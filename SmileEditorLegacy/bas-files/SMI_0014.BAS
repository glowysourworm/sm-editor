Attribute VB_Name = "SmileMod1"
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal hSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Public Const SRCCOPY = &HCC0020


Public Const faketiles = 0
Public AtNextCompression As Boolean 'whether or not compression byte of next tile has been reached (only used in special xx cases)
Public ClipTile(87) As Tile  'blockid and properties of tile clicked on in sheets
Public RoomTile(25600) As Tile
Public RoomArray(0 To 51200) As Byte 'current room contents
Public needslash As String
Public CurArray As Long 'where in data array
Public CurTile As Long 'which tile
Public TempVariant(2)  'to transfer data between subs
Public TileSize As Integer '16 or 32 pixels
Public AreaWidth As Integer 'intervals of 16
Public AreaHeight As Integer    'intervals of 16
Public SelectedTile As Integer
Public SelectedTileX As Integer   'x of tile in property editor (on map)
Public SelectedTileY As Integer   'y of tile in property editor (on map)
Public SelectedTileBlockID As Integer   'id of tile in property editor
Public SelectedTileSheet As Integer 'sheet of tile in property editor
Public NoPropertyChanging As Boolean    'temporarily locks drawscreen in property editor, so tile is not changed when properties are being loaded
Public MapTileNumber As Integer 'tile that is moused over on in map
Public Sheet0(511) As Byte
Public Sheet1(511) As Byte
Public Sheet2(511) As Byte
Public Sheet3(511) As Byte
Public NoXX As Boolean  'whether or not xx byte is compression (ie- not an xx)
Public TotalBytes As Long   'stores how many bytes composed an area before editing
Public DoubleCrap As Boolean    'whether or not there have been 2 incompatible sets in a row in switchbytes

Public Listing(511) As Byte


Public Sub Main()

For I = 0 To 511
Listing(I) = 0
Next I

MapDimensions 16, 16, 16
'show loading form
CF1.Visible = True
'load main form . . . hidden until file open
Load Smile

'creating other 3 picture boxes
For PIndex = 1 To 3
Load Smile.Picture1(PIndex)
Smile.Picture1(PIndex).Visible = True
Next PIndex
'loading standard use graphics into #1
Smile.Picture1(0).Picture = LoadPicture(App.Path & "\files\0.gif")
'set to Crateria graphics by default
Smile.AreaCombo1.Text = "Brinstar"
End Sub




Public Sub WhichAreaGraphics(AreaName As String)
'loads area graphics into picture boxes
For PIndex = 1 To 3
Smile.Picture1(PIndex).Picture = LoadPicture(App.Path & "\files\" & AreaName & "\" & PIndex & ".gif")
Next PIndex
End Sub






Public Sub DrawScreen(StartingTile As Integer)
'take current tilearray and load to screen
'need to skip offscreen tiles
Dim TempPattern As Byte
Dim TempSheet As Byte
Dim TempOrientation As Byte
Dim TempFlipAxis(1) As Byte
Dim TempFlipped(1) As Integer
Dim TempProperties As Byte
Dim TotalNumberOfTiles As Integer

TotalNumberOfTiles = AreaHeight * AreaWidth
If StartingTile > 0 Then TotalNumberOfTiles = 0

If StartingTile = 0 Then Smile.Picture2.Cls
For CurTile = (StartingTile + faketiles) To (StartingTile + TotalNumberOfTiles + faketiles)    '+faketiles because of 3 fake rows to prevent early mirroring errors
'figure X and Y on graphic sheets
Y = (RoomTile(CurTile).BlockID \ 32)
X = RoomTile(CurTile).BlockID - (Y * 32)

'temporary method of figuring out x and y of tiles in room
'need to figure widths
RoomTileX = (CurTile * TileSize)
RoomTileY = 0
TempPixelWide = AreaWidth * TileSize

Do
If RoomTileX >= TempPixelWide Then RoomTileY = RoomTileY + TileSize: RoomTileX = RoomTileX - TempPixelWide
Loop Until RoomTileX < TempPixelWide
'chooses which sheet to get graphics from, based on pattern byte
'need to set x and y for curtiles
TempPattern = RoomTile(CurTile).PatternByte
TempSheet = TempPattern Mod 4
'MsgBox Val("&H" & TempPattern & "&") Mod 4
TempOrientation = ((RoomTile(CurTile).PatternByte) Mod 16) \ 4
    If TempOrientation = 0 Then TempFlipAxis(0) = 0: TempFlipAxis(1) = 0: TempFlipped(0) = 1: TempFlipped(1) = 1
    If TempOrientation = 1 Then TempFlipAxis(0) = TileSize - 1: TempFlipAxis(1) = 0: TempFlipped(0) = -1: TempFlipped(1) = 1
    If TempOrientation = 2 Then TempFlipAxis(0) = 0: TempFlipAxis(1) = TileSize - 1: TempFlipped(0) = 1: TempFlipped(1) = -1
    If TempOrientation = 3 Then TempFlipAxis(0) = TileSize - 1: TempFlipAxis(1) = TileSize - 1: TempFlipped(0) = -1: TempFlipped(1) = -1

TempProperties = Smile.VScroll1.Value
StretchBlt Smile.Picture2.hdc, RoomTileX + TempFlipAxis(0), RoomTileY - ((faketiles \ AreaWidth) * TileSize) + TempFlipAxis(1), TileSize * TempFlipped(0), TileSize * TempFlipped(1), Smile.Picture1(TempSheet).hdc, X * 16, Y * 16, 16, 16, SRCCOPY
Next CurTile
If StartingTile = 0 Then Smile.Picture2.Refresh
End Sub

Public Sub ChangeProperties()
If NoPropertyChanging = True Then Exit Sub
'changes made with orientation and properties
Dim OrientationPart As Byte
Dim PropertyPart As Byte
Dim TempPattern As Byte
Dim LeftHalf As Byte    'value of left of hex for byte
Dim RightHalf As Byte   'value of right of hex for byte

PropertyPart = Smile.VScroll1.Value

LeftHalf = PropertyPart
RightHalf = SelectedTileSheet + (OrientationPart * 4)
RoomTile(SelectedTile + faketiles).PatternByte = Val("&H" & (Hex$(LeftHalf) & Hex$(RightHalf)) & "&")
DrawScreen 0
End Sub


Public Sub MapDimensions(NewTileSize As Integer, NewAreaWidth As Integer, NewAreaHeight As Integer)
TileSize = NewTileSize
AreaWidth = NewAreaWidth
AreaHeight = NewAreaHeight

Smile.Target(1).Move 0, 0, TileSize, TileSize
Smile.Picture2.Move 0, 0, AreaWidth * TileSize, AreaHeight * TileSize
Smile.MapHScroll1.Max = (Smile.Picture2.Width \ 128) - 2
Smile.MapVScroll1.Max = (Smile.Picture2.Height \ 112) - 2
Smile.MapHScroll1.Value = 0
Smile.MapVScroll1.Value = 0

DrawScreen 0

End Sub






Public Sub DoHotKeys(KeyPressed As Integer, Shift As Integer)
Dim Character As String
Dim TempSwap As Byte

If KeyPressed >= 37 And KeyPressed <= 40 Then GoTo ArrowKey
Select Case Chr$(KeyPressed)
    Case "H": KeyPressed = 37: GoTo ArrowKey
    Case "V": KeyPressed = 38: GoTo ArrowKey
    Case "B": GoTo FlipBytes
    Case "Q": KeyPressed = 1: GoTo ClipBoards  'mouse click
    Case "W": GoTo ClipBoards
    Case "E": GoTo ClipBoards
    Case "R": GoTo ClipBoards
    Case "A": GoTo ClipBoards
    Case "S": GoTo ClipBoards
    Case "D": GoTo ClipBoards
    Case "F": GoTo ClipBoards
    Case Else: Exit Sub
End Select


FlipBytes:
'switch patternbyte and blockID
TempSwap = RoomTile(MapTileNumber + faketiles).BlockID
RoomTile(MapTileNumber + faketiles).BlockID = RoomTile(MapTileNumber + faketiles).PatternByte
RoomTile(MapTileNumber + faketiles).PatternByte = TempSwap
Exit Sub

ArrowKey:
Dim OrientationPart As Integer
Dim PropertyPart As Integer
OrientationPart = Val(Right$("00" & Hex$(RoomTile(MapTileNumber + faketiles).PatternByte), 1))
PropertyPart = Val(Left$(Right$("00" & Hex$(RoomTile(MapTileNumber + faketiles).PatternByte), 2), 1))
'horizontal
If KeyPressed = 37 Or KeyPressed = 39 Then
    If OrientationPart < 8 Then
        OrientationPart = OrientationPart + 4
        If OrientationPart > 7 Then OrientationPart = OrientationPart - 8
    End If
    If OrientationPart >= 8 Then
        OrientationPart = OrientationPart + 4
        If OrientationPart > 15 Then OrientationPart = OrientationPart - 8
    End If
End If
'vertical
If KeyPressed = 38 Or KeyPressed = 40 Then
    OrientationPart = OrientationPart + 8
    If OrientationPart > 15 Then OrientationPart = OrientationPart - 16
End If
'setting orientation
RoomTile(MapTileNumber + faketiles).PatternByte = Val("&H" & Hex$(PropertyPart) & Hex$(OrientationPart) & "&")
Exit Sub

ClipBoards:
Smile.Picture2_MouseDown Val(KeyPressed), Shift, 0, 0
Exit Sub
End Sub



Public Sub OpenRoom2()
Dim RoomAddress As Long
    RoomAddress = Val("&H" & Smile.Label1.Caption & "&")
    If needslash = "" Then Exit Sub

Dim CommandString As String
    CommandString = App.Path & "/decomp.exe " & needslash & ".smc " & needslash & ".bin " & Hex$(RoomAddress) & " 4 0"
    Shell CommandString, vbNormalFocus

If needslash = "" Then Exit Sub
Open needslash & ".bin" For Binary As #1
    Get #1, 1, RoomTile()
Close #1

DrawScreen 0
End Sub


Public Sub SaveArea2(NumberOfTiles As Integer)
Dim RoomAddress As Long
RoomAddress = Val("&H" & Smile.Label1.Caption & "&")

Open needslash & ".bin" For Binary As #1
    For I = 0 To NumberOfTiles
        Put #1, (I * 2) + 1, RoomTile(I)
    Next I
Close #1

'save new bin data to ROM
Dim CommandString As String
CommandString = App.Path & "/recomp.exe " & needslash & ".bin " & needslash & ".smc " & Hex$(RoomAddress) & " 4 0"
Shell CommandString, vbNormalFocus

End Sub
