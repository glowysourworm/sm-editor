using OpenTK.Mathematics;

using SMEditor.Controls.Graphics.PrimitiveData;

namespace SMEditor.Controls.Graphics.Utility
{
    public static class CoordinateConverter
    {
        /// <summary>
        /// Converts from UI coordinates to XY-Normalized
        /// </summary>
        /// <param name="pixelX">UI-coordinate X</param>
        /// <param name="pixelY">UI-coordinate Y</param>
        /// <param name="sceneWidth">UI Width</param>
        /// <param name="sceneHeight">UI Height</param>
        public static Vector2 ConvertToNormalizedXYScene(int pixelX, int pixelY, int sceneWidth, int sceneHeight)
        {
            var normalizedY = ((pixelY / (float)sceneHeight) * -2.0f) + 1.0f;
            var normalizedX = ((pixelX / (float)sceneWidth) * 2.0f) - 1.0f;

            return new Vector2(normalizedX, normalizedY);
        }

        /// <summary>
        /// Creates Quad from UI coordinates converting to XY-Normalized
        /// </summary>
        /// <param name="pixelX">UI-coordinate X</param>
        /// <param name="pixelY">UI-coordinate Y</param>
        /// <param name="pixelWidth">UI-coordinate Width</param>
        /// <param name="pixelHeight">UI-coordinate Height</param>
        /// <param name="sceneWidth">UI Width</param>
        /// <param name="sceneHeight">UI Height</param>
        public static GLQuad CreateQuadNormalizedXYScene(int pixelX, int pixelY, int pixelWidth, int pixelHeight, int sceneWidth, int sceneHeight)
        {
            var topLeft = ConvertToNormalizedXYScene(pixelX, pixelY, sceneWidth, sceneHeight);
            var bottomRight = ConvertToNormalizedXYScene(pixelX + pixelWidth, pixelY + pixelHeight, sceneWidth, sceneHeight);

            return new GLQuad()
            {
                Top = topLeft.Y,
                Bottom = bottomRight.Y,
                Left = topLeft.X,
                Right = bottomRight.X,
            };
        }

        /// <summary>
        /// Converts from UI coordinates to UV-Normalized scene coordinates - used for texture overlays or post-processing
        /// </summary>
        /// <param name="pixelX">UI Pixel X</param>
        /// <param name="pixelY">UI Pixel Y</param>
        /// <param name="sceneWidth">UI scene width</param>
        /// <param name="sceneHeight">UI scene height</param>
        /// <returns>UV coordinates with respect to the scene</returns>
        public static Vector2 ConvertToNormalizedUVScene(int pixelX, int pixelY, int sceneWidth, int sceneHeight)
        {
            // Have to invert the Y coordinate to work with the texture
            var normalizedU = pixelX / (float)sceneWidth;
            var normalizedV = 1 - (pixelY / (float)sceneHeight);

            return new Vector2(normalizedU, normalizedV);
        }

        /// <summary>
        /// Creates GLQuad from UI coordinates converting to UV-Normalized scene coordinates - used for texture overlays or post-processing
        /// </summary>
        /// <param name="pixelX">UI Pixel X</param>
        /// <param name="pixelY">UI Pixel Y</param>
        /// <param name="sceneWidth">UI scene width</param>
        /// <param name="sceneHeight">UI scene height</param>
        /// <returns>UV coordinate GLQuad with respect to the scene</returns>
        public static GLQuad CreateQuadNormalizedUVScene(int pixelX, int pixelY, int pixelWidth, int pixelHeight, int sceneWidth, int sceneHeight)
        {
            var topLeft = ConvertToNormalizedUVScene(pixelX, pixelY, sceneWidth, sceneHeight);
            var bottomRight = ConvertToNormalizedUVScene(pixelX + pixelWidth, pixelY + pixelHeight, sceneWidth, sceneHeight);

            return new GLQuad()
            {
                Top = topLeft.Y,
                Bottom = bottomRight.Y,
                Left = topLeft.X,
                Right = bottomRight.X,
            };
        }
    }
}
