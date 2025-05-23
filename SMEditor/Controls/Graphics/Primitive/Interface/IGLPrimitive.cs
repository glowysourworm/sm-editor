namespace SMEditor.Controls.Graphics.Primitive.Interface
{
    /// <summary>
    /// Represents a piece of the GL model that maintains references with the OpenGL backend. It is meant to
    /// have a life-cycle that is reusable. Create() -> Teardown() -> Create() -> ...
    /// </summary>
    public interface IGLPrimitive
    {
        /// <summary>
        /// Returns the GL handle created by the OpenTK GL backend
        /// </summary>
        int Handle { get; }

        /// <summary>
        /// Returns true if the model is created on the GL backend
        /// </summary>
        bool IsCreated { get; }

        /// <summary>
        /// Returns true if the primitive is bound on the backend
        /// </summary>
        bool IsBound { get; }

        /// <summary>
        /// Binds the primitive on the backend - making it active
        /// </summary>
        void Bind(bool bind);

        /// <summary>
        /// Creates the GPU resources associated with the IGLModel using the OpenTK GL API
        /// </summary>
        /// <param name="programHandle">The handle for the owning program of the IGLPrimitive</param>
        void Create(int programHandle);

        /// <summary>
        /// Deletes backend GPU resources associated with the IGLModel using the OpenTK GL API
        /// </summary>
        void Teardown();
    }
}
