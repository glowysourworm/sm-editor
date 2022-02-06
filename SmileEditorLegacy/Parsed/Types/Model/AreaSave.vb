Public Type AreaSave
    RoomID As Integer
    RoomLoad As Integer 'points to door data that uses this RoomID
    Unknown As Integer  'always zero??
    ScrollX As Integer
    ScrollY As Integer
    SamusY As Integer   'as offset from top
    SamusX As Integer   'as offset from center
End Type
