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
    }
}
