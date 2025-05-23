using System.Windows;
using System.Windows.Media;

namespace SMEditor.ViewModel
{
    public class SpriteEditorViewModel : ViewModelBase
    {
        string _spriteSheetFile;
        int _spriteSheetHeight;
        int _spriteSheetWidth;
        int _spriteSheetColumns;
        int _spriteSheetRows;
        int _animationTimeMilliSeconds;

        int _zoom;
        Point _offset;
        Color _selectedColor;
        Color _backgroundColor;
        Color _spriteGridColor;
        int _brushSize;

        public string SpriteSheetFile
        {
            get { return _spriteSheetFile; }
            set { this.RaiseAndSetIfChanged(ref _spriteSheetFile, value); }
        }
        public int SpriteSheetHeight
        {
            get { return _spriteSheetHeight; }
            set { this.RaiseAndSetIfChanged(ref _spriteSheetHeight, value); }
        }
        public int SpriteSheetWidth
        {
            get { return _spriteSheetWidth; }
            set { this.RaiseAndSetIfChanged(ref _spriteSheetWidth, value); }
        }
        public int SpriteSheetColumns
        {
            get { return _spriteSheetColumns; }
            set { this.RaiseAndSetIfChanged(ref _spriteSheetColumns, value); }
        }
        public int SpriteSheetRows
        {
            get { return _spriteSheetRows; }
            set { this.RaiseAndSetIfChanged(ref _spriteSheetRows, value); }
        }
        public int AnimationTimeMilliSeconds
        {
            get { return _animationTimeMilliSeconds; }
            set { this.RaiseAndSetIfChanged(ref _animationTimeMilliSeconds, value); }
        }

        // Editor Parameters
        public int Zoom
        {
            get { return _zoom; }
            set { this.RaiseAndSetIfChanged(ref _zoom, value); }
        }
        public Point Offset
        {
            get { return _offset; }
            set { this.RaiseAndSetIfChanged(ref _offset, value); }
        }
        public Color SelectedColor
        {
            get { return _selectedColor; }
            set { this.RaiseAndSetIfChanged(ref _selectedColor, value); }
        }
        public Color BackgroundColor
        {
            get { return _backgroundColor; }
            set { this.RaiseAndSetIfChanged(ref _backgroundColor, value); }
        }
        public Color SpriteGridColor
        {
            get { return _spriteGridColor; }
            set { this.RaiseAndSetIfChanged(ref _spriteGridColor, value); }
        }
        public int BrushSize
        {
            get { return _brushSize; }
            set { this.RaiseAndSetIfChanged(ref _brushSize, value); }
        }

        public SpriteEditorViewModel()
        {
            this.SpriteSheetFile = string.Empty;
            this.AnimationTimeMilliSeconds = 500;
            this.Zoom = 1;
        }
    }
}
