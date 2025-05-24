using System.Numerics;
using System.Windows.Media;

using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.PrimitiveData.Interface;

namespace SMEditor.Controls.Graphics.PrimitiveData
{
    /// <summary>
    /// Simple struct to help keep track of the vertex buffer data for a quad structure
    /// </summary>
    public struct GLColorQuad : IGLVector<float>
    {
        public GLQuad VertexCoordinates { get; set; }
        public Vector4 Color { get; set; }

        public GLColorQuad(float x1, float y1, float x2, float y2, Color color)
        {
            this.VertexCoordinates = new GLQuad(x1, y1, x2, y2);
            this.Color = new Vector4(color.ScR, color.ScG, color.ScB, color.ScA);
        }

        public int GetElementSize(PrimitiveType primitiveType)
        {
            // These should probably be tested! :)
            switch (primitiveType)
            {
                case PrimitiveType.Triangles:
                    return 6;
                default:
                    throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);
            }
        }

        public int GetStreamSize(PrimitiveType primitiveType)
        {
            switch (primitiveType)
            {
                // 36 TOTAL FLOATS * sizeof(float) (bytes)
                case PrimitiveType.Triangles:
                    return 36 * sizeof(float);
                default:
                    throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);
            }
        }

        public void StreamBuffer(DataStream outputStream, PrimitiveType primitiveType)
        {
            if (primitiveType != PrimitiveType.Triangles)
                throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);

            // ELEMENT LAYOUT
            //
            // Triangle 1:  bottom-left, top-left, top-right
            // Triangle 2:  bottom-left, top-right, bottom-right
            //
            // [x1, y1], [x2, y2], ... [xn, yn]
            //
            // Each vertex contains vertex attributes (vec2, vec4) for (position, color)
            //
            // Total Size = 6 (floats / vertex) * 6 (vertices / element) = 36 floats = 144 bytes

            // 2 + 4 (float) per vertex
            outputStream.Write(this.VertexCoordinates.Left);              // vec2 (top-left)
            outputStream.Write(this.VertexCoordinates.Bottom);
            outputStream.Write(this.Color);                               // vec4 (color)

            outputStream.Write(this.VertexCoordinates.Left);
            outputStream.Write(this.VertexCoordinates.Top);
            outputStream.Write(this.Color);

            outputStream.Write(this.VertexCoordinates.Right);
            outputStream.Write(this.VertexCoordinates.Top);
            outputStream.Write(this.Color);

            outputStream.Write(this.VertexCoordinates.Left);
            outputStream.Write(this.VertexCoordinates.Bottom);
            outputStream.Write(this.Color);

            outputStream.Write(this.VertexCoordinates.Right);
            outputStream.Write(this.VertexCoordinates.Top);
            outputStream.Write(this.Color);

            outputStream.Write(this.VertexCoordinates.Right);
            outputStream.Write(this.VertexCoordinates.Bottom);
            outputStream.Write(this.Color);
        }

        public override string ToString()
        {
            return this.VertexCoordinates.ToString();
        }
    }
}
