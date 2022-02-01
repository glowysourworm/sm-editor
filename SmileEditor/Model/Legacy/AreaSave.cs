namespace SmileEditor.Model.Legacy
{
    internal class AreaSave
    {
        internal int RoomID { get; set; }       // (Legacy)     RoomLoad As Integer 'points to door data that uses this RoomID
        internal int Unknown { get; set; }      // (Legacy) 	always zero??
        internal int ScrollX { get; set; }      // (Legacy)     ScrollY As Integer
        internal int SamusY { get; set; }       // (Legacy) 	as offset from top
        internal int SamusX { get; set; }    	// (Legacy) 	as offset from center

        internal AreaSave() { }
    }
}