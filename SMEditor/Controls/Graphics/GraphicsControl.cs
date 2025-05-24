using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using OpenTK.GLControl;
using OpenTK.Graphics.OpenGL4;

using RogueCreator.Graphics.GLModel.Program;

using SMEditor.Controls.Graphics.Program.Interface;

using static SMEditor.Controls.Graphics.RenderingOutputHandler;

namespace SMEditor.Controls.Graphics
{
    public class GraphicsControl : GLControl
    {
        // Parameters for the GL backend
        bool _glInitialized;

        bool _renderingProgramLoaded;

        // Running rendering program
        IGLRenderingProgram _renderingProgram;

        public GraphicsControl(GLRenderingOutputHandler renderingOutputHandler) : base(GLControlSettings.Default)
        {
            _glInitialized = false;
            _renderingProgramLoaded = false;

            // Have to load GL context before calling the backend
            this.Load += (sender, e) =>
            {
                // GL Version!
                renderingOutputHandler("Renderer:  " + GL.GetString(StringName.Renderer));
                renderingOutputHandler("GLSL Version:  " + GL.GetString(StringName.ShadingLanguageVersion));
                renderingOutputHandler("Vendor:  " + GL.GetString(StringName.Vendor));
                renderingOutputHandler("Open GL Version:  " + GL.GetString(StringName.Version));

                GL.Enable(EnableCap.DebugOutput);
                GL.Enable(EnableCap.DebugOutputSynchronous);
                GL.DebugMessageCallback(new DebugProc((source, type, id, severity, length, messagePtr, userParameter) =>
                {
                    var message = Marshal.PtrToStringAuto(messagePtr);

                    renderingOutputHandler(message);

                }), IntPtr.Zero);

                // Signal that the OnPaint method can call GLDraw()
                _glInitialized = true;
            };
        }

        public bool IsGLInitialized()
        {
            return _glInitialized;
        }

        public bool IsGLRenderingProgramLoaded()
        {
            return _renderingProgramLoaded;
        }

        public void LoadScene(IGLRenderingProgram renderingProgram)
        {
            if (!_glInitialized)
                throw new GLException("OpenGL not yet initialized:  GraphicsControl.LoadScene");

            // Clear the backend
            DeleteProgram();

            _renderingProgram = renderingProgram;
            _renderingProgramLoaded = true;

            Invalidate();
        }

        public void UnloadScene()
        {
            // Clear the backend
            DeleteProgram();

            Invalidate();
        }

        public void SetViewport(int offsetX, int offsetY, int width, int height)
        {
            if (!_glInitialized)
                throw new GLException("OpenGL not yet initialized:  GraphicsControl.SetViewport");

            GL.Viewport(offsetX, offsetY, width, height);

            Invalidate();
        }

        protected void DeleteProgram()
        {
            if (!_glInitialized)
                throw new GLException("OpenGL not yet initialized:  GraphicsControl.DeleteProgram");

            // Deletes GL Backend GPU data
            if (_renderingProgram != null && _renderingProgram.IsCompiled)
                _renderingProgram.Delete();

            _renderingProgram = null;
            _renderingProgramLoaded = false;
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            base.OnPaint(e);

            // Must first initialize the GL backend
            if (!_glInitialized)
                return;

            GLDraw();
        }

        protected override void OnInvalidated(InvalidateEventArgs e)
        {
            base.OnInvalidated(e);

            // Must first initialize the GL backend
            if (!_glInitialized)
                return;

            GLDraw();
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);

            if (_renderingProgramLoaded)
                DeleteProgram();
        }

        #region (private) GL Methods

        private void GLDraw()
        {
            if (!_glInitialized)
                throw new GLException("OpenGL not yet initialized:  GraphicsControl.GLDraw");

            // Run the rendering program
            if (_renderingProgramLoaded)
            {
                _renderingProgram.Run();
            }

            // Important to take care of flicker (see when to swap buffers!)
            this.Context.SwapBuffers();
        }
        #endregion
    }
}
