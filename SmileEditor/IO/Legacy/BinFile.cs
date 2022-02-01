using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmileEditor.IO.Legacy
{
    /// <summary>
    /// This is the product of the legacy SMILE editor. Constants here are offsets for 
    /// certain variables to be read in; and the export can be done in terms of this file type.
    /// </summary>
    internal class BinFile
    {
        /*
         * 
         * [1/31/2022] Constants are being stored in terms of ints to keep the file address. this looks like it was
         *             a "short" length (0x0000 0000) in the file - which sets the bin file length at 32768 bytes max.
         * 
         */

        #region (internal) Variable Offsets (in order)

        /// <summary>
        /// [1/31/2022] Pretty sure this is actual rom header size (512). So, most (i think all) of the variables are offset by this amount
        /// </summary>
        internal const int HeaderOffset           = 0x0200;           // Offset (512) for bin header:                        (Legacy) ROM_HEADER
        internal const int PALOffset              = 0x7FD9;           // Offset to set the is PAL byte:                      (Legacy) TempByte
        internal const int SpecialCodingOffset    = 0x16B20;          // Offset for "RoomVar" or other "special coding":     (Legacy) TestByte
        internal const int PLMBankOffset          = 0x204AC;          // Offset for PLM Bank:                                (Legacy) PLMBank
        internal const int ScrollPLMBankOffset    = 0x20B60;          // Offset for Scroll PLM Bank:                         (Legacy) ScrollPLMBank
        internal const int KejardonAutosaveOffset = 0x82EA;           // Offset for Kejardon autosave feature:               (Legacy) TestByte
        internal const int JTEAvailabilityOffset  = 0x11F320;         // Offset for JTE availability:                        (Legacy) JTEBank
        internal const int JTEBankOffset          = 0x11F323;         // Offset for the JTE Bank:                            (Legacy) JTEBank

        #endregion

        #region (internal) Variable Values - from the stream i/o procedures

        internal const int ShowRoomVarMenus        = 0x20;                   // Test value for showing the room variable data menus (Legacy) RoomVarData
        internal const int JTEAvailable            = 0xBF;                   // Test value for showing that JTE is installed        (Legacy) JTEBank
        internal const int KejardonAutosaveEnabled = 0xA2;

        #endregion

        #region (internal) Variable Data

        /// <summary>
        /// Set if the rom is a Phase Alternating Line (PAL) rom
        /// </summary>
        internal bool IsPAL { get; private set; }

        /// <summary>
        /// (Probably correct)
        /// </summary>
        internal bool IsSpecialCoding { get; private set; }

        /// <summary>
        /// TODO
        /// </summary>
        internal byte PLMBank { get; private set; }

        /// <summary>
        /// TODO
        /// </summary>
        internal int ScrollPLMBank { get; private set; }

        #endregion
    }
}
