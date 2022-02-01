using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmileEditor.Model.Legacy
{
    /// <summary>
    /// Default preferences imported from SmileMod1.bas (Legacy). Not all UI functions were saved or behave the same - so
    /// most of these are for use with this version of the smile editor to import legacy prefs.
    /// </summary>
    internal static class KeyPreferences
    {
        internal const byte EnterDoor                    = 0x0D;
        internal const byte Brighten                     = 0x21;        // (Legacy) GoTo AdjustBrightness +1
        internal const byte Darken                       = 0x22;        // (Legacy) GoTo AdjustBrightness -1
        internal const byte TakeSnapshot                 = 0x2C;        // (Legacy) REQUIRES SHIFT MODIFIER
        internal const byte TileInfoForASMers            = 0x41;
        internal const byte PrepareDoor                  = 0x43;
        internal const byte EditorForDoor                = 0x44;
        internal const byte EnterDoorAlternate           = 0x45;        // (Legacy) 'pressed "E"
        internal const byte SetProp                      = 0xBB;        // (Legacy) 'pressed "=" key
        internal const byte SetLoadSaveDoor              = 0x4C;        // (Legacy) 'pressed "L" key
        internal const byte MetroidActivation            = 0x4D;        // (Legacy) 'pressed "M" key

        /// <summary>
        /// BTS stands for "Behind the Scenes" (christ...) because it contains the collision data for any tile.
        /// </summary>
        internal const byte ChangeBTS                    = 0x33;        // (Legacy) 'pressed "#" key
        internal const byte ChangeZoom                   = 0x5A;
        internal const byte ToggleLayer1                 = 0x70;
        internal const byte ToggleLayer2                 = 0x71;
        internal const byte ToggleGrid                   = 0x72;
        internal const byte TogglePLM                    = 0x73;
        internal const byte ToggleEnemies                = 0x74;
        internal const byte ShowAllLayers                = 0x75;
    }
}
