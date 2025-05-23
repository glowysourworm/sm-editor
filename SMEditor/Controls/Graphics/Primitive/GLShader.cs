using System;

using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.Primitive.Interface;
using SMEditor.Controls.Grpahics.Data;

namespace SMEditor.Controls.Graphics.Primitive
{
    /// <summary>
    /// Representation of a shader shared by the GPU. This contains the shader handle and data needed to
    /// compile the shader at runtime.
    /// </summary>
    public class GLShader : IGLShader
    {
        public int Handle { get; private set; }
        public bool IsCreated { get; private set; }
        public bool IsBound { get; private set; }
        public ShaderType Type { get { return _shaderData.Type; } }

        readonly ShaderData _shaderData;

        public GLShader(ShaderData shaderData)
        {
            this.Handle = 0;
            this.IsCreated = false;

            _shaderData = shaderData;

            switch (shaderData.Type)
            {
                case ShaderType.FragmentShader:
                case ShaderType.VertexShader:
                    break;
                case ShaderType.GeometryShader:
                case ShaderType.TessEvaluationShader:
                case ShaderType.TessControlShader:
                case ShaderType.ComputeShader:
                default:
                    throw new Exception("Unknown OpenTK ShaderType GLShader.cs");
            }
        }

        public void Teardown()
        {
            if (!this.IsCreated)
                throw new Exception("GLShader already deleted from the backend");

            // Deletes the shader object from the GL backend
            GL.DeleteShader(this.Handle);

            this.IsCreated = false;
        }

        public void Create(int programHandle)
        {
            if (this.IsCreated)
                throw new Exception("GLShader already created in the backend");

            // Declare the shader on the GL backend
            this.Handle = GL.CreateShader(_shaderData.Type);

            // Set the shader source on the GL backend
            GL.ShaderSource(this.Handle, _shaderData.Source);

            // Compile the shader and check for errors
            GL.CompileShader(this.Handle);

            // Check info log for the errors
            var errorLog = GL.GetShaderInfoLog(this.Handle);

            // For now, just show the exception from the shader
            if (!string.IsNullOrEmpty(errorLog))
                throw new Exception(errorLog);

            this.IsCreated = true;
        }

        public void Bind(bool bind)
        {

        }
    }
}
