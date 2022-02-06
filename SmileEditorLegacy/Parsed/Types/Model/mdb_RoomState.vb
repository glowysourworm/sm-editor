Public Type mdb_RoomState
    LevelData As ThreeByte
    GraphicSet As Byte
    MusicTrack As Byte
    MusicControl As Byte
    FX1 As Integer     'pointer to room_fx1 [ $83 ]
    EnemyPopulation As Integer 'pointer to enemy_pop [ $a1 ]  'info on enemies
    EnemySet As Integer 'pointer to room_set [ $b4 ]
    Layer2 As Integer   'layer 2 scrolling data
    Scroll As Integer   'pointer to mdb_scroll [ $8f ]
    U1 As Integer 'used in escape version of Bomb Torizo's room **WTF**
    'xray casing code??? [$8F]
    FX2 As Integer  'pointer to room_fx2 (code? I forgot) [ $8f ]
    PLM As Integer  'pointer to PLM data
    BG_Data As Integer  'pointer to bg_data ($8F)
    Layer1_2 As Integer 'pointer to layer 1 and 2 handling code ($8F)
End Type