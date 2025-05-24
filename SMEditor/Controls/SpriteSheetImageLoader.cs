using System;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Windows.Media.Imaging;

using OpenTK.Graphics.OpenGL4;

using RogueCreator.Graphics.GLModel.Program;

using SMEditor.Controls.Graphics;
using SMEditor.Controls.Graphics.Interface;
using SMEditor.Controls.Graphics.Primitive;
using SMEditor.Controls.Graphics.PrimitiveData;
using SMEditor.Controls.Graphics.Program.Interface;
using SMEditor.Controls.Graphics.Utility;

using PixelFormat = OpenTK.Graphics.OpenGL4.PixelFormat;

namespace SMEditor.Controls
{
    public class SpriteSheetImageLoader
    {
        private readonly GraphicsControl _openGLControl;
        private readonly IGLSLCache _glslCache;
        private IGLProgram _rubberbandProgram;              // GL_LINES (Vector2[4])

        public event EventHandler<string> MessageEvent;

        private WriteableBitmap _bitmap;
        private string _bitmapFileName;
        private bool _bitmapDirty;

        static SpriteSheetImageLoader()
        {
            GLSLCache.Load();
        }
        public SpriteSheetImageLoader(GraphicsControl openGLControl)
        {
            _openGLControl = openGLControl;
            _glslCache = new GLSLCache();
        }

        public GraphicsControl GetGraphics()
        {
            return _openGLControl;
        }

        public bool IsLoaded(string imageFile)
        {
            if (string.IsNullOrEmpty(imageFile))
                throw new Exception("Image file not specified:  null / empty string exception");

            if (string.IsNullOrEmpty(_bitmapFileName))
                return false;

            return _bitmapFileName.Equals(imageFile);
        }

        public bool IsLoaded()
        {
            return _bitmap != null;
        }

        public bool IsDirty()
        {
            return _bitmapDirty;
        }

        public void Load(string imageFile)
        {
            if (!OpenImageFile(imageFile))
                return;

            // This may happen when the tab is loaded. User has to select the tab (see TabControl caching modes)
            if (!_openGLControl.IsGLInitialized())
                return;

            try
            {
                // OpenGL Backend Still Loaded
                if (_openGLControl.IsGLRenderingProgramLoaded())
                {
                    // Removes previous program from the GPU
                    _openGLControl.UnloadScene();
                }

                var program = BuildProgram();

                _openGLControl.LoadScene(program);

                OnLog("OpenGL loaded successfully!");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void SetViewport(int zoomLevel, Point offset)
        {
            if (!this.IsLoaded())
                throw new Exception("Trying to set viewport before loading graphics:  SpriteSheetImageLoader.SetViewport");

            _openGLControl.SetViewport(_bitmap.PixelWidth, _bitmap.PixelHeight, zoomLevel, offset);
        }

        public void SetRubberband(int x1, int y1, int x2, int y2)
        {
            if (!this.IsLoaded())
                throw new Exception("Trying to set viewport before loading graphics:  SpriteSheetImageLoader.SetRubberband");

            // Rubberband:  Vector2[] with 4 elements:  top-left, top-right, bottom-right, bottom-left           

            var rubberband = new GLLine[4]
            {
                new GLLine(CoordinateConverter.ConvertToNormalizedXYScene(x1, y1, _bitmap.PixelWidth, _bitmap.PixelHeight)),
                new GLLine(CoordinateConverter.ConvertToNormalizedXYScene(x2, y1, _bitmap.PixelWidth, _bitmap.PixelHeight)),
                new GLLine(CoordinateConverter.ConvertToNormalizedXYScene(x2, y2, _bitmap.PixelWidth, _bitmap.PixelHeight)),
                new GLLine(CoordinateConverter.ConvertToNormalizedXYScene(x1, y2, _bitmap.PixelWidth, _bitmap.PixelHeight))
            };
            var dataStream = new DataStream(rubberband.Length,
                                            rubberband.First().GetElementSize(PrimitiveType.Lines),
                                            rubberband.First().GetStreamSize(PrimitiveType.Lines));

            //_rubberbandProgram.ReBuffer(dataStream);

            _openGLControl.Invalidate();
        }

        /// <summary>
        /// Builds Compiled GL program for rendering the sprite sheet
        /// </summary>
        /// <returns></returns>
        private IGLRenderingProgram BuildProgram()
        {
            var sceneBoundsXY = CoordinateConverter.CreateQuadNormalizedXYScene(0, 0, _bitmap.PixelWidth, _bitmap.PixelHeight, _bitmap.PixelWidth, _bitmap.PixelHeight);
            var sceneBoundsUV = CoordinateConverter.CreateQuadNormalizedUVScene(0, 0, _bitmap.PixelWidth, _bitmap.PixelHeight, _bitmap.PixelWidth, _bitmap.PixelHeight);
            var frameQuad = new GLImageQuad(sceneBoundsXY, sceneBoundsUV);
            var sceneQuad = new GLImageQuad(sceneBoundsXY, sceneBoundsUV);

            var x1 = (int)(_bitmap.PixelWidth / (double)4.0);
            var y1 = (int)(_bitmap.PixelHeight / (double)4.0);
            var x2 = (int)(_bitmap.PixelWidth * 3 / (double)4.0);
            var y2 = (int)(_bitmap.PixelHeight * 3 / (double)4.0);

            var rubberbandQuad = CoordinateConverter.CreateQuadNormalizedXYScene(0, 0, _bitmap.PixelWidth, _bitmap.PixelHeight, _bitmap.PixelWidth, _bitmap.PixelHeight);

            // Procedure: Make an IGLVector (of Quads) - one per pixel. These may be 
            //            resized for zoom. So, this only needs to be loaded once, or
            //            when the drawing data is modified, inserted in the stream.
            //
            // 

            var pixelColor = new System.Windows.Media.Color();
            var pixelBuffer = new byte[_bitmap.PixelWidth * _bitmap.PixelHeight * sizeof(int)];

            for (int column = 0; column < _bitmap.PixelWidth; column++)
            {
                for (int row = 0; row < _bitmap.PixelHeight; row++)
                {
                    var index = (column + (row * _bitmap.PixelWidth)) * sizeof(int);

                    _bitmap.GetPixel(column, row, ref pixelColor);

                    pixelBuffer[index + 0] = pixelColor.R;
                    pixelBuffer[index + 1] = pixelColor.G;
                    pixelBuffer[index + 2] = pixelColor.B;
                    pixelBuffer[index + 3] = pixelColor.A;

                    //pixelQuads[index] = new GLColorQuad(quad.Left, quad.Top, quad.Right, quad.Bottom, pixelColor);
                }
            }


            OnLog("Pixel data loaded for bitmap into OpenGL:  {0} x {1}", _bitmap.PixelWidth, _bitmap.PixelHeight);

            // Element Size:   Total number of primitives (floats) to commit to the stream
            // Element Length: Total number of elements as seen by OpenGL - depends on the drawing type
            //

            // NOTE***  THE CAPACITY FOR THE STREAM DOES NOT FOLLOW LINES! NEEDS TO BE REWORKED
            var rubberbandDataStream = new DataStream(1, rubberbandQuad.GetElementSize(PrimitiveType.Triangles), rubberbandQuad.GetStreamSize(PrimitiveType.Triangles));
            var sceneDataStream = new DataStream(1, sceneQuad.GetElementSize(PrimitiveType.Triangles), sceneQuad.GetStreamSize(PrimitiveType.Triangles));
            var frameDataStream = new DataStream(1, frameQuad.GetElementSize(PrimitiveType.Triangles), frameQuad.GetStreamSize(PrimitiveType.Triangles));

            // Build the data streams
            rubberbandQuad.StreamBuffer(rubberbandDataStream, PrimitiveType.Triangles);
            sceneQuad.StreamBuffer(sceneDataStream, PrimitiveType.Triangles);
            frameQuad.StreamBuffer(frameDataStream, PrimitiveType.Triangles);

            // Prepare Shader Programs
            var frameShaderFrag = _glslCache.Get(GLSLResource.FrameFragmentShader);
            var frameShaderVert = _glslCache.Get(GLSLResource.FrameVertexShader);
            var sceneShaderFrag = _glslCache.Get(GLSLResource.SceneFragmentShader);
            var sceneShaderVert = _glslCache.Get(GLSLResource.SceneVertexShader);
            var rubberbandShaderFrag = _glslCache.Get(GLSLResource.RubberbandFragmentShader);
            var rubberbandShaderVert = _glslCache.Get(GLSLResource.RubberbandVertexShader);

            var frameTextureUniform = frameShaderFrag.Uniforms1i.FirstOrDefault(x => x.Name == "frameTexture");
            var sceneTextureUniform = frameShaderFrag.Uniforms1i.FirstOrDefault(x => x.Name == "sceneTexture");
            var componentTextureUniform = frameShaderFrag.Uniforms1i.FirstOrDefault(x => x.Name == "componentTexture");
            var rubberbandColorUniform = rubberbandShaderFrag.Uniforms4.FirstOrDefault(x => x.Name == "rubberbandColor");

            // Create the GL frame buffer for our scene
            var frameBuffer = new GLFrameBuffer(_bitmap.PixelWidth, _bitmap.PixelHeight);

            // Declare Shader Programs
            var rubberbandProgram = new GLShaderProgram(new GLShader(rubberbandShaderVert), new GLShader(rubberbandShaderFrag));
            var sceneProgram = new GLShaderProgram(new GLShader(sceneShaderVert), new GLShader(sceneShaderFrag));
            var frameProgram = new GLShaderProgram(new GLShader(frameShaderVert), new GLShader(frameShaderFrag));

            var textureIndex = 0;
            var vertexBufferIndex = 0;

            // Un-Safe:  Pin memory for transferring pixelBuffer (picture data)
            var pinnedArray = GCHandle.Alloc(pixelBuffer, GCHandleType.Pinned);
            var pinnedPointer = pinnedArray.AddrOfPinnedObject();
            //---------- (MUST FREE DATA)


            // SET FRAME TEXTURE PIXEL BUFFER TO NULL
            var frameTexture = new GLTexture(IntPtr.Zero,
                                             _bitmap.PixelWidth,
                                             _bitmap.PixelHeight,
                                             textureIndex++,                    // For multiple textures, remember to increment texture index! TEXTURE_UNIT[index]
                                             TextureUnit.Texture0,              // MUST MATCH TEXTURE INDEX!
                                             PixelFormat.Rgba,
                                             PixelType.UnsignedByte);

            var sceneTexture = new GLTexture(pinnedPointer,                       // UN-MANAGED IntPtr to pixel data!
                                             _bitmap.PixelWidth,
                                             _bitmap.PixelHeight,
                                             textureIndex++,                    // For multiple textures, remember to increment texture index! TEXTURE_UNIT[index]
                                             TextureUnit.Texture1,              // MUST MATCH TEXTURE INDEX!
                                             PixelFormat.Rgba,
                                             PixelType.UnsignedByte);

            var componentTexture = new GLTexture(IntPtr.Zero,                       
                                                 _bitmap.PixelWidth,
                                                 _bitmap.PixelHeight,
                                                 textureIndex++,                    // For multiple textures, remember to increment texture index! TEXTURE_UNIT[index]
                                                 TextureUnit.Texture2,              // MUST MATCH TEXTURE INDEX!
                                                 PixelFormat.Rgba,
                                                 PixelType.UnsignedByte);

            var rubberbandVBO = new GLVertexBuffer<float>(vertexBufferIndex++, rubberbandDataStream, rubberbandShaderVert.VertexAttributes);
            var sceneVBO = new GLVertexBuffer<float>(vertexBufferIndex++, sceneDataStream, sceneShaderVert.VertexAttributes);
            var frameVBO = new GLVertexBuffer<float>(vertexBufferIndex++, frameDataStream, frameShaderVert.VertexAttributes);

            // Create VAOs for each GLShaderProgram
            var rubberbandVAO = new GLVertexArray(PrimitiveType.Triangles, rubberbandVBO);
            var sceneVAO = new GLVertexArray(PrimitiveType.Triangles, sceneVBO);
            var frameVAO = new GLVertexArray(PrimitiveType.Triangles, frameVBO);

            rubberbandProgram.DeclareVAO(rubberbandVAO);
            sceneProgram.DeclareVAO(sceneVAO);
            frameProgram.DeclareVAO(frameVAO);

            // Save the rubberband program
            _rubberbandProgram = rubberbandProgram;

            var program = new GLRenderingProgram(frameBuffer, rubberbandProgram,
                                                 sceneProgram, frameProgram,
                                                 frameTexture, sceneTexture, componentTexture,
                                                 frameTextureUniform, sceneTextureUniform, componentTextureUniform, rubberbandColorUniform);

            program.Compile();

            // Un-Safe:  Free Pinned Memory
            pinnedArray.Free();
            // ---------------- (Memory was transferred to GPU using GL Backend)

            return program;
        }

        private bool OpenImageFile(string imageFile)
        {
            try
            {
                using (var stream = System.IO.File.OpenRead(imageFile))
                {
                    var decoder = new PngBitmapDecoder(stream, BitmapCreateOptions.PreservePixelFormat, BitmapCacheOption.Default);
                    var bitmapSource = decoder.Frames[0];

                    _bitmap = new WriteableBitmap(bitmapSource);
                    _bitmapFileName = imageFile;
                    _bitmapDirty = false;

                    OnLog("Image file loaded:  {0}", imageFile);
                }

                return true;
            }
            catch (Exception ex)
            {
                OnLog("Error opening image file:  {0}", ex.Message);

                _bitmap = null;
                _bitmapDirty = false;
                _bitmapFileName = "";

                return false;
            }
        }


        private void OnLog(string message, params object[] args)
        {
            if (this.MessageEvent != null)
                this.MessageEvent(this, string.Format(message, args));
        }
    }
}
