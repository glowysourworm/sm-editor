
using SMEditor.Model.Current.Common;

namespace SMEditor.Model.Current
{
    /// <summary>
    /// Post Load Modification definition. These are for special room events tied to blocks on the 
    /// screen.
    /// </summary>
    internal class PLM : ModelBase
    {
        /// <summary>
        /// Type of Post Load Modification to perform
        /// </summary>
        internal PLMType Type { get; set; }

        /// <summary>
        /// (TODO) TILE OR PIXEL OFFSET?
        /// </summary>
        internal byte X { get; set; }

        /// <summary>
        /// (TODO) TILE OR PIXEL OFFSET?
        /// </summary>S
        internal byte Y { get; set; }

        internal PLM()
        {
            this.Type = PLMType.Standard;
        }
    }
}
