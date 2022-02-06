Public Type DoorData
    RoomID As Integer   'pointer to room definition (mdb) [$8F]
    DoorBitFlag As Byte '7th=elevator, 6th=switches regions
    Direction As Byte   'direction and whether or not door closes behind... others?
    Xi As Byte   'x of door "illusion" on exit (16x16)
    Yi As Byte   'y of door "illusion" on exit (16x16)
    X As Byte   'x of door on exit (16x16)
    Y As Byte   'y of door on exit (16x16)
    Distance As Integer 'distance Samus is placed from door (not 16x16)
    ScrollData As Integer 'pointer to code for updating scroll data (ie- if you start in a room with no scroll) [$8F]
End Type