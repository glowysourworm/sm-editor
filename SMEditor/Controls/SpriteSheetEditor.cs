using System;
using System.Collections;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
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

        bool _mouseLeftDown;
        bool _mouseRightDown;

        Point _mouseLeftPoint;
        Point _mouseRightPoint;
        Point _mouseDragOffset;

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
                openGLControl.Width = (int)this.RenderSize.Width;
                openGLControl.Height = (int)this.RenderSize.Height;
            };

            openGLControl.SizeChanged += (sender, e) =>
            {
                // DON'T CHANGE SIZE OF GL CONTROL! Set to parent size only!
            };

            openGLControl.MouseWheel += (sender, e) =>
            {
                HandleMouseWheel(e.Delta, Keyboard.Modifiers == ModifierKeys.Control, e.Location.X, e.Location.Y);
            };

            openGLControl.MouseDown += (sender, e) =>
            {
                HandleMouseDown(e.Button == System.Windows.Forms.MouseButtons.Left, 
                                e.Button == System.Windows.Forms.MouseButtons.Right, e.Location.X, e.Location.Y);
            };
            openGLControl.MouseUp += (sender, e) =>
            {
                HandleMouseUp(e.Button == System.Windows.Forms.MouseButtons.Left,
                              e.Button == System.Windows.Forms.MouseButtons.Right, e.Location.X, e.Location.Y);
            };
            openGLControl.MouseMove += (sender, e) =>
            {
                HandleMouseMove(e.Location.X, e.Location.Y);
            };

            _graphicsLoader = new SpriteSheetImageLoader(openGLControl);
            _mouseDragOffset = new Point();
            _mouseLeftPoint = new Point();
            _mouseRightPoint = new Point();
        }

        #region Mouse Interaction
        protected override void OnMouseMove(System.Windows.Input.MouseEventArgs e)
        {
            base.OnMouseMove(e);
            HandleMouseMove(e.GetPosition(this).X, e.GetPosition(this).Y);
        }
        protected override void OnMouseWheel(MouseWheelEventArgs e)
        {
            base.OnMouseWheel(e);
            HandleMouseWheel(e.Delta, Keyboard.Modifiers == ModifierKeys.Control, e.GetPosition(this).X, e.GetPosition(this).Y);
        }

        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonDown(e);
            HandleMouseDown(true, false, e.GetPosition(this).X, e.GetPosition(this).Y);
        }
        protected override void OnMouseLeftButtonUp(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonUp(e);
            HandleMouseUp(true, false, e.GetPosition(this).X, e.GetPosition(this).Y);
        }

        protected override void OnMouseRightButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseRightButtonDown(e);
            HandleMouseDown(false, true, e.GetPosition(this).X, e.GetPosition(this).Y);
        }
        protected override void OnMouseRightButtonUp(MouseButtonEventArgs e)
        {
            base.OnMouseRightButtonUp(e);
            HandleMouseUp(false, true, e.GetPosition(this).X, e.GetPosition(this).Y);
        }

        protected override void OnMouseLeave(System.Windows.Input.MouseEventArgs e)
        {
            base.OnMouseLeave(e);

            _mouseLeftDown = false;
            _mouseRightDown = false;
        }

        protected void HandleMouseDown(bool leftButton, bool rightButton, double positionX, double positionY)
        {
            if (leftButton)
            {
                _mouseLeftDown = true;
                _mouseLeftPoint.X = positionX;
                _mouseLeftPoint.Y = positionY;
            }

            // Drag
            else if (rightButton)
            {
                _mouseRightDown = true;

                // Start where the offset began
                _mouseRightPoint.X = positionX;
                _mouseRightPoint.Y = positionY;
                _mouseDragOffset.X = this.Offset.X;
                _mouseDragOffset.Y = this.Offset.Y;
            }
        }
        protected void HandleMouseUp(bool leftButton, bool rightButton, double positionX, double positionY)
        {
            if (leftButton)
            {
                // Mouse Left Action
                if (_mouseLeftDown)
                {
                    RubberbandSelectImpl(positionX, positionY);
                }

                _mouseLeftDown = false;
            }

            else if (rightButton)
            {
                // Mouse Right Action
                if (_mouseRightDown)
                {
                    // Uses Current Offset
                    TranslateImpl(positionX, positionY);
                }

                _mouseRightDown = false;
            }
        }
        protected void HandleMouseMove(double positionX, double positionY)
        {
            if (_mouseLeftDown)
            {
                RubberbandSelectImpl(positionX, positionY);
            }

            if (_mouseRightDown)
            {
                TranslateImpl(positionX, positionY);
            }
        }
        protected void HandleMouseWheel(double delta, bool ctrl, double positionX, double positionY)
        {
            if (ctrl)
                ZoomImpl(delta > 0, positionX, positionY);

            //else
            //    this.ParentScrollViewer.ScrollToVerticalOffset(this.ParentScrollViewer.VerticalOffset - delta);
        }

        private void RubberbandSelectImpl(double positionX, double positionY)
        {
            _graphicsLoader.SetRubberband((int)_mouseLeftPoint.X, (int)_mouseLeftPoint.Y, (int)positionX, (int)positionY);           
        }
        private void TranslateImpl(double positionX, double positionY)
        {
            var deltaX = (positionX - _mouseRightPoint.X) / (double)this.Zoom;
            var deltaY = (-1 * (positionY - _mouseRightPoint.Y)) / (double)this.Zoom;

            // Dragging
            if (_mouseRightDown)
                this.Offset = new Point(_mouseDragOffset.X + deltaX, _mouseDragOffset.Y + deltaY);

            else
                this.Offset = new Point((this.Offset.X + deltaX), (this.Offset.Y + deltaY));

            UpdateViewport();
        }
        private void ZoomImpl(bool zoomIn, double positionX, double positionY)
        {
            if (zoomIn)
                this.Zoom = Math.Min(this.Zoom + 1, 7);

            else
                this.Zoom = Math.Max(this.Zoom - 1, 1);

            //this.Offset = new Point(this.Offset.X + ((this.Offset.X - positionX) * 0.1),
            //                        this.Offset.Y + ((this.Offset.Y - positionY) * 0.1));

            UpdateViewport();
        }
        #endregion

        protected void UpdateViewport()
        {
            // Procedure:  This will set just the viewport of the GL backend
            // 

            if (_graphicsLoader == null)
                return;

            if (_graphicsLoader.IsLoaded())
            {
                // Zoom / Offset (sets GL viewport)
                _graphicsLoader.SetViewport(this.Zoom, new System.Drawing.Point((int)this.Offset.X, (int)this.Offset.Y));
            }
        }

        protected void LoadImageFile()
        {
            _graphicsLoader.Load(this.ImageFileName);

            UpdateViewport();
        }

        protected override void OnRender(DrawingContext drawingContext)
        {
            base.OnRender(drawingContext);

            _graphicsLoader.GetGraphics().Invalidate();
        }

        protected override void OnRenderSizeChanged(SizeChangedInfo sizeInfo)
        {
            base.OnRenderSizeChanged(sizeInfo);

            UpdateViewport();
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

            if (editor != null)
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
