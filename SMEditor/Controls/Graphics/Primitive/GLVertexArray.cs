using System;

using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.Primitive.Interface;
using SMEditor.Controls.Graphics.PrimitiveData;

namespace SMEditor.Controls.Graphics.Primitive
{
    /// <summary>
    /// Corresponds to the VAO objects in OpenGL. These are used to manage the VBO Vertex Buffer objects
    /// that are stored on the GL backend
    /// </summary>
    public class GLVertexArray : IGLVertexArray
    {
        public int Handle { get; private set; }
        public bool IsCreated { get; private set; }
        public bool IsBound { get; private set; }

        // Primary VBO vertex buffer objects indexed by the OpenGL BufferIndex
        readonly PrimitiveType _primitiveType;
        readonly IGLVertexBuffer _vertexBuffer;

        public GLVertexArray(PrimitiveType primitiveType, IGLVertexBuffer vertexBuffer)
        {
            _primitiveType = primitiveType;
            _vertexBuffer = vertexBuffer;

            this.IsBound = false;
            this.IsCreated = false;
        }

        public void Create(int programHandle)
        {
            if (this.IsCreated)
                throw new Exception("GLVertexArray already created in the backend");

            // Procedure:  Create / Draw / Teardown several vertex buffers
            //
            // 0) Create the vertex array
            // 1) Bind the vertex array handle (starts editing)
            // 2) Calculate the total buffer draw length and store

            // Generate the vertex array for THIS instance
            this.Handle = GL.GenVertexArray();

            // BIND THIS INSTANCE TO BE THE CURRENT VERTEX ARRAY
            GL.BindVertexArray(this.Handle);

            // NOTE: The buffer indices are assigned prior to passing into this instance. Order
            //       has already been indicated by the calling IGLModel or IGLProgram
            //       
            //       Simply call IGLPrimitve.Create() to initialize the vertex buffer
            //
            _vertexBuffer.Create(programHandle);

            this.IsCreated = true;
            this.IsBound = true;
        }

        public void Teardown()
        {
            if (!this.IsCreated)
                throw new Exception("GLVertexArray already deleted from the backend");

            // Teardown vertex buffers
            _vertexBuffer.Teardown();

            // Delete this vertex array
            GL.DeleteVertexArray(this.Handle);

            this.IsCreated = false;
            this.IsBound = false;
            this.Handle = 0;
        }

        public void ReBuffer(DataStream stream)
        {
            if (!this.IsCreated)
                throw new Exception("GLVertexArray already deleted from the backend");

            if (!this.IsBound)
                throw new Exception("GLVertexArray must be bound before calling ReBuffer()");

            _vertexBuffer.ReBuffer(stream);
        }

        public void Draw()
        {
            if (!this.IsCreated)
                throw new Exception("GLVertexArray already deleted from the backend");

            if (!this.IsBound)
                throw new Exception("GLVertexArray must be bound before calling Draw()");

            // Draw Buffer (NOTE! NOT SURE IF IT IS NUMBER OF ELEMENTS, STREAM SIZE, or VERTICES!) (Documentation is not very good)
            GL.DrawArrays(_primitiveType, 0, _vertexBuffer.GetNumberOfVertices());
        }

        public void Bind(bool bind)
        {
            if (!this.IsCreated)
                throw new Exception("GLVertexArray already deleted from the backend");

            // Bind VAO before using
            if (bind)
            {
                GL.BindVertexArray(this.Handle);
            }

            else
            {
                GL.BindVertexArray(0);
            }

            this.IsBound = bind;
        }
    }
}
