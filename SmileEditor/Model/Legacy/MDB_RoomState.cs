using System;

namespace SmileEditor.Model.Legacy
{
    internal class MDB_RoomState
    {
        internal Tuple<byte, byte, byte> LevelData { get; set; }
        internal byte GraphicSet { get; set; }
        internal byte MusicTrack { get; set; }
        internal byte MusicControl { get; set; }
        internal int FX1 { get; set; }                  // (Legacy) 'pointer to room_fx1 [ $83 ]
        internal int EnemyPopulation { get; set; }      // (Legacy) 'pointer to enemy_pop [ $a1 ]  'info on enemies
        internal int EnemySet { get; set; }             // (Legacy) 'pointer to room_set [ $b4 ]
        internal int Layer2 { get; set; }               // (Legacy) 'layer 2 scrolling data
        internal int Scroll { get; set; }               // (Legacy) 'pointer to mdb_scroll [ $8f ]
        internal int U1 { get; set; }                   // (Legacy) 'used in escape version of Bomb Torizo's room **WTF**
                                                        // (Legacy) (Comment) 'xray casing code??? [$8F]
        internal int FX2 { get; set; }                  // (Legacy) 'pointer to room_fx2 (code? I forgot) [ $8f ]
        internal int PLM { get; set; }                  // (Legacy) 'pointer to PLM data
        internal int BG_Data { get; set; }              // (Legacy) 'pointer to bg_data ($8F)
        internal int Layer1_2 { get; set; }				// (Legacy) 'pointer to layer 1 and 2 handling code ($8F)

        internal MDB_RoomState()
        {
            this.LevelData = new Tuple<byte, byte, byte>(0x00, 0x00, 0x00);
        }
    }
}
