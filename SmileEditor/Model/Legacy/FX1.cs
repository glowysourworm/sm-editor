namespace SmileEditor.Model.Legacy
{
    internal class FX1
    {
        internal int Select { get; set; }                   // (Legacy) '0000 or doorID, use this entry... FFFF none... anything else, add 10h to FX1 pointer, and loop back to find next entry
        internal int Surface_Start { get; set; }            // (Legacy) 'starting point of liquid's surface
        internal int Surface_New { get; set; }              // (Legacy) 'new surface of liquid
        internal int Surface_Speed { get; set; }            // (Legacy) 'speed of surface of liquid (lower is faster, bit 15 selects direction(0=flow down))
        internal byte Surface_Delay { get; set; }           // (Legacy) 'lower is faster (0 = LONG time)
        internal byte Layer3Type { get; set; }
        internal byte A { get; set; }
        internal byte B { get; set; }
        internal byte C { get; set; }
        internal byte Palette_FX { get; set; }              // (Legacy) 'palette fx bitflags (region-based)
        internal byte AnimateTile { get; set; }             // (Legacy) 'tile animation bitflags (region-based)
        internal byte Palette_Blend { get; set; }			// (Legacy) 'index value for palette blend data table [ $89 ]

        internal FX1() { }
    }
}
