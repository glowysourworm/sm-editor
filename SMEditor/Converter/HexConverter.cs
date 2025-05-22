using System;
using System.Globalization;
using System.Windows.Data;

namespace SMEditor.Converter
{
    public class HexConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
                return Binding.DoNothing;

            var number = (int)value;

            return "0x" + number.ToString("X6");           // Needs to cover address space
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
                return Binding.DoNothing;

            var hex = value as string;
            var result = 0;

            if (!string.IsNullOrEmpty(hex))
            {
                // Hexadecimal
                if (hex.StartsWith("0x") || hex.StartsWith("0X"))
                {
                    if (Int32.TryParse(hex.Replace("0x", "").Replace("0X", ""), NumberStyles.HexNumber, CultureInfo.InvariantCulture.NumberFormat, out result))
                        return result;
                }

                else
                {
                    if (int.TryParse(hex, out result))
                        return result;
                }
            }

            return 0;
        }
    }
}
