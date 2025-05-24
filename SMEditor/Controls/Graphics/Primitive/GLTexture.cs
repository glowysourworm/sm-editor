using System;
using System.Windows.Media;

using OpenTK.Graphics.OpenGL4;
using OpenTK.Mathematics;

using SMEditor.Controls.Graphics.Primitive.Interface;
using PixelFormat = OpenTK.Graphics.OpenGL4.PixelFormat;

namespace SMEditor.Controls.Graphics.Primitive
{
    public class GLTexture : IGLPrimitive
    {
        // Corresponds to the level of the nth minimap for the texture (see texture rendering to learn about minimaps)
        //
        const int TEXTURE_MINIMAP_LEVEL = 0;

        public int ProgramHandle { get; private set; }
        public int Handle { get; private set; }
        public bool IsCreated { get; private set; }
        public bool IsBound { get; private set; }

        public TextureUnit Unit { get; private set; }
        public int TextureIndex { get; private set; }

        readonly IntPtr _pixelBuffer;
        readonly int _width;
        readonly int _height;
        readonly PixelFormat _pixelFormat;
        readonly PixelType _pixelType;

        public GLTexture(IntPtr pixelBuffer, int width, int height, int textureIndex, TextureUnit unit, PixelFormat pixelFormat, PixelType pixelType)
        {
            this.Handle = 0;
            this.IsCreated = false;
            this.Unit = unit;
            this.TextureIndex = textureIndex;

            _pixelBuffer = pixelBuffer;
            _width = width;
            _height = height;
            _pixelFormat = pixelFormat;
            _pixelType = pixelType;
        }

        public void Create(int programHandle)
        {
            if (this.IsCreated)
                throw new Exception("GLTexture already created in the backend");

            this.ProgramHandle = programHandle;

            // Procedure
            //
            // 0) Generate texture to create the handle and set active texture
            // 1) Bind GL to the current texture
            // 2) Apply the pixel data to the texture
            //

            // Generate texture
            this.Handle = GL.GenTexture();

            // Set active texture
            GL.ActiveTexture(this.Unit);

            // Bind the texture to apply changes
            GL.BindTexture(TextureTarget.Texture2D, this.Handle);

            // Apply the pixel data to the backend
            GL.TexImage2D(TextureTarget.Texture2D,
                          TEXTURE_MINIMAP_LEVEL,
                          PixelInternalFormat.Rgba,     // I believe this is the format used in the shader (some kind of 4-vector)
                          _width, _height, 0,           // border:  "Should always be set to zero" ....?
                          _pixelFormat,                 // This should be the format used in OUR pixel data array
                          _pixelType,
                          _pixelBuffer);                // Pixel data in byte array

            // SETTING THESE TO DEFAULTS (TODO)
            //GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, new int[] { (int)TextureWrapMode.ClampToEdge });
            //GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, new int[] { (int)TextureWrapMode.ClampToEdge });
            //GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, new int[] { (int)TextureMinFilter.Linear });
            //GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, new int[] { (int)TextureMinFilter.Linear });

            // Remove filtering to "see Pixels"
            GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, new int[] { (int)TextureWrapMode.ClampToEdge });
            GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, new int[] { (int)TextureWrapMode.ClampToEdge });
            GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, new int[] { (int)TextureMinFilter.Nearest });
            GL.TexParameterI(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, new int[] { (int)TextureMinFilter.Nearest });

            GL.GenerateTextureMipmap(this.Handle);

            this.IsCreated = true;
            this.IsBound = true;
        }

        public void ClearColor(Color color)
        {
            if (!this.IsCreated)
                throw new Exception("GLTexture already deleted from the backend");

            if (!this.IsBound)
                throw new Exception("GLTexture must be bound before calling ClearColor");

            var colorVector = new Vector4(color.ScR, color.ScG, color.ScB, color.ScA);

            GL.ClearTexImage(this.ProgramHandle, 0, PixelFormat.Rgba, PixelType.UnsignedByte, ref colorVector);
        }

        public void Teardown()
        {
            if (!this.IsCreated)
                throw new Exception("GLTexture already deleted from the backend");

            GL.DeleteTexture(this.TextureIndex);

            this.IsCreated = false;
            this.IsBound = false;
            this.Handle = 0;
        }

        public void Bind(bool bind)
        {
            if (!this.IsCreated)
                throw new Exception("GLTexture already deleted from the backend");

            if (bind)
            {
                GL.ActiveTexture(this.Unit);
                GL.BindTexture(TextureTarget.Texture2D, this.Handle);
            }
            else
                GL.BindTexture(TextureTarget.Texture2D, 0);

            this.IsBound = bind;
        }
    }
}
