using System;

using OpenTK.Graphics.OpenGL;
using OpenTK.Mathematics;

using SMEditor.Controls.Graphics;
using SMEditor.Controls.Graphics.Primitive;
using SMEditor.Controls.Graphics.Primitive.Interface;
using SMEditor.Controls.Graphics.Program.Interface;
using SMEditor.Controls.Grpahics.Data;

namespace RogueCreator.Graphics.GLModel.Program
{
    /// <summary>
    /// Program to create a level preview image - which has a fully lit ISymbolLayer from the model
    /// rendered by the GL backend.
    /// </summary>
    public class GLRenderingProgram : IGLRenderingProgram
    {
        public bool IsCompiled { get; private set; }

        readonly IGLFrameBuffer _frameBuffer;
        readonly IGLProgram _rubberbandSelectProgram;
        readonly IGLProgram _sceneProgram;
        readonly IGLProgram _frameProgram;

        readonly UniformData<int> _frameTextureUniform;                     // Frame texture:  Used for frame buffer attachment - rendered by: { frame program }
        readonly UniformData<int> _sceneTextureUniform;
        readonly UniformData<Vector4> _rubberbandColorUniform;

        GLTexture _frameTexture;
        GLTexture _sceneTexture;

        int _zoomLevel = 1;

        public GLRenderingProgram(IGLFrameBuffer frameBuffer,
                                  IGLProgram rubberbandSelectProgram, 
                                  IGLProgram sceneProgram,
                                  IGLProgram frameProgram,
                                  GLTexture frameTexture,
                                  GLTexture sceneTexture,
                                  UniformData<int> frameTextureUniform,
                                  UniformData<int> sceneTextureUniform,
                                  UniformData<Vector4> rubberbandColorUniform)
        {
            _frameBuffer = frameBuffer;
            _rubberbandSelectProgram = rubberbandSelectProgram;
            _sceneProgram = sceneProgram;
            _frameProgram = frameProgram;
            _frameTextureUniform = frameTextureUniform;
            _sceneTextureUniform = sceneTextureUniform;
            _rubberbandColorUniform = rubberbandColorUniform;
            _frameTexture = frameTexture;
            _sceneTexture = sceneTexture;
        }

        public void Compile()
        {
            if (this.IsCompiled)
                throw new Exception("Already called IGLLevelRenderingProgram.Compile()");

            _rubberbandSelectProgram.Compile();
            _sceneProgram.Compile();
            _frameProgram.Compile();

            // Create the textures:  (NOTE** Program handle not used currently)
            _frameTexture.Create(_frameProgram.Handle);
            _sceneTexture.Create(_sceneProgram.Handle);

            _rubberbandSelectProgram.Bind(true);
            _rubberbandSelectProgram.BindUniform(_rubberbandColorUniform);

            _sceneProgram.Bind(true);
            _sceneProgram.BindUniform(_sceneTextureUniform);

            _frameProgram.Bind(true);
            _frameProgram.BindUniform(_sceneTextureUniform);
            _frameProgram.BindUniform(_frameTextureUniform);

            // Create Frame buffer:  Uses scene program to render to the frame buffer attached texture
            _frameBuffer.Create(_frameProgram.Handle);

            // Attach texture to frame buffer
            _frameBuffer.AttachTexture(_frameTexture.Handle, FramebufferAttachment.ColorAttachment0);
            _frameBuffer.AttachRenderBuffer();

            this.IsCompiled = true;
        }

        public void Delete()
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            // Procedure
            //
            // 0) Delete textures
            // 1) Delete frame buffer
            // 2) Delete programs
            //

            // Textures
            _frameTexture.Teardown();

            // Frame Buffer
            _frameBuffer.Teardown();

            // Programs
            _rubberbandSelectProgram.Delete();
            _sceneProgram.Delete();
            _frameProgram.Delete();

            this.IsCompiled = false;
        }

        public void SetZoom(int zoomLevel)
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            // Save this scale factor for the rendering loop
            _zoomLevel = zoomLevel;
        }

        public int GetZoom()
        {
            return _zoomLevel;
        }

        public void Run()
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            if (!_frameBuffer.IsReady())
                throw new GLException("Framebuffer status not ready for drawing!");

            // Procedure:  Two color attachments to the frame buffer - color attachment 1 used for blending
            //
            // 1) Bind the frame buffer
            // 2) Render scene to frame buffer
            // 3) De-activate frame buffer
            // 4) Render to screen (using frame program)
            //

            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.StencilBufferBit | ClearBufferMask.DepthBufferBit);
            //GL.ClearColor(0.0f, 0.0f, 0.0f, 0.0f);

            // Enable the frame buffer
            _frameBuffer.Bind(true);

            // Activate Color Attachment 0
            GL.DrawBuffer(DrawBufferMode.ColorAttachment1);

            // Render the scene (bitmap)
            _sceneProgram.Bind(true);
            _sceneProgram.DrawAll();

            GL.DrawBuffer(DrawBufferMode.ColorAttachment0);

            GL.LineWidth(5);

            // Render the rubberband select polygon
            _rubberbandSelectProgram.Bind(true);
            _rubberbandSelectProgram.DrawAll();

            GL.LineWidth(1);

            // Render the frame buffer contents
            _frameBuffer.Bind(false);
            _frameProgram.Bind(true);
            _frameProgram.DrawAll();

            GL.Flush();
            GL.Finish();
        }
    }
}
