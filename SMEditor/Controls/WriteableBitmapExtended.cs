using System;
using System.ComponentModel.Design.Serialization;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace SMEditor.Controls
{
    public static class WriteableBitmapExtended
    {
        public static void GetPixel(this WriteableBitmap bitmap, int x, int y, ref Color color)
        {
            unsafe
            {
                try
                {
                    var bufferPointer = bitmap.BackBuffer;
                    var index = CalculateByteOffset(bitmap, x, y);

                    bufferPointer += index;

                    var pixel = *(int*)bufferPointer;
                    var bytes = BitConverter.GetBytes(pixel);

                    color.R = (byte)bytes[0];
                    color.G = (byte)bytes[1];
                    color.B = (byte)bytes[2];
                    color.A = (byte)bytes[3];
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        /// <summary>
        /// Draws rect of the bitmap to a specified color. The colorArray parameter is modified to suit the method, so that
        /// it can be passed back into the method without allocating new memory. The color parameter is also used to help avoid
        /// looping through the colorArray - which is assumed to be ALL CONSTANT! (SAME COLOR!)
        /// </summary>
        /// <param name="bitmap">Source Bitmap</param>
        /// <param name="x1">Top-Left Pixel X</param>
        /// <param name="y1">Top-Left Pixel Y</param>
        /// <param name="x2">Bottom-Right Pixel X</param>
        /// <param name="y2">Bottom-Right Pixel Y</param>
        /// <param name="color">Desired Color</param>
        /// <param name="colorArray">Color Array</param>
        public static void DrawRect(this WriteableBitmap bitmap, int x1, int y1, int x2, int y2, int color, ref int[] colorArray)
        {
            var index1 = CalculateByteOffset(bitmap, x1, y1);
            var index2 = CalculateByteOffset(bitmap, x2, y2);
            var length = (index2 - index1) / 4;
            var newArray = false;

            if (length == 0)
                return;

            // Re-Allocation may be prevented by caller
            if (colorArray.Length != length)
            {
                colorArray = new int[length];
                newArray = true;
            }

            if (newArray || color != colorArray[0])
            {
                for (int index = 0; index < length; index++)
                {
                    colorArray[index] = color;
                }
            }

            var rect = new Int32Rect(x1, y1, x2 - x1, y2 - y1);

            bitmap.WritePixels(rect, colorArray, bitmap.BackBufferStride, 0);
            bitmap.AddDirtyRect(rect);
        }

        private static int CalculateByteOffset(this WriteableBitmap bitmap, int x, int y)
        {
            // https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.imaging.writeablebitmap?view=windowsdesktop-9.0
            var columnOffset = x * 4;
            var rowOffset = y * bitmap.BackBufferStride;

            return columnOffset + rowOffset;
        }
    }
}
