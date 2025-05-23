using System.Windows.Controls;
using System.Windows.Media;

using Xceed.Wpf.Toolkit;

namespace SMEditor.View
{
    public partial class AnimatorView : UserControl
    {
        public AnimatorView()
        {
            InitializeComponent();
        }

        private void ColorPicker_SelectedColorChanged(object sender, System.Windows.RoutedPropertyChangedEventArgs<System.Windows.Media.Color?> e)
        {
            this.ImageBorder.Background = new SolidColorBrush(e.NewValue ?? Colors.White);
        }
    }
}
