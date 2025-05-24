using SMEditor.Controls.Graphics.PrimitiveData;

namespace SMEditor.Controls.Graphics.Primitive.Interface
{
    /// <summary>
    /// Represents the VAO vertex array from the OpenGL backend
    /// </summary>
    public interface IGLVertexArray : IGLPrimitive
    {
        /// <summary>
        /// Calls the GL.DrawArrays method with the instance's configured parameters
        /// </summary>
        void Draw();

        /// <summary>
        /// Sets up a new data stream on the GL backend. Must be the same size / type of the original.
        /// </summary>
        void ReBuffer(DataStream stream);
    }
}
