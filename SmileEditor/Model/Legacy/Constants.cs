namespace SmileEditor.Model.Legacy
{
    /// <summary>
    /// Constants mostly for memory pointers or locations in the original ROM
    /// </summary>
    internal static class Constants
    {
        internal const long CRETilesOffsetDefault           = 0x1C8000;     // (Legacy)     '= &H1C8000 default offset of CRE tiles
        internal const long CRETTableOffsetDefault          = 0x1CA09D;     // (Legacy)     '= &H1CA09D default offset of CRE ttables

        internal const long AreaSavePointerTable            = 0x44B5;       // (Legacy)     'pointer to table with the 8 pointers to the 8 areas' save spots
        internal const long ShipIconOffset                  = 0x14853;      // (Legacy)		'offset where the ship's map icon is stored on the map
        internal const long BossIconOffset                  = 0x147CB;		// (Legacy)		'offset to start of pointer table to boss icons (indexed by area)
    }
}