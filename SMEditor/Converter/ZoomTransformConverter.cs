using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

namespace SMEditor.Converter
{
    public class ZoomTransformConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (values == null)
                return Binding.DoNothing;

            if (values.Length != 2)
                return Binding.DoNothing;

            var zoom = (int)values[0];
            var offset = (Point)values[1];

            var scale = new ScaleTransform(Math.Clamp(zoom, 1, 20), Math.Clamp(zoom, 1, 20));
            var translate = new TranslateTransform(offset.X, offset.Y);
            var group = new TransformGroup();

            group.Children.Add(scale);
            group.Children.Add(translate);

            return group;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            var transform = value as TransformGroup;

            if (transform != null && transform.Children.Count == 2)
            {
                var scale = transform.Children[0] as ScaleTransform;
                var translate = transform.Children[1] as TranslateTransform;

                return new object[]
                {
                    scale?.ScaleX ?? 1,
                    new Point(translate?.X ?? 0, translate?.Y ?? 0)
                };
            }

            return new object[] { 1, new Point(0, 0) };
        }
    }
}
