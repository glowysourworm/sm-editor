Public Type EnemyStats  '64 bytes total
    UNKNOWNAnimate As Integer '2 bytes  '# of bytes to rip from rom for tiles
    Palette As Integer  '2 bytes    3/4
    HP As Integer       '2 bytes    5/6
    Damage As Integer   '2 bytes    7/8
    Width As Integer    '2 bytes    9/10
    Height As Integer   '2 bytes    11/12
    PaletteBank As Byte '1 byte     13
    HurtFlash As Byte    '1 byte    'how long enemy flashes when shot
    SoundOfImpact As Integer  '2 byte  '15/16
    Unknown2 As Integer  '2 bytes   '0000 for all except bosses/mini's
    EnemyAI As Integer  '2 bytes    '19/20 (initialization)
    EnemyParts As Integer  '2 bytes   '21/22 (enemy parts 0 = 1)
    Unknown5 As Integer  '2 bytes   '23/24 (?)
    UnknownGraphicPointer As Integer  '2 bytes  'add on 2nd graphic to an enemy?!! (motion)
    GrappleReaction As Integer  '2 bytes  27-28
    EnemyShot2 As Integer  '2 bytes   29/30  (metroid grab & moctroid suck)
    UnknownC As Integer  '2 bytes   31/32 (frozen AI?)
    UnknownD As Integer  '2 bytes   33/34... always 0000? (x-ray pause AI)
    DeathAnimation As Integer  '2 bytes  36
    UnknownF As Integer  '2 bytes   37/38... always 0000?
    UnknownG As Integer  '2 bytes   39/40
    PowerbombInvulnerability As Integer  '2 bytes  41-42  ''<Kejardon> Bytes 41-42: Powerbomb invulnerability (00 00 = vulnerable, (00-4C) 80 = untouchable)
    UnknownI As Integer             '43/44
    UnknownJ As Integer             '45/46
    UnknownK As Integer             '47/48
    EnemyTouch As Integer   '49/50 'when an enemy touches you
    EnemyShot As Integer    '51/52  'when your shot touches an enemy
    UnknownN As Integer             '53/54
    EnemyTiles As ThreeByte '3 bytes    55-57
    LayerControl As Byte    '1 byte 58
    ItemDrop As Integer     '2 bytes 59-60 (bank 1A)
        'Bytes: 1 = Energy, 2 = Big Energy, 3 = Missiles, 4 = nothing, 5 = super missiles, 6 = power bombs 14 0A 55 82 05 05
    Vulnerabilities As Integer  '2 bytes (bank B4)
    EnemyName As Integer  '2 bytes (bank 1A)
End Type