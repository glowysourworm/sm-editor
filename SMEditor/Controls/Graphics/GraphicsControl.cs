using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using OpenTK.GLControl;
using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.Program.Interface;

using static SMEditor.Controls.Graphics.RenderingOutputHandler;

namespace SMEditor.Controls.Graphics
{
    public class GraphicsControl : GLControl
    {
        // Parameters for the GL backend
        bool _glInitialized;

        // Running rendering program
        IGLRenderingProgram _renderingProgram;

        public GraphicsControl(GLRenderingOutputHandler renderingOutputHandler) : base(GLControlSettings.Default)
        {
            _glInitialized = false;

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
            };
        }

        public void LoadScene(IGLRenderingProgram renderingProgram)
        {
            // Clear the backend
            DeleteProgram();

            _renderingProgram = renderingProgram;

            // Signal that the OnPaint method can call GLDraw()
            _glInitialized = true;

            Invalidate();
        }

        public void SetViewport(int offsetX, int offsetY, int width, int height)
        {
            GL.Viewport(offsetX, offsetY, width, height);

            Invalidate();
        }

        protected void DeleteProgram()
        {
            if (_renderingProgram != null && _renderingProgram.IsCompiled)
                _renderingProgram.Delete();
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // Must first initialize the GL backend
            if (!_glInitialized)
                return;

            base.OnPaint(e);

            GLDraw();
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);

            DeleteProgram();
        }

        #region (private) GL Methods

        private void GLDraw()
        {
            // Run the rendering program (TODO)
            _renderingProgram.Run();

            this.Context?.SwapBuffers();
        }
        #endregion
    }
}
