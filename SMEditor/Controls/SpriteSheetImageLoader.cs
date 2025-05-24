using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Windows.Media;
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
                _openGLControl.SetViewport(0, 0, _bitmap.PixelWidth, _bitmap.PixelHeight);
                _openGLControl.Width = _bitmap.PixelWidth;
                _openGLControl.Height = _bitmap.PixelHeight;
                //_openGLControl.BackColor = System.Drawing.Color.White;

                OnLog("OpenGL loaded successfully!");
            }
            catch (Exception ex)
            {
                throw ex;
            }
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
            var sceneDataStream = new DataStream(1, sceneQuad.GetElementSize(PrimitiveType.Triangles), sceneQuad.GetStreamSize(PrimitiveType.Triangles));
            var frameDataStream = new DataStream(1, frameQuad.GetElementSize(PrimitiveType.Triangles), frameQuad.GetStreamSize(PrimitiveType.Triangles));

            // Build the data streams
            sceneQuad.StreamBuffer(sceneDataStream, PrimitiveType.Triangles);
            frameQuad.StreamBuffer(frameDataStream, PrimitiveType.Triangles);

            // Prepare Shader Programs
            var frameShaderFrag = _glslCache.Get(GLSLResource.FrameFragmentShader);
            var frameShaderVert = _glslCache.Get(GLSLResource.FrameVertexShader);
            var sceneShaderFrag = _glslCache.Get(GLSLResource.SceneFragmentShader);
            var sceneShaderVert = _glslCache.Get(GLSLResource.SceneVertexShader);

            var frameTextureUniform = frameShaderFrag.Uniforms1i.FirstOrDefault(x => x.Name == "frameTexture");
            var sceneTextureUniform = frameShaderFrag.Uniforms1i.FirstOrDefault(x => x.Name == "sceneTexture");

            // Create the GL frame buffer for our scene
            var frameBuffer = new GLFrameBuffer(_bitmap.PixelWidth, _bitmap.PixelHeight);

            // Declare Shader Programs
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

            var sceneTexture = new GLTexture(pinnedPointer,                     // UN-MANAGED IntPtr to pixel data!
                                             _bitmap.PixelWidth,
                                             _bitmap.PixelHeight,
                                             textureIndex++,                    // For multiple textures, remember to increment texture index! TEXTURE_UNIT[index]
                                             TextureUnit.Texture1,              // MUST MATCH TEXTURE INDEX!
                                             PixelFormat.Rgba,
                                             PixelType.UnsignedByte);

            var sceneVBO = new GLVertexBuffer<float>(vertexBufferIndex++, sceneDataStream, sceneShaderVert.VertexAttributes);
            var frameVBO = new GLVertexBuffer<float>(vertexBufferIndex++, frameDataStream, frameShaderVert.VertexAttributes);

            // Create VAOs for each GLShaderProgram
            var sceneVAO = new GLVertexArray(PrimitiveType.Triangles, sceneVBO);
            var frameVAO = new GLVertexArray(PrimitiveType.Triangles, frameVBO);

            sceneProgram.DeclareVAO(sceneVAO);
            frameProgram.DeclareVAO(frameVAO);

            var program = new GLRenderingProgram(frameBuffer, sceneProgram, frameProgram, frameTexture, sceneTexture, frameTextureUniform, sceneTextureUniform);

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
