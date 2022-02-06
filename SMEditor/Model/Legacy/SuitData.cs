namespace SMEditor.Model.Legacy
{
    /// <summary>
    /// [2/1/2022] ORIGINALLY CALLED h8BDD8899_Type (and) hsuit8BDD8899_Type. Not sure that this is actually "suit" data.. and
    /// the offset for the data COULD be &H8BDD8899 (in VBA) (or) 0x8BDD8899
    /// </summary>
    internal class SuitData
    {
        /// <summary>
        /// [2/1/2022] Not sure what this is actually is.. and the offset for the data COULD be &H8BDD8899 (in VBA) (or) 0x8BDD8899
        /// </summary>
        internal long h8BDD8899 { get; set; }
        internal byte Music { get; set; }
        internal byte Type { get; set; }
        internal byte Unknown1 { get; set; }
        internal int Amount { get; set; }
        internal int Unknown2 { get; set; }

        internal SuitData() { }
    }
}
