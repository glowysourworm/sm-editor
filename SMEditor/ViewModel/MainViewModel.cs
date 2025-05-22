using System.Collections.ObjectModel;

namespace SMEditor.ViewModel
{
    public class MainViewModel : ViewModelBase
    {
        string _romFile;
        int _startAddress;
        int _endAddress;
        int _imageWidth;
        int _imageHeight;
        int _stride;

        ObservableCollection<RomImageViewModel> _images;
        ObservableCollection<LogViewModel> _logs;

        public string RomFile
        {
            get { return _romFile; }
            set { this.RaiseAndSetIfChanged(ref _romFile, value); }
        }
        public int StartAddress
        {
            get { return _startAddress; }
            set { this.RaiseAndSetIfChanged(ref _startAddress, value); }
        }
        public int EndAddress
        {
            get { return _endAddress; }
            set { this.RaiseAndSetIfChanged(ref _endAddress, value); }
        }
        public int ImageWidth
        {
            get { return _imageWidth; }
            set { this.RaiseAndSetIfChanged(ref _imageWidth, value); }
        }
        public int ImageHeight
        {
            get { return _imageHeight; }
            set { this.RaiseAndSetIfChanged(ref _imageHeight, value); }
        }
        public int Stride
        {
            get { return _stride; }
            set { this.RaiseAndSetIfChanged(ref _stride, value); }
        }
        public ObservableCollection<RomImageViewModel> Images
        {
            get { return _images; }
            set { this.RaiseAndSetIfChanged(ref _images, value); }
        }
        public ObservableCollection<LogViewModel> Logs
        {
            get { return _logs; }
            set { this.RaiseAndSetIfChanged(ref _logs, value); }
        }

        public MainViewModel()
        {
            this.Images = new ObservableCollection<RomImageViewModel>();
            this.Logs = new ObservableCollection<LogViewModel>();
        }
    }
}
