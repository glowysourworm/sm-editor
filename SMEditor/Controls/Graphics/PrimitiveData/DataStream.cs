using System;
using System.Numerics;

namespace SMEditor.Controls.Graphics.PrimitiveData
{
    /// <summary>
    /// Simple class to handle streaming the IGLVector instances more specifically
    /// </summary>
    public class DataStream
    {
        /// <summary>
        /// Number of vertices for the entire stream (ELEMENT # Vertices * # Elements)
        /// </summary>
        public int StreamNumberVertices { get; private set; }

        /// <summary>
        /// Number of ELEMENTS in the stream
        /// </summary>
        public int StreamNumberElements { get; private set; }

        /// <summary>
        /// Returns size of stream in bytes
        /// </summary>
        public int GetStreamSize()
        {
            return _array.Length;
        }

        readonly byte[] _array;

        // Index of the current array (byte). Caller may ask for the data in terms of floats...
        int _cursor;


        /// <summary>
        /// Creates a data stream with storage for N number of IGLVector elements
        /// </summary>
        /// <param name="vectorElementNumberVertices">Size of a single IGLVector element IN # VERTICES</param>
        /// <param name="vectorStreamSize">Total size of a single IGLVector stream (BYTES)</param>
        public DataStream(int capacity, int elementSizeVertices, int elementSizeBytes)
        {
            this.StreamNumberVertices = elementSizeVertices * capacity;
            this.StreamNumberElements = capacity;

            _array = new byte[capacity * elementSizeBytes];
            _cursor = 0;
        }

        public void Write(float data)
        {
            byte[] buffer = BitConverter.GetBytes(data);

            for (int index = 0; index < buffer.Length; index++)
            {
                _array[_cursor++] = buffer[index];
            }
        }

        public void Write(Vector4 vec4)
        {
            this.Write(vec4.X);
            this.Write(vec4.Y);
            this.Write(vec4.Z);
            this.Write(vec4.W);
        }

        public byte[] GetData()
        {
            return _array;
        }
    }
}
