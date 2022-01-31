Attribute VB_Name = "dllModule"
'a module for dealing with my dll'all declares for smile.dll go in here
'C++ int = VB long
''''''''vb version
'Public Declare Function Figure_TotalNumberOfTiles Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\SMILE\Release\SMILE.dll" (ByVal StartingTile As Long, ByVal AreaWidth As Long, ByVal AreaHeight As Long) As Long
'Public Declare Sub FormDrag Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\SMILE\Release\SMILE.dll" (ByVal hWnd As Long)
'Public Declare Function CrystalBlt Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\SMILE\Release\SMILE.dll" (ByVal DestHDC As Long, ByVal DestX As Long, ByVal DestY As Long, ByVal DestWidth As Long, ByVal DestHeight As Long, ByVal MaskHDC As Long, ByVal SpriteHDC As Long, ByVal BlockID As Byte, ByVal TempSheet As Byte, Optional ByVal SpriteWidth As Long = 16, Optional ByVal SpriteHeight As Long = 16, Optional ByVal Do2 As Boolean = True) As Long
'Public Declare Function ReturnVariable Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\SMILE\Release\SMILE.dll" () As Long
'Public Declare Sub Figure_RoomTileXY Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\SMILE\Release\SMILE.dll" (ByRef RoomTileX As Long, ByRef RoomTileY As Long, ByVal CurTile As Long, ByVal TileSize As Long, ByVal TempPixelWide As Long)
'.....
'Public Declare Function FromBin Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\legna\Release\legna.dll" (ByRef InputArray As Byte) As Byte
'Public Declare Function ToBin Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\legna\Release\legna.dll" (ByVal InputByte As Byte, ByRef OutputArray As Byte) As Byte
'Public Declare Function IntExtTest Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\legna\Release\legna.dll" (ByRef InputArray As Byte) As Byte
'Public Declare Function DrawLine Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\legna\Release\legna.dll" (ByVal ControlHDC As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long) As Byte
'Public Declare Function DrawSquare Lib "C:\Program Files\Microsoft Visual Studio\MyProjects\legna\Release\legna.dll" (ByVal ControlHDC As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long) As Byte

''''''''public release
Public Declare Function Figure_TotalNumberOfTiles Lib "SMILE.dll" (ByVal StartingTile As Long, ByVal AreaWidth As Long, ByVal AreaHeight As Long) As Long
Public Declare Sub FormDrag Lib "SMILE.dll" (ByVal hWnd As Long)
Public Declare Function CrystalBlt Lib "SMILE.dll" (ByVal DestHDC As Long, ByVal DestX As Long, ByVal DestY As Long, ByVal DestWidth As Long, ByVal DestHeight As Long, ByVal MaskHDC As Long, ByVal SpriteHDC As Long, ByVal BlockID As Byte, ByVal TempSheet As Byte, Optional ByVal SpriteWidth As Long = 16, Optional ByVal SpriteHeight As Long = 16, Optional ByVal Do2 As Boolean = True) As Long
Public Declare Function ReturnVariable Lib "SMILE.dll" () As Long
Public Declare Sub Figure_RoomTileXY Lib "SMILE.dll" (ByRef RoomTileX As Long, ByRef RoomTileY As Long, ByVal CurTile As Long, ByVal TileSize As Long, ByVal TempPixelWide As Long)
'.....
Public Declare Function FromBin Lib "SMILE.dll" (ByRef InputArray As Byte) As Byte
Public Declare Function ToBin Lib "SMILE.dll" (ByVal InputByte As Byte, ByRef OutputArray As Byte) As Byte
Public Declare Function DrawLine Lib "SMILE.dll" (ByVal ControlHDC As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long) As Byte
Public Declare Function DrawSquare Lib "SMILE.dll" (ByVal ControlHDC As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long) As Byte
Public Declare Function DrawSquareSpaced Lib "SMILE.dll" (ByVal ControlHDC As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long) As Byte









Public Sub GetDrawBlockData(BlockIndex As Long, ByRef TtableEntry() As Long, ByRef Ttables() As Byte, SomeWorthlessVariable As Long)
On Error GoTo ErrorTrapSubscriptOutOfRange00
    Dim Tmp, I As Long
    Dim TempBytes(4) As Byte
    Tmp = (BlockIndex And &H3FF) * 8 'convert index value to a val that can access the correct data in our array
    'fill TtableEntry with indexes from the 'tile table'
    For I = 0 To 3
        TempBytes(0) = Ttables(Tmp)
        TempBytes(1) = Ttables(Tmp + 1)
        TtableEntry(I) = BytesToLong(TempBytes())
        Tmp = Tmp + 2
    Next I
    Exit Sub
    
ErrorTrapSubscriptOutOfRange00:
'an unhandled error that needs to be dealt with?
If Err.Number = 9 Then
    SkippedError(0) = True
Else
    MsgBox Err.Description & " in GetDrawBlockData", vbCritical, "Crap... Unhandled error."
    SkippedError(0) = True
End If
Err.Clear
End Sub

