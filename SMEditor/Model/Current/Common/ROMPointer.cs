namespace SMEditor.Model.Current.Common
{
    /// <summary>
    /// Bank, Offset, and (optional) Name values to identify the ROM data. This is used to decouple the
    /// memory locations from the data structures used in the model.
    /// </summary>
    internal class ROMPointer
    {
        /// <summary>
        /// Null / Default ROM Pointer
        /// </summary>
        internal static ROMPointer Empty = new ROMPointer();

        /// <summary>
        /// Data bank [$80] -> [$FF] to offset ROM memory pointer
        /// </summary>
        internal byte Bank { get; private set; }

        /// <summary>
        /// Covers the offsets for the size of the data bank (0x7FFF) = 32,768 Bytes (using the zeroth location)
        /// </summary>
        internal ushort Offset { get; private set; }

        /// <summary>
        /// (Extension) Name for the data (optional)
        /// </summary>
        internal string Name { get; private set; }

        /// <summary>
        /// (Extension) Description (optional) for the data in the data bank.
        /// </summary>
        internal string Description { get; private set; }

        internal ROMPointer()
        {
            this.Bank = 0;
            this.Offset = 0;
            this.Name = "(Empty)";
            this.Description = "(Empty)";
        }
    }
}
