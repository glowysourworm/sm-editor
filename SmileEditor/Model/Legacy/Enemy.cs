namespace SmileEditor.Model.Legacy
{
    internal class Enemy
    {
        internal int Species { get; set; }          // (Legacy) 2 bytes    'pointer (A0) to enemy data
        internal int X { get; set; }                // (Legacy) 2 bytes
        internal int Y { get; set; }                // (Legacy) 2 bytes
        internal int Orientation { get; set; }      // (Legacy) 2 bytes
        internal int Special { get; set; }          // (Legacy) 2 bytes (Prop-X)
        internal int Speed { get; set; }            // (Legacy) 2 bytes
        internal int Unknown3 { get; set; }         // (Legacy) 2 bytes    'graphic unknown
        internal int Unknown4 { get; set; }    		// (Legacy) 2 bytes    'speed2

        internal Enemy() { }
    }
}
