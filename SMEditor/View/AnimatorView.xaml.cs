using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

using SMEditor.ViewModel;

namespace SMEditor.View
{
    public partial class AnimatorView : UserControl
    {
        public event EventHandler<string> GLBackendEvent;

        public AnimatorView()
        {
            InitializeComponent();

            this.ImageEditor.GLBackendEvent += ImageEditor_GLBackendEvent;
        }

        protected override void OnRenderSizeChanged(SizeChangedInfo sizeInfo)
        {
            base.OnRenderSizeChanged(sizeInfo);

            this.ImageEditor.InvalidateVisual();
        }

        private void ImageEditor_GLBackendEvent(object? sender, string message)
        {
            if (this.GLBackendEvent != null)
                this.GLBackendEvent(this, message);

            // Also, just put logs here for now. There were some issues getting the win forms host
            // to scroll without a nasty lag. So, let's debug this way for a while.
            //this.GLLogMessages.Items.Add(new LogViewModel()
            //{
            //    Message = message
            //});
        }

        private void ColorPicker_SelectedColorChanged(object sender, System.Windows.RoutedPropertyChangedEventArgs<System.Windows.Media.Color?> e)
        {
            this.ImageBorder.Background = new SolidColorBrush(e.NewValue ?? Colors.White);
        }
    }
}
