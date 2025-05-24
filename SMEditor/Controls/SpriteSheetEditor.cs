using System;
using System.Collections;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms.Integration;
using System.Windows.Forms.VisualStyles;
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
            DependencyProperty.Register("Zoom", typeof(int), typeof(SpriteSheetEditor), new PropertyMetadata(OnViewportChanged));

        public static readonly DependencyProperty OffsetProperty =
            DependencyProperty.Register("Offset", typeof(Point), typeof(SpriteSheetEditor), new PropertyMetadata(OnViewportChanged));

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

        private readonly SpriteSheetImageLoader _graphicsLoader;

        public SpriteSheetEditor()
        {
            this.BackgroundColor = Colors.Transparent;
            this.SpriteGridColor = Colors.Transparent;
            this.Zoom = 1;
            this.ClipToBounds = true;

            var openGLControl = new GraphicsControl((message) =>
            {
                if (this.GLBackendEvent != null)
                    this.GLBackendEvent(this, message);
            });

            this.Child = openGLControl;
            this.SizeChanged += (sender, e) =>
            {

                //var border = this.Parent as Border;

                //if (openGLControl.Width < border.RenderSize.Width)
                //    openGLControl.Width = (int)border.RenderSize.Width;

                //if (openGLControl.Height < border.RenderSize.Height)
                //    openGLControl.Height = (int)border.RenderSize.Height;

                openGLControl.Invalidate();
            };

            openGLControl.SizeChanged += (sender, e) =>
            {
                //var border = this.Parent as Border;

                //this.Width = border.RenderSize.Width;
                //this.Height = border.RenderSize.Height;

                //this.Width = Math.Min(border.RenderSize.Width, openGLControl.Width);
                //this.Height = Math.Min(border.RenderSize.Height, openGLControl.Height);

                //if (_openGLControl.Width > this.Width)
                //    _openGLControl.Width = (int)this.Width;

                //if (_openGLControl.Height > this.Height)
                //    _openGLControl.Height = (int)this.Height;

                openGLControl.Invalidate();
            };

            _graphicsLoader = new SpriteSheetImageLoader(openGLControl);
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

        protected void UpdateViewport()
        {
            if (_graphicsLoader?.GetGraphics() != null)
                _graphicsLoader.GetGraphics().Invalidate();
        }

        protected void LoadImageFile()
        {
            _graphicsLoader.Load(this.ImageFileName);
        }

        protected override void OnRender(DrawingContext drawingContext)
        {
            base.OnRender(drawingContext);

            _graphicsLoader.GetGraphics().Invalidate();
        }

        protected override void ParentLayoutInvalidated(UIElement child)
        {
            base.ParentLayoutInvalidated(child);

            _graphicsLoader.GetGraphics().Invalidate();
        }

        private static void OnEditorChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var editor = d as SpriteSheetEditor;

            editor?.UpdateViewport();
            editor?.InvalidateVisual();
        }

        private static void OnImageFileChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var editor = d as SpriteSheetEditor;

            if (!string.IsNullOrEmpty(e.NewValue as string) && editor != null)
            {
                editor.LoadImageFile();
            }
        }

        private static void OnViewportChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var editor = d as SpriteSheetEditor;

            if (!string.IsNullOrEmpty(e.NewValue as string) && editor != null)
            {
                editor.UpdateViewport();
            }
        }

        private void OnLog(string message, params object[] args)
        {
            if (this.GLBackendEvent != null)
                this.GLBackendEvent(this, string.Format(message, args));
        }
    }
}
