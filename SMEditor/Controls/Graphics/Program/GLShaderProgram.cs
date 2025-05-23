using System;
using System.Collections.Generic;
using System.Linq;

using OpenTK.Graphics.OpenGL4;
using OpenTK.Mathematics;

using SMEditor.Controls.Graphics;
using SMEditor.Controls.Graphics.Primitive.Interface;
using SMEditor.Controls.Graphics.Program.Interface;
using SMEditor.Controls.Grpahics.Data;

namespace RogueCreator.Graphics.GLModel.Program
{
    public class GLShaderProgram : IGLProgram
    {
        public int Handle { get; private set; }
        public bool IsCompiled { get; private set; }
        public bool IsActive { get; private set; }

        // IGLPrimitive types for declaring the GL backend
        List<IGLVertexArray> _programVAOs;

        readonly IGLShader _vertexShader;
        readonly IGLShader _fragmentShader;

        public GLShaderProgram(IGLShader vertexShader, IGLShader fragmentShader)
        {
            _vertexShader = vertexShader;
            _fragmentShader = fragmentShader;
            _programVAOs = new List<IGLVertexArray>();
        }

        public void BindUniform<T>(UniformData<T> uniform) where T : struct
        {
            var uniformLocation = GL.GetUniformLocation(this.Handle, uniform.Name);

            switch (uniform.Type)
            {
                case ActiveUniformType.FloatVec2:
                    var vector2 = (Vector2)Convert.ChangeType(uniform.Value, typeof(Vector2));
                    GL.Uniform2(uniformLocation, vector2);
                    break;
                case ActiveUniformType.FloatVec4:
                    var vector4 = (Vector4)Convert.ChangeType(uniform.Value, typeof(Vector4));
                    GL.Uniform4(uniformLocation, vector4);
                    break;

                // Not sure about sampler declaration
                case ActiveUniformType.Sampler2D:
                    var textureIndex = (int)Convert.ChangeType(uniform.Value, typeof(int));
                    GL.Uniform1(uniformLocation, textureIndex);
                    break;
                case ActiveUniformType.Float:
                    var floatValue = (float)Convert.ChangeType(uniform.Value, typeof(float));
                    GL.Uniform1(uniformLocation, floatValue);
                    break;
                default:
                    throw new GLException("Unhandled Active Uniform Type:  GLShaderProgram.cs");
            }
        }

        public void DeclareVAO(IGLVertexArray programVAO)
        {
            if (this.IsCompiled)
                throw new Exception("Must add texture before compiling:  IGLProgram");

            _programVAOs.Add(programVAO);
        }

        public void Compile()
        {
            if (this.IsCompiled)
                throw new Exception("Already called IGLProgram.Compile()");

            if (!_programVAOs.Any())
                throw new GLException("IGLProgram must have a VAO attached before compiling");

            // Procedure
            //
            // 0) Declare the program 
            // 1) Create, compile, attach, and link the shaders
            // 2) Call the IGLPrimitive Create() methods
            //

            // Declare the GL program
            this.Handle = GL.CreateProgram();

            // Creates shader on the backend
            _vertexShader.Create(this.Handle);
            _fragmentShader.Create(this.Handle);

            // Attach shaders in the order they were declared
            GL.AttachShader(this.Handle, _vertexShader.Handle);
            GL.AttachShader(this.Handle, _fragmentShader.Handle);

            // Link the program
            GL.LinkProgram(this.Handle);

            // Declare: VAO -> VBO
            //
            foreach (var programVAO in _programVAOs)
                programVAO.Create(this.Handle);

            // "Installs the program object as part of the current rendering state"
            GL.UseProgram(this.Handle);

            this.IsCompiled = true;
            this.IsActive = true;
        }

        public void Delete()
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            // Procedure
            //
            // 0) Detach the shaders
            // 1) Call Teardown on the IGLModel entities
            // 2) Deactivate the program by setting GL.UseProgram to null
            // 3) Reset handle and flag for this instance
            //

            // Detach the shaders
            GL.DetachShader(this.Handle, _vertexShader.Handle);
            GL.DetachShader(this.Handle, _fragmentShader.Handle);

            // Teardown all shader entities
            _vertexShader.Teardown();
            _fragmentShader.Teardown();

            // Teardown the VAO
            foreach (var programVAO in _programVAOs)
                programVAO.Teardown();

            // Deactivate the program on the backend before deleting
            GL.UseProgram(0);

            // Delete this prgram from the backend
            GL.DeleteProgram(this.Handle);

            this.IsCompiled = false;
            this.IsActive = false;
            this.Handle = 0;
        }

        public void Draw(int bufferIndex)
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            if (!this.IsActive)
                throw new Exception("Must first call Bind to set the program active");

            var programVAO = _programVAOs[bufferIndex];
            programVAO.Bind(true);
            programVAO.Draw();
        }

        public void DrawAll()
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            if (!this.IsActive)
                throw new Exception("Must first call Bind to set the program active");

            for (int index = 0; index < _programVAOs.Count; index++)
            {
                _programVAOs[index].Bind(true);
                _programVAOs[index].Draw();
            }
        }

        public void Bind(bool bind)
        {
            if (!this.IsCompiled)
                throw new Exception("Must first call IGLProgram.Compile() before using the GL program");

            if (bind)
            {
                GL.UseProgram(this.Handle);
            }
            else
            {
                GL.UseProgram(0);
            }

            this.IsActive = bind;
        }
    }
}
