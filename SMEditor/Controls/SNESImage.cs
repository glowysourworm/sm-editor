using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

using SMEditor.Controls.Model;

namespace SMEditor.Controls
{
    public class SNESImage : Canvas
    {
        public static readonly DependencyProperty SnesImageProperty =
            DependencyProperty.Register("SnesImage", typeof(SNESImageModel), typeof(SNESImage), new PropertyMetadata(OnImageChanged));

        public static readonly DependencyProperty PixelRenderSizeProperty =
            DependencyProperty.Register("PixelRenderSize", typeof(int), typeof(SNESImage));

        public SNESImageModel SnesImage
        {
            get { return (SNESImageModel)GetValue(SnesImageProperty); }
            set { SetValue(SnesImageProperty, value); }
        }

        public int PixelRenderSize
        {
            get { return (int)GetValue(PixelRenderSizeProperty); }
            set { SetValue(PixelRenderSizeProperty, value); }
        }


        public SNESImage()
        {
        }

        protected override Size MeasureOverride(Size constraint)
        {
            if (this.SnesImage != null)
            {
                return new Size(this.SnesImage.ImageWidth, this.SnesImage.ImageHeight);
            }

            return base.MeasureOverride(constraint);
        }

        protected override void OnRender(DrawingContext dc)
        {
            base.OnRender(dc);

            if (this.SnesImage != null)
            {
                // Render each pixel as a rect
                for (int column = 0; column < this.SnesImage.ImageWidth; column++)
                {
                    for (int row = 0; row < this.SnesImage.ImageHeight; row++)
                    {
                        // TODO: The Samus graphics data has to be loaded. The palette set shows what colors to put
                        //       at each pixel.
                    }
                }
            }
        }

        private static void OnImageChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as SNESImage;

            control?.InvalidateVisual();
        }
    }
}
