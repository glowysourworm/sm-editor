using SMEditor.Controls.Graphics.Primitive;
using SMEditor.Controls.Grpahics.Data;

namespace SMEditor.Controls.Graphics.Interface
{
    /// <summary>
    /// Maintains cache of GLSL objects read from resource streams - mostly shaders.
    /// </summary>
    public interface IGLSLCache
    {
        ShaderData Get(GLSLResource glslKey);
    }
}
