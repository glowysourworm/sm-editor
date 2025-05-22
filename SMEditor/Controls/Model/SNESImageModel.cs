using System.Windows.Media;

using SMEditor.ViewModel;

namespace SMEditor.Controls.Model
{
    public class SNESImageModel : ViewModelBase
    {
        private int _imageWidth;
        private int _imageHeight;
        byte[] _buffer;

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
        public byte[] Buffer
        {
            get { return _buffer; }
            set { this.RaiseAndSetIfChanged(ref _buffer, value); }
        }

        public Color GetBrushFromPalette(int pixelX, int pixelY)
        {
            return Colors.White;
        }
    }
}
