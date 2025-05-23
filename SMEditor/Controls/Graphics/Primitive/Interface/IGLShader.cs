
using OpenTK.Graphics.OpenGL4;

namespace SMEditor.Controls.Graphics.Primitive.Interface
{
    /// <summary>
    /// Specifies an OpenGL shader for the rendering pipeline
    /// </summary>
    public interface IGLShader : IGLPrimitive
    {
        /// <summary>
        /// Defines the type of OpenGL shader
        /// </summary>
        ShaderType Type { get; }
    }
}
