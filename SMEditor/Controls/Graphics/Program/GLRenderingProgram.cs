using System;
using System.Windows.Media;

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
        readonly UniformData<int> _componentTextureUniform;
        readonly UniformData<Vector4> _rubberbandColorUniform;

        GLTexture _frameTexture;
        GLTexture _sceneTexture;
        GLTexture _componentTexture;

        public GLRenderingProgram(IGLFrameBuffer frameBuffer,
                                  IGLProgram rubberbandSelectProgram, 
                                  IGLProgram sceneProgram,
                                  IGLProgram frameProgram,
                                  GLTexture frameTexture,
                                  GLTexture sceneTexture,
                                  GLTexture componentTexture,
                                  UniformData<int> frameTextureUniform,
                                  UniformData<int> sceneTextureUniform,
                                  UniformData<int> componentTextureUniform,
                                  UniformData<Vector4> rubberbandColorUniform)
        {
           // _frameBuffer = frameBuffer;
            _rubberbandSelectProgram = rubberbandSelectProgram;
            _sceneProgram = sceneProgram;
            _frameProgram = frameProgram;
            _frameTextureUniform = frameTextureUniform;
            _sceneTextureUniform = sceneTextureUniform;
            _componentTextureUniform = componentTextureUniform;
            _rubberbandColorUniform = rubberbandColorUniform;
            _frameTexture = frameTexture;
            _sceneTexture = sceneTexture;
            _componentTexture = componentTexture;
        }

        public void Compile()
        {
            if (this.IsCompiled)
                throw new Exception("Already called IGLLevelRenderingProgram.Compile()");

            _rubberbandSelectProgram.Compile();
            _sceneProgram.Compile();
            _frameProgram.Compile();

            // Create the textures:  (NOTE** Program handle not used currently)
            _frameTexture.Create(-1);
            _sceneTexture.Create(-1);
            _componentTexture.Create(-1);

            _rubberbandSelectProgram.Bind(true);
            _rubberbandSelectProgram.BindUniform(_rubberbandColorUniform);

            _sceneProgram.Bind(true);
            _sceneProgram.BindUniform(_sceneTextureUniform);

            _frameProgram.Bind(true);
            _frameProgram.BindUniform(_sceneTextureUniform);
            _frameProgram.BindUniform(_frameTextureUniform);
            _frameProgram.BindUniform(_componentTextureUniform);

            // Create Frame buffer:  Uses scene program to render to the frame buffer attached texture
            //_frameBuffer.Create(_frameProgram.Handle);

            // Attach texture to frame buffer
            //_frameBuffer.Bind(true);
            //_frameBuffer.AttachTexture(_frameTexture.Handle, FramebufferAttachment.ColorAttachment0);
            //_frameBuffer.AttachTexture(_sceneTexture.Handle, FramebufferAttachment.ColorAttachment1);
            //_frameBuffer.AttachTexture(_componentTexture.Handle, FramebufferAttachment.ColorAttachment2);
            //_frameBuffer.AttachRenderBuffer();
            //_frameBuffer.Bind(false);

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
            _sceneTexture.Teardown();
            _componentTexture.Teardown();

            // Frame Buffer
            //_frameBuffer.Teardown();

            // Programs
            _rubberbandSelectProgram.Delete();
            _sceneProgram.Delete();
            _frameProgram.Delete();

            this.IsCompiled = false;
        }

        public void Run()
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            //if (!_frameBuffer.IsReady())
            //    throw new GLException("Framebuffer status not ready for drawing!");

            // Procedure:  Two color attachments to the frame buffer - color attachment 1 used for blending
            //
            // 1) Bind the frame buffer
            // 2) Render scene to frame buffer (the bitmap we're editing)
            // 3) Render 
            // 3) De-activate frame buffer
            // 4) Render to screen (using frame program)
            //
            //GL.DrawBuffer(DrawBufferMode.ColorAttachment0);
            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.StencilBufferBit | ClearBufferMask.DepthBufferBit);
            GL.ClearColor(0.0f, 0.0f, 0.0f, 0.0f);

            // Frame Texture must be cleared out since we allocated it
            //_frameTexture.Bind(true);
            //_frameTexture.ClearColor(Colors.Transparent);

            //_componentTexture.Bind(true);
            //_componentTexture.ClearColor(Colors.Transparent);

            // Enable the frame buffer
            //_frameBuffer.Bind(true);

            // Activate Color Attachment 1 (Scene Texture = Primary Bitmap)
            //GL.DrawBuffer(DrawBufferMode.ColorAttachment1);

            // Render the scene (bitmap) (This would've been other data) (the frame program has the primary bitmap)
            _sceneProgram.Bind(true);
            _sceneProgram.DrawAll();

            // Activate Color Attachment 2 (Component Texture = All Overlays)
            //GL.DrawBuffer(DrawBufferMode.ColorAttachment2);

            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactor.SrcAlpha, BlendingFactor.OneMinusSrcAlpha);

            // Render the rubberband select polygon
            _rubberbandSelectProgram.Bind(true);
            _rubberbandSelectProgram.DrawAll();

            GL.Disable(EnableCap.Blend);

            // Activate Color Attachment 0 (Frame Texture = Frame Buffer Renderer (gets redrawn each pass))
            //GL.DrawBuffer(DrawBufferMode.ColorAttachment0);

            //GL.Enable(EnableCap.Blend);
            //GL.BlendFunc(BlendingFactor.SrcAlpha, BlendingFactor.OneMinusSrcAlpha);

            // Render the frame buffer contents
            //_frameBuffer.Bind(false);
            //_frameProgram.Bind(true);
            //_frameProgram.DrawAll();

            //GL.Disable(EnableCap.Blend);

            GL.Flush();
            GL.Finish();
        }
    }
}
