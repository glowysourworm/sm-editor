namespace SMEditor.ViewModel
{
    public class LogViewModel : ViewModelBase
    {
        string _message;

        public string Message
        {
            get { return _message; }
            set { this.RaiseAndSetIfChanged(ref _message, value); }
        }
    }
}
