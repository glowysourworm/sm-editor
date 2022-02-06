using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMEditor.Model.Current.Common
{
    /// <summary>
    /// Base class for game data loaded from the ROM data banks
    /// </summary>
    internal abstract class ModelBase
    {
        /// <summary>
        /// (Extension) Name property added to any model object
        /// </summary>
        internal string Name { get; set; }

        /// <summary>
        /// (Extension) Description property added any model object
        /// </summary>
        internal string Description { get; set; }

        internal ModelBase()
        {
            this.Name = "(Empty)";
            this.Description = "(Empty)";
        }
    }
}
