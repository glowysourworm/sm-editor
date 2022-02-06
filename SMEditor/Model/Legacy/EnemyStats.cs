using System;

namespace SMEditor.Model.Legacy
{
    internal class EnemyStats
    {
        internal int UNKNOWNAnimate { get; set; }                       // (Legacy) 2 bytes  '# of bytes to rip from rom for tiles
        internal int Palette { get; set; }                              // (Legacy) 2 bytes    3/4
        internal int HP { get; set; }                                   // (Legacy) 2 bytes    5/6
        internal int Damage { get; set; }                               // (Legacy) 2 bytes    7/8
        internal int Width { get; set; }                                // (Legacy) 2 bytes    9/10
        internal int Height { get; set; }                               // (Legacy) 2 bytes    11/12
        internal byte PaletteBank { get; set; }                         // (Legacy) 1 byte     13
        internal byte HurtFlash { get; set; }                           // (Legacy) 1 byte    how long enemy flashes when shot
        internal int SoundOfImpact { get; set; }                        // (Legacy) 2 byte    15/16
        internal int Unknown2 { get; set; }                             // (Legacy) 2 bytes   0000 for all except bosses/mini's
        internal int EnemyAI { get; set; }                              // (Legacy) 2 bytes   19/20 (initialization)
        internal int EnemyParts { get; set; }                           // (Legacy) 2 bytes   21/22 (enemy parts 0 = 1)
        internal int Unknown5 { get; set; }                             // (Legacy) 2 bytes   23/24 (?)
        internal int UnknownGraphicPointer { get; set; }                // (Legacy) 2 bytes   add on 2nd graphic to an enemy?!! (motion)
        internal int GrappleReaction { get; set; }                      // (Legacy) 2 bytes    27-28
        internal int EnemyShot2 { get; set; }                           // (Legacy) 2 bytes   29/30  (metroid grab & moctroid suck)
        internal int UnknownC { get; set; }                             // (Legacy) 2 bytes   31/32 (frozen AI?)
        internal int UnknownD { get; set; }                             // (Legacy) 2 bytes   33/34... always 0000? (x-ray pause AI)
        internal int DeathAnimation { get; set; }                       // (Legacy) 2 bytes   36
        internal int UnknownF { get; set; }                             // (Legacy) 2 bytes   37/38... always 0000?
        internal int UnknownG { get; set; }                             // (Legacy) 2 bytes   39/40
        internal int PowerbombInvulnerability { get; set; }             // (Legacy) 2 bytes   41-42  ''<Kejardon> Bytes 41-42: Powerbomb invulnerability (00 00 = vulnerable, (00-4C) 80 = untouchable)
        internal int UnknownI { get; set; }                             // (Legacy) 43/44
        internal int UnknownJ { get; set; }                             // (Legacy) 45/46
        internal int UnknownK { get; set; }                             // (Legacy) 47/48
        internal int EnemyTouch { get; set; }                           // (Legacy) 49/50     when an enemy touches you
        internal int EnemyShot { get; set; }                            // (Legacy) 51/52     when your shot touches an enemy
        internal int UnknownN { get; set; }                             // (Legacy) 53/54
        internal Tuple<byte, byte, byte> EnemyTiles { get; set; }       // (Legacy) 3 bytes    55-57  (NOTE** ThreeByte was the old name for the byte tuple)
        internal byte LayerControl { get; set; }                        // (Legacy) 1 byte 58
        internal int ItemDrop { get; set; }                             // (Legacy) 2 bytes 59-60 (bank 1A)

        // 'Bytes: 1 = Energy, 2 = Big Energy, 3 = Missiles, 4 = nothing, 5 = super missiles, 6 = power bombs 14 0A 55 82 05 05

        internal int Vulnerabilities { get; set; }                      // (Legacy) 2 bytes (bank B4)
        internal int EnemyName { get; set; }                            // (Legacy) 2 bytes (bank 1A)

        internal EnemyStats() 
        {
            this.EnemyTiles = new Tuple<byte, byte, byte>(0x00, 0x00, 0x00);   
        }
    }
}
