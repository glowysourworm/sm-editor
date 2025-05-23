using System;
using System.Collections.Generic;
using System.Linq;

using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.Primitive.Interface;
using SMEditor.Controls.Graphics.PrimitiveData;
using SMEditor.Controls.Grpahics.Data;

namespace SMEditor.Controls.Graphics.Primitive
{
    /// <summary>
    /// Corresponds to the VBO vertex buffer object on the GL backend
    /// </summary>
    public class GLVertexBuffer<T> : IGLVertexBuffer where T : struct
    {
        public int Handle { get; private set; }
        public bool IsBound { get; private set; }
        public int BufferIndex { get; private set; }
        public bool IsCreated { get; private set; }

        // Primary vertex data for the buffer
        readonly DataStream _stream;
        readonly IEnumerable<VertexAttributeData> _vertexAttributes;

        public GLVertexBuffer(int bufferIndex, DataStream dataStream, IEnumerable<VertexAttributeData> vertexAttributes)
        {
            _stream = dataStream;
            _vertexAttributes = vertexAttributes;

            this.BufferIndex = bufferIndex;
            this.Handle = 0;
            this.IsCreated = false;
            this.IsBound = false;
        }

        public void Create(int programHandle)
        {
            if (this.IsCreated)
                throw new Exception("GLVertexBuffer already created in the backend");

            // Procedure
            //
            // 1) Create the buffer and store the handle
            // 2) Bind the buffer on the backend to modify
            // 3) Copy the vertex data to the backend
            // 4) *Set up the attribute pointer based on the
            //     associated shader (see the GLSL resource files)
            //

            // Create buffer for vertices in the GPU memory space
            this.Handle = GL.GenBuffer();

            // Bind to array buffer type in OpenGL
            GL.BindBuffer(BufferTarget.ArrayBuffer, this.Handle);

            // COPY DATA TO GPU BUFFER:  This is one of the ways to take application memory to the GPU. 
            //
            GL.BufferData(BufferTarget.ArrayBuffer,
                          _stream.GetStreamSize(),
                          _stream.GetData(),
                          BufferUsageHint.StaticDraw);

            // SETUP VERTEX ATTRIBUTE POINTERS:
            //
            // *** Each "in" variable in the vertex shader is being read from the GL.BufferData float[] input.
            //
            // 1) Setup attribute "pointers" to be at the appropriate offset with the appropriate stride.
            // 2) Call GL to enable the vertex attribute array for this buffer
            //

            var offsetBytes = 0;
            var strideBytes = CalculateAttributeStride();

            foreach (var attribute in _vertexAttributes)
            {
                // Get the attribute handle for the input variable
                var attributeHandle = GL.GetAttribLocation(programHandle, attribute.Name);

                var attributeSize = 0;
                var glType = VertexAttribPointerType.Float;
                var glNormalized = false;
                var currentOffset = 0;

                // HANDLE ATTRIBUTES BY DATA TYPE
                switch (attribute.Type)
                {
                    case ActiveUniformType.FloatVec2:
                    {
                        // Element size of the vector2
                        attributeSize = 2;

                        // Data type to read on the GL backend
                        glType = VertexAttribPointerType.Float;

                        // Normalized coordinates (?)
                        glNormalized = false;

                        // Setup an offset to be added to the total offset
                        currentOffset = 2 * sizeof(float);

                    }
                    break;
                    default:
                        throw new GLException("Unhandled vertex array attribute data type:  {0}", attribute.Type);
                }

                // Declare the attribute array configuration
                GL.VertexAttribPointer(attribute.Index,
                                       attributeSize,
                                       glType, glNormalized,
                                       strideBytes,
                                       offsetBytes);

                // Enable the vertex attribute
                GL.EnableVertexAttribArray(attributeHandle);

                // Increment the data offset
                offsetBytes += currentOffset;
            }

            this.IsCreated = true;
        }

        public void Teardown()
        {
            if (!this.IsCreated)
                throw new Exception("GLVertexBuffer already deleted from the backend");

            // Bind the CURRENT buffer to a null pointer to detach the buffer from the GL
            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            // Apply vertex attributes
            GL.DisableVertexAttribArray(this.BufferIndex);

            // Now, delete THIS buffer
            GL.DeleteBuffer(this.Handle);

            this.Handle = 0;
            this.IsCreated = false;
        }

        public int GetNumberOfVertices()
        {
            // Number of elements: Equivalent to number of ELEMENTS [ element1: { attrib1, attrib2, .. }, element2: {...} ] sent into
            //                     the GL backend
            //

            return _stream.StreamNumberVertices;
        }

        public int GetNumberOfElements()
        {
            return _stream.StreamNumberElements;
        }

        public int GetBufferSize()
        {
            return _stream.GetStreamSize();
        }

        private int CalculateAttributeStride()
        {
            return _vertexAttributes.Aggregate(0, (stride, attribute) =>
            {
                // HANDLE ATTRIBUTES BY DATA TYPE
                if (attribute.Type == ActiveUniformType.FloatVec2)
                    return stride + (2 * sizeof(float));
                else
                    throw new GLException("Unhandled vertex array attribute data type:  {0}", attribute.Type);
            });
        }

        public void Bind(bool bind)
        {
            if (!this.IsCreated)
                throw new Exception("GLVertexBuffer already deleted from the backend");

            // Bind VBO before using
            if (bind)
                GL.BindBuffer(BufferTarget.ArrayBuffer, this.Handle);

            else
                GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            this.IsBound = bind;
        }
    }
}
