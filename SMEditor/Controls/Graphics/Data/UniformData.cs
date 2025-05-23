using OpenTK.Graphics.OpenGL4;

namespace SMEditor.Controls.Grpahics.Data
{
    public class UniformData<T> where T : struct
    {
        public string Name { get; private set; }
        public ActiveUniformType Type { get; private set; }

        /// <summary>
        /// NOTE:  Can also be the index of the texture! used for sampler2D
        /// </summary>
        public T Value { get; private set; }

        public UniformData(string name, ActiveUniformType type, T value)
        {
            this.Type = type;
            this.Name = name;
            this.Value = value;
        }
    }
}
