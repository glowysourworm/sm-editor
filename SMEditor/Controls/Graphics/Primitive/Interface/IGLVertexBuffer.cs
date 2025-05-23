namespace SMEditor.Controls.Graphics.Primitive.Interface
{
    /// <summary>
    /// Interface for the VBO (Vertex Buffer Object) in OpenGL. Several of these belong to the VAO (IGLVertexBuffer)
    /// </summary>
    public interface IGLVertexBuffer : IGLPrimitive
    {
        /// <summary>
        /// Buffer index provided by the VAO IGLVertexArray - This identifies the buffer to the GPU backend.
        /// </summary>
        int BufferIndex { get; }

        /// <summary>
        /// Number of VERTICES per for the (entire) stream
        /// </summary>
        int GetNumberOfVertices();

        /// <summary>
        /// Length of buffer in terms of ELEMENTS
        /// </summary>
        int GetNumberOfElements();

        /// <summary>
        /// Gets size of buffer in bytes
        /// </summary>
        int GetBufferSize();
    }
}
