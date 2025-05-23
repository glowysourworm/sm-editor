using System.Collections.Generic;

using OpenTK.Graphics.OpenGL;

using SMEditor.Controls.Graphics.Primitive.Interface;

namespace SMEditor.Controls.Graphics.Primitive
{
    public class GLFrameBuffer : IGLFrameBuffer
    {
        public int Handle { get; private set; }
        public bool IsCreated { get; private set; }
        public bool IsBound { get; private set; }

        // Treating this as part of the framebuffer
        int _renderBufferHandle;

        List<FramebufferAttachment> _textureAttachments;

        readonly int _sceneWidth;
        readonly int _sceneHeight;

        public GLFrameBuffer(int sceneWidth, int sceneHeight)
        {
            _renderBufferHandle = 0;
            _sceneWidth = sceneWidth;
            _sceneHeight = sceneHeight;

            _textureAttachments = new List<FramebufferAttachment>();

            this.IsCreated = false;
            this.IsBound = false;
        }

        public void Create(int programHandle)
        {
            // Procedure:  This object should utilize a GL frame buffer to target the program's rendering
            //             to a 2D texture
            //
            // 1) Create, bind, and initialize the frame buffer
            // 2) Generate the 2D texture
            // 3) Bind the texture to the render buffer
            // 4) Bind the frame buffer as the ACTIVE frame buffer
            //

            // https://learnopengl.com/Advanced-OpenGL/Framebuffers

            this.Handle = GL.GenFramebuffer();

            // *This option sets up the frame buffer for READ (AND) WRITE
            GL.BindFramebuffer(FramebufferTarget.Framebuffer, this.Handle);

            this.IsCreated = true;
            this.IsBound = true;
        }

        public bool IsReady()
        {
            if (!this.IsCreated)
                throw new GLException("GLFrameBuffer has not yet been created on the backend");

            // Have to check for the status of the buffer before drawing
            //
            // // https://learnopengl.com/Advanced-OpenGL/Framebuffers
            //
            return GL.CheckFramebufferStatus(FramebufferTarget.ReadFramebuffer) == FramebufferErrorCode.FramebufferComplete;
        }

        public void Bind(bool bind)
        {
            if (!this.IsCreated)
                throw new GLException("GLFrameBuffer has not yet been created on the backend");

            if (bind)
            {
                GL.BindFramebuffer(FramebufferTarget.Framebuffer, this.Handle);
            }

            else
            {
                GL.BindFramebuffer(FramebufferTarget.Framebuffer, 0);
            }

            this.IsBound = bind;
        }

        public void AttachTexture(int textureHandle, FramebufferAttachment attachment)
        {
            if (!this.IsCreated)
                throw new GLException("GLFrameBuffer already deleted from the backend");

            if (!this.IsBound)
                throw new GLException("GLFrameBuffer must be bound before use");

            // Bind the texture to our frame buffer (NOTE:  Scene texture level = 0 because of no minimaps)            
            GL.FramebufferTexture2D(FramebufferTarget.Framebuffer, attachment, TextureTarget.Texture2D, textureHandle, 0);

            // Store list of attachments
            _textureAttachments.Add(attachment);
        }

        public void AttachRenderBuffer()
        {
            // Create a render buffer for the frame buffer
            _renderBufferHandle = GL.GenRenderbuffer();

            // Bind the render buffer
            GL.BindRenderbuffer(RenderbufferTarget.Renderbuffer, _renderBufferHandle);

            // Create the buffer storage
            GL.RenderbufferStorage(RenderbufferTarget.Renderbuffer, RenderbufferStorage.Depth24Stencil8, _sceneWidth, _sceneHeight);

            // Attach the render buffer
            GL.FramebufferRenderbuffer(FramebufferTarget.Framebuffer, FramebufferAttachment.DepthStencilAttachment, RenderbufferTarget.Renderbuffer, _renderBufferHandle);
        }

        public void Teardown()
        {
            if (!this.IsCreated)
                throw new GLException("GLFrameBuffer already deleted from the backend");

            // Unbind the framebuffer target
            GL.BindFramebuffer(FramebufferTarget.Framebuffer, 0);

            if (_renderBufferHandle != 0)
            {
                // Unbind the renderbuffer target
                GL.BindRenderbuffer(RenderbufferTarget.Renderbuffer, 0);

                // Delete the render buffer
                GL.DeleteRenderbuffer(_renderBufferHandle);
            }

            // Detach frame buffer textures
            foreach (var attachment in _textureAttachments)
                GL.FramebufferTexture2D(FramebufferTarget.Framebuffer, attachment, TextureTarget.Texture2D, 0, 0);

            // Delete THIS frame buffer
            GL.DeleteFramebuffer(this.Handle);

            this.Handle = 0;
            this.IsCreated = false;
        }
    }
}
