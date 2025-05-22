using System;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace SMEditor.ViewModel
{
    /// <summary>
    /// Image class for an image source from a portion of the rom data
    /// </summary>
    public class RomImageViewModel : ViewModelBase
    {
        private int _startAddress;
        private int _endAddress;
        private int _imageWidth;
        private int _imageHeight;
        byte[] _buffer;
        BitmapSource _source;

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
            set { this.RaiseAndSetIfChanged(ref _imageWidth, value); UpdateImageSource(); }
        }
        public int ImageHeight
        {
            get { return _imageHeight; }
            set { this.RaiseAndSetIfChanged(ref _imageHeight, value); UpdateImageSource(); }
        }
        public byte[] Buffer
        {
            get { return _buffer; }
            set { this.RaiseAndSetIfChanged(ref _buffer, value); UpdateImageSource(); }
        }
        public BitmapSource Source
        {
            get { return _source; }
            set { this.RaiseAndSetIfChanged(ref _source, value); }
        }

        public RomImageViewModel()
        {
            this.Buffer = Array.Empty<byte>();
            this.Source = null;
        }

        private void UpdateImageSource()
        {
            if (_buffer != null && _imageHeight > 0 && _imageWidth > 0)
            {
                this.Source = BitmapSource.Create(_imageWidth, _imageHeight, 96, 96, PixelFormats.Rgb24, BitmapPalettes.WebPalette, _buffer, _imageWidth);
            }
        }
    }
}
