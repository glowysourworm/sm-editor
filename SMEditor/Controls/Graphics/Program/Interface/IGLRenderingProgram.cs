namespace SMEditor.Controls.Graphics.Program.Interface
{
    /// <summary>
    /// GL Program that has an attached frame buffer for pre-rendering to a texture
    /// </summary>
    public interface IGLRenderingProgram
    {
        /// <summary>
        /// Returns true if the program is compiled on the backend
        /// </summary>
        bool IsCompiled { get; }

        /// <summary>
        /// Compiles the GL program on the backend
        /// </summary>
        void Compile();

        /// <summary>
        /// Deletes the GL programs from the backend
        /// </summary>
        void Delete();

        /// <summary>
        /// Renders the program's drawing arrays
        /// </summary>
        void Run();

        /// <summary>
        /// Sets a scale factor for zoom effect for the program using a scale matrix
        /// </summary>
        void SetZoom(int zoomLevel);

        /// <summary>
        /// Returns last zoom setting
        /// </summary>
        int GetZoom();
    }
}
