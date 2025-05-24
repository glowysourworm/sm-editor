using System;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms.Integration;
using System.Windows.Media;

namespace SMEditor.Controls
{
    /// <summary>
    /// Must be hosted inside a WPF ScrollViewer
    /// </summary>
    public class ScrollableWindowsFormsHost : WindowsFormsHost
    {
        private PresentationSource _presentationSource;

        public ScrollableWindowsFormsHost()
        {
            PresentationSource.AddSourceChangedHandler(this, SourceChangedEventHandler);
        }

        protected override void OnWindowPositionChanged(Rect rcBoundingBox)
        {
            base.OnWindowPositionChanged(rcBoundingBox);

            ParentScrollViewer.ScrollChanged += ParentScrollViewer_ScrollChanged;
            ParentScrollViewer.SizeChanged += ParentScrollViewer_SizeChanged;
            ParentScrollViewer.Loaded += ParentScrollViewer_Loaded;

            if (Scrolling || Resizing)
            {
                if (ParentScrollViewer == null)
                    return;
                GeneralTransform tr = RootVisual.TransformToDescendant(ParentScrollViewer);
                var scrollRect = new Rect(new Size(ParentScrollViewer.ViewportWidth, ParentScrollViewer.ViewportHeight));

                var intersect = Rect.Intersect(scrollRect, tr.TransformBounds(rcBoundingBox));
                if (!intersect.IsEmpty)
                {
                    tr = ParentScrollViewer.TransformToDescendant(this);
                    intersect = tr.TransformBounds(intersect);
                }
                else
                    intersect = new Rect();

                int x1 = (int)Math.Round(intersect.Left);
                int y1 = (int)Math.Round(intersect.Top);
                int x2 = (int)Math.Round(intersect.Right);
                int y2 = (int)Math.Round(intersect.Bottom);

                SetRegion(x1, y1, x2, y2);
                this.Scrolling = false;
                this.Resizing = false;

            }

        }

        private void ParentScrollViewer_Loaded(object sender, RoutedEventArgs e)
        {
            this.Resizing = true;
        }

        private void ParentScrollViewer_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            this.Resizing = true;
        }

        private void ParentScrollViewer_ScrollChanged(object sender, ScrollChangedEventArgs e)
        {
            if (e.VerticalChange != 0 || e.HorizontalChange != 0 || e.ExtentHeightChange != 0 || e.ExtentWidthChange != 0)
                Scrolling = true;
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);

            if (disposing)
                PresentationSource.RemoveSourceChangedHandler(this, SourceChangedEventHandler);
        }

        private void SourceChangedEventHandler(Object sender, SourceChangedEventArgs e)
        {
            ParentScrollViewer = FindParentScrollViewer();
        }

        private ScrollViewer FindParentScrollViewer()
        {
            DependencyObject vParent = this;
            ScrollViewer parentScroll = null;
            while (vParent != null)
            {
                parentScroll = vParent as ScrollViewer;
                if (parentScroll != null)
                    break;

                vParent = LogicalTreeHelper.GetParent(vParent);
            }
            return parentScroll;
        }

        private void SetRegion(int x1, int y1, int x2, int y2)
        {
            SetWindowRgn(Handle, CreateRectRgn(x1, y1, x2, y2), true);
        }

        private Visual RootVisual
        {
            get
            {
                _presentationSource = PresentationSource.FromVisual(this);
                return _presentationSource.RootVisual;
            }
        }

        protected ScrollViewer ParentScrollViewer { get; set; }

        private bool Scrolling { get; set; }
        private bool Resizing { get; set; }

        [DllImport("User32.dll", SetLastError = true)]
        static extern int SetWindowRgn(IntPtr hWnd, IntPtr hRgn, bool bRedraw);

        [DllImport("gdi32.dll")]
        static extern IntPtr CreateRectRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);
    }
}
