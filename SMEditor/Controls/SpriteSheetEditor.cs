using System;
using System.Collections;
using System.Linq;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms.Integration;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;

using OpenTK.Graphics.OpenGL4;

using RogueCreator.Graphics.GLModel.Program;

using SMEditor.Controls.Graphics;
using SMEditor.Controls.Graphics.Interface;
using SMEditor.Controls.Graphics.Primitive;
using SMEditor.Controls.Graphics.PrimitiveData;
using SMEditor.Controls.Graphics.Utility;

using PixelFormat = OpenTK.Graphics.OpenGL4.PixelFormat;

namespace SMEditor.Controls
{
    public class SpriteSheetEditor : WindowsFormsHost
    {
        #region Dependency Properties
        public static readonly DependencyProperty ImageFileNameProperty =
            DependencyProperty.Register("ImageFileName", typeof(string), typeof(SpriteSheetEditor), new PropertyMetadata(OnImageFileChanged));

        public static readonly DependencyProperty ZoomProperty =
            DependencyProperty.Register("Zoom", typeof(int), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty OffsetProperty =
            DependencyProperty.Register("Offset", typeof(Point), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty SelectedColorProperty =
            DependencyProperty.Register("SelectedColor", typeof(Color), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty BackgroundColorProperty =
            DependencyProperty.Register("BackgroundColor", typeof(Color), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty SpriteGridColorProperty =
            DependencyProperty.Register("SpriteGridColor", typeof(Color), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty BrushSizeProperty =
            DependencyProperty.Register("BrushSize", typeof(int), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty SpriteSheetColumnsProperty =
            DependencyProperty.Register("SpriteSheetColumns", typeof(int), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public static readonly DependencyProperty SpriteSheetRowsProperty =
            DependencyProperty.Register("SpriteSheetRows", typeof(int), typeof(SpriteSheetEditor), new PropertyMetadata(OnEditorChanged));

        public string ImageFileName
        {
            get { return (string)GetValue(ImageFileNameProperty); }
            set { SetValue(ImageFileNameProperty, value); }
        }

        public int Zoom
        {
            get { return (int)GetValue(ZoomProperty); }
            set { SetValue(ZoomProperty, value); }
        }
        public Point Offset
        {
            get { return (Point)GetValue(OffsetProperty); }
            set { SetValue(OffsetProperty, value); }
        }

        public Color SelectedColor
        {
            get { return (Color)GetValue(SelectedColorProperty); }
            set { SetValue(SelectedColorProperty, value); }
        }
        public Color BackgroundColor
        {
            get { return (Color)GetValue(BackgroundColorProperty); }
            set { SetValue(BackgroundColorProperty, value); }
        }
        public Color SpriteGridColor
        {
            get { return (Color)GetValue(SpriteGridColorProperty); }
            set { SetValue(SpriteGridColorProperty, value); }
        }
        public int BrushSize
        {
            get { return (int)GetValue(BrushSizeProperty); }
            set { SetValue(BrushSizeProperty, value); }
        }
        public int SpriteSheetColumns
        {
            get { return (int)GetValue(SpriteSheetColumnsProperty); }
            set { SetValue(SpriteSheetColumnsProperty, value); }
        }
        public int SpriteSheetRows
        {
            get { return (int)GetValue(SpriteSheetRowsProperty); }
            set { SetValue(SpriteSheetRowsProperty, value); }
        }
        #endregion

        // GL Event Forwarding
        public event EventHandler<string> GLBackendEvent;

        protected readonly IGLSLCache _glslCache;

        private GraphicsControl _openGLControl;
        private string _loadedImagefile;            // The call to UpdateGraphics is in the path of many bindings

        static SpriteSheetEditor()
        {
            GLSLCache.Load();
        }
        public SpriteSheetEditor()
        {
            this.BackgroundColor = Colors.Transparent;
            this.SpriteGridColor = Colors.Transparent;
            this.Zoom = 1;

            this.ClipToBounds = true;

            _glslCache = new GLSLCache();

            _openGLControl = new GraphicsControl((message) =>
            {
                if (this.GLBackendEvent != null)
                    this.GLBackendEvent(this, message);
            });

            this.Child = _openGLControl;
            this.SizeChanged += (sender, e) =>
            {
                //if (_openGLControl.Width < this.Width)
                //    _openGLControl.Width = (int)this.Width;

                //if (_openGLControl.Height < this.Height)
                //    _openGLControl.Height = (int)this.Height;

                _openGLControl.Invalidate();
            };

            _openGLControl.SizeChanged += (sender, e) =>
            {
                //if (_openGLControl.Width > this.Width)
                //    _openGLControl.Width = (int)this.Width;

                //if (_openGLControl.Height > this.Height)
                //    _openGLControl.Height = (int)this.Height;

                _openGLControl.Invalidate();
            };
        }

        #region Mouse Interaction
        bool _mouseLeftDown;
        bool _mouseRightDown;

        Point _mouseLeftPoint;
        Point _mouseRightPoint;

        protected override void OnMouseMove(MouseEventArgs e)
        {
            base.OnMouseMove(e);

            if (_mouseLeftDown)
            {
            }

            if (_mouseRightDown)
            {
                TranslateImpl(e.GetPosition(this));
            }
        }

        protected override void OnMouseWheel(MouseWheelEventArgs e)
        {
            base.OnMouseWheel(e);

            ZoomImpl(e.Delta > 0);
        }

        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonDown(e);

            _mouseLeftDown = true;
            _mouseLeftPoint = e.GetPosition(this);
        }
        protected override void OnMouseLeftButtonUp(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonUp(e);

            // Mouse Left Action
            if (_mouseLeftDown)
            {

            }

            _mouseLeftDown = false;
        }

        protected override void OnMouseRightButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseRightButtonDown(e);

            _mouseRightDown = true;
            _mouseRightPoint = e.GetPosition(this);
        }
        protected override void OnMouseRightButtonUp(MouseButtonEventArgs e)
        {
            base.OnMouseRightButtonUp(e);

            // Mouse Right Action
            if (_mouseRightDown)
            {
                TranslateImpl(e.GetPosition(this));
            }

            _mouseRightDown = false;
        }

        protected override void OnMouseLeave(MouseEventArgs e)
        {
            base.OnMouseLeave(e);

            _mouseLeftDown = false;
            _mouseRightDown = false;
        }

        private void TranslateImpl(Point point)
        {
            var delta = point - _mouseRightPoint;

            this.Offset = new Point(this.Offset.X + (delta.X * this.Zoom), this.Offset.Y + (delta.Y * this.Zoom));
        }

        private void ZoomImpl(bool zoomIn)
        {
            if (zoomIn)
                this.Zoom = Math.Min(this.Zoom + 1, 20);

            else
                this.Zoom = Math.Max(this.Zoom - 1, 1);
        }
        #endregion

        protected void UpdateGraphics()
        {
            if (string.IsNullOrEmpty(this.ImageFileName) ||
                this.ImageFileName == _loadedImagefile)
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

                using (var stream = System.IO.File.OpenRead(this.ImageFileName))
                {
                    var decoder = new PngBitmapDecoder(stream, BitmapCreateOptions.PreservePixelFormat, BitmapCacheOption.Default);
                    var bitmapSource = decoder.Frames[0];

                    var bitmap = new WriteableBitmap(bitmapSource);

                    OnLog("Spritesheet loaded from file:  {0}", this.ImageFileName);


                    // TODO: REPACKAGE THIS: Make some sort of Graphics Builder Service

                    var sceneBoundsXY = CoordinateConverter.CreateQuadNormalizedXYScene(0, 0, bitmap.PixelWidth, bitmap.PixelHeight, bitmap.PixelWidth, bitmap.PixelHeight);
                    var sceneBoundsUV = CoordinateConverter.CreateQuadNormalizedUVScene(0, 0, bitmap.PixelWidth, bitmap.PixelHeight, bitmap.PixelWidth, bitmap.PixelHeight);
                    var frameQuad = new GLImageQuad(sceneBoundsXY, sceneBoundsUV);
                    var sceneQuad = new GLImageQuad(sceneBoundsXY, sceneBoundsUV);

                    // Procedure: Make an IGLVector (of Quads) - one per pixel. These may be 
                    //            resized for zoom. So, this only needs to be loaded once, or
                    //            when the drawing data is modified, inserted in the stream.
                    //
                    // 

                    var pixelColor = new Color();
                    var pixelBuffer = new byte[bitmap.PixelWidth * bitmap.PixelHeight * sizeof(int)];

                    for (int column = 0; column < bitmap.PixelWidth; column++)
                    {
                        for (int row = 0; row < bitmap.PixelHeight; row++)
                        {
                            var index = (column + (row * bitmap.PixelWidth)) * sizeof(int);                            
                            
                            //var quad = CoordinateConverter.CreateQuadNormalizedXYScene(row, column, 1, 1, bitmap.PixelWidth, bitmap.PixelHeight);

                            bitmap.GetPixel(column, row, ref pixelColor);

                            pixelBuffer[index + 0] = pixelColor.R;
                            pixelBuffer[index + 1] = pixelColor.G;
                            pixelBuffer[index + 2] = pixelColor.B;
                            pixelBuffer[index + 3] = pixelColor.A;

                            //pixelQuads[index] = new GLColorQuad(quad.Left, quad.Top, quad.Right, quad.Bottom, pixelColor);
                        }
                    }
                    

                    OnLog("Pixel data loaded for bitmap into OpenGL:  {0} x {1}", bitmap.PixelWidth, bitmap.PixelHeight);

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
                    var sceneTextureUniform = sceneShaderFrag.Uniforms1i.FirstOrDefault(x => x.Name == "sceneTexture");

                    // Create the GL frame buffer for our scene
                    var frameBuffer = new GLFrameBuffer(bitmap.PixelWidth, bitmap.PixelHeight);

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
                    var frameTexture = new GLTexture(pinnedPointer,
                                                     bitmap.PixelWidth,
                                                     bitmap.PixelHeight,
                                                     textureIndex++,                    // For multiple textures, remember to increment texture index! TEXTURE_UNIT[index]
                                                     TextureUnit.Texture0,              // MUST MATCH TEXTURE INDEX!
                                                     PixelFormat.Rgba,
                                                     PixelType.UnsignedByte);

                    var sceneTexture = new GLTexture(pinnedPointer,                     // UN-MANAGED IntPtr to pixel data!
                                                     bitmap.PixelWidth,
                                                     bitmap.PixelHeight,
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

                    // Compile (may throw errors back from the GL backend!)
                    program.Compile();

                    OnLog("OpenGL loaded successfully. Loading scene, and setting viewport...");

                    // Load the GL Control! :)
                    //
                    _openGLControl.LoadScene(program);
                    _openGLControl.SetViewport(0, 0, bitmap.PixelWidth, bitmap.PixelHeight);
                    _openGLControl.Width = bitmap.PixelWidth;
                    _openGLControl.Height = bitmap.PixelHeight;
                    //_openGLControl.BackColor = System.Drawing.Color.White;

                    _loadedImagefile = this.ImageFileName;

                    this.BackgroundColor = Colors.White;
                    this.ClipToBounds = true;

                    // Un-Safe:  Free Pinned Memory
                    //pinnedArray.Free();
                    // ---------------- (Memory was transferred to GPU using GL Backend)

                    // Problem with parent binding for the height / width. This was needed for clipping purposes.
                    //this.Width = (this.Parent as FrameworkElement).Width;
                    //this.Height = (this.Parent as FrameworkElement).Height;
                    //this.Width = bitmap.PixelWidth;
                    //this.Height = bitmap.PixelHeight;

                    InvalidateVisual();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected override void ParentLayoutInvalidated(UIElement child)
        {
            base.ParentLayoutInvalidated(child);

            _openGLControl.Invalidate();
        }

        private static void OnEditorChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var editor = d as SpriteSheetEditor;

            editor?.UpdateGraphics();
            editor?.InvalidateVisual();
        }

        private static void OnImageFileChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var editor = d as SpriteSheetEditor;

            if (!string.IsNullOrEmpty(e.NewValue as string) && editor != null)
            {
                editor.UpdateGraphics();
            }
        }

        private void OnLog(string message, params object[] args)
        {
            if (this.GLBackendEvent != null)
                this.GLBackendEvent(this, string.Format(message, args));
        }
    }
}
