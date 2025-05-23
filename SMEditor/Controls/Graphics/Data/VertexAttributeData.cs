using OpenTK.Graphics.OpenGL4;

namespace SMEditor.Controls.Grpahics.Data
{
    /// <summary>
    /// Describes a single vertex attribute "in" parameter for a shader
    /// </summary>
    public class VertexAttributeData
    {
        public int Index { get; private set; }
        public string Name { get; private set; }

        /// <summary>
        /// Type of input data for the shader - this would be some sort of GLSL supported data type.
        /// </summary>
        public ActiveUniformType Type { get; private set; }

        public VertexAttributeData(int index, string name, ActiveUniformType type)
        {
            this.Index = index;
            this.Name = name;
            this.Type = type;
        }
    }
}
