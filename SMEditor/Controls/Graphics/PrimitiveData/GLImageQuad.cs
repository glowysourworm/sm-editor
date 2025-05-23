using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.PrimitiveData.Interface;

namespace SMEditor.Controls.Graphics.PrimitiveData
{
    /// <summary>
    /// Creates a quad-like vertex buffer structure with interleved texture coordinates to draw GL-Triangles.
    /// </summary>
    internal struct GLImageQuad : IGLVector<float>
    {
        public GLQuad VertexCoordinates;
        public GLQuad TextureCoordinates;

        public GLImageQuad(GLQuad vertexCoords, GLQuad textureCoords)
        {
            this.VertexCoordinates = vertexCoords;
            this.TextureCoordinates = textureCoords;
        }

        public int GetElementSize(PrimitiveType primitiveType)
        {
            // These should probably be tested! :)
            switch (primitiveType)
            {
                case PrimitiveType.Triangles:
                    return 6;
                default:
                    throw new GLException("Unhandled primitive type for GLImage2DVector:  {0}", primitiveType);
            }
        }

        public int GetStreamSize(PrimitiveType primitiveType)
        {
            switch (primitiveType)
            {
                // 24 TOTAL FLOATS * sizeof(float) (bytes)
                case PrimitiveType.Triangles:
                    return 24 * sizeof(float);
                default:
                    throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);
            }
        }

        public void StreamBuffer(DataStream outputStream, PrimitiveType primitiveType)
        {
            if (primitiveType != PrimitiveType.Triangles)
                throw new GLException("Unhandled primitive type for GLQuad:  {0}", primitiveType);

            // Top Left
            outputStream.Write(this.VertexCoordinates.Left);            // vec2
            outputStream.Write(this.VertexCoordinates.Top);
            outputStream.Write(this.TextureCoordinates.Left);           // vec2
            outputStream.Write(this.TextureCoordinates.Top);

            // Top Right
            outputStream.Write(this.VertexCoordinates.Right);
            outputStream.Write(this.VertexCoordinates.Top);
            outputStream.Write(this.TextureCoordinates.Right);
            outputStream.Write(this.TextureCoordinates.Top);

            // Bottom Left
            outputStream.Write(this.VertexCoordinates.Left);
            outputStream.Write(this.VertexCoordinates.Bottom);
            outputStream.Write(this.TextureCoordinates.Left);
            outputStream.Write(this.TextureCoordinates.Bottom);

            // Bottom Left
            outputStream.Write(this.VertexCoordinates.Left);
            outputStream.Write(this.VertexCoordinates.Bottom);
            outputStream.Write(this.TextureCoordinates.Left);
            outputStream.Write(this.TextureCoordinates.Bottom);

            // Top Right
            outputStream.Write(this.VertexCoordinates.Right);
            outputStream.Write(this.VertexCoordinates.Top);
            outputStream.Write(this.TextureCoordinates.Right);
            outputStream.Write(this.TextureCoordinates.Top);

            // Bottom Right
            outputStream.Write(this.VertexCoordinates.Right);
            outputStream.Write(this.VertexCoordinates.Bottom);
            outputStream.Write(this.TextureCoordinates.Right);
            outputStream.Write(this.TextureCoordinates.Bottom);
        }

        public override string ToString()
        {
            return string.Format("vertex [{0}] texcoord [{1}]", this.VertexCoordinates, this.TextureCoordinates);
        }
    }
}
