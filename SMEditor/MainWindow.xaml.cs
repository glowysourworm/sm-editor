using System;
using System.DirectoryServices.ActiveDirectory;
using System.Windows;
using System.Windows.Controls;

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

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog();

            if (dialog.ShowDialog() == true)
            {
                var romBuffer = System.IO.File.ReadAllBytes(dialog.FileName);

                // We're going to scrub the rom for data:  Samus's data should be somewhere in here
                // and we need the artwork. Here's a section of the rom.txt file:

                /*
                    Bank $90      $90:0000-$90:7FFF      $80000-87FFF        Samus's animations/movement/weapons, shinesparking, minimap, hitbox collision, etc.
                    Bank $91      $91:8000-$91:FFFF      $88000-8FFFF        Samus's movement transitions/frame delays, other Samus data, demo inputs, etc.
                    Bank $92      $92:0000-$92:7FFF      $90000-97FFF        Animation pointer tables, animation data, tilemaps, etc.
                    Bank $93      $93:8000-$93:FFFF      $98000-9FFFF        Samus's beam animation tilemaps.
                    Bank $94      $94:0000-$94:7FFF      $A0000-A7FFF        BTS collision, start of "Special GFX" in SMILE.
                    Bank $95      $95:8000-$95:FFFF      $A8000-AFFFF        "Special GFX" in SMILE.
                    Bank $96      $96:0000-$96:7FFF      $B0000-B7FFF        "Special GFX" in SMILE.
                    Bank $97      $97:8000-$97:FFFF      $B8000-BFFFF        "Special GFX" in SMILE.
                    Bank $98      $98:0000-$98:7FFF      $C0000-C7FFF        "Special GFX" in SMILE.
                    Bank $99      $99:8000-$99:FFFF      $C8000-CFFFF        "Special GFX" in SMILE.
                    Bank $9A      $9A:0000-$9A:7FFF      $D0000-D7FFF        Grapple graphics, layer FX graphics, beam graphics, common sprite graphics, etc.
                    Bank $9B      $9B:8000-$9B:FFFF      $D8000-DFFFF        Samus's graphics.
                    Bank $9C      $9C:0000-$9C:7FFF      $E0000-E7FFF        Samus's graphics.
                    Bank $9D      $9D:8000-$9D:FFFF      $E8000-EFFFF        Samus's graphics.
                    Bank $9E      $9E:0000-$9E:7FFF      $F0000-F7FFF        Samus's graphics.
                    Bank $9F      $9F:8000-$9F:FFFF      $F8000-FFFFF        Samus's graphics.
                */

                // Lets start by dumping banks $90 -> $9F

                var startAddress = 0x80000;
                var endAddress = 0xFFFFF;

                using (var stream = System.IO.File.OpenWrite("C:\\Backup\\_programs\\Development\\snes_dev\\samus.bin"))
                {
                    stream.Write(romBuffer, startAddress, endAddress - startAddress + 1);
                }
            }
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void ReloadImages()
        {
            // Reload Images
            var viewModel = this.DataContext as MainViewModel;

            if (viewModel != null)
            {
                try
                {
                    viewModel.Images.Clear();

                    var romBuffer = System.IO.File.ReadAllBytes(viewModel.RomFile);

                    // Image Data Slices
                    for (int index = viewModel.StartAddress; index < viewModel.EndAddress; index += viewModel.Stride)
                    {
                        var imageBuffer = new byte[viewModel.Stride];

                        Array.Copy(romBuffer, index, imageBuffer, 0, viewModel.Stride);

                        viewModel.Images.Add(new RomImageViewModel()
                        {
                            Buffer = imageBuffer,
                            StartAddress = index,
                            EndAddress = index + viewModel.Stride,
                            ImageWidth = viewModel.ImageWidth,
                            ImageHeight = viewModel.ImageHeight
                        });
                    }

                    var format = "ROM Parsed Successfully!  {0} {1} x {2} images loaded with size {3} (bytes) from address [{4} to {5}]";

                    viewModel.Logs.Add(new LogViewModel()
                    {
                        Message = string.Format(format, viewModel.Images.Count, viewModel.ImageWidth, viewModel.ImageHeight, viewModel.Stride, viewModel.StartAddress, viewModel.EndAddress)
                    });
                }
                catch (Exception ex)
                {
                    viewModel.Logs.Add(new LogViewModel()
                    {
                       Message= ex.ToString()
                    });
                    viewModel.Logs.Add(new LogViewModel()
                    {
                        Message = ex.InnerException?.ToString() ?? ""
                    });
                }
            }
        }

        private void ReadROM_Click(object sender, RoutedEventArgs e)
        {
            ReloadImages();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog();

            if (dialog.ShowDialog() == true)
            {
                var viewModel = this.DataContext as MainViewModel;

                if (viewModel != null)
                {
                    viewModel.RomFile = dialog.FileName;

                    ReloadImages();
                }
            }
        }
    }
}
