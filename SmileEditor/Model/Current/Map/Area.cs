using SmileEditor.Model.Current.Common;

using System.Collections.Generic;

namespace SmileEditor.Model.Current.Map
{
    /// <summary>
    /// Represents an area of the map - containing a set of rooms
    /// </summary>
    internal class Area : ModelBase
    {
        /// <summary>
        /// Pointer to the original area as located in the ROM. The new area data will be substituted
        /// as set by the user (Name, and Description). The layout in the ROM is static.
        /// </summary>
        internal ROMPointer AreaPointer { get; private set; }

        /// <summary>
        /// (readonly) Original area (enum) from the ROM.
        /// </summary>
        internal MapArea OriginalArea { get; private set; }

        /// <summary>
        /// List of rooms corresponding to the area
        /// </summary>
        internal List<Room> Rooms { get; private set; }

        internal Area()
        {
            this.Rooms = new List<Room>();
            this.OriginalArea = MapArea.Debug;
            this.AreaPointer = ROMPointer.Empty;
        }
    }
}
