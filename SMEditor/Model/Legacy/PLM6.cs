namespace SMEditor.Model.Legacy
{
    /// <summary>
    /// PLM stands for Post Load Modification. These are 
    /// </summary>
    internal class PLM6
    {
        internal int Type { get; set; }         // (Legacy) 2 bytes
        internal byte X { get; set; }           // (Legacy) 1 byte
        internal byte Y { get; set; }           // (Legacy) 1 byte
        internal byte I { get; set; }           // (Legacy) 1 byte  index?
        internal byte Unknown { get; set; }     // (Legacy) 1 byte

        internal PLM6() { }
    }
}
