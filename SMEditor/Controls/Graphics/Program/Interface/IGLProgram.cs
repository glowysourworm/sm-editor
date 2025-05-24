using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SMEditor.Controls.Graphics.Primitive.Interface;
using SMEditor.Controls.Graphics.PrimitiveData;
using SMEditor.Controls.Graphics.PrimitiveData.Interface;
using SMEditor.Controls.Grpahics.Data;

namespace SMEditor.Controls.Graphics.Program.Interface
{
    /// <summary>
    /// Program to run GLSL on the backend OpenGL using OpenTK interface. This may commonly be known
    /// as "The Shader"; but is a compilation of multiple entities on the backend that are composed using
    /// IGLModel instances in the proper order along with the associated shaders.
    /// 
    /// This interface is meant to describe a STATICALLY SIZED OpenGL 2D Scene. 
    /// </summary>
    public interface IGLProgram
    {
        /// <summary>
        /// Backend GL handle for the program
        /// </summary>
        int Handle { get; }

        /// <summary>
        /// Gets a flag that shows whether the IGLProgram has been compiled. If TRUE, then the program must
        /// be DELETED before ANOTHER program is created.
        /// </summary>
        bool IsCompiled { get; }

        /// <summary>
        /// Gets a flag specifying whether the program is active GL.UseProgram
        /// </summary>
        bool IsActive { get; }

        /// <summary>
        /// Compiles the contents of the program on the GL backend. This should be run once
        /// prior to calling the Run method.
        /// </summary>
        void Compile();

        /// <summary>
        /// Binds a uniform value to the shader program
        /// </summary>
        void BindUniform<T>(UniformData<T> uniform) where T : struct;

        /// <summary>
        /// Declares a vertex array object to the program - which is then managed by the IGLProgram
        /// </summary>
        void DeclareVAO(IGLVertexArray vertexArray);

        /// <summary>
        /// Runs the program - which draws the contents of the associated buffers. This may be called
        /// multiple times.
        /// </summary>
        void DrawAll();

        /// <summary>
        /// Runs the program - which draws the contents of the indexed buffer.
        /// </summary>
        void Draw(int bufferIndex);

        /// <summary>
        /// Sets the program to active - GL.UseProgram
        /// </summary>
        void Bind(bool bind);

        /// <summary>
        /// Sets the output stream (must be the same size as the original stream) (should be the same data type; but GL doesn't really care, it's agnostic) ^_^
        /// </summary>
        void ReBuffer(DataStream stream);

        /// <summary>
        /// Deletes the contents of the program from the GL backend. NOTE*** THIS MUST BE CALLED BEFORE COMPILING
        /// ANOTHER INSTANCE OF IGLProgram.
        /// </summary>
        void Delete();
    }
}
