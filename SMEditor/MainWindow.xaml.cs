using System.Windows;

using Microsoft.Win32;

using SMEditor.ViewModel;

namespace SMEditor
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            this.DataContext = new MainViewModel();

        }

        private void OpenSpriteSheet_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog();
            var viewModel = this.DataContext as MainViewModel;

            if (dialog.ShowDialog() == true && viewModel != null)
            {
                viewModel.AnimatorViewModel.SpriteSheetFile = dialog.FileName;
            }
        }

        private void AnimatorView_GLBackendEvent(object sender, string glMessage)
        {
            var viewModel = this.DataContext as MainViewModel;

            if (viewModel != null)
            {
                viewModel.Logs.Add(new LogViewModel()
                {
                    Message = glMessage
                });
            }
        }
    }
}
