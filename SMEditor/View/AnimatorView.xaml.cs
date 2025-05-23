using System;
using System.Windows.Controls;
using System.Windows.Media;

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

        private void ImageEditor_GLBackendEvent(object? sender, string message)
        {
            if (this.GLBackendEvent != null)
                this.GLBackendEvent(this, message);
        }

        private void ColorPicker_SelectedColorChanged(object sender, System.Windows.RoutedPropertyChangedEventArgs<System.Windows.Media.Color?> e)
        {
            this.ImageBorder.Background = new SolidColorBrush(e.NewValue ?? Colors.White);
        }
    }
}
