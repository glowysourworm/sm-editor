Public Type FX1
    Select As Integer           '0000 or doorID, use this entry... FFFF none... anything else, add 10h to FX1 pointer, and loop back to find next entry
    Surface_Start As Integer    'starting point of liquid's surface
    Surface_New As Integer      'new surface of liquid
    Surface_Speed As Integer    'speed of surface of liquid (lower is faster, bit 15 selects direction(0=flow down))
    Surface_Delay As Byte       'lower is faster (0 = LONG time)
    Layer3Type As Byte
    A As Byte
    B As Byte
    C As Byte
    Palette_FX As Byte     'palette fx bitflags (region-based)
    AnimateTile As Byte 'tile animation bitflags (region-based)
    Palette_Blend As Byte   'index value for palette blend data table [ $89 ]
End Type