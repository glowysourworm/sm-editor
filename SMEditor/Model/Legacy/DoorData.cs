namespace SMEditor.Model.Legacy
{
    internal class DoorData
    {
        internal int RoomID { get; set; }           // (Legacy) pointer to room definition (mdb) [$8F]
        internal byte DoorBitFlag { get; set; }     // (Legacy) 7th=elevator, 6th=switches regions
        internal byte Direction { get; set; }       // (Legacy) direction and whether or not door closes behind... others?
        internal byte Xi { get; set; }              // (Legacy) x of door "illusion" on exit (16x16)
        internal byte Yi { get; set; }              // (Legacy) y of door "illusion" on exit (16x16)
        internal byte X { get; set; }               // (Legacy) x of door on exit (16x16)
        internal byte Y { get; set; }               // (Legacy) y of door on exit (16x16)
        internal int Distance { get; set; }         // (Legacy) distance Samus is placed from door (not 16x16)
        internal int ScrollData { get; set; }       // (Legacy) pointer to code for updating scroll data (ie- if you start in a room with no scroll) [$8F]

        internal DoorData() { }
    }
}
