namespace SMEditor.Model.Legacy
{
    /// <summary>
    /// Data structure to load room data from the ROM.
    /// </summary>
    internal class MDB_Header
    {
        internal byte RoomIndex { get; set; }               // (Legacy) 'index value for room, for an unknown purpose
        internal byte Region { get; set; }                  // (Legacy) 'area of Zebes (on map)
        internal byte X { get; set; }                       // (Legacy) 'x on map
        internal byte Y { get; set; }                       // (Legacy) 'y on map
        internal byte Width { get; set; }                   // (Legacy) 'in screens and/or map tiles
        internal byte Height { get; set; }                  // (Legacy) 'in screens and/or map tiles
        internal byte UpScroller { get; set; }
        internal byte DownScroller { get; set; }
        internal byte Unknown4 { get; set; }
        internal int DoorOut { get; set; }					// (Legacy) '[$8F] pointer

        internal MDB_Header() { }
    }
}
