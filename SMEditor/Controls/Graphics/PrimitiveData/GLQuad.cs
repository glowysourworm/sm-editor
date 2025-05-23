
using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.PrimitiveData.Interface;

namespace SMEditor.Controls.Graphics.PrimitiveData
{
    /// <summary>
    /// Simple struct to help keep track of the vertex buffer data for a quad structure
    /// </summary>
    public struct GLQuad : IGLVector<float>
    {
        public float Top;
        public float Left;
        public float Right;
        public float Bottom;

        public GLQuad(float x1, float y1, float x2, float y2)
        {
            this.Top = y1;
            this.Left = x1;
            this.Right = x2;
            this.Bottom = y2;
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
                // 12 TOTAL FLOATS * sizeof(float) (bytes)
                case PrimitiveType.Triangles:
                    return 12 * sizeof(float);
                default:
                    throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);
            }
        }

        public void StreamBuffer(DataStream outputStream, PrimitiveType primitiveType)
        {
            if (primitiveType != PrimitiveType.Triangles)
                throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);

            // Outputs 2-triangle entities:  top-left, top-right, bottom-left, bottom-left, top-right, bottom-right

            // [x1, y1], [x2, y2], ... [xn, yn]

            outputStream.Write(this.Left);
            outputStream.Write(this.Top);

            outputStream.Write(this.Right);
            outputStream.Write(this.Top);

            outputStream.Write(this.Left);
            outputStream.Write(this.Bottom);

            outputStream.Write(this.Left);
            outputStream.Write(this.Bottom);

            outputStream.Write(this.Right);
            outputStream.Write(this.Top);

            outputStream.Write(this.Right);
            outputStream.Write(this.Bottom);
        }

        public override string ToString()
        {
            return string.Format("Top: {0} Left: {1} Right: {2} Bottom: {3}", this.Top, this.Left, this.Right, this.Bottom);
        }
    }
}
