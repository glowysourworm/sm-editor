Public Type Enemy   '16 bytes total
    Species As Integer  '2 bytes    'pointer (A0) to enemy data
    X As Integer    '2 bytes
    Y As Integer    '2 bytes
    Orientation As Integer    '2 bytes
    Special As Integer    '2 bytes (Prop-X)
    Unknown3 As Integer '2 bytes    'graphic unknown
    Speed As Integer    '2 bytes
    Unknown4 As Integer '2 bytes    'speed2
End Type