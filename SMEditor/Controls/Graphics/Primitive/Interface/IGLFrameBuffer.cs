using OpenTK.Graphics.OpenGL;

namespace SMEditor.Controls.Graphics.Primitive.Interface
{
    public interface IGLFrameBuffer : IGLPrimitive
    {
        /// <summary>
        /// Calls the GL.CheckFrameBufferStatus readiness check method for frame buffers
        /// </summary>
        bool IsReady();

        /// <summary>
        /// Attaches the frame texture for rendering
        /// </summary>
        void AttachTexture(int textureHandle, FramebufferAttachment attachment);

        /// <summary>
        /// Attaches a depth-stencil render buffer
        /// </summary>
        void AttachRenderBuffer();
    }
}
