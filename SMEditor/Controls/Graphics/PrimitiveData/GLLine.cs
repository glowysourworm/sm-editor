using OpenTK.Graphics.OpenGL4;
using OpenTK.Mathematics;

using SMEditor.Controls.Graphics.PrimitiveData.Interface;

namespace SMEditor.Controls.Graphics.PrimitiveData
{
    public class GLLine : IGLVector<float>
    {
        private readonly Vector2 _point;

        public GLLine(Vector2 point)
        {
            _point = point;
        }

        public int GetElementSize(PrimitiveType primitiveType)
        {
            // 1 Element
            switch (primitiveType)
            {
                case PrimitiveType.Lines:
                    return 1;
                default:
                    throw new GLException("Unhandled primitive type:  {0}", primitiveType);
            }
        }

        public int GetStreamSize(PrimitiveType primitiveType)
        {
            // Vector2 = 2 * sizeof(float)
            switch (primitiveType)
            {
                case PrimitiveType.Lines:
                    return 2 * sizeof(float);
                default:
                    throw new GLException("Unhandled primitive type:  {0}", primitiveType);
            }
        }

        public void StreamBuffer(DataStream outputStream, PrimitiveType primitiveType)
        {
            if (primitiveType != PrimitiveType.Lines)
                throw new GLException("Unhandled primitive type:  {0}", primitiveType);

            outputStream.Write(_point);
        }
    }
}
