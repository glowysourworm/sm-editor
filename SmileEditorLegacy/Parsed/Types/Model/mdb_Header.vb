Public Type mdb_Header
    RoomIndex As Byte   'index value for room, for an unknown purpose
    Region As Byte  'area of Zebes (on map)
    X As Byte   'x on map
    Y As Byte   'y on map
    Width As Byte   'in screens and/or map tiles
    Height As Byte  'in screens and/or map tiles
    UpScroller As Byte
    DownScroller As Byte
    Unknown4 As Byte
    DoorOut As Integer  '[$8F] pointer
End Type