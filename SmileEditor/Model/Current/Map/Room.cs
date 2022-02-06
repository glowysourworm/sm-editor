using SmileEditor.Model.Current.Common;

namespace SmileEditor.Model.Current.Map
{
    /// <summary>
    /// Data structure that represents a room
    /// </summary>
    internal class Room : ModelBase
    {
        /// <summary>
        /// Points back to the data bank
        /// </summary>
        internal ROMPointer RoomPointer { get; private set; }

        /// <summary>
        /// X Location on the map (graphical coordinates)
        /// </summary>
        internal byte X { get; set; }

        /// <summary>
        /// Y Location on the map (graphical coordinates)
        /// </summary>
        internal byte Y { get; set; }

        /// <summary>
        /// Room width in Screens AND/OR Map Tiles
        /// </summary>
        internal byte Width { get; set; }

        /// <summary>
        /// Room height in Screens AND/OR Map Tiles 
        /// </summary>
        internal byte Height { get; set; }

        /// <summary>
        /// TODO (WOULD LIKE TO FIGURE THIS ONE OUT!)
        /// </summary>
        internal byte Unknown4 { get; set; }

        /// <summary>
        /// TODO (Something like the pointer to the bank of doors for the room)
        /// </summary>
        internal int DoorOut { get; set; }

        internal Room()
        {
            this.RoomPointer = ROMPointer.Empty;
        }
    }
}
