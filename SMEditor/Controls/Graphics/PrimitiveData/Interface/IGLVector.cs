using OpenTK.Graphics.OpenGL4;

namespace SMEditor.Controls.Graphics.PrimitiveData.Interface
{
    /// <summary>
    /// Interface that specifies a method of memory layout for any IGLVector
    /// </summary>
    public interface IGLVector<T> where T : struct
    {
        /// <summary>
        /// Returns the total size of the stream (in BYTES) (for one element)
        /// </summary>
        int GetStreamSize(PrimitiveType primitiveType);

        /// <summary>
        /// Gets size of elements for the provided primitive type in terms of # of VERTICES
        /// </summary>
        int GetElementSize(PrimitiveType primitiveType);

        /// <summary>
        /// Outputs the data to the output MANAGED stream - used for building data in 
        /// managed memory while preparing model for rendering.
        /// </summary>
        void StreamBuffer(DataStream outputStream, PrimitiveType primitiveType);
    }
}
