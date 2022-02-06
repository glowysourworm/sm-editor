Attribute VB_Name = "SmileMod1"
'FOR MAKEDEFAULTS.FRM ONLY
Public ResultPattern As Byte
Public ResultBTS As Byte
Public ResultLoaded As Boolean
''''''''''''''''''''''''''

Public Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Public Const SM_CXFULLSCREEN = 16   'width of client area
Public Const SM_CYFULLSCREEN = 17   'Height of window client area
Public Const SM_CXSCREEN = 0 ' Width of screen
Public Const SM_CYSCREEN = 1 ' Height of screen
Public Const SM_CYMENU = 15 ' Height of menu
Public Const SM_CYCAPTION = 4 ' Height of caption or title

Public Declare Function SetStretchBltMode Lib "gdi32" (ByVal hdc As Long, ByVal nStretchMode As Long) As Long
Public Const HALFTONE = 4
Public Const COLORONCOLOR = 3
Public Const BLACKONWHITE = 1
Public Const WHITEONBLACK = 2



Public Const BOXHIGH = 9869055
Public Const BOXLOW = 150
Public Const DOORBOXHIGH = 16750230
Public Const DOORBOXLOW = 6566400

Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const HWND_TOPMOST = -1
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal hSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Public Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Public Const SRCCOPY = &HCC0020
Public Const SRCPAINT = &HEE0086
Public Const SRCAND = &H8800C6
Public Const DSTINVERT = &H550009
Public Const BLACKNESS = &H42
Public Declare Function FlashWindow Lib "user32" (ByVal hWnd As Long, ByVal bInvert As Long) As Long
Public Const FLASHW_STOP = 0


Public Type POINTAPI
    X As Long
    Y As Long
End Type
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Public Declare Function ScreenToClient Lib "user32" (ByVal hWnd As Long, lpPoint As POINTAPI) As Long

Public Type SPI_HEADER
    ID As String * 3            'so SMILE knows it's not executable
    Version As String * 1       'in case future changes for compatibility
    UserVersion As String * 4   'version assigned by the author to the plug-in
    Date As String * 8          'mm-dd-yyyy of compile
    Author As String * 32       'author of plug-in
    Title As String * 32        'title of program
    Description As String * 432 'description of program
End Type


Public MyResolution As Long
Public Const GraphicStart = 517794    'val("&H7E6A2&")
Public AtNextCompression As Boolean 'whether or not compression byte of next tile has been reached (only used in special xx cases)
Public ClipBoardTile(512) As Tile  'blockid and properties of tiles clicked on in sheets (only has to go to 256?)
Public ClipBoardClip(256) As Byte   'clip byte of tiles clicked on in sheets
Public RoomHeader As Integer    'header of decompressed room data
Public RoomTile() As Tile  'layer 1 tile data
Public RoomTile2() As Tile 'layer 2 tile data?
Public ScrollArray() As Byte    'scroll data
Public ScrollArrayCopy() As Byte 'copy of scroll data to compare in scroll plm saving
Public RoomClip() As Byte  'bts data
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
Public NoPropertyChanging As Boolean    'temporarily locks DrawScreenDLL in property editor, so tile is not changed when properties are being loaded
Public MapTileNumber As Integer 'tile that is moused over on in map
Public Sheet0(511) As Byte
Public Sheet1(511) As Byte
Public Sheet2(511) As Byte
Public Sheet3(511) As Byte
Public TotalBytes As Long   'stores how many bytes composed an area before editing
Public DoubleCrap As Boolean    'whether or not there have been 2 incompatible sets in a row in switchbytes

Public OldClick As Integer
Public NewClick As Integer
Public StampSize As Integer 'size of full stamp
Public StampX As Integer    'width of current stamp
Public StampY As Integer    'height of current stamp
Public EnemySet() As Enemy
Public EnemyClickX As Integer
Public EnemyClickY As Integer
Public PLMSet() As PLM6
Public PLMClickX As Integer
Public PLMClickY As Integer

Public Listing(511) As Byte
Public ROM_HEADER As Integer

Public MyDecompress() As Byte   'current compressed data in memory
Public MyPalette() As Byte      'current palette in memory
Public MyTileSet() As Byte      'current tile set in memory
Public MyTileTable() As Byte    'current tile table in memory
Public MyPixelMap() As Byte     'current pixelmap in memory
Public MyPCPalette() As Long    'current PCPalette in memory

'from Ultima4701
Public SecTiles As New cDIBSection ' picTiles
Public Ttable() As Byte
Public Pixelmap() As Byte
Public PcPalette() As Long
''''

'new
Public ScrollOffset As Long
Public LevelDataOffset As Long
Public LightBulb As Byte
Public Mask As Boolean
Public Do2 As Boolean
Public FakeClip(1 To 256) As FakePictureBox
Public BTSMenuValue As Byte
Public FakeTargets(0 To 1) As FakeTarget

Public RR As Byte
Public GG As Byte
Public BB As Byte
Public PCPaletteEditor(0 To 128) As Byte

'rgb for palette editor
Public pRR As Byte
Public pGG As Byte
Public pBB As Byte
Public pPaletteOffset As Long

'universal enemy editing pointer
Public pEnemyEditing As Long    'offset for specific data needed while editing enemy properties

'taken from dim's... return or keep here?
Public MyState As mdb_RoomState

Public EnemyClear_Offset As Long    'offset of value of number of enemies needed to "clear" a room
Public EnemyClear_Value As Byte     'number of enemies to clear a room
Public CurrentEnemyStatistics As EnemyStats 'permanent properties of selected enemy
Public CopiedEnemyStatistics As EnemyStats  'copy of permanent properties of an enemy, to be "pasted" in over another
Public CopiedEnemyStatisticsSpeciesID As String * 4 'species ID for what's in the clip
Public Doorset() As DoorData    'array of doors to be used to simplify door editing
Public CloneDoorset() As CloneDoor  'array of Clone Doors

Public LevelDataPointer As ThreeByte    'global, to keep consistent
Public FX1Pointer As Integer    'global, to keep consistent with other parts of the editor
Public EnemyPopulationPointer As Integer    'global, since should be in enemy editor, though is technically part of the roomstate
Public EnemySetPointer As Integer  'global, to keep consistent
Public ScrollPointer As Integer  'global, to keep consistent
Public U1Pointer As Integer  'global, to keep consistent
Public FX2Pointer As Integer    'global, to keep consistent with other parts of the editor
Public PLMPointer As Integer    'global, to keep consistent with other parts of the editor
Public BG_DataPointer As Integer  'global, to keep consistent
Public Layer1_2Pointer As Integer  'global, to keep consistent
Public DoorOutPointer As Integer  'global, to keep consistent
Public FastRead As Boolean        'open room without displaying level or graphics... used for tool reads
Public CRETileTableBytes() As Byte    'array of 2-byte table data (per 8x8 tile) for CRE
Public URETileTableBytes() As Byte    'array of 2-byte table data (per 8x8 tile) for URE
Public CRETilesOffset As Long           '= &H1C8000 'default offset of CRE tiles
Public CRETTableOffset As Long          '= &H1CA09D 'default offset of CRE ttables


Public URETTableOffset As Long 'offset of URE ttables

Public AreaMap(0 To 2047) As MapType   'the map from the rom  'should be in mapper1, but needed to be accessed in drawmaptile
Public AreaMapStation(0 To 2047) As Byte    '0=hidden, 1=show... what happens when you get to a mapping station
'^--- 0 to 1023 = left half ... 1024 to 2047 = right half
Public AreaMapStationBytes(0 To 255) As Byte   '$100 bytes that store the bits of the map station

Public Const AreaSavePointerTable = &H44B5&     'pointer to table with the 8 pointers to the 8 areas' save spots
Public Const ShipIconOffset = &H14853           'offset where the ship's map icon is stored on the map
Public Const BossIconOffset = &H147CB           'offset to start of pointer table to boss icons (indexed by area)


Public DraggedDropped As DraggedObject
Public MyRoomVar As Jathys_RoomVar
Public RoomStatePointersOffset As Long
Public UseAutoHide As Boolean                   'autohide menus
Public SnapToGrid As Boolean                    'do enemies and plm's snap to a grid
Public WhichDoorDataOffset As Long              'bts chosen, then the door offset it points to
Public MyDoorDataOffset(0 To 49) As Long        'offset to door data... use in load/save point editor
Public ScrollPLMBytes() As Byte                 'scroll plm data
Public MapEditorX As Integer                    'copy of mouse X in map editor
Public MapEditorY As Integer                    'copy of mouse Y in map editor
Public FoundRooms() As String * 5               'room chosen in map editor to open in level editor
Public LastRoomOpened As String * 5             'last room opened before closing smile
Public FavoriteRooms() As String * 45           'first 5 are the mdb value, next 40 are for the name
Public Kejardon00 As Boolean                    'CRETilesOffset finder
Public DoorScrollX As Byte                      'X position we enter from a door
Public DoorScrollY As Byte                      'Y position we enter from a door

Public MyGBColor(0 To 3) As Long                'colors used for 2bpp gfx
Public Emulator As String * 256                 'keeps path to emulator
Public SRMPath As String * 256                  'keeps path to SRM folder (if one is there)
Public MiscForm1Type As Byte                    'what type o data we're editing when openning MiscForm1
Public MiscForm1Byte As Byte                    'value to carry over, optional
Public TempFX1 As FX1                           'what FX1 is used by the game

Public DisplayFX1 As Boolean                    'whether or not FX1 can be displayed (ie- is this real data?)
Public WheelScroller As Boolean                 'scroller with mouse middle button
Public JTEBank As Byte                          'bank for JTE engine, if available

Public PLMBank As Byte
Public ScrollPLMBank As Byte
Public UserScreenHeight As Long     'screen height, accounting for title bar, etc...
Public UserScreenWidth As Long      'screen widht, accounting for title bar, etc...
Public RefreshGraphicMenuMask As Boolean    'whether or not to force a refresh of the graphic menu mask when changing graphic set
Public SkippedError(0 To 9) As Boolean  'errors that would normally crash smile... warn about them instead (and possibly offer clues for fixing)

Public PointerSavingOnly As Boolean 'pointer editor saved, but NOT MOVING DATA
Public EnteredRoomFromThisDoor As Long   'what door we came *from* (used for certain FX1 rooms)
Public FX1Displacement As Integer   'how deep our FX1 data is from the original starting pointer (ie- a door-depenedent FX1)

Public PlugInPath As String         'plug-in we most recently opened
Public MY_SPI_HEADER As SPI_HEADER
Public SPI_CellData(0 To 24) As String 'actual data for a cell
Public SPI_TempString As String        'copy of celldata that we're currently working with
Public SPI_FullString As String        'user data when opening a file
Public Zooming As Boolean               'are we zooming right now?
Public Zoomed_H As Single              'H value if zoomed... actually ratio between maxH and H
Public Zoomed_V As Single              'V value if zoomed... actually ratio between maxV and V
Public MouseMyX As Single
Public MouseMyY As Single
Public NonMaximizedView As Integer
Public SRMVariables(0 To 19) As Integer



Public Sub Main()
'MsgBox "Pose form. Values are incorrect for the keys?"
'metroid buddy settings
Dim TempBuddyIni As String * 1000
'set up metroid buddy... yes, this is the first thing we do
MetroidMaxSpeed = 3
MetroidMinSpeed = -3
MetroidTargetX = -100
MetroidTargetY = -100
MetroidFeedingTimeMax = 800
'add an ini file for the buddy later as an override?

If FileExists(App.Path & "\files\metroidbuddy.ini") = True Then
    Open App.Path & "\files\metroidbuddy.ini" For Binary As #1
        Get #1, , TempBuddyIni
    Close #1
End If

FixMissingFiles

If UCase$(Right$(App.EXEName, 1)) = "K" Then
    Kejardon00 = True
End If
FastRead = False    'make sure we start out with normal reading (ie- not tool read)
'ReDim RoomTile(0 To 25600) As Tile
'ReDim RoomClip(0 To 12800) As Byte
Do1 = True
Do2 = True
StampSize = 16
For I = 0 To 511
Listing(I) = 0
Next I

'needed to prevent division by zero error caused when openning ini
MapDimensions 16, 16, 16
'load main form . . . hidden until file open

Smile.Visible = True

Load RoomHeader1

ReDim CloneDoorset(0 To 0) As CloneDoor
'to allow species form to know whether or not copiedenemystatistics is activated yet
CopiedEnemyStatisticsSpeciesID = "FFFF"
'move the metroid buddy offscreen
Smile.MetroidImage1(0).Move -100, -100
Smile.MetroidImage1(1).Move -100, -100
Smile.MetroidImage1(2).Move -100, -100
End Sub



Public Sub DrawScreen2(StartingTile As Integer)
Dim DrawMethod As Long   'how to draw layer 2 (if layer 2 is off, draw blackness)
Dim TempPattern As Byte
Dim TempSheet As Byte
Dim TempOrientation As Byte
Dim TempFlipAxis(1) As Byte
Dim TempFlipped(1) As Integer
Dim TempProperties As Byte
Dim TotalNumberOfTiles As Integer
Dim RoomTileX As Long
Dim RoomTileY As Long

If UBound(RoomTile2) = 0 Then
    Do2 = False
    Exit Sub
Else
    Do2 = True
End If

If Smile.mnuLayer2.Checked = True Then
    DrawMethod = SRCCOPY
Else
    DrawMethod = BLACKNESS
End If
'If tilesize = 8 Then exit sub
'layer 2
'take current tilearray and load to screen
'need to skip offscreen tiles

TotalNumberOfTiles = AreaHeight * AreaWidth
If StartingTile > 0 Then TotalNumberOfTiles = 0
If StartingTile = 0 Then Smile.Picture2.Cls
'For CurTile = (StartingTile) To (StartingTile + TotalNumberOfTiles) - 1
TempPixelWide = AreaWidth * TileSize


'if scroll editor, interpolate the results
'halftone works better, but is quite a bit slower
'this carries through to Layer 1, but is then forgotten
If TileSize < 16 Then SetStretchBltMode Smile.Picture2.hdc, HALFTONE

For CurTile = (StartingTile) To (StartingTile + TotalNumberOfTiles)
'figure X and Y on graphic sheets
If CurTile > UBound(RoomTile) Then Exit For
Y = (RoomTile2(CurTile).BlockID \ 32)
X = RoomTile2(CurTile).BlockID - (Y * 32)
'all tiles
RoomTileX = (CurTile * TileSize)
'figure x and y of tile
RoomTileY = (RoomTileX \ TempPixelWide) * TileSize
RoomTileX = RoomTileX Mod TempPixelWide

'chooses which sheet to get graphics from, based on pattern byte
'need to set x and y for curtiles
TempPattern = RoomTile2(CurTile).PatternByte
TempSheet = TempPattern Mod 4

'MsgBox Val("&H" & TempPattern & "&") Mod 4
TempOrientation = ((RoomTile2(CurTile).PatternByte) Mod 16) \ 4
    If TempOrientation = 0 Then TempFlipAxis(0) = 0: TempFlipAxis(1) = 0: TempFlipped(0) = 1: TempFlipped(1) = 1
    If Smile.mnuLayer2.Checked = True And TempOrientation = 1 Then TempFlipAxis(0) = TileSize - 1: TempFlipAxis(1) = 0: TempFlipped(0) = -1: TempFlipped(1) = 1
    If Smile.mnuLayer2.Checked = False And TempOrientation = 1 Then TempFlipAxis(0) = TileSize - 0: TempFlipAxis(1) = 0: TempFlipped(0) = -1: TempFlipped(1) = 1
    If TempOrientation = 2 Then TempFlipAxis(0) = 0: TempFlipAxis(1) = TileSize - 1: TempFlipped(0) = 1: TempFlipped(1) = -1
    If TempOrientation = 3 Then TempFlipAxis(0) = TileSize - 1: TempFlipAxis(1) = TileSize - 1: TempFlipped(0) = -1: TempFlipped(1) = -1

'TempProperties = Smile.VScroll1.Value

StretchBlt Smile.Picture2.hdc, RoomTileX + TempFlipAxis(0), RoomTileY + TempFlipAxis(1), TileSize * TempFlipped(0), TileSize * TempFlipped(1), Smile.MenuPicture1.hdc, X * 16, (Y * 16) + (TempSheet * 128), 16, 16, DrawMethod
''''''''''''''''''''''''''
Next CurTile




If StartingTile = 0 And Smile.mnuLayer1.Checked = False Then Smile.Picture2.Refresh
End Sub




Public Sub ChangeProperties(Optional ChangeOrientation As Boolean = True)
'only do changes if we can see layer 1
If Smile.mnuLayer1.Checked = False Then Exit Sub
'placed in to make sure SMILE is initialized
If NoPropertyChanging = True Then Exit Sub
'changes made with orientation and properties
Dim OrientationPart As Byte
Dim PropertyPart As Byte
Dim TempPattern As Byte
Dim LeftHalf As Byte    'value of left of hex for byte
Dim RightHalf As Byte   'value of right of hex for byte
PropertyPart = Smile.VScroll1.Value
If ChangeOrientation = True Then
    OrientationPart = Smile.HFlip.Value + (Smile.VFlip.Value * 2)
    RightHalf = SelectedTileSheet + (OrientationPart * 4)
Else
    OrientationPart = Val("&H" & Right$(Hex$(RoomTile(SelectedTile).PatternByte), 1) & "&")
    RightHalf = OrientationPart
End If
LeftHalf = PropertyPart
RoomTile(SelectedTile).PatternByte = Val("&H" & (Hex$(LeftHalf) & Hex$(RightHalf)) & "&")
ClipBoardTile(1).PatternByte = RoomTile(SelectedTile).PatternByte
DrawScreenDLL SelectedTile
End Sub


Public Sub MapDimensions(NewTileSize As Integer, NewAreaWidth As Integer, NewAreaHeight As Integer)
Dim TempDoorScrollX As Integer
Dim TempDoorScrollY As Integer

TileSize = NewTileSize
AreaWidth = NewAreaWidth * 16 '16 tiles
AreaHeight = NewAreaHeight * 16 '16 tiles
            'Smile.Target(1).Move 0, 0, TileSize, TileSize
'SPEED PROBLEM!!!
Smile.Picture2.Move 0, 0, AreaWidth * TileSize, AreaHeight * TileSize
Smile.MapHScroll1.Max = AreaWidth - (Smile.MapHScroll1.Width \ TileSize)
If Smile.MapHScroll1.Max < 0 Then Smile.MapHScroll1.Max = 0
If Smile.MapVScroll1.Max < 0 Then Smile.MapVScroll1.Max = 0
Smile.MapVScroll1.Max = AreaHeight - (Smile.MapVScroll1.Height \ TileSize)
'XXXXX were commented out for some reason... doing so causes rooms not to scroll to 0,0 when selecting new room
If Zooming = False Then
    Smile.MapHScroll1.Value = 0
    Smile.MapVScroll1.Value = 0
End If

If DoorScrollX > 0 And DoorScrollX < Smile.MapHScroll1.Max Then
    TempDoorScrollX = DoorScrollX * TileSize
    If TempDoorScrollX > Smile.MapHScroll1.Max Then TempDoorScrollX = Smile.MapHScroll1.Max
    If Zooming = False Then Smile.MapHScroll1.Value = TempDoorScrollX
End If

If DoorScrollY > 0 And DoorScrollY < Smile.MapVScroll1.Max Then
    TempDoorScrollY = DoorScrollY * TileSize
    If TempDoorScrollY > Smile.MapVScroll1.Max Then TempDoorScrollY = Smile.MapVScroll1.Max
    If Zooming = False Then Smile.MapVScroll1.Value = TempDoorScrollY
End If

DoorScrollX = 0
DoorScrollY = 0
End Sub






Public Sub DoHotKeys(KeyPressed As Integer, Shift As Integer, Optional KeyboardCall As Boolean = True)
Dim L1 As Boolean   'layer 1 (if not, layer 2)
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = True Then L1 = False Else L1 = True
If KeyPressed >= 112 And KeyPressed <= 117 Then GoTo FunctionKeyJump
If L1 = False And UBound(RoomTile2) = 0 Then Exit Sub
FunctionKeyJump:
Dim Character As String
Dim TempSwap As Byte
Dim LightEffect As Integer
Dim TempInfo As String
Static EnteringRoom As Boolean


If KeyPressed = 13 Then GoTo EnterDoor  'pressed "Enter"
If KeyPressed = 33 Then LightEffect = 1: GoTo AdjustBrightness
If KeyPressed = 34 Then LightEffect = -1: GoTo AdjustBrightness
If KeyPressed = 44 And Shift > 0 Then Smile.TakeSnapshot: Exit Sub
If KeyPressed = 65 Then GoTo TileInfoForASMers
If KeyPressed = 67 Then GoTo PrepareDoor
If KeyPressed = 68 Then GoTo EditorForDoor
If KeyPressed = 69 Then GoTo EnterDoor  'pressed "E"
If KeyPressed >= 37 And KeyPressed <= 40 Then GoTo ArrowKey
If KeyPressed = 187 Then GoTo SetProp   'pressed "=" key
If KeyPressed = 76 Then GoTo SetLoadSaveDoor 'pressed "L" key
If KeyPressed = 77 Then GoTo MetroidActivation  'pressed "M" key
If KeyPressed = 51 And Shift = 1 Then GoTo ChangingBTS 'pressed "#"
If KeyPressed = 90 Then GoTo ZoomLevel
If KeyPressed > 95 And KeyPressed < 106 Then KeyPressed = KeyPressed - 48   'pressed 0-9 on numpad
If KeyPressed > 47 And KeyPressed < 58 Then GoTo ChangingBTSNum    'pressed 0-9
If KeyPressed = 112 Then Smile.mnuLayer1_Click
If KeyPressed = 113 Then Smile.mnuLayer2_Click
If KeyPressed = 114 Then Smile.mnuGrid_Click
If KeyPressed = 115 Then Smile.mnuViewPLM_Click
If KeyPressed = 116 Then Smile.mnuEnemies_Click
If KeyPressed = 117 Then Smile.mnuShowAll_Click
Exit Sub

ChangingBTS:
'bts changing via # being pressed
LoadMiscForm1 4, 10
GoTo ChangeBTSValueNow
ChangingBTSNum:
'bts changing via 0-9 being pressed
LoadMiscForm1 4, Val(KeyPressed - 48)
ChangeBTSValueNow:
If MiscForm1Type <> 255 Then Exit Sub   'bts cancelled, so don't change
RoomClip(MapTileNumber) = MiscForm1Byte
DrawScreenDLL MapTileNumber
Smile.Picture2.Refresh
Exit Sub


TestingRoom:
'open room in emulator
Smile.TestRoom
Exit Sub

ChangeSpawning:
'don't allow scroll editor to change spawning
If Smile.mnuScrollEditor.Checked = True Then Exit Sub
Exit Sub

ArrowKey:
'don't allow scroll editor to flip tiles
If Smile.mnuScrollEditor.Checked = True Then Exit Sub
Dim OrientationPart As Integer
Dim PropertyPart As Integer
Dim AreaPart As Integer
Dim HorizontalFlip As Boolean
'0-511
If L1 = True Then
    OrientationPart = Val("&H" & Right$("00" & Hex$(RoomTile(MapTileNumber).PatternByte), 1) & "&")
    PropertyPart = Val("&H" & Left$(Right$("00" & Hex$(RoomTile(MapTileNumber).PatternByte), 2), 1) & "&")
Else
    OrientationPart = Val("&H" & Right$("00" & Hex$(RoomTile2(MapTileNumber).PatternByte), 1) & "&")
    PropertyPart = Val("&H" & Left$(Right$("00" & Hex$(RoomTile2(MapTileNumber).PatternByte), 2), 1) & "&")
End If

'horizontal
If KeyPressed = 37 Or KeyPressed = 39 Then
HorizontalFlip = True
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
HorizontalFlip = False
    OrientationPart = OrientationPart + 8
    If OrientationPart > 15 Then OrientationPart = OrientationPart - 16
End If

SlopeChangeDone:
'setting orientation
If L1 = True Then
    RoomTile(MapTileNumber).PatternByte = Val("&H" & Hex$(PropertyPart) & Hex$(OrientationPart) & "&")
    'only flip bts if a slope
    If PropertyPart = 1 Then RoomClip(MapTileNumber) = FlipTheClip(RoomClip(MapTileNumber), HorizontalFlip)
Else
    RoomTile2(MapTileNumber).PatternByte = Val("&H" & Hex$(PropertyPart) & Hex$(OrientationPart) & "&")
End If

If KeyboardCall Then
    DrawScreenDLL MapTileNumber
    'refreshing entire map for one tile
    Smile.Picture2.Refresh
End If
Exit Sub

SetProp:
'don't allow scroll editor to enter doors
If Smile.mnuScrollEditor.Checked = True Then Exit Sub
Dim ByteAsHex As String * 2
Dim LeftHalf As String * 1
Dim RightHalf As String * 1

ByteAsHex = Right$("00" & Hex$(RoomTile(MapTileNumber).PatternByte), 2)
'LeftHalf = Left$(ByteAsHex, 1)
RightHalf = Right$(ByteAsHex, 1)
LeftHalf = Hex$(Smile.VScroll1.Value)
ByteAsHex = LeftHalf & RightHalf


If L1 = True Then
    RoomTile(MapTileNumber).PatternByte = Val("&H" & ByteAsHex & "&")
End If
DrawScreenDLL MapTileNumber
Exit Sub


PrepareDoor:
'are you clicking on the edge of a screen
My_EdgeX = (Smile.Target(1).Left / TileSize) Mod 16
My_EdgeY = (Smile.Target(1).Top / TileSize) Mod 16
If My_EdgeX <> 0 And My_EdgeX <> 15 And My_EdgeY <> 0 And My_EdgeY <> 15 Then Exit Sub
Smile.mnuDoorPopOptions_Click 0
Exit Sub

EnterDoor:
'are you clicking on a door tile?  if not, test the room instead...
If RoomTile(MapTileNumber).PatternByte \ 16 <> 9 Then GoTo TestingRoom
'EnteredRoomFromThisDoor
EnteringRoom = True
DoHotKeys 76, False 'force us to choose door data to check with fx1 when the room opens
EnteringRoom = False
Smile.mnuJumpToRoomOptions_Click 1
EnteredRoomFromThisDoor = 0
Exit Sub


EditorForDoor:
'are you clicking on a door tile?
If RoomTile(MapTileNumber).PatternByte \ 16 = 9 Then DoorForm1.Show 1: Exit Sub
Exit Sub

SetLoadSaveDoor:
'don't allow scroll editor to flip tiles
If Smile.mnuScrollEditor.Checked = True Then Exit Sub
'remember this door's offset for use with a load/save point later
'start by checking to see if we are clicking on a door tile
If RoomTile(MapTileNumber).PatternByte \ 16 <> 9 Then Exit Sub
WhichDoorDataOffset = RoomClip(MapTileNumber)
ReduceWhichDoorDataOffset:
'reduce this value to max # of doors, if needed
If WhichDoorDataOffset > 49 Then WhichDoorDataOffset = WhichDoorDataOffset - 1: GoTo ReduceWhichDoorDataOffset
GetFullWhichDoorDataOffset:
'convert this into the actual offset for the specific door chosen
WhichDoorDataOffset = MyDoorDataOffset(WhichDoorDataOffset)
EnteredRoomFromThisDoor = WhichDoorDataOffset
If EnteringRoom = True Then Exit Sub
Load LoadPoints1
If WhichDoorDataOffset <> 0 Then LoadPoints1.DoorDataCommand1.Enabled = True
Exit Sub

AdjustBrightness:
Dim TempIndex As Integer
TempIndex = (LightBulb - 1)
TempIndex = TempIndex + LightEffect
If TempIndex < 0 Then TempIndex = 0
If TempIndex > 2 Then TempIndex = 2
Smile.mnuLightBulb_Click TempIndex
Exit Sub

MetroidActivation:
Dim MetroidDescription As String

Select Case MetroidBehavior
    Case MetroidAway: MetroidBehavior = MetroidMouse: MetroidDescription = "Metroid Mousing"
    Case MetroidMouse: MetroidBehavior = MetroidHunting: MetroidDescription = "Metroid Hunting"
    Case MetroidFeeding: MetroidBehavior = MetroidHunting: MetroidDescription = "Metroid Hunting"
    Case MetroidHunting: MetroidBehavior = MetroidAway: MetroidDescription = "Metroid Away"
    Case Else: MetroidDescription = "Metroid Unknown Mode"
End Select
Smile.SMILECaption.Caption = "<<<" & MetroidDescription & ">>>"
Exit Sub


ZoomLevel:
Zooming = True
If Smile.MapHScroll1.Max > 0 Then Zoomed_H = Smile.MapHScroll1.Value / Smile.MapHScroll1.Max Else Zoomed_H = 0
If Smile.MapVScroll1.Max > 0 Then Zoomed_V = Smile.MapVScroll1.Value / Smile.MapVScroll1.Max Else Zoomed_V = 0

If Shift = 0 Then
    Select Case TileSize
        Case 8: TileSize = 16
        Case 16: TileSize = 24
        Case 24: TileSize = 32
        Case 32: Exit Sub
    End Select
Else
If Shift = 1 Then
    Select Case TileSize
        Case 8: Exit Sub
        Case 16: TileSize = 8
        Case 24: TileSize = 16
        Case 32: TileSize = 24
    End Select
Else: Exit Sub
End If
End If
Smile.mnuTileSizes_Click TileSize
DoEvents
Smile.MapHScroll1.Value = Smile.MapHScroll1.Max * Zoomed_H
Smile.MapVScroll1.Value = Smile.MapVScroll1.Max * Zoomed_V
Zooming = False
Exit Sub

TileInfoForASMers:
TempInfo = "Tile Number = $" & Right$("0000" & Hex$(MapTileNumber), 4) & vbCrLf
TempInfo = TempInfo & "Tile Data = $" & Right$("00" & Hex$(RoomTile(MapTileNumber).PatternByte), 2) & Right$("00" & Hex$(RoomTile(MapTileNumber).BlockID), 2) & vbCrLf
TempInfo = TempInfo & "BTS Value = $" & Right$("00" & Hex$(RoomClip(MapTileNumber)), 2)
MsgBox TempInfo, vbInformation, "Tile Information"
End Sub




Public Sub DoFavorites(FIndex As Integer)
Dim FValue As Byte
Dim FavoritesSize As Integer

Open App.Path & "\SMILE.fav" For Binary As #1
Close #1

Select Case FValue
    Case 0: Smile.mnuOpen_Click
    Case Else: Exit Sub
End Select
End Sub


Public Sub DoorPrep()
'get details of future door
'only recognize if mouse is on edge of one of a screen? (that's how we tell direction)
Dim My_CloneDoor As DoorData
Dim My_EdgeX As Byte '0 to 15, where they clicked on a screen
Dim My_EdgeY As Byte '0 to 15, where they clicked on a screen
Dim Touching As Byte    '0=left, 1=right, 2=top, 3=bottom
Dim CallIt As String * 50 'allow user to "name" a door they're setting up, for easy reference

My_EdgeX = (Smile.Target(1).Left / TileSize) Mod 16
My_EdgeY = (Smile.Target(1).Top / TileSize) Mod 16

My_CloneDoor.X = Smile.Target(1).Left \ (16 * TileSize)
My_CloneDoor.Y = Smile.Target(1).Top \ (16 * TileSize)

Touching = 255
If My_EdgeX = 0 Then Touching = 0: My_CloneDoor.Direction = 4
If My_EdgeX = 15 Then Touching = 1: My_CloneDoor.Direction = 5
If My_EdgeY = 0 Then Touching = 2: My_CloneDoor.Direction = 6
If My_EdgeY = 15 Then Touching = 3: My_CloneDoor.Direction = 7
If Touching = 255 Then MsgBox "To prepare a Clone Door, you must be clicking on the edge of a screen.", vbInformation: Exit Sub 'if not on the edge, not a door (elevators need to be put on edge, then adjusted

My_CloneDoor.RoomID = Val("&H" & Right$(Smile.mdbCombo.Text, 4))
'adjust Xi and Yi for door
If Touching = 0 Then My_CloneDoor.Xi = Val("&H" & Right$(Hex$(My_CloneDoor.X), 1) & "1"): My_CloneDoor.Yi = Val("&H" & Right$(Hex$(My_CloneDoor.Y), 1) & "6")
If Touching = 1 Then My_CloneDoor.Xi = Val("&H" & Right$(Hex$(My_CloneDoor.X), 1) & "E"): My_CloneDoor.Yi = Val("&H" & Right$(Hex$(My_CloneDoor.Y), 1) & "6")
If Touching = 2 Then My_CloneDoor.Xi = Val("&H" & Right$(Hex$(My_CloneDoor.X), 1) & "6"): My_CloneDoor.Yi = Val("&H" & Right$(Hex$(My_CloneDoor.Y), 1) & "2")
If Touching = 3 Then My_CloneDoor.Xi = Val("&H" & Right$(Hex$(My_CloneDoor.X), 1) & "6"): My_CloneDoor.Yi = Val("&H" & Right$(Hex$(My_CloneDoor.Y), 1) & "D")
'unless we're going up through door, distance should be 8000 (except for elevators)
If Touching = 2 Then My_CloneDoor.Distance = &H1C0 Else My_CloneDoor.Distance = &H8000
CallIt = Left$(InputBox("Give a name to this door setting (50 characters or less).", "Name door setting.", ""), 50)
If CallIt = "                                                  " Then Exit Sub
ReDim Preserve CloneDoorset(0 To UBound(CloneDoorset) + 1)
CloneDoorset(UBound(CloneDoorset)).Name = CallIt
CloneDoorset(UBound(CloneDoorset)).DoorProperties = My_CloneDoor
End Sub


Public Sub ReadDoors(Offset As Long)
Dim DoorThisPointer As ThreeByte
Dim DoorDataOffset As Long
'instead of looping for doors, I'll assume a room will never have more than 99 (a good assumption)... this will be faster than looping
Dim TempInteger(99) As Integer
Dim DoorI As Byte
Dim ThisDoor As DoorData
Dim MyHeader As mdb_Header
Dim DDOffset As Long

Offset = Offset + ROM_HEADER + 1
Open needslash For Binary As #1
    Get #1, Offset, MyHeader
Close #1

'DoorOut gets converted into pointer to door data (pointer table pointing to actual door data)
DoorThisPointer.Byte1 = Val("&H" & Right$(Hex$(MyHeader.DoorOut), 2) & "&")
DoorThisPointer.Byte2 = Val("&H" & Left$(Hex$(MyHeader.DoorOut), 2) & "&")
DoorThisPointer.Byte3 = &H8F&
DoorDataOffset = ThreePoint2Offset(DoorThisPointer) + ROM_HEADER
'make a copy of pointer to the pointer table for door data
Smile.DoorLabel.Caption = DoorDataOffset
Open needslash For Binary As #1
'get the pointers from the current location
    Get #1, DoorDataOffset + 1, TempInteger()
ReDim Doorset(0 To 0) As DoorData
'For DoorI = 0 To 99
'MsgBox "Doors limited to 50... change that"
For DoorI = 0 To 49
'0000-7FFF aren't pointers.... 8000-FFFF are
If TempInteger(DoorI) >= 0 Then Exit For
    ReDim Preserve Doorset(0 To DoorI) As DoorData
    DoorThisPointer.Byte1 = Val("&H" & Right$(Hex$(TempInteger(DoorI)), 2) & "&")
    DoorThisPointer.Byte2 = Val("&H" & Left$(Hex$(TempInteger(DoorI)), 2) & "&")
    DoorThisPointer.Byte3 = &H83&
    DoorDataOffset = ThreePoint2Offset(DoorThisPointer)
    'save for use with load point editor
    MyDoorDataOffset(DoorI) = DoorDataOffset
    Get #1, DoorDataOffset + ROM_HEADER + 1, Doorset(DoorI)
Next DoorI
Close #1
End Sub

Public Sub ReadEnemies()
Dim EnemyOffset As Long
Dim EnemyData As Enemy
Dim Temp2Bytes As String * 4
Dim LeftByte As Long
Dim RightByte As Long
Dim TempValue As Long

EnemyOffset = Val("&H" & Smile.EnemyLabel.Caption & "&")
'erase old enemy data
ReDim EnemySet(0 To 0) As Enemy

'disable extra enemy boxes
For I = 0 To Smile.EnemyBox.UBound
    Smile.EnemyBox(I).Enabled = False
    Smile.EnemyBox(I).Visible = False
Next I
If EnemyOffset = 0 Then Exit Sub

'get new enemies
For I = 0 To Smile.EnemyBox.UBound
Open needslash For Binary As #1
    Get #1, EnemyOffset + (I * 16) + ROM_HEADER + 1, EnemyData
Close #1

If Right$("0000" & Hex$(EnemyData.Species), 4) = "FFFF" Then Exit For
ReDim Preserve EnemySet(0 To I) As Enemy
EnemySet(I) = EnemyData

Smile.EnemyBox(I).Enabled = True


EnemyGIF = App.Path & "\files\enemies\" & Right$("0000" & Hex$(EnemySet(I).Species), 4) & ".gif"

Open EnemyGIF For Binary As #1
EnemyGIFSize = LOF(1)
Close #1
If EnemyGIFSize = 0 Then
    Kill EnemyGIF
    EnemyGIF = App.Path & "\files\enemies\unknown.gif"
End If
Smile.EnemyBox(I).Stretch = False
Smile.EnemyBox(I).Picture = LoadPicture(EnemyGIF)
Smile.EnemyBox(I).Stretch = True

    Smile.EnemyBox(I).Width = Smile.EnemyBox(I).Width * (TileSize / 16)
    Smile.EnemyBox(I).Height = Smile.EnemyBox(I).Height * (TileSize / 16)

'figure x-axis
Temp2Bytes = Right$("0000" & Hex$(EnemyData.X), 4)
LeftByte = Val("&H" & Left$(Temp2Bytes, 2) & "&")
RightByte = Val("&H" & Right$(Temp2Bytes, 2) & "&")
TempValue = ((LeftByte * 255) + RightByte) * TileSize / 16
Smile.EnemyBox(I).Left = (TempValue - Smile.EnemyBox(I).Width / 2)

'figure y-axis
Temp2Bytes = Right$("0000" & Hex$(EnemyData.Y), 4)
LeftByte = Val("&H" & Left$(Temp2Bytes, 2) & "&")
RightByte = Val("&H" & Right$(Temp2Bytes, 2) & "&")
TempValue = ((LeftByte * 255) + RightByte) * TileSize / 16
Smile.EnemyBox(I).Top = (TempValue - Smile.EnemyBox(I).Height / 2)
Next I

EnemyClear_Offset = EnemyOffset + (I * 16) + 2
Open needslash For Binary As #1
    Get #1, EnemyClear_Offset + ROM_HEADER + 1, EnemyClear_Value
Close #1
For I = 0 To Smile.EnemyBox.UBound
    Smile.EnemyBox(I).Visible = Smile.EnemyBox(I).Enabled
Next I

End Sub



Public Sub SaveDoors(Offset As Long)
Dim DoorThisPointer As ThreeByte
Dim DoorTableOffset As Long         'offset of door pointer table
Dim NewDoorTableOffset As Long      'assuming we've moved the door pointer table, this is the new location for it
Dim DoorDataOffset As Long          'pointer to actual door data
'instead of looping for doors, I'll assume a room will never have more than 99 (a good assumption)... this will be faster than looping
Dim TempInteger(99) As Integer
Dim DoorI As Byte
Dim ThisDoor As DoorData
Dim MyHeader As mdb_Header
Dim MoveData As Boolean             'are we moving the door table?
Dim MoverInteger As Integer         'if moving the door table, this is used
Dim Temp0000 As Integer
Dim TempFFFF As Integer

Temp0000 = 0
TempFFFF = Val("&HFFFF")
'we use the old door_out value, in case we've changed the pointer
'we will save door data to the previously existing location, so that in changing the pointer, nothing else gets changed
DoorTableOffset = Val(Smile.DoorLabel.Caption)

'OPEN MYHEADER ONLY TO COMPARE OLD POINTERS TO NEW
Offset = Offset + ROM_HEADER + 1
Open needslash For Binary As #1
    Get #1, Offset, MyHeader
Close #1
DoorThisPointer.Byte1 = Val("&H" & Right$(Hex$(MyHeader.DoorOut), 2) & "&")
DoorThisPointer.Byte2 = Val("&H" & Left$(Hex$(MyHeader.DoorOut), 2) & "&")
DoorThisPointer.Byte3 = &H8F&
NewDoorTableOffset = ThreePoint2Offset(DoorThisPointer) + ROM_HEADER

'compare the two different(?) pointers
If DoorTableOffset <> NewDoorTableOffset Then
'if different, are they being read correctly?
    DD = MsgBox("You're moving the Door_Out pointer?" & vbCrLf & vbCrLf & "Would you also like to copy the data it points to to the new location?" & vbCrLf & "(Recommended, unless you'll be moving the data in a hex editor).", vbYesNo, "Also move the pointer table?")
    If DD = vbYes Then MoveData = True
End If


Open needslash For Binary As #1
'get the pointers
    Get #1, DoorTableOffset + 1, TempInteger()

'For DoorI = 0 To 99
For DoorI = 0 To 49
'if 0000-7FFF, not pointers.... 8000-FFFF are
If TempInteger(DoorI) >= 0 Then Exit For
    DoorThisPointer.Byte1 = Val("&H" & Right$(Hex$(TempInteger(DoorI)), 2) & "&")
    DoorThisPointer.Byte2 = Val("&H" & Left$(Hex$(TempInteger(DoorI)), 2) & "&")
    DoorThisPointer.Byte3 = &H83&
    DoorDataOffset = ThreePoint2Offset(DoorThisPointer)
    'save for use with load point editor
    MyDoorDataOffset(DoorI) = DoorDataOffset
    Put #1, DoorDataOffset + ROM_HEADER + 1, Doorset(DoorI)
    'since this door exists, check to see if we're moving data
    If MoveData = True Then
        'blank out existing table
        'Put #1, DoorTableOffset + (DoorI * 2) + 1, TempFFFF
        'place data at its new location
        Put #1, NewDoorTableOffset + (DoorI * 2) + 1, TempInteger(DoorI)
    End If
Next DoorI
    'if we moved data and we find an FFFF after, change it to a non-pointer
    If MoveData = True Then
        Get #1, NewDoorTableOffset + (DoorI * 2) + 1, MoverInteger
        If MoverInteger = &HFFFF Then
            Put #1, NewDoorTableOffset + (DoorI * 2) + 1, Temp0000
        Else
            If MoverInteger < 0 Then
                DD = MsgBox("At its new location, the list of doors won't end." & vbCrLf & vbCrLf & "Do you wish to place an ending value? (Will overwrite the next 2 bytes after the door pointer table)?" & vbCrLf & "Hint: If you don't know what's going on, don't do it.", vbYesNo, "Overwrite?")
                If DD = vbYes Then Put #1, NewDoorTableOffset + (DoorI * 2) + 1, Temp0000
            End If
        End If
    End If
Close #1
End Sub



Public Sub SaveEnemies()
Dim EnemyOffset As Long
Dim myFFFF As Integer
Dim LandingY As Integer
Dim LandingSlowDownY As Integer
Dim OriginalCoding As Byte

myFFFF = Val("&HFFFF")

EnemyOffset = Val("&H" & Smile.EnemyLabel.Caption & "&")
'if pointer is 0000, don't save
If EnemyOffset = 0 Then Exit Sub
'if there are no enemies, don't save them
If UBound(EnemySet) = 0 And EnemySet(0).Species = Val("&H0000&") Then Exit Sub
If UBound(EnemySet) = 0 And EnemySet(0).Species = Val("&HFFFF&") Then Exit Sub
'If UBound(EnemySet) = 0 Then Exit Sub

Open needslash For Binary As #1
    'save enemy data
    Put #1, EnemyOffset + ROM_HEADER + 1, EnemySet()
    'save FFFF after enemy data
    Put #1, , myFFFF
    'save needed to kill value
    Put #1, EnemyClear_Offset + ROM_HEADER + 1, EnemyClear_Value
Close #1

'if ship part, move landing Y and speed Y, if coding not changed
For Index2 = 0 To UBound(EnemySet)
    If EnemySet(Index2).Species = &HD07F Or EnemySet(Index2).Species = &HD0BF Then
        LandingY = EnemySet(Index2).Y - &H19
        LandingSlowDownY = LandingY / 1.5
        Open needslash For Binary As #1
            Get #1, &H112814 + ROM_HEADER + 1, OriginalCoding
            'if &HAD, the original coding is still there...
            'if &HC9, our special code... don't change...
            If OriginalCoding = &HAD Then
                Put #1, &H1128AE + ROM_HEADER + 1, LandingY
                Put #1, &H1128B3 + ROM_HEADER + 1, LandingY
                Put #1, &H112810 + ROM_HEADER + 1, LandingSlowDownY
            End If
        Close #1
    End If
Next Index2

End Sub


Public Sub ReadPLM()
Dim PLMOffset As Long
Dim PLMData As PLM6
Dim Temp2Bytes As String * 4
Dim LeftByte As Long
Dim RightByte As Long
Dim TempValue As Long

PLMOffset = Val("&H" & Smile.PLMLabel.Caption & "&") + ROM_HEADER + 1
'erase old PLM data
ReDim PLMSet(0 To 0) As PLM6

'disable extra PLM boxes
For I = 0 To Smile.PLMBox.UBound
    Smile.PLMBox(I).Enabled = False
    Smile.PLMBox(I).Visible = False
Next I
If PLMOffset = 0 Then Exit Sub

'get new PLM
For I = 0 To Smile.PLMBox.UBound
Open needslash For Binary As #1
    Get #1, PLMOffset + (I * 6), PLMData
Close #1

If Right$("0000" & Hex$(PLMData.Type), 4) = "0000" Then Exit For
ReDim Preserve PLMSet(0 To I) As PLM6
PLMSet(I) = PLMData
Smile.PLMBox(I).Enabled = True

PLMGIF = App.Path & "\files\PLM\" & Right$("0000" & Hex$(PLMSet(I).Type), 4) & ".gif"
Open PLMGIF For Binary As #1
PLMGIFSize = LOF(1)
Close #1
If PLMGIFSize = 0 Then
    Kill PLMGIF
    PLMGIF = App.Path & "\files\PLM\unknown.gif"
End If

Smile.PLMBox(I).Stretch = False
Smile.PLMBox(I).Picture = LoadPicture(PLMGIF)
Smile.PLMBox(I).Stretch = True

'figure x-axis
Smile.PLMBox(I).Left = (PLMData.X - ((Smile.PLMBox(I).Width \ 16) \ 2)) * TileSize
'figure y-axis
Smile.PLMBox(I).Top = (PLMData.Y - ((Smile.PLMBox(I).Height \ 16) \ 2)) * TileSize
Next I

For I = 0 To Smile.PLMBox.UBound
    Smile.PLMBox(I).Visible = Smile.PLMBox(I).Enabled
    Smile.PLMBox(I).Width = Smile.PLMBox(I).Width * (TileSize / 16)
    Smile.PLMBox(I).Height = Smile.PLMBox(I).Height * (TileSize / 16)

Next I
End Sub


Public Sub SavePLM()
Dim PLMOffset As Long
Dim my0000 As Integer

my0000 = 0

PLMOffset = Val("&H" & Smile.PLMLabel.Caption & "&") + 1 + ROM_HEADER
'if 0000 is the pointer to PLM, don't save
If PLMOffset = 0 Then Exit Sub
'if there are no PLM, don't save them

If UBound(PLMSet) = 0 And PLMSet(0).Type = Val("&H0000&") Then GoTo SaveEmptyPLMEntries

'placing PLM's, then end bytes
SavePLMEntries:
Open needslash For Binary As #1
    Put #1, PLMOffset, PLMSet()
    Put #1, , my0000
Close #1
Exit Sub

'no PLM's, but a valid PLM pointer, so just do the end bytes
SaveEmptyPLMEntries:
Open needslash For Binary As #1
    Put #1, PLMOffset, my0000
    'Put #1, , my0000           'why in hell did I leave this in? LOL...
Close #1
End Sub


Public Sub ShowClipGrid(X As Long, Y As Long)
Dim PicHDC As Long
Dim HalfX As Long
Dim HalfY As Long
Dim FullX As Long
Dim FullY As Long
Dim IdentifiedBTS As Boolean

PicHDC = Smile.Picture2.hdc
HalfX = X + (TileSize \ 2)
FullX = X + TileSize - 1
HalfY = Y + (TileSize \ 2)
FullY = Y + TileSize - 1

'SPEED PROBLEM!!!
Dim DrawMethod As Long
If Smile.mnuTransparentBTS.Checked = True Then
    DrawMethod = SRCPAINT
Else
    DrawMethod = SRCCOPY
End If

Dim PropertyPart As Byte
PropertyPart = Val("&H" & Left$(Right$("00" & Hex$(RoomTile(CurTile).PatternByte), 2), 1) & "&")
'bug fix for when entering sub beyond level data
If CurTile > UBound(RoomClip) Then Exit Sub


If PropertyPart <> 1 Then GoTo SlopesDone
'SLOPES
Smile.Picture2.ForeColor = vbGreen
Select Case RoomClip(CurTile)
'XXXXXXXXXXXXXXXXXXXXXXXXXXXX GREEN XXXXXXXXXXXXXXXXXXXXXXXXXXXX
'REGULAR
    'solids
    Case &H0&: DrawSquare PicHDC, X, HalfY, FullX, FullY: DrawSquare PicHDC, X + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H1&: DrawSquare PicHDC, HalfX, FullY, FullX, Y: DrawSquare PicHDC, HalfX + 1, FullY - 1, FullX - 1, Y + 1
    Case &H2&: DrawSquare PicHDC, HalfX, HalfY, FullX, FullY: DrawSquare PicHDC, HalfX + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H3&: DrawSquare PicHDC, X, FullY, HalfX, HalfY: DrawSquare PicHDC, X + 1, FullY - 1, HalfX - 1, HalfY + 1: DrawSquare PicHDC, HalfX, Y, FullX, FullY: DrawSquare PicHDC, HalfX + 1, Y + 1, FullX - 1, FullY - 1
    Case &H4&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H5&: DrawLine PicHDC, X, FullY, HalfX, HalfY - 1: DrawLine PicHDC, HalfX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H6&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    'half block
    Case &H7&: DrawSquare PicHDC, X, HalfY, FullX, FullY
    'full blocks
    Case &H8& To &HD&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    'steps
    Case &HE&: DrawSquare PicHDC, X, FullY, FullX, FullY - 4: DrawSquare PicHDC, X + 4, FullY - 4, FullX, FullY - 8: DrawSquare PicHDC, X + 8, FullY - 8, FullX, FullY - 12: DrawSquare PicHDC, X + 12, FullY - 12, FullX, FullY - 15
    'slopes
    Case &HF&: DrawLine PicHDC, X, FullY, HalfX, Y + (TileSize / 1.5): DrawLine PicHDC, HalfX, Y + (TileSize / 1.5), FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H10&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H11&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H12&: DrawLine PicHDC, X, FullY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H13&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    Case &H14&: DrawLine PicHDC, HalfX, FullY, FullX, HalfY: DrawLine PicHDC, FullX, HalfY + 1, FullX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H15&: DrawLine PicHDC, X, HalfY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, HalfY
    Case &H16&: DrawLine PicHDC, X, FullY, FullX, HalfY: DrawLine PicHDC, FullX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H17&: DrawLine PicHDC, X, HalfY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, HalfY, X, FullY
    Case &H18&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 5: DrawLine PicHDC, X, FullY, FullX, FullY - 5
    Case &H19&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 11: DrawLine PicHDC, X, FullY - 5, FullX, FullY - 10
    Case &H1A&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 16: DrawLine PicHDC, X, FullY - 10, FullX, FullY - 15
    Case &H1B&: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H1C&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H1D&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, Y
    Case &H1E&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX - 5, Y: DrawLine PicHDC, FullX - 5, Y, FullX, Y
    Case &H1F&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 15, FullY, FullX, FullY: DrawLine PicHDC, FullX - 15, FullY, FullX - 10, Y: DrawLine PicHDC, FullX - 10, Y, FullX, Y
'HORIZONTAL FLIP
    'solids
    Case &H40&: DrawSquare PicHDC, X, HalfY, FullX, FullY: DrawSquare PicHDC, X + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H41&: DrawSquare PicHDC, HalfX, FullY, X, Y: DrawSquare PicHDC, HalfX - 1, FullY - 1, X + 1, Y + 1
    Case &H42&: DrawSquare PicHDC, HalfX, HalfY, X, FullY: DrawSquare PicHDC, HalfX - 1, HalfY + 1, X + 1, FullY - 1
    Case &H43&: DrawSquare PicHDC, FullX, FullY, HalfX, HalfY: DrawSquare PicHDC, FullX - 1, FullY - 1, HalfX + 1, HalfY + 1: DrawSquare PicHDC, HalfX - 1, Y, X, FullY: DrawSquare PicHDC, HalfX - 2, Y + 1, X + 1, FullY - 1
    Case &H44&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H45&: DrawLine PicHDC, X, FullY, HalfX, HalfY - 1: DrawLine PicHDC, HalfX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H46&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    'half block
    Case &H47&: DrawSquare PicHDC, X, HalfY, FullX, FullY
    'full blocks
    Case &H48& To &H4D&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    'steps
    Case &H4E&: DrawSquare PicHDC, X, FullY, FullX, FullY - 4: DrawSquare PicHDC, X, FullY - 4, FullX - 4, FullY - 8: DrawSquare PicHDC, X, FullY - 8, FullX - 8, FullY - 12: DrawSquare PicHDC, X, FullY - 12, FullX - 12, FullY - 15
    'slopes
    Case &H4F&: DrawLine PicHDC, FullX, FullY, HalfX, Y + (TileSize / 1.5): DrawLine PicHDC, HalfX, Y + (TileSize / 1.5), X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H50&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H51&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H52&: DrawLine PicHDC, FullX, FullY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H53&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    Case &H54&: DrawLine PicHDC, HalfX, FullY, X, HalfY - 1: DrawLine PicHDC, X, HalfY, X, FullY: DrawLine PicHDC, X, FullY, X, FullY
    Case &H55&: DrawLine PicHDC, FullX, HalfY, HalfX, Y: DrawLine PicHDC, HalfX, Y, X, Y: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, FullY, X, FullY: DrawLine PicHDC, FullX, FullY, FullX, HalfY
    Case &H56&: DrawLine PicHDC, FullX, FullY, X, HalfY: DrawLine PicHDC, X, HalfY, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H57&: DrawLine PicHDC, FullX, HalfY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H58&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 5: DrawLine PicHDC, FullX, FullY, X, FullY - 5
    Case &H59&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 11: DrawLine PicHDC, FullX, FullY - 5, X, FullY - 10
    Case &H5A&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 16: DrawLine PicHDC, FullX, FullY - 10, X, FullY - 15
    Case &H5B&: DrawLine PicHDC, HalfX, FullY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, HalfX, FullY, X, FullY
    Case &H5C&: DrawLine PicHDC, FullX, FullY, HalfX, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY: DrawLine PicHDC, HalfX, Y, X, Y
    Case &H5D&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 5, FullY, X, FullY: DrawLine PicHDC, X + 5, FullY, X, Y
    Case &H5E&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 10, FullY, X, FullY: DrawLine PicHDC, X + 10, FullY, X + 5, Y: DrawLine PicHDC, X + 5, Y, X, Y
    Case &H5F&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 15, FullY, X, FullY: DrawLine PicHDC, X + 15, FullY, X + 10, Y: DrawLine PicHDC, X + 10, Y, X, Y
'VERTICAL FLIP
    'solids
    Case &H80&: DrawSquare PicHDC, X, HalfY, FullX, Y: DrawSquare PicHDC, X + 1, HalfY - 1, FullX - 1, Y + 1
    Case &H81&: DrawSquare PicHDC, HalfX, Y, FullX, FullY: DrawSquare PicHDC, HalfX + 1, Y + 1, FullX - 1, FullY - 1
    Case &H82&: DrawSquare PicHDC, HalfX, HalfY, FullX, Y: DrawSquare PicHDC, HalfX + 1, HalfY - 1, FullX - 1, Y + 1
    Case &H83&: DrawSquare PicHDC, X, Y, HalfX, HalfY: DrawSquare PicHDC, X + 1, Y + 1, HalfX - 1, HalfY - 1: DrawSquare PicHDC, HalfX, FullY, FullX, Y: DrawSquare PicHDC, HalfX + 1, FullY - 1, FullX - 1, Y + 1
    Case &H84&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H85&: DrawLine PicHDC, X, Y, HalfX, HalfY: DrawLine PicHDC, HalfX, HalfY - 1, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H86&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    'half block
    Case &H87&: DrawSquare PicHDC, X, HalfY, FullX, Y
    'full blocks
    Case &H88& To &H8D&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    'steps
    Case &H8E&: DrawSquare PicHDC, X, Y, FullX, Y + 4: DrawSquare PicHDC, X + 4, Y + 4, FullX, Y + 8: DrawSquare PicHDC, X + 8, Y + 8, FullX, Y + 12: DrawSquare PicHDC, X + 12, Y + 12, FullX, Y + 15
    'slopes
    Case &H8F&: DrawLine PicHDC, X, Y, HalfX, Y + (TileSize / 3): DrawLine PicHDC, HalfX, Y + (TileSize / 3), FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H90&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H91&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H92&: DrawLine PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, Y, FullX, Y
    Case &H93&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    Case &H94&: DrawLine PicHDC, HalfX, Y, FullX, HalfY - 1: DrawLine PicHDC, FullX, HalfY - 1, FullX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H95&: DrawLine PicHDC, X, HalfY, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, HalfY
    Case &H96&: DrawLine PicHDC, X, Y, FullX, HalfY: DrawLine PicHDC, FullX, HalfY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H97&: DrawLine PicHDC, X, HalfY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H98&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 5: DrawLine PicHDC, X, Y, FullX, Y + 5
    Case &H99&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 11: DrawLine PicHDC, X, Y + 5, FullX, Y + 10
    Case &H9A&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 16: DrawLine PicHDC, X, Y + 10, FullX, Y + 15
    Case &H9B&: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H9C&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H9D&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 5, Y, FullX, Y: DrawLine PicHDC, FullX - 5, Y, FullX, FullY
    Case &H9E&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 10, Y, FullX, Y: DrawLine PicHDC, FullX - 10, Y, FullX - 5, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, FullY
    Case &H9F&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 15, Y, FullX, Y: DrawLine PicHDC, FullX - 15, Y, FullX - 10, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX, FullY
'HORIZONTAL AND VERTICAL FLIP
    'solids
    Case &HC0&: DrawSquare PicHDC, FullX, HalfY, X, Y: DrawSquare PicHDC, FullX - 1, HalfY - 1, X + 1, Y + 1
    Case &HC1&: DrawSquare PicHDC, HalfX, Y, X, FullY: DrawSquare PicHDC, HalfX - 1, Y + 1, X + 1, FullY - 1
    Case &HC2&: DrawSquare PicHDC, HalfX, HalfY, X, Y: DrawSquare PicHDC, HalfX - 1, HalfY - 1, X + 1, Y + 1
    Case &HC3&: DrawSquare PicHDC, FullX, Y, HalfX, HalfY: DrawSquare PicHDC, FullX - 1, Y + 1, HalfX + 1, HalfY - 1: DrawSquare PicHDC, HalfX, FullY, X, Y: DrawSquare PicHDC, HalfX - 1, FullY - 1, X + 1, Y + 1
    Case &HC4&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &HC5&: DrawLine PicHDC, X, Y, HalfX, HalfY: DrawLine PicHDC, HalfX - 1, HalfY - 1, FullX - 1, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HC6&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    'half block
    Case &HC7&: DrawSquare PicHDC, X, HalfY, FullX, Y
    'full blocks
    Case &HC8& To &HCD&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    'steps
    Case &HCE&: DrawSquare PicHDC, X, Y, FullX, Y + 4: DrawSquare PicHDC, X, Y + 4, FullX - 4, Y + 8: DrawSquare PicHDC, X, Y + 8, FullX - 8, Y + 12: DrawSquare PicHDC, X, Y + 12, FullX - 12, Y + 15
    'slopes
    Case &HCF&: DrawLine PicHDC, FullX, Y, HalfX, Y + (TileSize / 3): DrawLine PicHDC, HalfX, Y + (TileSize / 3), X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD0&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &HD1&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &HD2&: DrawLine PicHDC, FullX, Y, X, FullY: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD3&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    Case &HD4&: DrawLine PicHDC, HalfX, Y, X, HalfY: DrawLine PicHDC, X, HalfY, X, Y: DrawLine PicHDC, HalfX, Y, X, Y
    Case &HD5&: DrawLine PicHDC, FullX, HalfY, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, X, FullY: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, Y, X, Y: DrawLine PicHDC, FullX, Y, FullX, HalfY
    Case &HD6&: DrawLine PicHDC, FullX, Y, X, HalfY: DrawLine PicHDC, X, HalfY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD7&: DrawLine PicHDC, FullX, HalfY, X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD8&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 5: DrawLine PicHDC, FullX, Y, X, Y + 5
    Case &HD9&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 11: DrawLine PicHDC, FullX, Y + 5, X, Y + 10
    Case &HDA&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 16: DrawLine PicHDC, FullX, Y + 10, X, Y + 15
    Case &HDB&: DrawLine PicHDC, HalfX, Y, X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, HalfX, Y, X, Y
    Case &HDC&: DrawLine PicHDC, FullX, Y, HalfX, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y: DrawLine PicHDC, HalfX, FullY, X, FullY
    Case &HDD&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 5, Y, X, Y: DrawLine PicHDC, X + 5, Y, X, FullY
    Case &HDE&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 10, Y, X, Y: DrawLine PicHDC, X + 10, Y, X + 5, FullY: DrawLine PicHDC, X + 5, FullY, X, FullY
    Case &HDF&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 15, Y, X, Y: DrawLine PicHDC, X + 15, Y, X + 10, FullY: DrawLine PicHDC, X + 10, FullY, X, FullY
End Select

Smile.Picture2.ForeColor = vbYellow
Select Case RoomClip(CurTile)
'XXXXXXXXXXXXXXXXXXXXXXXXXXXX YELLOW XXXXXXXXXXXXXXXXXXXXXXXXXXXX
'REGULAR
    'solids
    Case &H20&: DrawSquare PicHDC, X, HalfY, FullX, FullY: DrawSquare PicHDC, X + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H21&: DrawSquare PicHDC, HalfX, FullY, FullX, Y: DrawSquare PicHDC, HalfX + 1, FullY - 1, FullX - 1, Y + 1
    Case &H22&: DrawSquare PicHDC, HalfX, HalfY, FullX, FullY: DrawSquare PicHDC, HalfX + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H23&: DrawSquare PicHDC, X, FullY, HalfX, HalfY: DrawSquare PicHDC, X + 1, FullY - 1, HalfX - 1, HalfY + 1: DrawSquare PicHDC, HalfX, Y, FullX, FullY: DrawSquare PicHDC, HalfX + 1, Y + 1, FullX - 1, FullY - 1
    Case &H24&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H25&: DrawLine PicHDC, X, FullY, HalfX, HalfY - 1: DrawLine PicHDC, HalfX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H26&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    'half block
    Case &H27&: DrawSquare PicHDC, X, HalfY, FullX, FullY
    'full blocks
    Case &H28& To &H2D&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 1, FullX, Y + 1
    'steps
    Case &H2E&: DrawSquare PicHDC, X, FullY, FullX, FullY - 4: DrawSquare PicHDC, X + 4, FullY - 4, FullX, FullY - 8: DrawSquare PicHDC, X + 8, FullY - 8, FullX, FullY - 12: DrawSquare PicHDC, X + 12, FullY - 12, FullX, FullY - 15
    'slopes
    Case &H2F&: DrawLine PicHDC, X, FullY, HalfX, Y + (TileSize / 1.5): DrawLine PicHDC, HalfX, Y + (TileSize / 1.5), FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H30&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H31&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H32&: DrawLine PicHDC, X, FullY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H33&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 1, FullX, Y + 1
    Case &H34&: DrawLine PicHDC, HalfX, FullY, FullX, HalfY: DrawLine PicHDC, FullX, HalfY + 1, FullX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H35&: DrawLine PicHDC, X, HalfY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, HalfY
    Case &H36&: DrawLine PicHDC, X, FullY, FullX, HalfY: DrawLine PicHDC, FullX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H37&: DrawLine PicHDC, X, HalfY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, HalfY, X, FullY
    Case &H38&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 5: DrawLine PicHDC, X, FullY, FullX, FullY - 5
    Case &H39&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 11: DrawLine PicHDC, X, FullY - 5, FullX, FullY - 10
    Case &H3A&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 16: DrawLine PicHDC, X, FullY - 10, FullX, FullY - 15
    Case &H3B&: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H3C&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H3D&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, Y
    Case &H3E&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX - 5, Y: DrawLine PicHDC, FullX - 5, Y, FullX, Y
    Case &H3F&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 15, FullY, FullX, FullY: DrawLine PicHDC, FullX - 15, FullY, FullX - 10, Y: DrawLine PicHDC, FullX - 10, Y, FullX, Y
'HORIZONTAL FLIP
    'solids
    Case &H60&: DrawSquare PicHDC, X, HalfY, FullX, FullY: DrawSquare PicHDC, X + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H61&: DrawSquare PicHDC, HalfX, FullY, X, Y: DrawSquare PicHDC, HalfX - 1, FullY - 1, X + 1, Y + 1
    Case &H62&: DrawSquare PicHDC, HalfX, HalfY, X, FullY: DrawSquare PicHDC, HalfX - 1, HalfY + 1, X + 1, FullY - 1
    Case &H63&: DrawSquare PicHDC, FullX, FullY, HalfX, HalfY: DrawSquare PicHDC, FullX - 1, FullY - 1, HalfX + 1, HalfY + 1: DrawSquare PicHDC, HalfX - 1, Y, X, FullY: DrawSquare PicHDC, HalfX - 2, Y + 1, X + 1, FullY - 1
    Case &H64&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H65&: DrawLine PicHDC, X, FullY, HalfX, HalfY - 1: DrawLine PicHDC, HalfX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H66&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    'half block
    Case &H67&: DrawSquare PicHDC, X, HalfY, FullX, FullY
    'full blocks
    Case &H68& To &H6D&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 1, FullX, Y + 1
    'steps
    Case &H6E&: DrawSquare PicHDC, X, FullY, FullX, FullY - 4: DrawSquare PicHDC, X, FullY - 4, FullX - 4, FullY - 8: DrawSquare PicHDC, X, FullY - 8, FullX - 8, FullY - 12: DrawSquare PicHDC, X, FullY - 12, FullX - 12, FullY - 15
    'slopes
    Case &H6F&: DrawLine PicHDC, FullX, FullY, HalfX, Y + (TileSize / 1.5): DrawLine PicHDC, HalfX, Y + (TileSize / 1.5), X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H70&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H71&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H72&: DrawLine PicHDC, FullX, FullY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H73&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 1, FullX, Y + 1
    Case &H74&: DrawLine PicHDC, HalfX, FullY, X, HalfY - 1: DrawLine PicHDC, X, HalfY, X, FullY: DrawLine PicHDC, X, FullY, X, FullY
    Case &H75&: DrawLine PicHDC, FullX, HalfY, HalfX, Y: DrawLine PicHDC, HalfX, Y, X, Y: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, FullY, X, FullY: DrawLine PicHDC, FullX, FullY, FullX, HalfY
    Case &H76&: DrawLine PicHDC, FullX, FullY, X, HalfY: DrawLine PicHDC, X, HalfY, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H77&: DrawLine PicHDC, FullX, HalfY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H78&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 5: DrawLine PicHDC, FullX, FullY, X, FullY - 5
    Case &H79&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 11: DrawLine PicHDC, FullX, FullY - 5, X, FullY - 10
    Case &H7A&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 16: DrawLine PicHDC, FullX, FullY - 10, X, FullY - 15
    Case &H7B&: DrawLine PicHDC, HalfX, FullY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, HalfX, FullY, X, FullY
    Case &H7C&: DrawLine PicHDC, FullX, FullY, HalfX, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY: DrawLine PicHDC, HalfX, Y, X, Y
    Case &H7D&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 5, FullY, X, FullY: DrawLine PicHDC, X + 5, FullY, X, Y
    Case &H7E&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 10, FullY, X, FullY: DrawLine PicHDC, X + 10, FullY, X + 5, Y: DrawLine PicHDC, X + 5, Y, X, Y
    Case &H7F&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 15, FullY, X, FullY: DrawLine PicHDC, X + 15, FullY, X + 10, Y: DrawLine PicHDC, X + 10, Y, X, Y
'VERTICAL FLIP
    'solids
    Case &HA0&: DrawSquare PicHDC, X, HalfY, FullX, Y: DrawSquare PicHDC, X + 1, HalfY - 1, FullX - 1, Y + 1
    Case &HA1&: DrawSquare PicHDC, HalfX, Y, FullX, FullY: DrawSquare PicHDC, HalfX + 1, Y + 1, FullX - 1, FullY - 1
    Case &HA2&: DrawSquare PicHDC, HalfX, HalfY, FullX, Y: DrawSquare PicHDC, HalfX + 1, HalfY - 1, FullX - 1, Y + 1
    Case &HA3&: DrawSquare PicHDC, X, Y, HalfX, HalfY: DrawSquare PicHDC, X + 1, Y + 1, HalfX - 1, HalfY - 1: DrawSquare PicHDC, HalfX, FullY, FullX, Y: DrawSquare PicHDC, HalfX + 1, FullY - 1, FullX - 1, Y + 1
    Case &HA4&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &HA5&: DrawLine PicHDC, X, Y, HalfX, HalfY: DrawLine PicHDC, HalfX, HalfY - 1, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HA6&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    'half block
    Case &HA7&: DrawSquare PicHDC, X, HalfY, FullX, Y
    'full blocks
    Case &HA8& To &HAD&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 1, FullX, FullY - 1
    'steps
    Case &HAE&: DrawSquare PicHDC, X, Y, FullX, Y + 4: DrawSquare PicHDC, X + 4, Y + 4, FullX, Y + 8: DrawSquare PicHDC, X + 8, Y + 8, FullX, Y + 12: DrawSquare PicHDC, X + 12, Y + 12, FullX, Y + 15
    'slopes
    Case &HAF&: DrawLine PicHDC, X, Y, HalfX, Y + (TileSize / 3): DrawLine PicHDC, HalfX, Y + (TileSize / 3), FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HB0&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &HB1&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &HB2&: DrawLine PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, Y, FullX, Y
    Case &HB3&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 1, FullX, FullY - 1
    Case &HB4&: DrawLine PicHDC, HalfX, Y, FullX, HalfY - 1: DrawLine PicHDC, FullX, HalfY - 1, FullX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &HB5&: DrawLine PicHDC, X, HalfY, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, HalfY
    Case &HB6&: DrawLine PicHDC, X, Y, FullX, HalfY: DrawLine PicHDC, FullX, HalfY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HB7&: DrawLine PicHDC, X, HalfY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HB8&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 5: DrawLine PicHDC, X, Y, FullX, Y + 5
    Case &HB9&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 11: DrawLine PicHDC, X, Y + 5, FullX, Y + 10
    Case &HBA&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 16: DrawLine PicHDC, X, Y + 10, FullX, Y + 15
    Case &HBB&: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &HBC&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &HBD&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 5, Y, FullX, Y: DrawLine PicHDC, FullX - 5, Y, FullX, FullY
    Case &HBE&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 10, Y, FullX, Y: DrawLine PicHDC, FullX - 10, Y, FullX - 5, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, FullY
    Case &HBF&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 15, Y, FullX, Y: DrawLine PicHDC, FullX - 15, Y, FullX - 10, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX, FullY
'HORIZONTAL AND VERTICAL FLIP
    'solids
    Case &HE0&: DrawSquare PicHDC, FullX, HalfY, X, Y: DrawSquare PicHDC, FullX - 1, HalfY - 1, X + 1, Y + 1
    Case &HE1&: DrawSquare PicHDC, HalfX, Y, X, FullY: DrawSquare PicHDC, HalfX - 1, Y + 1, X + 1, FullY - 1
    Case &HE2&: DrawSquare PicHDC, HalfX, HalfY, X, Y: DrawSquare PicHDC, HalfX - 1, HalfY - 1, X + 1, Y + 1
    Case &HE3&: DrawSquare PicHDC, FullX, Y, HalfX, HalfY: DrawSquare PicHDC, FullX - 1, Y + 1, HalfX + 1, HalfY - 1: DrawSquare PicHDC, HalfX, FullY, X, Y: DrawSquare PicHDC, HalfX - 1, FullY - 1, X + 1, Y + 1
    Case &HE4&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &HE5&: DrawLine PicHDC, X, Y, HalfX, HalfY: DrawLine PicHDC, HalfX - 1, HalfY - 1, FullX - 1, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HE6&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    'half block
    Case &HE7&: DrawSquare PicHDC, X, HalfY, FullX, Y
    'full blocks
    Case &HE8& To &HED&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 1, FullX, FullY - 1
    'steps
    Case &HEE&: DrawSquare PicHDC, X, Y, FullX, Y + 4: DrawSquare PicHDC, X, Y + 4, FullX - 4, Y + 8: DrawSquare PicHDC, X, Y + 8, FullX - 8, Y + 12: DrawSquare PicHDC, X, Y + 12, FullX - 12, Y + 15
    'slopes
    Case &HEF&: DrawLine PicHDC, FullX, Y, HalfX, Y + (TileSize / 3): DrawLine PicHDC, HalfX, Y + (TileSize / 3), X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HF0&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &HF1&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &HF2&: DrawLine PicHDC, FullX, Y, X, FullY: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, Y, X, Y
    Case &HF3&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 1, FullX, FullY - 1
    Case &HF4&: DrawLine PicHDC, HalfX, Y, X, HalfY: DrawLine PicHDC, X, HalfY, X, Y: DrawLine PicHDC, HalfX, Y, X, Y
    Case &HF5&: DrawLine PicHDC, FullX, HalfY, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, X, FullY: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, Y, X, Y: DrawLine PicHDC, FullX, Y, FullX, HalfY
    Case &HF6&: DrawLine PicHDC, FullX, Y, X, HalfY: DrawLine PicHDC, X, HalfY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HF7&: DrawLine PicHDC, FullX, HalfY, X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HF8&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 5: DrawLine PicHDC, FullX, Y, X, Y + 5
    Case &HF9&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 11: DrawLine PicHDC, FullX, Y + 5, X, Y + 10
    Case &HFA&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 16: DrawLine PicHDC, FullX, Y + 10, X, Y + 15
    Case &HFB&: DrawLine PicHDC, HalfX, Y, X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, HalfX, Y, X, Y
    Case &HFC&: DrawLine PicHDC, FullX, Y, HalfX, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y: DrawLine PicHDC, HalfX, FullY, X, FullY
    Case &HFD&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 5, Y, X, Y: DrawLine PicHDC, X + 5, Y, X, FullY
    Case &HFE&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 10, Y, X, Y: DrawLine PicHDC, X + 10, Y, X + 5, FullY: DrawLine PicHDC, X + 5, FullY, X, FullY
    Case &HFF&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 15, Y, X, Y: DrawLine PicHDC, X + 15, Y, X + 10, FullY: DrawLine PicHDC, X + 10, FullY, X, FullY
End Select


SlopesDone:
'grey square around door tiles
If PropertyPart = 9 Then
    Smile.Picture2.ForeColor = DOORBOXHIGH
        DrawSquare PicHDC, X, Y, FullX, Y + 1
        DrawSquare PicHDC, X, Y, X + 1, FullY
    Smile.Picture2.ForeColor = DOORBOXLOW
        DrawSquare PicHDC, X, FullY - 1, FullX, FullY
        DrawSquare PicHDC, FullX - 1, Y + 1, FullX, FullY
End If

'used to create blocks larger than 1x1
If RoomClip(CurTile) = Val("&HFF&") Then Smile.Picture2.Circle (HalfX, HalfY), TileSize \ 16, vbGreen

'SPECIAL BLOCKS
'main blocks
If PropertyPart = &HC& And RoomClip(CurTile) = &H0& Then XThrough X, Y, True   'shoot, returning
If PropertyPart = &HC& And RoomClip(CurTile) = &H4& Then XThrough X, Y    'shoot, non-returning
If PropertyPart = &HC& And RoomClip(CurTile) = &H8& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 1 * 16, 0, 16, 16, DrawMethod: XThrough X, Y, True: IdentifiedBTS = True   'pb, returning
If PropertyPart = &HC& And RoomClip(CurTile) = &H9& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 1 * 16, 0, 16, 16, DrawMethod: XThrough X, Y: IdentifiedBTS = True   'pb, permanently gone
If PropertyPart = &HC& And RoomClip(CurTile) = &HA& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 0 * 16, 0, 16, 16, DrawMethod: XThrough X, Y, True: IdentifiedBTS = True   'sm, returning
If PropertyPart = &HC& And RoomClip(CurTile) = &HB& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 0 * 16, 0, 16, 16, DrawMethod: XThrough X, Y: IdentifiedBTS = True   'sm, permanently gone
If PropertyPart = &HB& And RoomClip(CurTile) = &H0& Then XThrough X, Y, True   'crumble, returning
If PropertyPart = &HB& And RoomClip(CurTile) = &H4& Then XThrough X, Y    'crumble, non-returning
If PropertyPart = &HB& And RoomClip(CurTile) = &HE& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 2 * 16, 0, 16, 16, DrawMethod: XThrough X, Y, True: IdentifiedBTS = True   'speed, returning
If PropertyPart = &HB& And RoomClip(CurTile) = &HF& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 2 * 16, 0, 16, 16, DrawMethod: XThrough X, Y: IdentifiedBTS = True   'speed, permanently gone
If PropertyPart = &HE& And RoomClip(CurTile) = &H1& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 3 * 16, 0, 16, 16, DrawMethod: XThrough X, Y, True: IdentifiedBTS = True   'crumble grapple, returning
If PropertyPart = &HE& And RoomClip(CurTile) = &H2& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 3 * 16, 0, 16, 16, DrawMethod: XThrough X, Y: IdentifiedBTS = True   'crumble grapple, permanently gone
If PropertyPart = &HF& And RoomClip(CurTile) = &H0& Then XThrough X, Y, True   'bomb block, returning
If PropertyPart = &HF& And RoomClip(CurTile) = &H4& Then XThrough X, Y    'bomb block, permanently gone
'left and right
If PropertyPart = &H3& And RoomClip(CurTile) = &H8& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 4 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
If PropertyPart = &H3& And RoomClip(CurTile) = &H9& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 5 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
'multiple downs
If PropertyPart = &H3& And RoomClip(CurTile) = &H81& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 6 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
If PropertyPart = &H3& And RoomClip(CurTile) = &H82& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 6 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
If PropertyPart = &H3& And RoomClip(CurTile) = &H83& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 6 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
If PropertyPart = &H3& And RoomClip(CurTile) = &H85& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 6 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
'grinder block
If PropertyPart = &HA& And RoomClip(CurTile) = &HF& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 7 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True
'barrier block
If PropertyPart = &HB& And RoomClip(CurTile) = &HB& Then StretchBlt Smile.Picture2.hdc, X, Y, TileSize, TileSize, Smile.Special1.hdc, 8 * 16, 0, 16, 16, DrawMethod: IdentifiedBTS = True

If IdentifiedBTS = False And RoomClip(CurTile) <> 0 And PropertyPart <> 1 Then
    Smile.Picture2.ForeColor = vbBlack
    Smile.Picture2.FontBold = True
    'XXXXXXXXXX
    Smile.Picture2.FontSize = (TileSize \ 2) - 1
    Smile.Picture2.CurrentX = X + 2
    Smile.Picture2.CurrentY = Y + 2
    Smile.Picture2.Print Right$("00" & Hex$(RoomClip(CurTile)), 2)
    Smile.Picture2.ForeColor = vbRed
    Smile.Picture2.CurrentX = X + 1
    Smile.Picture2.CurrentY = Y + 1
    Smile.Picture2.Print Right$("00" & Hex$(RoomClip(CurTile)), 2)
End If
End Sub


Public Sub ShowClipGrid2x2(X As Long, Y As Long)
'for use on tiles that have bts set to values that will create tiles larger than 1x1
'kill slopes
Dim PropertyPart As Byte
PropertyPart = Val("&H" & Left$(Right$("00" & Hex$(RoomTile(CurTile).PatternByte), 2), 1) & "&")

If PropertyPart = 1 Then Exit Sub

'only need if drawing actual graphics'
Dim DrawMethod As Long
If Smile.mnuTransparentBTS.Checked = True Then
    DrawMethod = SRCPAINT
Else
    DrawMethod = SRCCOPY
End If

''''''''''''''''''''''''''''''''''''''
'bug fix for when entering sub beyond level data
If CurTile > UBound(RoomClip) Then Exit Sub

'Smile.Picture2.DrawStyle = vbDot
'If PropertyPart <> Val("&H01&") And RoomClip(CurTile) = Val("&H01&") Then XThrough X, Y, True, 2, 1 '2x1 horizontal on anything not a slope
If PropertyPart = Val("&H09&") Then Exit Sub   'don't draw on door tiles
Select Case RoomClip(CurTile)
    Case Val("&H01&"): XThrough X, Y, True, 2, 1    '2x1 horizontal
    Case Val("&H02&"): XThrough X, Y, True, 1, 2    '1x2 vertical
    Case Val("&H03&"): XThrough X, Y, True, 2, 2    '2x2 horizontal/vertical
    Case Val("&H05&"): XThrough X, Y, , 2, 1   '2x1 horizontal
    Case Val("&H06&"): XThrough X, Y, , 1, 2   '1x2 vertical
    Case Val("&H07&"): XThrough X, Y, , 2, 2   '2x2 horizontal/vertical
End Select
Smile.Picture2.DrawStyle = vbSolid


End Sub



Public Sub ShowSlopePreview(X As Long, Y As Long, SlopeValue As Byte)
Dim PicHDC As Long
Dim HalfX As Long
Dim HalfY As Long
Dim FullX As Long
Dim FullY As Long

PicHDC = Smile.Slopes1.hdc
'HalfX = X + (TileSize \ 2)
'FullX = X + TileSize - 1
'HalfY = Y + (TileSize \ 2)
'FullY = Y + TileSize - 1
HalfX = X + (16 \ 2)
FullX = X + 16 - 1
HalfY = Y + (16 \ 2)
FullY = Y + 16 - 1


'WHEN UPDATING FROM SHOWCLIPGRID:
'tilesize becomes 16
'picture2 becomes slopes1
'vbgreen becomes mycolor
Dim MyColor As ColorConstants

'If x Mod 32 = y Mod 32 Then MyColor = vbRed Else MyColor = vbBlue
MyColor = vbGreen
If (SlopeValue \ Val("&H20&")) Mod 2 = 1 Then
    MyColor = vbYellow
    SlopeValue = SlopeValue - Val("&H20&")
End If

Smile.Slopes1.ForeColor = MyColor

Select Case SlopeValue
'REGULAR
    'solids
    Case &H0&: DrawSquare PicHDC, X, HalfY, FullX, FullY: DrawSquare PicHDC, X + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H1&: DrawSquare PicHDC, HalfX, FullY, FullX, Y: DrawSquare PicHDC, HalfX + 1, FullY - 1, FullX - 1, Y + 1
    Case &H2&: DrawSquare PicHDC, HalfX, HalfY, FullX, FullY: DrawSquare PicHDC, HalfX + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H3&: DrawSquare PicHDC, X, FullY, HalfX, HalfY: DrawSquare PicHDC, X + 1, FullY - 1, HalfX - 1, HalfY + 1: DrawSquare PicHDC, HalfX, Y, FullX, FullY: DrawSquare PicHDC, HalfX + 1, Y + 1, FullX - 1, FullY - 1
    Case &H4&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H5&: DrawLine PicHDC, X, FullY, HalfX, HalfY - 1: DrawLine PicHDC, HalfX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H6&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    'half block
    Case &H7&: DrawSquare PicHDC, X, HalfY, FullX, FullY
    'full blocks
    Case &H8& To &HD&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    'steps
    Case &HE&: DrawSquare PicHDC, X, FullY, FullX, FullY - 4: DrawSquare PicHDC, X + 4, FullY - 4, FullX, FullY - 8: DrawSquare PicHDC, X + 8, FullY - 8, FullX, FullY - 12: DrawSquare PicHDC, X + 12, FullY - 12, FullX, FullY - 15
    'slopes
    Case &HF&: DrawLine PicHDC, X, FullY, HalfX, Y + (TileSize / 1.5): DrawLine PicHDC, HalfX, Y + (TileSize / 1.5), FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H10&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H11&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H12&: DrawLine PicHDC, X, FullY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H13&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    Case &H14&: DrawLine PicHDC, HalfX, FullY, FullX, HalfY: DrawLine PicHDC, FullX, HalfY + 1, FullX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H15&: DrawLine PicHDC, X, HalfY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, HalfY
    Case &H16&: DrawLine PicHDC, X, FullY, FullX, HalfY: DrawLine PicHDC, FullX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H17&: DrawLine PicHDC, X, HalfY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, HalfY, X, FullY
    Case &H18&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 5: DrawLine PicHDC, X, FullY, FullX, FullY - 5
    Case &H19&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 11: DrawLine PicHDC, X, FullY - 5, FullX, FullY - 10
    Case &H1A&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, FullY - 16: DrawLine PicHDC, X, FullY - 10, FullX, FullY - 15
    Case &H1B&: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H1C&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H1D&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, Y
    Case &H1E&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX - 5, Y: DrawLine PicHDC, FullX - 5, Y, FullX, Y
    Case &H1F&: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, FullX - 15, FullY, FullX, FullY: DrawLine PicHDC, FullX - 15, FullY, FullX - 10, Y: DrawLine PicHDC, FullX - 10, Y, FullX, Y
'HORIZONTAL FLIP
    'solids
    Case &H40&: DrawSquare PicHDC, X, HalfY, FullX, FullY: DrawSquare PicHDC, X + 1, HalfY + 1, FullX - 1, FullY - 1
    Case &H41&: DrawSquare PicHDC, HalfX, FullY, X, Y: DrawSquare PicHDC, HalfX - 1, FullY - 1, X + 1, Y + 1
    Case &H42&: DrawSquare PicHDC, HalfX, HalfY, X, FullY: DrawSquare PicHDC, HalfX - 1, HalfY + 1, X + 1, FullY - 1
    Case &H43&: DrawSquare PicHDC, FullX, FullY, HalfX, HalfY: DrawSquare PicHDC, FullX - 1, FullY - 1, HalfX + 1, HalfY + 1: DrawSquare PicHDC, HalfX - 1, Y, X, FullY: DrawSquare PicHDC, HalfX - 2, Y + 1, X + 1, FullY - 1
    Case &H44&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H45&: DrawLine PicHDC, X, FullY, HalfX, HalfY - 1: DrawLine PicHDC, HalfX, HalfY, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    Case &H46&: DrawLine PicHDC, X, FullY, HalfX, Y: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, X, FullY, FullX, FullY
    'half block
    Case &H47&: DrawSquare PicHDC, X, HalfY, FullX, FullY
    'full blocks
    Case &H48& To &H4D&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    'steps
    Case &H4E&: DrawSquare PicHDC, X, FullY, FullX, FullY - 4: DrawSquare PicHDC, X, FullY - 4, FullX - 4, FullY - 8: DrawSquare PicHDC, X, FullY - 8, FullX - 8, FullY - 12: DrawSquare PicHDC, X, FullY - 12, FullX - 12, FullY - 15
    'slopes
    Case &H4F&: DrawLine PicHDC, FullX, FullY, HalfX, Y + (TileSize / 1.5): DrawLine PicHDC, HalfX, Y + (TileSize / 1.5), X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H50&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H51&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H52&: DrawLine PicHDC, FullX, FullY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H53&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, Y + 2, FullX, Y + 2
    Case &H54&: DrawLine PicHDC, HalfX, FullY, X, HalfY - 1: DrawLine PicHDC, X, HalfY, X, FullY: DrawLine PicHDC, X, FullY, X, FullY
    Case &H55&: DrawLine PicHDC, FullX, HalfY, HalfX, Y: DrawLine PicHDC, HalfX, Y, X, Y: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, FullY, X, FullY: DrawLine PicHDC, FullX, FullY, FullX, HalfY
    Case &H56&: DrawLine PicHDC, FullX, FullY, X, HalfY: DrawLine PicHDC, X, HalfY, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H57&: DrawLine PicHDC, FullX, HalfY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY
    Case &H58&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 5: DrawLine PicHDC, FullX, FullY, X, FullY - 5
    Case &H59&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 11: DrawLine PicHDC, FullX, FullY - 5, X, FullY - 10
    Case &H5A&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY, X, FullY - 16: DrawLine PicHDC, FullX, FullY - 10, X, FullY - 15
    Case &H5B&: DrawLine PicHDC, HalfX, FullY, X, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, HalfX, FullY, X, FullY
    Case &H5C&: DrawLine PicHDC, FullX, FullY, HalfX, Y: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, FullY, X, FullY: DrawLine PicHDC, HalfX, Y, X, Y
    Case &H5D&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 5, FullY, X, FullY: DrawLine PicHDC, X + 5, FullY, X, Y
    Case &H5E&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 10, FullY, X, FullY: DrawLine PicHDC, X + 10, FullY, X + 5, Y: DrawLine PicHDC, X + 5, Y, X, Y
    Case &H5F&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 15, FullY, X, FullY: DrawLine PicHDC, X + 15, FullY, X + 10, Y: DrawLine PicHDC, X + 10, Y, X, Y
'VERTICAL FLIP
    'solids
    Case &H80&: DrawSquare PicHDC, X, HalfY, FullX, Y: DrawSquare PicHDC, X + 1, HalfY - 1, FullX - 1, Y + 1
    Case &H81&: DrawSquare PicHDC, HalfX, Y, FullX, FullY: DrawSquare PicHDC, HalfX + 1, Y + 1, FullX - 1, FullY - 1
    Case &H82&: DrawSquare PicHDC, HalfX, HalfY, FullX, Y: DrawSquare PicHDC, HalfX + 1, HalfY - 1, FullX - 1, Y + 1
    Case &H83&: DrawSquare PicHDC, X, Y, HalfX, HalfY: DrawSquare PicHDC, X + 1, Y + 1, HalfX - 1, HalfY - 1: DrawSquare PicHDC, HalfX, FullY, FullX, Y: DrawSquare PicHDC, HalfX + 1, FullY - 1, FullX - 1, Y + 1
    Case &H84&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &H85&: DrawLine PicHDC, X, Y, HalfX, HalfY: DrawLine PicHDC, HalfX, HalfY - 1, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H86&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    'half block
    Case &H87&: DrawSquare PicHDC, X, HalfY, FullX, Y
    'full blocks
    Case &H88& To &H8D&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    'steps
    Case &H8E&: DrawSquare PicHDC, X, Y, FullX, Y + 4: DrawSquare PicHDC, X + 4, Y + 4, FullX, Y + 8: DrawSquare PicHDC, X + 8, Y + 8, FullX, Y + 12: DrawSquare PicHDC, X + 12, Y + 12, FullX, Y + 15
    'slopes
    Case &H8F&: DrawLine PicHDC, X, Y, HalfX, Y + (TileSize / 3): DrawLine PicHDC, HalfX, Y + (TileSize / 3), FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H90&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &H91&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &H92&: DrawLine PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, Y, FullX, Y
    Case &H93&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    Case &H94&: DrawLine PicHDC, HalfX, Y, FullX, HalfY - 1: DrawLine PicHDC, FullX, HalfY - 1, FullX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H95&: DrawLine PicHDC, X, HalfY, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, FullY: DrawLine PicHDC, FullX, Y, FullX, FullY: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, HalfY
    Case &H96&: DrawLine PicHDC, X, Y, FullX, HalfY: DrawLine PicHDC, FullX, HalfY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H97&: DrawLine PicHDC, X, HalfY, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &H98&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 5: DrawLine PicHDC, X, Y, FullX, Y + 5
    Case &H99&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 11: DrawLine PicHDC, X, Y + 5, FullX, Y + 10
    Case &H9A&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, FullX, Y, FullX, Y + 16: DrawLine PicHDC, X, Y + 10, FullX, Y + 15
    Case &H9B&: DrawLine PicHDC, HalfX, Y, FullX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, HalfX, Y, FullX, Y
    Case &H9C&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, HalfX, FullY, FullX, FullY
    Case &H9D&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 5, Y, FullX, Y: DrawLine PicHDC, FullX - 5, Y, FullX, FullY
    Case &H9E&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 10, Y, FullX, Y: DrawLine PicHDC, FullX - 10, Y, FullX - 5, FullY: DrawLine PicHDC, FullX - 5, FullY, FullX, FullY
    Case &H9F&: DrawLine PicHDC, FullX, FullY, FullX, Y: DrawLine PicHDC, FullX - 15, Y, FullX, Y: DrawLine PicHDC, FullX - 15, Y, FullX - 10, FullY: DrawLine PicHDC, FullX - 10, FullY, FullX, FullY
'HORIZONTAL AND VERTICAL FLIP
    'solids
    Case &HC0&: DrawSquare PicHDC, FullX, HalfY, X, Y: DrawSquare PicHDC, FullX - 1, HalfY - 1, X + 1, Y + 1
    Case &HC1&: DrawSquare PicHDC, HalfX, Y, X, FullY: DrawSquare PicHDC, HalfX - 1, Y + 1, X + 1, FullY - 1
    Case &HC2&: DrawSquare PicHDC, HalfX, HalfY, X, Y: DrawSquare PicHDC, HalfX - 1, HalfY - 1, X + 1, Y + 1
    Case &HC3&: DrawSquare PicHDC, FullX, Y, HalfX, HalfY: DrawSquare PicHDC, FullX - 1, Y + 1, HalfX + 1, HalfY - 1: DrawSquare PicHDC, HalfX, FullY, X, Y: DrawSquare PicHDC, HalfX - 1, FullY - 1, X + 1, Y + 1
    Case &HC4&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawSquare PicHDC, X + 1, Y + 1, FullX - 1, FullY - 1
    'symmetrical peaks
    Case &HC5&: DrawLine PicHDC, X, Y, HalfX, HalfY: DrawLine PicHDC, HalfX - 1, HalfY - 1, FullX - 1, Y: DrawLine PicHDC, X, Y, FullX, Y
    Case &HC6&: DrawLine PicHDC, X, Y, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, FullX, Y: DrawLine PicHDC, X, Y, FullX, Y
    'half block
    Case &HC7&: DrawSquare PicHDC, X, HalfY, FullX, Y
    'full blocks
    Case &HC8& To &HCD&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    'steps
    Case &HCE&: DrawSquare PicHDC, X, Y, FullX, Y + 4: DrawSquare PicHDC, X, Y + 4, FullX - 4, Y + 8: DrawSquare PicHDC, X, Y + 8, FullX - 8, Y + 12: DrawSquare PicHDC, X, Y + 12, FullX - 12, Y + 15
    'slopes
    Case &HCF&: DrawLine PicHDC, FullX, Y, HalfX, Y + (TileSize / 3): DrawLine PicHDC, HalfX, Y + (TileSize / 3), X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD0&: DrawLine PicHDC, X, FullY, FullX, FullY: DrawLine PicHDC, X, FullY - 4, FullX, FullY - 4: DrawLine PicHDC, X, FullY - 8, FullX, FullY - 8: DrawLine PicHDC, X, FullY - 12, FullX, FullY - 12
    Case &HD1&: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, X + 4, Y, X + 4, FullY: DrawLine PicHDC, X + 8, Y, X + 8, FullY: DrawLine PicHDC, X + 12, Y, X + 12, FullY
    Case &HD2&: DrawLine PicHDC, FullX, Y, X, FullY: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD3&: DrawSquare PicHDC, X, Y, FullX, FullY: DrawLine PicHDC, X, FullY - 2, FullX, FullY - 2
    Case &HD4&: DrawLine PicHDC, HalfX, Y, X, HalfY: DrawLine PicHDC, X, HalfY, X, Y: DrawLine PicHDC, HalfX, Y, X, Y
    Case &HD5&: DrawLine PicHDC, FullX, HalfY, HalfX, FullY: DrawLine PicHDC, HalfX, FullY, X, FullY: DrawLine PicHDC, X, Y, X, FullY: DrawLine PicHDC, FullX, Y, X, Y: DrawLine PicHDC, FullX, Y, FullX, HalfY
    Case &HD6&: DrawLine PicHDC, FullX, Y, X, HalfY: DrawLine PicHDC, X, HalfY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD7&: DrawLine PicHDC, FullX, HalfY, X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y
    Case &HD8&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 5: DrawLine PicHDC, FullX, Y, X, Y + 5
    Case &HD9&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 11: DrawLine PicHDC, FullX, Y + 5, X, Y + 10
    Case &HDA&: DrawLine PicHDC, X, Y, FullX, Y: DrawLine PicHDC, X, Y, X, Y + 16: DrawLine PicHDC, FullX, Y + 10, X, Y + 15
    Case &HDB&: DrawLine PicHDC, HalfX, Y, X, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, HalfX, Y, X, Y
    Case &HDC&: DrawLine PicHDC, FullX, Y, HalfX, FullY: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, FullX, Y, X, Y: DrawLine PicHDC, HalfX, FullY, X, FullY
    Case &HDD&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 5, Y, X, Y: DrawLine PicHDC, X + 5, Y, X, FullY
    Case &HDE&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 10, Y, X, Y: DrawLine PicHDC, X + 10, Y, X + 5, FullY: DrawLine PicHDC, X + 5, FullY, X, FullY
    Case &HDF&: DrawLine PicHDC, X, FullY, X, Y: DrawLine PicHDC, X + 15, Y, X, Y: DrawLine PicHDC, X + 15, Y, X + 10, FullY: DrawLine PicHDC, X + 10, FullY, X, FullY

    'unknown
    Case Else: Smile.Slopes1.Circle (X + 8, Y + 8), 7, vbRed ': MsgBox Hex$(RoomClip(CurTile))
End Select

End Sub


Public Sub DrawBTSMenu(Flip As Byte)
Dim XX As Long
Dim YY As Long
Dim III As Byte

Smile.Slopes1.Cls
XX = 0
YY = 0
For III = 0 To 63
If XX >= 8 * 16 Then XX = 0: YY = YY + 16
    ShowSlopePreview XX, YY, Flip + III
    XX = XX + 16
Next III

End Sub



Public Sub RefreshEnemy(Index As Integer)
EnemyGIF = App.Path & "\files\enemies\" & Right$("0000" & Hex$(EnemySet(Index).Species), 4) & ".gif"
Open EnemyGIF For Binary As #1
EnemyGIFSize = LOF(1)
Close #1
If EnemyGIFSize = 0 Then Kill EnemyGIF: EnemyGIF = App.Path & "\files\enemies\unknown.gif"
Smile.EnemyBox(Index).Stretch = False
Smile.EnemyBox(Index).Picture = LoadPicture(EnemyGIF)
Smile.EnemyBox(Index).Stretch = True

    Smile.EnemyBox(Index).Width = Smile.EnemyBox(Index).Width * (TileSize \ 16)
    Smile.EnemyBox(Index).Height = Smile.EnemyBox(Index).Height * (TileSize \ 16)

End Sub


Public Sub RefreshPLM(Index As Integer)
PLMGIF = App.Path & "\files\PLM\" & Right$("0000" & Hex$(PLMSet(Index).Type), 4) & ".gif"
Open PLMGIF For Binary As #1
PLMGIFSize = LOF(1)
Close #1
If PLMGIFSize = 0 Then Kill PLMGIF: PLMGIF = App.Path & "\files\PLM\unknown.gif"
Smile.PLMBox(Index).Stretch = False
Smile.PLMBox(Index).Picture = LoadPicture(PLMGIF)
Smile.PLMBox(Index).Stretch = True


    Smile.PLMBox(Index).Width = Smile.PLMBox(Index).Width * (TileSize \ 16)
    Smile.PLMBox(Index).Height = Smile.PLMBox(Index).Height * (TileSize \ 16)

End Sub

Public Function ThreePoint2Offset(Pointer As ThreeByte) As Long
If Pointer.Byte3 >= Val("&H80&") Then Pointer.Byte3 = Pointer.Byte3 - Val("&H80&")
ThreePoint2Offset = Val("&H" & InHex(Val(Pointer.Byte2), 2) & InHex(Val(Pointer.Byte1), 2) & "&")
If ThreePoint2Offset < Val("&H8000&") Then ThreePoint2Offset = ThreePoint2Offset + Val("&H8000&")
ThreePoint2Offset = ThreePoint2Offset + (Pointer.Byte3 * Val("&H8000&")) - Val("&H8000&")
End Function





Public Function InHex(Value, Length) As String
InHex = Right$("0000000000" & Hex$(Value), Length)
End Function

Public Sub OpenRoom(Offset As Long, Optional MyTestCode As String = "E5E6", Optional MyTestCodeNum As Byte = 1)
If needslash = "" Then Exit Sub
Dim FoundCode As Boolean
Dim MyHeader As mdb_Header
'Dim MyState As mdb_RoomState
Dim TempThree As ThreeByte
Dim TestCode As Integer
Dim TestLength As Byte
Dim TempByte(1) As Byte
Dim TempTestLength As Byte
Dim TestCodeMatch(0 To 9) As Byte
Dim TestCodeIndex As Byte
Dim TestCodeValue As Byte
Dim TempASMByte As Byte
Dim TempBoolean As Boolean

Offset = Offset + ROM_HEADER + 1
Smile.TestCodeList1.Clear
Open needslash For Binary As #1
    Get #1, Offset, MyHeader

    Offset = Offset + 11    'after header
    Do
        Get #1, Offset + TempTestLength, TestCode
            Select Case Hex$(TestCode)
                Case "E5E6": TestLength = 2: TestCodeMatch(0) = TestCodeMatch(0) + 1: TestCodeIndex = 0
                Case "E5EB": TestLength = 6: TestCodeMatch(1) = TestCodeMatch(1) + 1: TestCodeIndex = 1
                Case "E5FF": TestLength = 4: TestCodeMatch(2) = TestCodeMatch(2) + 1: TestCodeIndex = 2
                Case "E612": TestLength = 5: TestCodeMatch(3) = TestCodeMatch(3) + 1: TestCodeIndex = 3
                Case "E629": TestLength = 5: TestCodeMatch(4) = TestCodeMatch(4) + 1: TestCodeIndex = 4
                Case "E640": TestLength = 4: TestCodeMatch(5) = TestCodeMatch(5) + 1: TestCodeIndex = 5
                Case "E652": TestLength = 4: TestCodeMatch(6) = TestCodeMatch(6) + 1: TestCodeIndex = 6
                Case "E669": TestLength = 4: TestCodeMatch(7) = TestCodeMatch(7) + 1: TestCodeIndex = 7
                Case "E678": TestLength = 4: TestCodeMatch(8) = TestCodeMatch(8) + 1: TestCodeIndex = 8
                Case Else: MsgBox "TestCode = " & Hex$(TestCode): Close #1: Exit Sub
            End Select
                                    
            Smile.TestCodeList1.AddItem Hex$(TestCode) & CodeDescription(Hex$(TestCode)) & " " & TestCodeMatch(TestCodeIndex)
            'if code found, we finish the list, but don't add to the offset, so we use temptestlength
            If FoundCode = False Then Offset = Offset + TestLength
            If FoundCode = True Then TempTestLength = TempTestLength + TestLength
            'in case code not available, will exit on last code
            If Hex$(TestCode) = MyTestCode And TestCodeMatch(TestCodeIndex) = MyTestCodeNum Then
                FoundCode = True
                'events
                If Hex$(TestCode) = "E612" Then
                    Get #1, Offset - 3, TestCodeValue
                End If
                'bosses
                If Hex$(TestCode) = "E629" Then
                    Get #1, Offset - 3, TestCodeValue
                End If
            End If


StandardState:
'only one here
If Hex$(TestCode) = "E5E6" Then
States1.Frame1(9).ZOrder 0
End If

DoorState:
'only one here
If Hex$(TestCode) = "E5EB" Then
States1.Frame1(3).ZOrder 0
End If

ItemState:
'tourianboss01 E5FF
'morph E640
'morph + missile E652
'powerbombs E669
'speedbooster E678
If Hex$(TestCode) = "E5FF" Or Hex$(TestCode) = "E640" Or Hex$(TestCode) = "E652" Or Hex$(TestCode) = "E669" Or Hex$(TestCode) = "E678" Then
End If

BossState:
'even though we only save one, both should be loaded, in case user changes state type
If Hex$(TestCode) = "E629" Or Hex$(TestCode) = "E612" Then
    Dim MyTempArray(0 To 7) As Byte
    ToBin TestCodeValue, MyTempArray(0)
    For III = 0 To 7
        States1.Bit1(III).Value = MyTempArray(III)
    Next III
States1.Frame1(0).ZOrder 0
End If

EventState:
'even though we only save one, both should be loaded, in case user changes state type
If Hex$(TestCode) = "E612" Or Hex$(TestCode) = "E629" Then
    States1.EventCombo1.Text = States1.EventCombo1.List(TestCodeValue)
States1.Frame1(1).ZOrder 0
End If


    Loop Until TestLength = 2
    Smile.TestCodeList1.Tag = 1
    Smile.TestCodeList1.Text = MyTestCode & CodeDescription(MyTestCode) & " " & MyTestCodeNum
    Smile.TestCodeList1.Tag = 0
    
    'if special state (ie- not last one)
    If MyTestCode <> "E5E6" Then
        Get #1, Offset - 2, TempByte()
        TempThree.Byte1 = TempByte(0)
        TempThree.Byte2 = TempByte(1)
        TempThree.Byte3 = Val("&H8F&")
        Offset = ThreePoint2Offset(TempThree) + ROM_HEADER + 1
    End If
RoomStatePointersOffset = Offset
    Get #1, Offset, MyState

'POINTER EDITOR
LevelDataPointer = MyState.LevelData
Get #1, &H15F2C + ROM_HEADER + 1, TempASMByte
If TempASMByte = &HBD Then GoTo ContinueOpenning

ContinueOpenning:
FX1Pointer = MyState.FX1
EnemyPopulationPointer = MyState.EnemyPopulation
EnemySetPointer = MyState.EnemySet
ScrollPointer = MyState.Scroll
U1Pointer = MyState.U1
FX2Pointer = MyState.FX2
PLMPointer = MyState.PLM
BG_DataPointer = MyState.BG_Data
Layer1_2Pointer = MyState.Layer1_2
'XXXXXXXXXXXXXXXXXXX
Smile.Testing.Text = Hex$(MyState.BG_Data)

'scrolling data 'not state dependent
TempThree.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(MyState.Scroll), 4), 2) & "&")
TempThree.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(MyState.Scroll), 4), 2) & "&")
TempThree.Byte3 = Val("&H8F&")

If Val("&H" & Right$("00" & Hex(TempThree.Byte2), 2) & Right$("00" & Hex$(TempThree.Byte1), 2) & "&") < 32768 Then ScrollOffset = 0 Else ScrollOffset = ThreePoint2Offset(TempThree)
'old way to tell if scroll isn't a pointer
'If TempThree.Byte1 > 0 Or TempThree.Byte2 > 0 Then ScrollOffset = ThreePoint2Offset(TempThree) Else ScrollOffset = 0
ReDim ScrollArray(0 To (MyHeader.Width * MyHeader.Height) - 1) As Byte
ReDim ScrollArrayCopy(0 To (MyHeader.Width * MyHeader.Height) - 1) As Byte

If ScrollOffset > 0 Then Get #1, ScrollOffset + ROM_HEADER + 1, ScrollArray() Else ScrollArray(0) = 255
ScrollArrayCopy() = ScrollArray()
Close #1
If MyHeader.Region <= 7 Then RoomHeader1.RegionCombo1.Text = RoomHeader1.RegionCombo1.List(MyHeader.Region)
RoomHeader1.WidthText1.Text = Right$("00" & Hex$(MyHeader.Width), 1)
RoomHeader1.HeightText1.Text = Right$("00" & Hex$(MyHeader.Height), 1)
RoomHeader1.XText1.Text = Right$("00" & Hex$(MyHeader.X), 2)
RoomHeader1.YText1.Text = Right$("00" & Hex$(MyHeader.Y), 2)
RoomHeader1.UpScrollerText1.Text = Right$("00" & Hex$(MyHeader.UpScroller), 2)
RoomHeader1.DownScrollerText1.Text = Right$("00" & Hex$(MyHeader.DownScroller), 2)
RoomHeader1.RoomIndexText1.Text = Right$("00" & Hex$(MyHeader.RoomIndex), 2)
RoomHeader1.Unknown4Text1.Text = Right$("00" & Hex$(MyHeader.Unknown4), 2)
DoorOutPointer = MyHeader.DoorOut
'setting combo value for graphics will call the rendering of the graphics
Smile.StateGraphicSetCombo1.Text = MyState.GraphicSet + 1
'set music track
For I = 0 To Smile.MusicTrack1.ListCount
    If Right$("00" & Hex$(MyState.MusicTrack), 2) = Left$(Smile.MusicTrack1.List(I), 2) Then Exit For
Next I
If I > Smile.MusicTrack1.ListCount Then Smile.MusicTrack1.AddItem Right$("00" & Hex$(MyState.MusicTrack), 2) & " = ???": I = I - 1
Smile.MusicTrack1.Text = Smile.MusicTrack1.List(I)
'set music control
For I = 0 To Smile.MusicControl1.ListCount
    If Right$("00" & Hex$(MyState.MusicControl), 2) = Left$(Smile.MusicControl1.List(I), 2) Then Exit For
Next I
If I > Smile.MusicControl1.ListCount Then Smile.MusicControl1.AddItem Right$("00" & Hex$(MyState.MusicControl), 2) & " = ???": I = I - 1
Smile.MusicControl1.Text = Smile.MusicControl1.List(I)
'set OTHER stuff
'layer2scroll
Smile.Layer2Scroll1.Text = Right$("0000" & Hex$(MyState.Layer2), 4)


Offset = ThreePoint2Offset(MyState.LevelData)
MapDimensions TileSize, Val(MyHeader.Width), Val(MyHeader.Height)
Open needslash & ".bin" For Binary As #1
Close #1
Kill needslash & ".bin"
DecompressOld Offset, ".bin"

Open needslash & ".bin" For Binary As #1
    Get #1, 1, RoomHeader
'    MsgBox "Subscript out of Range" & vbclrf & "on Roomheader"
ReDim RoomTile(0 To (FInt(RoomHeader) \ 2) - 1) As Tile
    Get #1, 3, RoomTile()
ReDim RoomClip(0 To (FInt(RoomHeader) \ 2) - 1) As Byte
    Get #1, ((UBound(RoomTile) + 1) * 2) + 3, RoomClip()
'old checker
'If (LOF(1) - ((UBound(RoomTile) + 1) * 2) + (UBound(RoomClip) + 1)) > 0 Then
If LOF(1) - ((UBound(RoomTile) + 1) * 2) - (UBound(RoomClip) + 1) - 2 > 0 Then
    'old method of figuring layer 2 ubound
    'ReDim RoomTile2(0 To ((LOF(1) - ((UBound(RoomTile) * 2) + UBound(RoomClip) + 2)) \ 2) - 1) As Tile
    ReDim RoomTile2(0 To UBound(RoomTile)) As Tile
    Get #1, ((UBound(RoomTile) + 1) * 2) + (UBound(RoomClip) + 1) + 3, RoomTile2()
Else
    ReDim RoomTile2(0 To 0) As Tile
End If

Close #1
'open new graphics for menu
'ADDED TO LISTBOX FUNCTIONS

''SPEED INCREASE IN C++''
LunarOpenFile needslash, LC_READWRITE
'entry spot for mask?
Mask = True
    DrawTiles Val(MyState.GraphicSet) + 1
    RenderItNow Val(MyState.GraphicSet) + 1
    BitBlt Smile.MenuPictureMask1.hdc, 0, 0, Smile.MenuPictureMask1.Width, Smile.MenuPictureMask1.Height, Smile.MenuPictureMask1.hdc, 0, 0, DSTINVERT
Mask = False
    DrawTiles Val(MyState.GraphicSet) + 1
    RenderItNow Val(MyState.GraphicSet) + 1
Smile.PictureScroll1.Value = 0
'''''''''''''''''''''''''
LunarCloseFile
'draw to map (reasonably fast)
DrawScreenDLL 0
'get location for enemy data
Dim EnPopBank As Byte   'finding bank for enemy population (A1 or by my code)
Open needslash For Binary As #1
    'get the new EnPopBank before openning enemies
    Dim TempThreeVar As ThreeByte
    TempThreeVar.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(U1Pointer), 4), 2) & "&")
    TempThreeVar.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(U1Pointer), 4), 2) & "&")
    TempThreeVar.Byte3 = &H80&
    Get #1, ThreePoint2Offset(TempThreeVar) + ROM_HEADER + 1, MyRoomVar
    Get #1, &H100B5B + ROM_HEADER + 1, EnPopBank    'first pointer to EnPop Code
    If EnPopBank <> Val("&H20") Then 'if no JSR
        EnPopBank = Val("&HA1&")
    Else    'if JSR found, my code is in the ROM
        EnPopBank = MyRoomVar.MultiVar1 And Val("&H0020")
        If EnPopBank = &H20 Then
            Get #1, &H107FC3 + ROM_HEADER + 1, EnPopBank    'first instance of new bank listed in my code
        Else
            EnPopBank = Val("&HA1&")
        End If
    End If
Close #1

'Drewseph override for the old enpop coding
If UCase$(Right$(App.EXEName, 1)) = "D" And Val("&H" & RoomHeader1.RoomIndexText1.Text & "&") >= &HA0& Then
    EnPopBank = Val("&HEF&")
End If
'Scyzer override for the old enpop coding
If UCase$(Right$(App.EXEName, 1)) = "S" And Val("&H" & RoomHeader1.RoomIndexText1.Text & "&") >= &H80& Then
    EnPopBank = Val("&A2&")
End If


'get location for enemy data
TempThree.Byte1 = Val("&H" & Right$(InHex(MyState.EnemyPopulation, 4), 2) & "&")
TempThree.Byte2 = Val("&H" & Left$(InHex(MyState.EnemyPopulation, 4), 2) & "&")
TempThree.Byte3 = EnPopBank 'A1, unless new bank
Smile.EnemyLabel.Caption = Hex$(ThreePoint2Offset(TempThree))
If TempThree.Byte1 = 0 And TempThree.Byte2 = 0 Then Smile.EnemyLabel.Caption = "000000"

'get location for PLM data
TempThree.Byte1 = Val("&H" & Right$(InHex(MyState.PLM, 4), 2) & "&")
TempThree.Byte2 = Val("&H" & Left$(InHex(MyState.PLM, 4), 2) & "&")
'TempThree.Byte3 = Val("&H8F&")
TempThree.Byte3 = PLMBank   '8F by default
Smile.PLMLabel.Caption = Hex$(ThreePoint2Offset(TempThree))
If TempThree.Byte1 = 0 And TempThree.Byte2 = 0 Then Smile.PLMLabel.Caption = "000000"
'refresh controls
Smile.MenuPicture1.Refresh
Smile.StateGraphicSetCombo1.Tag = 1
States1.States1_Load_Again
PointerForm1.RefreshPointerForm
'load fx1 data and decide whether or not to display it
FX1Displacement = 0
Do
    DisplayFX1 = FigureFX1Data
    Select Case Right$("0000" & Hex$(TempFX1.Select), 4)
        Case "0000": Exit Do
        Case "FFFF": Exit Do
        Case Else:
    End Select
    'if we entered from the room list, accept any entry
    If EnteredRoomFromThisDoor = 0 Then Exit Do
    'if we entered from the door (and are finding door entries) see if this door matches
    If Right$("0000" & Hex$(TempFX1.Select), 4) = Right$("0000" & Hex$(EnteredRoomFromThisDoor), 4) Then Exit Do
    'if not, increase fx1pointer and try again
    FX1Displacement = FX1Displacement + &H10&
    FX1Pointer = FX1Pointer + FX1Displacement
    Loop
If FX1Displacement > 0 Then MsgBox "You've entered a room that has door-dependent FX1 data." & vbCrLf & "The door you have entered is not the first door in the FX1 list." & vbCrLf & "If changing pointer data for this room with the pointer editor, do NOT move the data or it will get damaged." & vbCrLf & "If you want to change pointers for this room (and move the related data), you should refresh the room first by using the Room List instead of a door.", vbInformation


'FX1 over just left edge
Smile.Layer3Picture1.Move -Smile.Picture2.Left, (TempFX1.Surface_Start) * (TileSize / 16), 4, Smile.Picture2.Height
'Smile.Layer3Picture1.Move 0 - Smile.Picture2.Left, (TempFX1.Surface_Start) * (TileSize / 16), 4, Smile.Picture2.Height

'FX1 over whole room
'Smile.Layer3Picture1.Move 0, (TempFX1.Surface_Start) * (TileSize / 16), Smile.Picture2.Width, Smile.Picture2.Height


If Smile.TestCodeList1.ListCount = 1 Then
    Smile.TestCodeList1.Visible = False
    Smile.TestCodeList1.BackColor = RGB(224, 224, 224)
    Smile.TestCodeList1.ForeColor = RGB(128, 128, 128)
    Smile.TestCodeList1.FontBold = False
Else
    Smile.TestCodeList1.Visible = True
    Smile.TestCodeList1.BackColor = RGB(0, 255, 0)
    Smile.TestCodeList1.ForeColor = RGB(0, 0, 0)
    Smile.TestCodeList1.FontBold = True
End If

End Sub

Public Function FInt(Value As Integer) As Long
FInt = Val("&H" & Hex$(Value) & "&")
End Function




Public Function FourBytesToLong(Bytes() As Byte) As Long
Dim TempLong As Long

TempLong = Val("&H" & InHex$(Bytes(0), 2) & InHex$(Bytes(1), 2) & InHex$(Bytes(2), 2) & InHex$(Bytes(3), 2) & "&")
FourBytesToLong = TempLong
End Function


Public Sub SaveRoom2(Offset As Long)
Dim TOTAL_SOLIDFOUR_INT As Integer  'for counting and error control
Dim TOTAL_SOLIDFOUR As Byte         'for saving as a byte
Dim CheckByte(0 To 2) As Byte               'temp byte for checking a byte's value

If needslash = "" Then Exit Sub

Dim MyHeader As mdb_Header
'Dim MyState As mdb_RoomState
Dim TempThree As ThreeByte
Dim TestCode As Integer
Dim TestLength As Byte
Dim SaveArray() As Byte
Dim TempByte(1) As Byte
Dim TempTestLength As Byte
Dim TestCodeMatch(0 To 9) As Byte
Dim TestCodeIndex As Byte
Dim MyTestCode As String
Dim MyTestCodeNum As Byte
Dim ChangedState As Boolean
Dim TempASMByte As Byte

ChangedState = False

MyTestCode = Left$(Smile.TestCodeList1.Text, 4)
MyTestCodeNum = Val(Right$(Smile.TestCodeList1.Text, 1))

Offset = Offset + ROM_HEADER + 1
'appears to work correctly XXXXXXXXX
RoomHeader = (UBound(RoomTile) + 1) * 2
Open needslash For Binary As #1
    Get #1, Offset, MyHeader
    If RoomHeader1.Tag = "1" Then
        MyHeader.Width = Val("&H" & RoomHeader1.WidthText1.Text)
        MyHeader.Height = Val("&H" & RoomHeader1.HeightText1.Text)
        MyHeader.X = Val("&H" & RoomHeader1.XText1.Text)
        MyHeader.Y = Val("&H" & RoomHeader1.YText1.Text)
        MyHeader.Region = RoomHeader1.RegionCombo1.ListIndex
        MyHeader.UpScroller = Val("&H" & RoomHeader1.UpScrollerText1.Text)
        MyHeader.DownScroller = Val("&H" & RoomHeader1.DownScrollerText1.Text)
        MyHeader.RoomIndex = Val("&H" & RoomHeader1.RoomIndexText1.Text)
        MyHeader.Unknown4 = Val("&H" & RoomHeader1.Unknown4Text1.Text)
        MyHeader.DoorOut = DoorOutPointer
    End If
    'placing changes to room properties
    
    Put #1, Offset, MyHeader
    
    FoundCode = False
    Offset = Offset + 11    'after header
    
    Dim ListArray() As String
    ReDim ListArray(0) As String
    
    Do
        Get #1, Offset + TempTestLength, TestCode
            Select Case Hex$(TestCode)
                Case "E5E6": TestLength = 2: TestCodeMatch(0) = TestCodeMatch(0) + 1: TestCodeIndex = 0
                Case "E5EB": TestLength = 6: TestCodeMatch(1) = TestCodeMatch(1) + 1: TestCodeIndex = 1
                Case "E5FF": TestLength = 4: TestCodeMatch(2) = TestCodeMatch(2) + 1: TestCodeIndex = 2
                Case "E612": TestLength = 5: TestCodeMatch(3) = TestCodeMatch(3) + 1: TestCodeIndex = 3
                Case "E629": TestLength = 5: TestCodeMatch(4) = TestCodeMatch(4) + 1: TestCodeIndex = 4
                Case "E640": TestLength = 4: TestCodeMatch(5) = TestCodeMatch(5) + 1: TestCodeIndex = 5
                Case "E652": TestLength = 4: TestCodeMatch(6) = TestCodeMatch(6) + 1: TestCodeIndex = 6
                Case "E669": TestLength = 4: TestCodeMatch(7) = TestCodeMatch(7) + 1: TestCodeIndex = 7
                Case "E678": TestLength = 4: TestCodeMatch(8) = TestCodeMatch(8) + 1: TestCodeIndex = 8
                Case Else: MsgBox "TestCode = " & Hex$(TestCode): Close #1: Exit Sub
            End Select
            
            ListArray(UBound(ListArray)) = Hex$(TestCode) & CodeDescription(Hex$(TestCode)) & " "
            ReDim Preserve ListArray(0 To UBound(ListArray) + 1) As String
            
            
            
            'if the opened state, place new state data from state editor
            If Hex$(TestCode) = Left$(Smile.TestCodeList1.Text, 4) And Right$(Smile.TestCodeList1.Text, 1) = TestCodeMatch(TestCodeIndex) Then
            If States1.TestCodeList1.Text = "" Then GoTo NoStateEditable
            
                'TestCode = Val("&H" & Left$(States1.TestCodeList1.Text, 4))
                'Put #1, Offset + TempTestLength, TestCode
                
            End If
NoStateEditable:
            '''''''''''''''''''''''''
            
            
            
            
            'if code found, we finish the list, but don't add to the offset, so we use temptestlength
            If FoundCode = False Then Offset = Offset + TestLength
            If FoundCode = True Then TempTestLength = TempTestLength + TestLength
            'in case code not available, will exit on last code
            If Hex$(TestCode) = MyTestCode And TestCodeMatch(TestCodeIndex) = MyTestCodeNum Then FoundCode = True   ': MsgBox Hex$(TestCode) & vbCrLf & MyTestCodeNum
            'save changes to testcode
            If FoundCode = True And TempTestLength = 0 Then
                'get and place new testcode
                TestCode = Val("&H" & Left$(States1.TestCodeList1.Text, 4))
                Put #1, Offset - TestLength, TestCode
                'boss state
                If Hex$(TestCode) = "E629" Then
                    Dim MyTempArray2(0 To 7) As Byte
                    For III = 0 To 7
                        MyTempArray2(III) = States1.Bit1(III).Value
                    Next III
                    Put #1, , FromBin(MyTempArray2(0))
                End If
                'event state
                If Hex$(TestCode) = "E612" Then
                    Dim MyEventByte As Byte
                    MyEventByte = States1.EventCombo1.ListIndex
                    Put #1, , MyEventByte
                End If
                
                
            End If
            'Offset = Offset + TestLength
    Loop Until TestLength = 2


    'if special state (ie- not last one)
    If MyTestCode <> "E5E6" Then
        Get #1, Offset - 2, TempByte()
        TempThree.Byte1 = TempByte(0)
        TempThree.Byte2 = TempByte(1)
        TempThree.Byte3 = Val("&H8F&")
        Offset = ThreePoint2Offset(TempThree) + ROM_HEADER + 1
    End If
    Get #1, Offset, MyState

'XXXXXXXXXX
    MyState.BG_Data = Val("&H" & Smile.Testing.Text)
    MyState.GraphicSet = Val(Smile.StateGraphicSetCombo1.Text) - 1
    MyState.MusicControl = Val("&H" & Left$(Smile.MusicControl1.Text, 2))
    MyState.MusicTrack = Val("&H" & Left$(Smile.MusicTrack1.Text, 2))
    
    'POINTER EDITOR
    MyState.LevelData = LevelDataPointer
Get #1, &H15F2C + ROM_HEADER + 1, TempASMByte
If TempASMByte = &HBD Then GoTo ContinueSaving

ContinueSaving:
    MyState.FX1 = FX1Pointer - FX1Displacement
    MyState.EnemyPopulation = EnemyPopulationPointer
    MyState.EnemySet = EnemySetPointer
    MyState.Scroll = ScrollPointer
    MyState.U1 = U1Pointer
    MyState.FX2 = FX2Pointer
    MyState.PLM = PLMPointer
    MyState.BG_Data = BG_DataPointer
    MyState.Layer1_2 = Layer1_2Pointer
    'OTHER
    MyState.Layer2 = Val("&H" & Smile.Layer2Scroll1.Text)
    Put #1, Offset, MyState
    
    If PointerSavingOnly = False Then SaveFX1Data
'scrolling data
TempThree.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(MyState.Scroll), 4), 2) & "&")
TempThree.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(MyState.Scroll), 4), 2) & "&")
TempThree.Byte3 = Val("&H8F&")

If TempThree.Byte2 > &H7F Then ScrollOffset = ThreePoint2Offset(TempThree) Else ScrollOffset = 0
If PointerSavingOnly = False Then
    If ScrollOffset > 0 Then Put #1, ScrollOffset + ROM_HEADER + 1, ScrollArray()
End If
ScrollArrayCopy() = ScrollArray()
Close #1


Offset = ThreePoint2Offset(MyState.LevelData)

KillFile needslash & ".bin"
'''''''''''''''''''''''
Open needslash & ".bin" For Binary As #1
    Put #1, 1, RoomHeader
    Put #1, 3, RoomTile()
    Put #1, ((UBound(RoomTile) + 1) * 2) + 3, RoomClip()

    If UBound(RoomTile2) > 0 Then
        Put #1, ((UBound(RoomTile) + 1) * 2) + (UBound(RoomClip) + 1) + 3, RoomTile2()
    End If
    
ReDim SaveArray(0 To LOF(1) - 1) As Byte

'XXXXX IF GLITCHING, REVERT TO THIS, REIMPLEMENTING THE LOWER-RIGHT LAYER 2 GLITCH
'If UBound(RoomTile2) > 0 Then ReDim SaveArray(0 To LOF(1) - 1) As Byte '-1
If UBound(RoomTile2) > 0 Then ReDim SaveArray(0 To LOF(1)) As Byte
    Get #1, 1, SaveArray()
Close #1

'save level data... if only doing pointers though, don't
If PointerSavingOnly = False Then RecompressOld Offset, SaveArray()

'REFRESH STATE LIST
'store listindex before clearing list
If Smile.TestCodeList1.ListCount = 1 Then GoTo DoSolidFourFile
TempListIndex = Smile.TestCodeList1.ListIndex
'update list
Smile.TestCodeList1.Tag = 1
Smile.TestCodeList1.Clear

For III = 0 To 8
TestCodeMatch(III) = 0
Next III

'change selected to state to new type
ListArray(TempListIndex) = Left$(States1.TestCodeList1.Text, 4) & CodeDescription(Left$(States1.TestCodeList1.Text, 4)) & " "

'remake list
For ListIndex = 0 To UBound(ListArray) - 1
Select Case Left$(ListArray(ListIndex), 4)
    Case "E5E6": TestCodeMatch(0) = TestCodeMatch(0) + 1: TestCodeIndex = 0
    Case "E5EB": TestCodeMatch(1) = TestCodeMatch(1) + 1: TestCodeIndex = 1
    Case "E5FF": TestCodeMatch(2) = TestCodeMatch(2) + 1: TestCodeIndex = 2
    Case "E612": TestCodeMatch(3) = TestCodeMatch(3) + 1: TestCodeIndex = 3
    Case "E629": TestCodeMatch(4) = TestCodeMatch(4) + 1: TestCodeIndex = 4
    Case "E640": TestCodeMatch(5) = TestCodeMatch(5) + 1: TestCodeIndex = 5
    Case "E652": TestCodeMatch(6) = TestCodeMatch(6) + 1: TestCodeIndex = 6
    Case "E669": TestCodeMatch(7) = TestCodeMatch(7) + 1: TestCodeIndex = 7
    Case "E678": TestCodeMatch(8) = TestCodeMatch(8) + 1: TestCodeIndex = 8
    Case Else: MsgBox "TestCode = " & Hex$(TestCode): Close #1: Exit Sub
End Select
Smile.TestCodeList1.AddItem (ListArray(ListIndex)) & TestCodeMatch(TestCodeIndex)
Next ListIndex
'"click" current state again
Smile.TestCodeList1.Text = Smile.TestCodeList1.List(TempListIndex)
Smile.TestCodeList1.Tag = 0
RefreshMapHighlight

DoSolidFourFile:
'Check to verify we have the proper ASM in the ROM... if not, leave
Open needslash For Binary As #27
    Get #27, &H17710 + ROM_HEADER + 1, CheckByte()
Close #27
'check for LDA RoomIndex, the starting of the ASM
If CheckByte(0) <> &HDA& Then Exit Sub
If CheckByte(1) <> &H5A& Then Exit Sub
If CheckByte(2) <> &HAE& Then Exit Sub
'Find how many there are (must be solid and have a bts of 04)
TOTAL_SOLIDFOUR_INT = 0
For I = 0 To UBound(RoomTile)
    If (RoomTile(I).PatternByte And &HF0&) = &H80& Then
        If RoomClip(I) = 4 Then
            TOTAL_SOLIDFOUR_INT = TOTAL_SOLIDFOUR_INT + 1
        End If
    End If
Next I
If TOTAL_SOLIDFOUR_INT > 254 Then TOTAL_SOLIDFOUR_INT = 254
TOTAL_SOLIDFOUR = Val(TOTAL_SOLIDFOUR_INT)
Open needslash For Binary As #27
    '00 out the data in the table, if needed
    For I = 0 To 255
        Get #27, &H17900 + ROM_HEADER + I + 1, CheckByte(0)
        If CheckByte(0) = 255 Then
            CheckByte(0) = 0
            Put #27, &H17900 + ROM_HEADER + I + 1, CheckByte(0)
        End If
    Next I
    'save our value to the correct location
    Put #27, &H17900 + ROM_HEADER + MyHeader.RoomIndex + 1, TOTAL_SOLIDFOUR
Close #27
End Sub



Public Function NumberOfScroll(X As Single, Y As Single) As Integer
X = X \ 128
Y = Y \ 128
NumberOfScroll = Y * (Smile.Picture2.Width \ 128) + X
End Function



Public Sub RaiseScroll(X As Single, Y As Single)
If ScrollArray(0) = 255 Then Smile.SMILECaption.Caption = "Can't change scrolls in this room . . . Most likely, your Scroll Pointer is either 0000 or 0001.": Exit Sub
X = X \ 128
Y = Y \ 128
BoxNumber = Y * (Smile.Picture2.Width \ 128) + X
If ScrollArray(BoxNumber) < 255 Then ScrollArray(BoxNumber) = ScrollArray(BoxNumber) + 1
If ScrollArray(BoxNumber) > 2 Then ScrollArray(BoxNumber) = 0
ShowScrollBoxes
Smile.Picture2.Refresh
End Sub


Public Sub ShowScrollBoxes()
Dim SizeOfBox As Integer
SizeOfBox = TileSize * 16
'red = no scroll
'blue = partial scroll
'green = full scroll
'yellow = ?
'MsgBox ""
'If ScrollArray(0) = 255 Then Exit Sub

boxcounter = 0
If ScrollArray(0) <> 255 Then GoTo REALSCROLLDATA
NOSCROLLDATA:       '(0000 or 0001 as pointers)
For YYY = 0 To Smile.Picture2.Height - SizeOfBox Step SizeOfBox
For XXX = 0 To Smile.Picture2.Width - SizeOfBox Step SizeOfBox
'if beyond the end of scroll data, don't try to open another
'needed when expanding rooms
If boxcounter > UBound(ScrollArray) Then GoTo DoneScroll
    Smile.Picture2.Line (XXX + 1, YYY + 1)-(XXX + SizeOfBox - 1, YYY + SizeOfBox - 1), RGB(120, 120, 120), B
    If ScrollPointer = 0 Then
        Smile.Picture2.Line (XXX, YYY)-(XXX + SizeOfBox, YYY + SizeOfBox), RGB(0, 0, 250), B
    Else
        Smile.Picture2.Line (XXX, YYY)-(XXX + SizeOfBox, YYY + SizeOfBox), RGB(0, 250, 0), B
    End If
    
boxcounter = boxcounter + 1
Next XXX
Next YYY



REALSCROLLDATA:
For YYY = 0 To Smile.Picture2.Height - SizeOfBox Step SizeOfBox
For XXX = 0 To Smile.Picture2.Width - SizeOfBox Step SizeOfBox
'if beyond the end of scroll data, don't try to open another
'needed when expanding rooms
If boxcounter > UBound(ScrollArray) Then GoTo DoneScroll
    Select Case ScrollArray(boxcounter)
        Case 0: Smile.Picture2.Line (XXX + 1, YYY + 1)-(XXX + SizeOfBox - 1, YYY + SizeOfBox - 1), vbRed, B
        Case 1: Smile.Picture2.Line (XXX + 1, YYY + 1)-(XXX + SizeOfBox - 1, YYY + SizeOfBox - 1), vbBlue, B
        Case 2: Smile.Picture2.Line (XXX + 1, YYY + 1)-(XXX + SizeOfBox - 1, YYY + SizeOfBox - 1), vbGreen, B
        'case 3 doesn't exist in the original game... anything => 3 appears to act as 2
        'Case Else: MsgBox "Scroll Value = " & Hex$(ScrollArray(boxcounter)) & vbCrLf & "Room may not have default scrolls.": Smile.Picture2.Line (xxx, yyy)-(xxx + 127, yyy + 127), RGB(0, 100, 0), B
    End Select
    boxcounter = boxcounter + 1
Next XXX
Next YYY

DoneScroll:
End Sub



Public Function FlipTheClip(Clip As Byte, Horizontal As Boolean) As Byte
Dim ByteAsHex As String * 2
Dim BytePart(1) As String * 1
Dim TempValue As Integer

ByteAsHex = Right$("00" & Hex$(Clip), 2)
BytePart(0) = Left$(ByteAsHex, 1)
BytePart(1) = Right$(ByteAsHex, 1)
TempValue = Val("&H" & BytePart(0) & "&")
If Horizontal = True Then GoTo HorizontalFlip Else GoTo VerticalFlip

HorizontalFlip:
If TempValue <= 3 Then TempValue = TempValue + 4: GoTo FlipIt
If TempValue >= 4 And TempValue <= 7 Then TempValue = TempValue - 4: GoTo FlipIt
If TempValue >= 8 And TempValue <= 11 Then TempValue = TempValue + 4: GoTo FlipIt
If TempValue >= 12 Then TempValue = TempValue - 4: GoTo FlipIt

VerticalFlip:
If TempValue < 8 Then TempValue = TempValue + 8: GoTo FlipIt
If TempValue >= 8 Then TempValue = TempValue - 8: GoTo FlipIt

FlipIt:
BytePart(0) = Hex$(TempValue)
ByteAsHex = BytePart(0) & BytePart(1)
FlipTheClip = Val("&H" & ByteAsHex & "&")
End Function


Public Function CodeDescription(TestCode As String) As String
Select Case TestCode
    Case "E5E6": CodeDescription = " = STANDARD"
    Case "E5FF": CodeDescription = " = Tourian Boss 1"
    Case "E612": CodeDescription = " = Events"
    Case "E629": CodeDescription = " = Bosses"
    Case "E640": CodeDescription = " = Morph"
    Case "E652": CodeDescription = " = Morph & Missiles"
    Case "E669": CodeDescription = " = Power Bombs"
    Case "E678": CodeDescription = " = Speed Booster"
End Select
End Function


Public Function CodeValueDescription(TestCodeValue As String, TestCode As String) As String

'events

If TestCode = "E612" Then
Select Case TestCodeValue
    Case "00": CodeValueDescription = " = 1st trigger"
    Case "0E": CodeValueDescription = " = Escape sequence"
    Case Else: CodeValueDescription = " = ?"
End Select
End If
'bosses
If TestCode = "E629" Then
Select Case TestCodeValue
    Case "00": CodeValueDescription = " = STANDARD"
    Case "01": CodeValueDescription = " = Ceres Ridley"
    Case "02": CodeValueDescription = " = Botwoon"
    
    Case Else: CodeValueDescription = " = ?"
End Select
End If
End Function

Public Sub FreeControls()
'if already enabled, then don't waste time doing it again
If Smile.TestCodeList1.Enabled = True Then Exit Sub

Smile.TestCodeList1.Enabled = True
Smile.mnuSaveRoom.Enabled = True
Smile.BrowserButtons1(6).Enabled = True
Smile.mnuSpecial.Enabled = True
Smile.mnuEdit.Enabled = True
Smile.mnuPreferencesView.Enabled = True
Smile.mnuTools.Enabled = True
Smile.mnuPreferences.Enabled = True
Smile.Picture2.Enabled = True
Smile.EnemyBox(0).Enabled = True
Smile.StateGraphicSetCombo1.Enabled = True
Smile.MusicControl1.Enabled = True
Smile.MusicTrack1.Enabled = True
Smile.VScroll1.Enabled = True
Smile.MapClicker.Enabled = True
Smile.MapHScroll1.Enabled = True
Smile.MapVScroll1.Enabled = True
Smile.MenuPicture1.Enabled = True
Smile.PictureScroll1.Enabled = True
Smile.PatternPreviewCheck.Enabled = True
For I = 0 To Smile.Option1.UBound
    Smile.Option1(I).Enabled = True
    Smile.Frame1(I).Enabled = True
Next I
Smile.mnuOffscreenEnemies.Enabled = True
Smile.mnuOffscreenPLM.Enabled = True
End Sub


Public Sub MoveControls(OriginalNewSize As Variant)
'Open App.Path & "\SMILE.ini" For Binary As #3
Dim NewWidth As Variant
Dim NewSize As Variant
Dim TempResult As Variant
Smile.Picture1.Height = 128
NewSize = OriginalNewSize   'needed to allow partial NewSize
If NewSize = 0 Then NewSize = 1: NewWidth = 2: GoTo FinalizeControls
If NewSize = 1 Then NewSize = 2: NewWidth = 2: GoTo FinalizeControls
If NewSize = 2 Then NewSize = 2: NewWidth = 2: GoTo FinalizeControls
If NewSize = 4 Then NewSize = 2: NewWidth = 3: GoTo FinalizeControls
If NewSize = 5 Then NewSize = 2: NewWidth = 3: GoTo FinalizeControls

If NewSize = 6 Then
    NewSize = (Smile.ScaleY(UserScreenHeight, vbTwips, vbPixels) - Smile.MapHScroll1.Height + 8) / 256
    NewWidth = UserScreenWidth / (256 * Smile.ScaleX(1, vbPixels, vbTwips))
    GoTo FinalizeControls
End If
If NewSize = 7 Then
    NewSize = (Smile.ScaleY(UserScreenHeight, vbTwips, vbPixels) - Smile.Picture1.Height - Smile.MapHScroll1.Height) / 256
    NewWidth = (UserScreenWidth - Smile.ScaleX(Smile.FakeFrame2.Width, vbPixels, vbTwips)) / (256 * Smile.ScaleX(1, vbPixels, vbTwips))
    GoTo FinalizeControls
End If

If NewSize = 8 Then NewSize = 3: NewWidth = 4: GoTo FinalizeControls
If NewSize = 9 Then NewSize = 3: NewWidth = 4: GoTo FinalizeControls
If NewSize = 10 Then NewSize = 4: NewWidth = 5: GoTo FinalizeControls
If NewSize = 11 Then NewSize = 4: NewWidth = 5: GoTo FinalizeControls
If NewSize = 12 Then NewSize = 5: NewWidth = 6: GoTo FinalizeControls
If NewSize = 13 Then NewSize = 5: NewWidth = 6: GoTo FinalizeControls

FinalizeControls:
Smile.WindowState = vbNormal
'level editing height + scroll bar under it
Smile.FakeFrame1.Height = (NewSize * 256) + Smile.MapHScroll1.Height
Smile.FakeFrame1.Width = (NewWidth * 256) + Smile.MapVScroll1.Width
'level editing height, without scroll bar under it
Smile.MapVScroll1.Height = NewSize * 256
Smile.MapVScroll1.Left = Smile.FakeFrame1.Width - Smile.MapVScroll1.Width
Smile.MapHScroll1.Top = Smile.MapVScroll1.Height
Smile.MapHScroll1.Width = Smile.FakeFrame1.Width - Smile.MapVScroll1.Width
Smile.MapClicker.Move Smile.MapVScroll1.Left, Smile.MapVScroll1.Height
'cre holder
Smile.Picture1.Height = 128
Smile.PictureScroll1.Height = Smile.Picture1.Height
Smile.Picture1.Top = Smile.FakeFrame1.Top + Smile.FakeFrame1.Height
'Smile.Picture1.Top = Smile.MapHScroll1.Top + Smile.MapHScroll1.Height
Smile.Picture3.Top = Smile.Picture1.Top

'height of smile
tempheight = Smile.Picture1.Top + Smile.Picture1.Height + 3

Smile.Move 0, 0
Smile.Height = Smile.ScaleY(tempheight, vbPixels, vbTwips)
Smile.FakeFrame2.Left = Smile.FakeFrame1.Left + Smile.FakeFrame1.Width + 3

TempResult = Smile.FakeFrame2.Left + Smile.FakeFrame2.Width + 3
Smile.Width = Smile.ScaleX(TempResult, vbPixels, vbTwips)
'Smile.FakeFrame1.ZOrder 0
If OriginalNewSize = 6 Or OriginalNewSize = 7 Then
    Smile.WindowState = vbMaximized
End If

'place maximize, minimize, and restore
Smile.BrowserBar1.Width = Smile.ScaleX(Smile.Width, vbTwips, vbPixels)
Smile.TaskCommand1(2).Left = Smile.ScaleX(Smile.BrowserBar1.Width, vbPixels, vbTwips) - Smile.TaskCommand1(2).Width
Smile.TaskCommand1(1).Left = Smile.TaskCommand1(2).Left - Smile.TaskCommand1(1).Width
Smile.TaskCommand1(0).Left = Smile.TaskCommand1(1).Left - Smile.TaskCommand1(0).Width
Smile.TaskCommand1(3).Left = Smile.TaskCommand1(0).Left

'needed? 64-bit fixes?
Smile.MenuPicture1.Width = 529
Smile.Picture1.Width = 529
End Sub

Public Sub SpecialBlocks()
Dim PermKill As Byte
PermKill = Abs(Smile.ReSpawning1.Value - 1)
'pattern/bts
'''''0F/84 - speed/crumble (returns).... special case $79CB3

'stolen from CHANGEPROPERTIES'''''''''''
Dim OrientationPart As Byte
Dim PropertyPart As Byte
''''''''''''''''''''''''''''''''''''''''


Select Case BTSMenuValue
    'main blocks
    Case 0: PropertyPart = Val("&H0C&"): RoomClip(MapTileNumber) = Val("&H0A&") + PermKill  'super missile block... returns
    Case 1: PropertyPart = Val("&H0C&"): RoomClip(MapTileNumber) = Val("&H08&") + PermKill  'power bomb block
    Case 2: PropertyPart = Val("&H0B&"): RoomClip(MapTileNumber) = Val("&H0E&") + PermKill  'speed block
    Case 3: PropertyPart = Val("&H0E&"): RoomClip(MapTileNumber) = Val("&H01&") + PermKill  'crumbling grapple block
    'directions
    Case 4: PropertyPart = Val("&H03&"): RoomClip(MapTileNumber) = Val("&H08&")  'left
    Case 5: PropertyPart = Val("&H03&"): RoomClip(MapTileNumber) = Val("&H09&")  'right
    Case 6: PropertyPart = Val("&H03&"): RoomClip(MapTileNumber) = Val("&H82&")  'down
    Case 7: PropertyPart = Val("&H0A&"): RoomClip(MapTileNumber) = Val("&H0F&")  'grinder blocks
    Case 8: PropertyPart = Val("&H0B&"): RoomClip(MapTileNumber) = Val("&H0B&")  'barrier
End Select

OrientationPart = Val("&H" & Right$(Hex$(RoomTile(MapTileNumber).PatternByte), 1) & "&")
RoomTile(MapTileNumber).PatternByte = Val("&H" & (Hex$(PropertyPart) & Hex$(OrientationPart)) & "&")
End Sub


Public Sub LoadINI()
Dim MenuWindowSize As Byte
Dim MenuTileSize As Byte
Dim MenuBrightness As Byte
Dim MenuTransparentBTS As Byte
Dim MenuShowScrollAreas As Byte
Dim MenuDrawPLMBoxes As Byte
Dim MenuPaletteType As Byte
Dim YellowSlopes As Byte
Dim LanguageOption As Byte      'which language files to use
Dim MenuDoSnap As Byte
Dim CheckRevealHiddenTilesCheck1 As Byte
Dim MapVisible As Boolean
Dim TempFavoriteRoom As String * 45

Dim SMILEVERSION As String * 5
Dim TempNeedslash As String * 256

'save smile version to the ini so SOLA is able to check for updates
SMILEVERSION = Right$("00" & App.Major, 2) & "." & Right$("00" & App.Minor, 2)

'getting ini values
Open App.Path & "\SMILE.ini" For Binary As #3
    Get #3, , MenuWindowSize
    Get #3, , MenuTileSize
    Get #3, , MenuBrightness
    Get #3, , MenuTransparentBTS
    Get #3, , MenuShowScrollAreas
    Get #3, , MenuDrawPLMBoxes
    Get #3, , MenuPaletteType
    Get #3, , YellowSlopes
    Get #3, , LanguageOption
    Get #3, , MenuDoSnap
    Get #3, , CheckRevealHiddenTilesCheck1
    Get #3, , MapVisible
    Get #3, , LastRoomOpened
    'Get #3, 60, SRMVariables() '... handled outside this sub
    Put #3, 100, SMILEVERSION   'for update checks  'SHOULD THIS BE A PUT #3 LINE INSTEAD??????
    Get #3, 110, Emulator       'path to emulator
    Get #3, 370, SRMPath        'path to SRM Folder (optional)
    Get #3, 700, TempNeedslash  '256 bytes. chop down
    'Load Favorite Rooms
    Do
        Get #3, , TempFavoriteRoom
        If Val(TempFavoriteRoom) = 0 Then GoTo NotThisOne
        If Smile.mnuFavoriteList(0).Visible = False Then
            ReDim Preserve FavoriteRooms(0 To 0) As String * 45
            Smile.mnuFavoriteList(0).Visible = True
        Else
            ReDim Preserve FavoriteRooms(0 To UBound(FavoriteRooms) + 1) As String * 45
            Load Smile.mnuFavoriteList(Smile.mnuFavoriteList.UBound + 1)
        End If
        FavoriteRooms(UBound(FavoriteRooms)) = TempFavoriteRoom
        Smile.mnuFavoriteList(UBound(FavoriteRooms)).Caption = Right$(FavoriteRooms(UBound(FavoriteRooms)), 40)
        Smile.mnuFavoriteList(UBound(FavoriteRooms)).Visible = True
        FavoriteRooms(UBound(FavoriteRooms)) = TempFavoriteRoom
NotThisOne:
    Loop While Not EOF(3)

Close #3

'no (or old) ini fixes
If MenuTileSize = 0 Then
    MenuTileSize = 16           'default
    MenuShowScrollAreas = True  'default, but not zero/false
End If


'setting preferences
Smile.mnuEditorSizes_Click Val(MenuWindowSize)
Smile.TestCodeList1.Tag = 1
Smile.mnuTileSizes_Click Val(MenuTileSize)
Smile.mnuLightBulb(MenuBrightness).Checked = True
LightBulb = MenuBrightness + 1
Smile.mnuTransparentBTS.Checked = MenuTransparentBTS
Smile.mnuShowScrollAreas.Checked = MenuShowScrollAreas
If MenuDrawPLMBoxes = True Then Smile.mnuDrawPLMBox_Click
Smile.mnuPaletteType(MenuPaletteType).Checked = True
Smile.YellowSlopes1.Value = Abs(YellowSlopes - 1)
Smile.mnuLanguage_Click Val(LanguageOption)
If MenuDoSnap = 0 Then
    Smile.mnuDoSnap.Checked = True
Else
    Smile.mnuDoSnap.Checked = False
End If
Mapper1.RevealHiddenTilesCheck1.Value = CheckRevealHiddenTilesCheck1
needslash = TempNeedslash
DD = InStr(1, UCase$(needslash), ".SMC", vbBinaryCompare) + 3
needslash = Left$(needslash, DD)
If Len(needslash) = 3 Then needslash = ""
Smile.mnuMapEditor.Checked = MapVisible
End Sub


Public Sub SaveINI()
Dim MenuWindowSize As Byte
Dim MenuTileSize As Byte
Dim MenuBrightness As Byte
Dim MenuTransparentBTS As Byte
Dim MenuShowScrollAreas As Byte
Dim MenuDrawPLMBoxes As Byte
Dim MenuPaletteType As Byte
Dim IniLoop As Byte
Dim YellowSlopes As Byte
Dim LanguageOption As Byte
Dim MenuDoSnap As Byte
Dim CheckRevealHiddenTilesCheck1 As Byte
Dim MapVisible As Boolean

Dim SMILEVERSION As String * 5
Dim TempNeedslash As String * 256
Dim FakeLastRoom As String * 5  'in case we need to skip last room in the ini

'window size
For IniLoop = 0 To 13
    If Smile.mnuEditorSizes(IniLoop).Checked = True Then MenuWindowSize = IniLoop: Exit For
Next IniLoop
If MenuWindowSize = 0 Then MenuWindowSize = Val(Smile.mnuEditorSizes(0).Tag)
'tile size (if 0, 0 is the default anyway, so we don't define)
MenuTileSize = TileSize

'brightness
For IniLoop = 0 To 2
    If Smile.mnuLightBulb(IniLoop).Checked = True Then MenuBrightness = IniLoop: Exit For
Next IniLoop
'transparent BTS
MenuTransparentBTS = Smile.mnuTransparentBTS.Checked
'show scroll area boxes
MenuShowScrollAreas = Smile.mnuShowScrollAreas.Checked
'draw PLM boxes
MenuDrawPLMBoxes = Smile.mnuDrawPLMBox.Checked
'palette type
For IniLoop = 0 To 2
    If Smile.mnuPaletteType(IniLoop).Checked = True Then MenuPaletteType = IniLoop: Exit For
Next IniLoop

'language check
For IniLoop = 0 To 5    'ubound + 2 (spacer, then custom, if it's there)
    If Smile.mnuLanguage(IniLoop).Checked = True Then LanguageOption = IniLoop: Exit For
Next IniLoop

'show yellow slopes
YellowSlopes = Abs(Smile.YellowSlopes1.Value - 1)

'allow/prevent snapping to grid
MenuDoSnap = Smile.mnuDoSnap.Checked + 1
'whether or not to reveal hidden tiles in the map editor
CheckRevealHiddenTilesCheck1 = Mapper1.RevealHiddenTilesCheck1.Value

'last room opened before closing smile
'lastroomopened already has a value

'save smile version to the ini so SOLA is able to check for updates
SMILEVERSION = Right$("00" & App.Major, 2) & "." & Right$("00" & Left$(App.Minor & "00", 2), 2)
TempNeedslash = needslash

'whether or not the map is visible
MapVisible = Smile.mnuMapEditor.Checked


'making sure to get rid of existing ini (if any), so that newer versions won't conflict
'Open App.Path & "\SMILE.ini" For Binary As #3
'Close #3
'Kill App.Path & "\SMILE.ini"
KillFile App.Path & "\SMILE.ini"
'saving the new ini
Open App.Path & "\SMILE.ini" For Binary As #3
    Put #3, , MenuWindowSize
    Put #3, , MenuTileSize
    Put #3, , MenuBrightness
    Put #3, , MenuTransparentBTS
    Put #3, , MenuShowScrollAreas
    Put #3, , MenuDrawPLMBoxes
    Put #3, , MenuPaletteType
    Put #3, , YellowSlopes
    Put #3, , LanguageOption
    Put #3, , MenuDoSnap
    Put #3, , CheckRevealHiddenTilesCheck1
    Put #3, , MapVisible
    If Smile.mdbCombo.Text <> "" Then
    Put #3, , LastRoomOpened
    Else
    'even if we don't write to the ini, we need to advance through it
    Get #3, , FakeLastRoom
    End If
    'must be handled here, as there is a killfile at the start of the process
    Put #3, 60, SRMVariables() '... handled outside this sub
    Put #3, 100, SMILEVERSION   'for update checks
    Put #3, 110, Emulator          'path to emulator
    Put #3, 370, SRMPath           'path to SRM Folder (optional)
    Put #3, 700, TempNeedslash      '256 bytes... chop down
    'Save Favorite Rooms
    For III = 0 To Smile.mnuFavoriteList.UBound
        If Smile.mnuFavoriteList(III).Visible = True Then Put #3, , FavoriteRooms(III)
    Next III
Close #3


End Sub


Public Sub PreviewGridLines()
Dim GridColor As Long

'cancel grid if no tiles selected since last copy
'taken out when changing to solid blocks
'If Smile.PreviewClip.Tag = 0 Then Smile.PreviewClip.Refresh: Exit Sub
For YYY = 0 To 240 Step 16
For XXX = 0 To 240 Step 16
    III = III + 1
    If FakeClip(III).Visible = True Then GridColor = vbGreen Else GridColor = vbRed
    If GridColor = vbRed Then Smile.PreviewClip.Line (XXX, YYY)-(XXX + 15, YYY + 15), RGB(100, 30, 30), BF
Next XXX
Next YYY
End Sub



Public Sub XThrough(X As Long, Y As Long, Optional Returning As Boolean = False, Optional Width As Byte = 1, Optional Height As Byte = 1)
'draws boxes for returning and non-returning blocks

Width = Width * TileSize
Height = Height * TileSize

'Smile.Picture2.Line (X, Y)-(X + Width - 1, Y + Height - 1), BOXHIGH, B
'Smile.Picture2.Line (X + Width - 1, Y)-(X + Width - 1, Y + Height), BOXLOW
'Smile.Picture2.Line (X, Y + Height - 1)-(X + Width - 1, Y + Height - 1), BOXLOW
'Smile.Picture2.Line (X + 1, Y + 1)-(X + Width - 2, Y + Height - 2), BOXHIGH, B
'Smile.Picture2.Line (X + Width - 2, Y)-(X + Width - 2, Y + Height - 1), BOXLOW
'Smile.Picture2.Line (X + 1, Y + Height - 2)-(X + Width - 2, Y + Height - 2), BOXLOW
Smile.Picture2.ForeColor = BOXHIGH
    DrawSquare Smile.Picture2.hdc, X, Y, X + Width - 1, Y + 1
    DrawSquare Smile.Picture2.hdc, X, Y, X + 1, Y + Height - 1
Smile.Picture2.ForeColor = BOXLOW
    DrawSquare Smile.Picture2.hdc, X + Width - 2, Y + 1, X + Width - 1, Y + Height - 1
    DrawSquare Smile.Picture2.hdc, X + 1, Y + Height - 1, X + Width - 1, Y + Height - 2


        
        
If Returning = True Then

End If
End Sub


Public Sub UpdatePreviewBuffer()
'copies clipboard *image* to a buffer
    Smile.PreviewClipBuffer.Move 0, 0, Smile.PreviewClip.Width, Smile.PreviewClip.Height
    BitBlt Smile.PreviewClipBuffer.hdc, 0, 0, Smile.PreviewClip.Width, Smile.PreviewClip.Height, Smile.PreviewClip.hdc, 0, 0, SRCCOPY
    Smile.PreviewClipBuffer.Refresh
End Sub


Public Sub MakeSongList()
Smile.MusicControl1.AddItem "00 = No Change"
Smile.MusicControl1.AddItem "01 = Samus appear"
Smile.MusicControl1.AddItem "02 = Aquire item"
Smile.MusicControl1.AddItem "03 = Elevator"
Smile.MusicControl1.AddItem "04 = Hall before statues"
Smile.MusicControl1.AddItem "05 = No change/Song One"
Smile.MusicControl1.AddItem "06 = Song Two"
Smile.MusicControl1.AddItem "07 = Mute"

Smile.MusicTrack1.AddItem "00 = None"
Smile.MusicTrack1.AddItem "03 = Title Screen"
Smile.MusicTrack1.AddItem "06 = Empty Crateria"
Smile.MusicTrack1.AddItem "09 = Space Pirate"
Smile.MusicTrack1.AddItem "0C = Samus Theme"
Smile.MusicTrack1.AddItem "0F = Green Brinstar"
Smile.MusicTrack1.AddItem "12 = Red Brinstar"
Smile.MusicTrack1.AddItem "15 = Upper Norfair"
Smile.MusicTrack1.AddItem "18 = Lower Norfair"
Smile.MusicTrack1.AddItem "1B = Maridia"
Smile.MusicTrack1.AddItem "1E = Tourian"
Smile.MusicTrack1.AddItem "21 = Mother Brain"
Smile.MusicTrack1.AddItem "24 = Boss Fight 1(04,05,06,80)"
Smile.MusicTrack1.AddItem "27 = Boss Fight 2(04,05,06)"
Smile.MusicTrack1.AddItem "2A = Miniboss Fight"
Smile.MusicTrack1.AddItem "2D = Ceres"
Smile.MusicTrack1.AddItem "30 = Wrecked Ship"
Smile.MusicTrack1.AddItem "33 = Zebes Boom"
Smile.MusicTrack1.AddItem "36 = Intro"
Smile.MusicTrack1.AddItem "39 = Death"
Smile.MusicTrack1.AddItem "3C = Credits"
Smile.MusicTrack1.AddItem "3F = The last metroid is in captivity"
Smile.MusicTrack1.AddItem "42 = The galaxy is at peace"
Smile.MusicTrack1.AddItem "45 = Large Metroid"
Smile.MusicTrack1.AddItem "48 = Samus Theme"
End Sub





Public Sub DrawScreenDLL(StartingTile As Integer)
'layer 1
'take current tilearray and load to screen
'need to skip offscreen tiles
Dim TempPattern As Byte
Dim TempSheet As Byte
Dim TempOrientation As Byte
Dim TempFlipAxis(1) As Byte
Dim TempFlipped(1) As Integer
Dim TempProperties As Byte
Dim TotalNumberOfTiles As Integer
Dim RoomTileX As Long
Dim RoomTileY As Long

TotalNumberOfTiles = Figure_TotalNumberOfTiles(StartingTile, AreaWidth, AreaHeight)
If StartingTile = 0 Then Smile.Picture2.Cls

'REENABLE AFTER SPEED FIX!!!
DrawScreen2 StartingTile

'next line was used to exit if layer 1 is disabled... moved to inside the loop, to allow grid to show
TempPixelWide = AreaWidth * TileSize

For CurTile = (StartingTile) To (StartingTile + TotalNumberOfTiles)
'exit for if passed the last tile
If CurTile > UBound(RoomTile) Then Exit For

'all tiles
Figure_RoomTileXY RoomTileX, RoomTileY, CurTile, TileSize, TempPixelWide

If Smile.mnuLayer1.Checked = False Then GoTo EndingLayer1
'choose which sheet to get graphics from, based on pattern byte
'need to set x and y for curtiles
TempPattern = RoomTile(CurTile).PatternByte
TempSheet = TempPattern Mod 4

TempOrientation = ((RoomTile(CurTile).PatternByte) Mod 16) \ 4
Select Case TempOrientation
    Case 0: TempFlipAxis(0) = 0: TempFlipAxis(1) = 0: TempFlipped(0) = 1: TempFlipped(1) = 1
    Case 1: TempFlipAxis(0) = TileSize - 1: TempFlipAxis(1) = 0: TempFlipped(0) = -1: TempFlipped(1) = 1
    Case 2: TempFlipAxis(0) = 0: TempFlipAxis(1) = TileSize - 1: TempFlipped(0) = 1: TempFlipped(1) = -1
    Case 3: TempFlipAxis(0) = TileSize - 1: TempFlipAxis(1) = TileSize - 1: TempFlipped(0) = -1: TempFlipped(1) = -1
End Select
'***
'Could be sped up a bit
CrystalBlt Smile.Picture2.hdc, RoomTileX + TempFlipAxis(0), RoomTileY + TempFlipAxis(1), TileSize * TempFlipped(0), TileSize * TempFlipped(1), Smile.MenuPictureMask1.hdc, Smile.MenuPicture1.hdc, RoomTile(CurTile).BlockID, TempSheet, , , Do2

'shows slopes
EndingLayer1:
If Smile.mnuGrid.Checked = True Then ShowClipGrid RoomTileX, RoomTileY
'whether or not to show a specific type of block in this rendering
If Smile.PatternPreview.Tag = "1" Then ShowTypePreview RoomTileX, RoomTileY
Next CurTile

'repetition of loop above
'needs to be here though, to allow drawing of grids larger than 1x1

'refigure totalnumberoftiles, since we may need to erase some earlier markings
'TotalNumberOfTiles = AreaHeight * AreaWidth

For CurTile = (StartingTile) To (StartingTile + TotalNumberOfTiles)
    'figure X and Y on graphic sheets
    If CurTile > UBound(RoomTile) Then Exit For
    'all tiles
    Figure_RoomTileXY RoomTileX, RoomTileY, CurTile, TileSize, TempPixelWide
    If Smile.mnuGrid.Checked = True Then ShowClipGrid2x2 RoomTileX, RoomTileY
Next CurTile

'show scroll area boxes if selected to do so, or in scroll editor
If Smile.mnuShowScrollAreas.Checked = True Then
    ShowScrollBoxes
Else
    If Smile.mnuScrollEditor.Checked = True Then ShowScrollBoxes
End If

If StartingTile = 0 Then Smile.Picture2.Refresh
CheckForErrors
End Sub







Public Sub BitDescriptions(AreaByte As Byte, BossEventByte As Byte, BitType As Byte)
Dim BD(0 To 7) As String
'bit type as follows
'0 for roomstates
'1 for animate tile


If BitType = 0 Then GoTo ROOMSTATEdes
If BitType = 1 Then GoTo ANIMATETILEdes
If BitType = 2 Then GoTo PALETTEFXdes
If BitType = 3 Then GoTo Cdes

ROOMSTATEdes:
If BossEventByte = 0 Then GoTo DoingEvents0 Else GoTo DoingBosses0
DoingEvents0:
GoTo FillBitBoxes
DoingBosses0:
Select Case AreaByte
    Case 0: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Bomb Torizo": BD(7) = ""
    Case 1: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Spore Spawn": BD(7) = "Kraid"
    Case 2: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "Golden Torizo": BD(6) = "Crocomire": BD(7) = "Ridley"
    Case 3: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "": BD(7) = "Phantoon"
    Case 4: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Botwoon": BD(7) = "Draygon"
    Case 5: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "": BD(7) = "Mother Brain"
    Case 6: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "": BD(7) = "Ridley"
    Case 7: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "": BD(7) = ""
End Select
GoTo FillBitBoxes

ANIMATETILEdes:
Select Case AreaByte
    Case 0: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "Lava": BD(5) = "Ocean": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 1: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "Mouth": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 2: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 3: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "Monitor": BD(4) = "Conveyer-left": BD(5) = "Conveyer-right": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 4: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "Quicksand-falling": BD(5) = "Quicksand-ceiling": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 5: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 6: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
    Case 7: BD(0) = "": BD(1) = "": BD(2) = "": BD(3) = "": BD(4) = "": BD(5) = "": BD(6) = "Spikes (ver)": BD(7) = "Spikes (hor)"
End Select
GoTo FillBitBoxes

PALETTEFXdes:
Select Case AreaByte
    Case 0: BD(0) = "Flash-orange": BD(1) = "?": BD(2) = "Flash-yellow2": BD(3) = "Flash-yellow1": BD(4) = "Glow-red/blue": BD(5) = "Flash-yellow": BD(6) = "Pulse-red": BD(7) = "Stay-grey"
    Case 1: BD(0) = "?": BD(1) = "?": BD(2) = "?": BD(3) = "?": BD(4) = "Spore Spawn": BD(5) = "Glow-red/orange": BD(6) = "Glow-pink/purple": BD(7) = "Glow-blue"
    Case 2: BD(0) = "?": BD(1) = "?": BD(2) = "?": BD(3) = "Glow4": BD(4) = "Glow3": BD(5) = "Glow2": BD(6) = "Glow1": BD(7) = "HEAT BIT"
    Case 3: BD(0) = "?": BD(1) = "?": BD(2) = "?": BD(3) = "?": BD(4) = "?": BD(5) = "?": BD(6) = "?": BD(7) = "Glow-green"
    Case 4: BD(0) = "?": BD(1) = "?": BD(2) = "?": BD(3) = "?": BD(4) = "?": BD(5) = "Waterfall illusion 2": BD(6) = "Quicksand illusion 1": BD(7) = "Quicksand illusion 1"
    Case 5: BD(0) = "?": BD(1) = "Lights pulse-red": BD(2) = "FG pulse-red": BD(3) = "BG glow-red": BD(4) = "Glow-shutter red": BD(5) = "Fast pulse-red/blue light": BD(6) = "Slow pulse-red/blue light": BD(7) = "HEAT BIT"
    Case 6: BD(0) = "?": BD(1) = "?": BD(2) = "?": BD(3) = "?": BD(4) = "?": BD(5) = "?": BD(6) = "?": BD(7) = "?"
    Case 7: BD(0) = "?": BD(1) = "?": BD(2) = "?": BD(3) = "?": BD(4) = "?": BD(5) = "?": BD(6) = "?": BD(7) = "?"
End Select
GoTo FillBitBoxes

Cdes:
BD(0) = "Tide-small": BD(1) = "Tide-large": BD(2) = "?": BD(3) = "?": BD(4) = "??": BD(5) = "bg warp-line shift": BD(6) = "bg warp-cascade heat": BD(7) = "Flow-left"
GoTo FillBitBoxes

'all need this
FillBitBoxes:
For III = 0 To 7
    Select Case BitType
        Case 0: States1.Bit1(III).Caption = BD(III)
        Case 1: FX1_1.Bit1(III).Caption = BD(III)
        Case 2: FX1_1.Bit2(III).Caption = BD(III)
        Case 3: FX1_1.Bit3(III).Caption = BD(III)
    End Select
Next III

End Sub





Public Function TypeHex(KeyAscii As Integer) As Integer
If KeyAscii = 8 Then Exit Function  'backspace
If KeyAscii = 13 Then Exit Function 'enter

'numbers
If KeyAscii >= 48 And KeyAscii <= 57 Then GoTo Hexed
'a-f become A-F
If KeyAscii >= 97 And KeyAscii <= 102 Then KeyAscii = KeyAscii - 32
'A-F
If KeyAscii >= 65 And KeyAscii <= 70 Then GoTo Hexed
'not a match
KeyAscii = 0

Hexed:
TypeHex = KeyAscii
End Function



Public Sub NewBank()
'adds a bank to the game
Dim BankArray(0 To &H7FFF&) As Byte
Dim spot As Long
Dim BankNumber As Byte

For spot = 0 To &H7FFF
BankArray(spot) = 255
Next spot

Open needslash For Binary As #1
    If (LOF(1) \ &H8000&) + &H80& > 255 Then GoTo TooManyBanks
    BankNumber = (LOF(1) \ &H8000&) + &H80&
    Put #1, LOF(1) + 1, BankArray
Close #1
    MsgBox "The bank you have created is $" & Right$("00" & Hex$(BankNumber), 2) & "."
Exit Sub

TooManyBanks:
MsgBox "This ROM already is at Bank $FF.  No more can be added.", vbCritical, "Whoops!"
End Sub




Public Sub ShowTypePreview(ByVal CurrentX, ByVal CurrentY)
'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
If RoomTile(CurTile).PatternByte \ 16 = Smile.VScroll1.Value Then
    'DrawSquare Smile.Picture2.hdc, CurrentX + 1, CurrentY + 1, CurrentX + TileSize - 1, CurrentY + TileSize - 1
    Smile.Picture2.ForeColor = BOXHIGH
    DrawSquare Smile.Picture2.hdc, CurrentX + 4, CurrentY + 4, CurrentX + TileSize - 4, CurrentY + TileSize - 4
    DrawLine Smile.Picture2.hdc, CurrentX, CurrentY, CurrentX + TileSize, CurrentY + TileSize
    DrawLine Smile.Picture2.hdc, CurrentX, CurrentY + TileSize, CurrentX + TileSize, CurrentY
    
    
End If
End Sub

Public Function Offset2ThreePoint(Offset As Long, Optional StartBank As Long = &HC0000) As ThreeByte
Dim OffsetString As String * 6
Dim Fake3Byte(1 To 3) As Integer   'prevent overflow while changing values
Dim OverflowToBank As Long   'if we have to lower Byte2 by the banksize, then that gets added to the bank

'turn to hex string
OffsetString = Right$("00000000" & Hex$(Offset), 6)
'Byte1
Fake3Byte(1) = Val("&H" & Right$(OffsetString, 2))
'Byte2
Fake3Byte(2) = Val("&H" & Mid$(OffsetString, 3, 2))
If Fake3Byte(2) > &H7F Then
    Fake3Byte(2) = Fake3Byte(2) - &H80
    OverflowToBank = &H8000&
Else
    OverflowToBank = 0
End If
'Byte3 (Bank Bye)
Fake3Byte(3) = Val("&H" & Left$(OffsetString, 2))
'&H0C0000 is the offset start of a bank of specific information
'to switch to another bank, I'd need to input that data seperately
Fake3Byte(3) = (Val(StartBank) + Val(OverflowToBank)) \ Val("&H8000&")
If Fake3Byte(3) < &H80 Then Fake3Byte(3) = Fake3Byte(3) + &H80
If Fake3Byte(2) < &H80 Then Fake3Byte(2) = Fake3Byte(2) + &H80
'put values into function value
Offset2ThreePoint.Byte1 = Val(Fake3Byte(1))
Offset2ThreePoint.Byte2 = Val(Fake3Byte(2))
Offset2ThreePoint.Byte3 = Val(Fake3Byte(3))

End Function

Public Sub RefreshMapHighlight()
Mapper1.Target(3).Width = (Val("&H" & RoomHeader1.WidthText1) * 8) + 1
Mapper1.Target(3).Height = (Val("&H" & RoomHeader1.HeightText1) * 8) + 1
Mapper1.Target(3).Left = Val("&H" & RoomHeader1.XText1) * 8
Mapper1.Target(3).Top = (Val("&H" & RoomHeader1.YText1) * 8) + 8
End Sub


Public Sub AddSubtractEnemiesPLMs()
'show form for user
AddSubtractEP.Show 1
'refresh enemy boxes
For I = 0 To Smile.EnemyBox.UBound
    If I <= UBound(EnemySet) Then Smile.EnemyBox(I).Enabled = True Else Smile.EnemyBox(I).Enabled = False
    If Smile.EnemyBox(I).Enabled = True Then
        Smile.EnemyBox(I).Visible = Smile.mnuEnemies.Checked
        If EnemySet(I).Species = 0 Then
            EnemySet(I).Species = 1
            EnemySet(I).Special = &H2000
            RefreshEnemy Val(I)
            EnemySet(I).X = 16
            EnemySet(I).Y = 16
            Smile.EnemyBox(I).Move 8, 8
        End If
    Else
        Smile.EnemyBox(I).Visible = False
    End If
Next I
    If UBound(EnemySet) = 0 And EnemySet(0).Species = 1 Then Smile.EnemyBox(0).Visible = False: EnemySet(0).Species = Val("&HFFFF")
    
'refresh PLM boxes
For I = 0 To Smile.PLMBox.UBound
    If I <= UBound(PLMSet) Then Smile.PLMBox(I).Enabled = True Else Smile.PLMBox(I).Enabled = False
    If Smile.PLMBox(I).Enabled = True Then
        Smile.PLMBox(I).Visible = Smile.mnuViewPLM.Checked
        If PLMSet(I).Type = 0 Then
            PLMSet(I).Type = 1
            RefreshPLM Val(I)
            PLMSet(I).X = 16
            PLMSet(I).Y = 16
            Smile.PLMBox(I).Move 8, 8
        End If
    Else
        Smile.PLMBox(I).Visible = False
    End If
Next I
    If UBound(PLMSet) = 0 And PLMSet(0).Type = 1 Then Smile.PLMBox(0).Visible = False: PLMSet(0).Type = Val("&H0000")

End Sub


Public Sub PopThePopper(PName As String, POffset As Long, PType As Byte)
Dim SecondArgument

'CRE
If PType = 0 Then
    SecondArgument = "Pointers for this CRE sheet are located at:" & vbCrLf & vbCrLf
    SecondArgument = SecondArgument & "   Table   = $" & Right$("000000" & Hex$(CRETTableOffset), 6) & vbCrLf
    SecondArgument = SecondArgument & "   Tiles   = $" & Right$("000000" & Hex$(POffset), 6) & vbCrLf & vbCrLf
    SecondArgument = SecondArgument & "Palettes for CRE come from the Scenery Graphic Palette"
    
    MsgBox SecondArgument, vbInformation, "Pointer Pop-Up"
    
End If
'URE
If PType = 1 Then
    SecondArgument = "Pointers for this graphics sheet are located at:" & vbCrLf & vbCrLf
    SecondArgument = SecondArgument & "   Table   = $" & Hex$(GetAddressOfGSP(Val(Smile.StateGraphicSetCombo1.Text)) - ROM_HEADER) & " (points to: $" & Right$("000000" & Hex$(URETTableOffset), 6) & ")" & vbCrLf
    SecondArgument = SecondArgument & "   Tiles   = $" & Hex$(GetAddressOfGSP(Val(Smile.StateGraphicSetCombo1.Text)) - ROM_HEADER + 3) & " (points to: $" & Right$("000000" & Hex$(POffset), 6) & ")" & vbCrLf
    SecondArgument = SecondArgument & "   Palette = $" & Hex$(GetAddressOfGSP(Val(Smile.StateGraphicSetCombo1.Text)) - ROM_HEADER + 6) & " (points to: $" & Right$("000000" & Hex$(GetPaletteOffset(Val(Smile.StateGraphicSetCombo1.ListIndex) + 1)), 6) & ")" & vbCrLf
    
    MsgBox SecondArgument, vbInformation, "Pointer Pop-Up"
End If

End Sub




Public Sub ReadRoom(Offset As Long, Optional MyTestCode As String = "E5E6", Optional MyTestCodeNum As Byte = 1)
'Open only enough to make needed changes
MsgBox ""
Exit Sub
If needslash = "" Then Exit Sub
Dim FoundCode As Boolean
Dim MyHeader As mdb_Header
'Dim MyState As mdb_RoomState
Dim TempThree As ThreeByte
Dim TestCode As Integer
Dim TestLength As Byte
Dim TempByte(1) As Byte
Dim TempTestLength As Byte
Dim TestCodeMatch(0 To 9) As Byte
Dim TestCodeIndex As Byte
Dim TestCodeValue As Byte
Offset = Offset + ROM_HEADER + 1
Smile.TestCodeList1.Clear
Open needslash For Binary As #1
    Get #1, Offset, MyHeader

    Offset = Offset + 11    'after header
    Do
        Get #1, Offset + TempTestLength, TestCode
            Select Case Hex$(TestCode)
                Case "E5E6": TestLength = 2: TestCodeMatch(0) = TestCodeMatch(0) + 1: TestCodeIndex = 0
                Case "E5EB": TestLength = 6: TestCodeMatch(1) = TestCodeMatch(1) + 1: TestCodeIndex = 1
                Case "E5FF": TestLength = 4: TestCodeMatch(2) = TestCodeMatch(2) + 1: TestCodeIndex = 2
                Case "E612": TestLength = 5: TestCodeMatch(3) = TestCodeMatch(3) + 1: TestCodeIndex = 3
                Case "E629": TestLength = 5: TestCodeMatch(4) = TestCodeMatch(4) + 1: TestCodeIndex = 4
                Case "E640": TestLength = 4: TestCodeMatch(5) = TestCodeMatch(5) + 1: TestCodeIndex = 5
                Case "E652": TestLength = 4: TestCodeMatch(6) = TestCodeMatch(6) + 1: TestCodeIndex = 6
                Case "E669": TestLength = 4: TestCodeMatch(7) = TestCodeMatch(7) + 1: TestCodeIndex = 7
                Case "E678": TestLength = 4: TestCodeMatch(8) = TestCodeMatch(8) + 1: TestCodeIndex = 8
                Case Else: MsgBox "TestCode = " & Hex$(TestCode): Close #1: Exit Sub
            End Select
                                    
            Smile.TestCodeList1.AddItem Hex$(TestCode) & CodeDescription(Hex$(TestCode)) & " " & TestCodeMatch(TestCodeIndex)
            'if code found, we finish the list, but don't add to the offset, so we use temptestlength
            If FoundCode = False Then Offset = Offset + TestLength
            If FoundCode = True Then TempTestLength = TempTestLength + TestLength
            'in case code not available, will exit on last code
            If Hex$(TestCode) = MyTestCode And TestCodeMatch(TestCodeIndex) = MyTestCodeNum Then
                FoundCode = True
                'events
                If Hex$(TestCode) = "E612" Then
                    Get #1, Offset - 3, TestCodeValue
                End If
                'bosses
                If Hex$(TestCode) = "E629" Then
                    Get #1, Offset - 3, TestCodeValue
                End If
            End If


StandardState:
'only one here
If Hex$(TestCode) = "E5E6" Then
States1.Frame1(9).ZOrder 0
End If

DoorState:
'only one here
If Hex$(TestCode) = "E5EB" Then
States1.Frame1(3).ZOrder 0
End If

ItemState:
'tourianboss01 E5FF
'morph E640
'morph + missile E652
'powerbombs E669
'speedbooster E678
If Hex$(TestCode) = "E5FF" Or Hex$(TestCode) = "E640" Or Hex$(TestCode) = "E652" Or Hex$(TestCode) = "E669" Or Hex$(TestCode) = "E678" Then
End If

BossState:
'even though we only save one, both should be loaded, in case user changes state type
If Hex$(TestCode) = "E629" Or Hex$(TestCode) = "E612" Then
    Dim MyTempArray(0 To 7) As Byte
    ToBin TestCodeValue, MyTempArray(0)
    For III = 0 To 7
        States1.Bit1(III).Value = MyTempArray(III)
    Next III
States1.Frame1(0).ZOrder 0
End If

EventState:
'even though we only save one, both should be loaded, in case user changes state type
If Hex$(TestCode) = "E612" Or Hex$(TestCode) = "E629" Then
    States1.EventCombo1.Text = States1.EventCombo1.List(TestCodeValue)
States1.Frame1(1).ZOrder 0
End If


    Loop Until TestLength = 2
    Smile.TestCodeList1.Tag = 1
    Smile.TestCodeList1.Text = MyTestCode & CodeDescription(MyTestCode) & " " & MyTestCodeNum
    'Smile.TestCodeList1.Tag = 0
    
    'if special state (ie- not last one)
    If MyTestCode <> "E5E6" Then
        Get #1, Offset - 2, TempByte()
        TempThree.Byte1 = TempByte(0)
        TempThree.Byte2 = TempByte(1)
        TempThree.Byte3 = Val("&H8F&")
        Offset = ThreePoint2Offset(TempThree) + ROM_HEADER + 1
    End If

    Get #1, Offset, MyState

'POINTER EDITOR
MyState.LevelData.Byte1 = MyState.LevelData.Byte1 Xor 255
MyState.LevelData.Byte2 = MyState.LevelData.Byte2 Xor 255
MyState.LevelData.Byte3 = MyState.LevelData.Byte3 Xor 255
    Put #1, Offset, MyState
Close #1
End Sub


Public Sub FFFFThisROM()
MsgBox "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
FastRead = True

FastRead = False
End Sub




Public Sub RefreshMap()
Dim CurrentX As Integer
Dim CurrentY As Integer

CurrentX = 0
CurrentY = 0
OverHalf = 0
For I = 0 To 2047
    MenuX = (AreaMap(I).Tile Mod 16) * 8
    MenuY = (AreaMap(I).Tile \ 16) * 8

DrawMapTile Val(I), CurrentX, CurrentY, Val(MenuX), Val(MenuY)

CurrentX = CurrentX + 8
If CurrentX >= 256 + OverHalf Then CurrentY = CurrentY + 8: CurrentX = 0 + OverHalf
If CurrentY >= 256 Then OverHalf = 256: CurrentY = 0: CurrentX = 0 + OverHalf
Next I
End Sub



Public Sub UpdateMapSaveGroups()
'load each area, one by one to check for groups
'save group data to a temp file to be imported
'save group numbers to appropriate spot
Dim MapGroupStart As Long               'location of our group
Dim MapGroupsI(0 To 6) As Integer       'integer version of MapGroups (used only because 256 is an option until we reduce by 1)
Dim MapGroups(0 To 6) As Byte           '# of groups in an area
Dim MapGroupIndexes() As Byte           'used to write to a temp file
Dim TempAreaMap(0 To 2047) As MapType   'temporary map of an area
Dim AreaI As Integer
Dim AreaIAdjuster As Integer            'switch 1st 2 areas around
Dim GroupI As Integer
Dim TileI As Integer

MapGroupStart = Val("&H1A8000") 'start of all map data
ReDim MapGroupIndexes(0 To 0) As Byte

Open needslash For Binary As #1
For AreaI = 0 To 6
    Select Case AreaI
        Case 0: AreaIAdjuster = &H1000
        Case 1: AreaIAdjuster = -&H1000
        Case Else: AreaIAdjuster = 0
    End Select
    Get #1, MapGroupStart + (AreaI * &H1000) + AreaIAdjuster + ROM_HEADER + 1, TempAreaMap()
    For GroupI = 0 To 255
        For TileI = 0 To 7
            If TempAreaMap((GroupI * 8) + TileI).Tile <> &H1F Then
                MapGroupsI(AreaI) = MapGroupsI(AreaI) + 1
                ReDim Preserve MapGroupIndexes(0 To UBound(MapGroupIndexes) + 1) As Byte
                MapGroupIndexes(UBound(MapGroupIndexes) - 1) = GroupI
                GoTo SkipRestOfGroup
            End If
        Next TileI
SkipRestOfGroup:
    Next GroupI
Next AreaI
Close #1
'check for 0 groups... check for too many groups
If UBound(MapGroupIndexes) > 0 Then ReDim Preserve MapGroupIndexes(0 To UBound(MapGroupIndexes) - 1) As Byte
If UBound(MapGroupIndexes) > &H500& Then
    MsgBox "You've done some pretty extensive map changes." & vbCrLf & vbCrLf & "Over $500 bytes are being saved." & vbCrLf & "This will overwrite some SRAM and seriously screw up your rom." & vbCrLf & vbCrLf & "Groups will not be saved." & vbCrLf & "Simplify your maps.", vbExclamation, "Oops!  $" & Hex$(UBound(MapGroupIndexes)) & " groups!"
    Exit Sub
End If
'convert mapgroups to bytes
For I = 0 To 6
    If MapGroupsI(I) > 0 Then MapGroups(I) = Val(MapGroupsI(I) - 1)
Next I
Open needslash For Binary As #1
    Put #1, &H8131& + ROM_HEADER + 1, MapGroups()
    Put #1, &HF800& + ROM_HEADER + 1, MapGroupIndexes()
Close #1
End Sub


Public Sub LoadMiscForm1(FormType As Byte, Optional ByteValue As Integer = 0)
MiscForm1Type = FormType
MiscForm1Byte = ByteValue
MiscForm1.Show 1
End Sub




Public Sub AdjustQuickTemp()
'adjusts SRM and SMC of QuickTemp, as needed
Dim SRMBytes(0 To &H32D) As Integer     'slot one in the SRM
Dim SRMHeader As Byte
Dim SRMChecksum As Integer
Dim SRCChecksumLong As Long             'temp checksum (long) to prevent overflow error
Dim SRMChecksumXor As Integer
Dim TempZero As Integer                 'to zero out time with integers
Dim TempHexByte As Byte                      'to place &A9 as a byte
Dim TempSamusXY(0 To 1) As Integer         'X is 0, Y is 1
Dim TempStateValue As String * 4
Dim TempBossState As Integer
Dim TempEventState As Integer
Dim TempStateInteger As Integer
Dim TempStateByte As Byte
Dim MyTempArray2(0 To 7) As Byte


SRM_HEADER = &H10
TempZero = 0

TempSamusXY(0) = MapTileNumber Mod (Val("&H" & RoomHeader1.WidthText1.Text) * 16)
TempSamusXY(1) = MapTileNumber \ (Val("&H" & RoomHeader1.WidthText1.Text) * 16)


'XXXXXXXXXXX NEED TO CHANGE OFFSET LATER TO TESTROOM FOLDER
'----------------------------------------------------------
'GRAB STARTING CONDITIONS FOR OUR TEST---------------------
'----------------------------------------------------------
Open App.Path & "\SMILE.ini" For Binary As #3
    Get #3, 60, SRMVariables()
Close #3

'----------------------------------------------------------
'EDIT THE ROM----------------------------------------------
'----------------------------------------------------------
'add the ASM
'adjust the ASM
'set starting conditions
Open App.Path & "\files\temp\quickmet.smc" For Binary As #3
    'avoid damage?
    If SRMVariables(8) = &HFFFF Then
        TempHexByte = &HA9
        Put #3, &H85DF1 + ROM_HEADER + 1, TempHexByte
        Put #3, &H86889 + ROM_HEADER + 1, TempHexByte
        Put #3, &H86AEA + ROM_HEADER + 1, TempHexByte
        Put #3, &H875F3 + ROM_HEADER + 1, TempHexByte
    End If
    'debug mode?
    TempHexByte = Val("&H" & Right$("0000" & Hex$(SRMVariables(9)), 2))
    Put #3, &H4 + ROM_HEADER + 1, TempHexByte   'FF according to deskjockey's notes though???
Close #3
'prevent HP being 0 on start up
If SRMVariables(0) = 0 Then SRMVariables(0) = &H63
'----------------------------------------------------------
'EDIT THE SRM FILE-----------------------------------------
'----------------------------------------------------------
Open App.Path & "\files\temp\quickmet.srm" For Binary As #3
    'energy, then max
    Put #3, &H20 + SRM_HEADER + 1, SRMVariables(0)
    Put #3, , SRMVariables(0)
    'reserve MAX, then reserves
    Put #3, &H32 + SRM_HEADER + 1, SRMVariables(1)
    Put #3, , SRMVariables(1)
    'missiles, then max
    Put #3, &H24 + SRM_HEADER + 1, SRMVariables(2)
    Put #3, , SRMVariables(2)
    'super missiles, then max
    Put #3, &H28 + SRM_HEADER + 1, SRMVariables(3)
    Put #3, , SRMVariables(3)
    'power bombs, then max
    Put #3, &H2C + SRM_HEADER + 1, SRMVariables(4)
    Put #3, , SRMVariables(4)
    'equipment, then enabled
    Put #3, &H0 + SRM_HEADER + 1, SRMVariables(5)
    Put #3, , SRMVariables(5)
    'beams, then enabled
    Put #3, &H4 + SRM_HEADER + 1, SRMVariables(6)
    Put #3, , SRMVariables(6)
    'maps revealed or not (1 byte each.... 2 at a time)
    Put #3, &H148 + SRM_HEADER + 1, SRMVariables(7) 'crateria/brinstar
    Put #3, , SRMVariables(7)   'norfair/wrecked ship
    Put #3, , SRMVariables(7)   'maridia/norfair
    Put #3, , SRMVariables(7)   'ceres/debug????
    'set the timer to 0000 for frame, seconds, minutes, hours
    Put #3, &H38 + SRM_HEADER + 1, TempZero
    Put #3, , TempZero
    Put #3, , TempZero
    Put #3, , TempZero
    'adjust quickmet for boss/event states of the room, if needed
    'MsgBox "QuickMetStates"
    TempStateValue = Left$(Smile.TestCodeList1.Text, 4)
    'if a boss state, adjust for area and for which boss bit was set
    If TempStateValue = "E629" Then
        For III = 0 To 7
            MyTempArray2(III) = States1.Bit1(III).Value
        Next III
        Put #3, &H78 + RoomHeader1.RegionCombo1.ListIndex + 1, FromBin(MyTempArray2(0))
    End If
    
    'if an event state, adjust for which event it was
    If TempStateValue = "E612" Then
        TempStateByte = States1.EventCombo1.ListIndex
        TempStateInteger = 0
FindCorrectEvent:
        If TempStateByte > 7 Then TempStateByte = TempStateByte - 8: TempStateInteger = TempStateInteger + 1: GoTo FindCorrectEvent
FoundCorrectEvent:
        'set the proper bit for this event, then save the byte to the correct location
        For III = 0 To 7
            MyTempArray2(III) = 0
        Next III
        MyTempArray2(7 - TempStateByte) = 1
        Put #3, &H70 + TempStateInteger + 1, FromBin(MyTempArray2(0))
    End If
    
    
    
    'RoomID was changed in Test Room
    'ScreenXY was changed in Test Room
    'LASTLY, adjusting the checksum so our SRM actually works
    Get #3, SRM_HEADER + 1, SRMBytes()
    For I = 0 To UBound(SRMBytes)
        SRMChecksumlong = SRMChecksumlong + SRMBytes(I)
    Next I
    'MsgBox Hex$(SRMChecksumlong)
    SRMChecksum = Val("&H" & Right$("0000" & Hex$(SRMChecksumlong), 4))
    'SRMChecksum = Val(SRMChecksumlong)
    SRMChecksumXor = SRMChecksum Xor &HFFFF
    Put #3, &H0 + 1, SRMChecksum
    Put #3, &H8 + 1, SRMChecksumXor
    Put #3, &H1FF0 + 1, SRMChecksum
    Put #3, &H1FF8 + 1, SRMChecksumXor
Close #3
End Sub

Public Function FigureFX1Data() As Boolean  'whether or not this is readable fx1
Dim ThisPointer As ThreeByte
Dim MyTempArray1(0 To 7) As Byte
Dim MyTempArray2(0 To 7) As Byte
Dim MyTempArray3(0 To 7) As Byte

ThisPointer.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(FX1Pointer), 4), 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(FX1Pointer), 4), 2) & "&")
ThisPointer.Byte3 = Val("&H83&")

'0000 = no pointer, so leave... otherwise, pointer form should make it > $7FFF
If ThisPointer.Byte1 = 0 And ThisPointer.Byte2 < &H80 Then
    FigureFX1Data = False
    Exit Function
Else
    FigureFX1Data = True
End If

Open needslash For Binary As #7
    Get #7, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, TempFX1
Close #7

End Function






Public Sub SaveFX1Data()
Dim ThisPointer As ThreeByte
Dim MyTempArray1(0 To 7) As Byte
Dim MyTempArray2(0 To 7) As Byte
Dim MyTempArray3(0 To 7) As Byte


'replace this in case the person changes the pointer to a good or a bad value?
'should refigure if it can save based on the new pointer
If DisplayFX1 = False Then Exit Sub

'find offset of pointer
ThisPointer.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(FX1Pointer), 4), 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(FX1Pointer), 4), 2) & "&")
ThisPointer.Byte3 = Val("&H83&")

'save FX1 properties
Open needslash For Binary As #7
    Put #7, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, TempFX1
Close #7
End Sub




Public Sub LanguageChange(TranslateAs As String, Index As Integer)
Dim LanguagePath As String
Dim Babel As String

LanguagePath = App.Path & "\files\languages\" & TranslateAs & ".txt"
If Index = Smile.mnuLanguage.UBound Then
    LanguagePath = App.Path & "\files\languages\Custom.txt"
End If

Open LanguagePath For Input As #7
    Input #7, Babel
    Smile.SMILECaption.Caption = Babel   'language name
'FILE MENUS
    Input #7, Babel
    Smile.mnuFile.Caption = Babel
    Input #7, Babel
    Smile.mnuOpen.Caption = Babel
    Input #7, Babel
    Smile.mnuSaveRoom.Caption = Babel
    Input #7, Babel
    Smile.mnuSpecial.Caption = Babel
    Input #7, Babel
    Smile.mnuLevelToBitmap(0).Caption = Babel
    
    'Input #7, Babel
    'Smile.mnuLevelToBitmap(2).Caption = Babel
    
    Input #7, Babel
    Smile.mnuPreferences.Caption = Babel
    Input #7, Babel
    Smile.mnuLanguages.Caption = Babel
    Input #7, Babel
    Smile.mnuPreferencesPalettes.Caption = Babel
    Input #7, Babel
    Smile.mnuDoSnap.Caption = Babel
    Input #7, Babel
    Smile.mnuHotkeys.Caption = Babel
    Input #7, Babel
    Smile.mnuExternalPrograms.Caption = Babel
    Input #7, Babel
    Smile.mnuTestRoomProperties.Caption = Babel
    Input #7, Babel
    Smile.mnuEmulator.Caption = Babel
    Input #7, Babel
    Smile.mnuSRMFolder.Caption = Babel
    Input #7, Babel
    Smile.mnuExit.Caption = Babel
'EDIT MENUS
    Input #7, Babel
    Smile.mnuEdit.Caption = Babel
    Input #7, Babel
    Smile.mnuRoomProperties.Caption = Babel
    Input #7, Babel
    Smile.mnuStateProperties.Caption = Babel
    Input #7, Babel
    Smile.mnuRoomVarData.Caption = Babel
    Input #7, Babel
    Smile.mnuFX1.Caption = Babel
    Input #7, Babel
    Smile.mnuPointerMenu.Caption = Babel
    Input #7, Babel
    Smile.mnuLoadPoints.Caption = Babel
    Input #7, Babel
    Smile.mnuSamusPoses.Caption = Babel
    Input #7, Babel
    Smile.mnuSpecial.Caption = Babel
    Input #7, Babel
    Smile.mnuFillArea.Caption = Babel
    Input #7, Babel
    Smile.mnuGameBehavior.Caption = Babel
    Input #7, Babel
    Smile.mnuAddSubtractEP.Caption = Babel
'VIEW MENUS
    Input #7, Babel
    Smile.mnuPreferencesView.Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSize.Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(0).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(1).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(2).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(4).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(5).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(6).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(8).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(9).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(10).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(11).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(12).Caption = Babel
    Input #7, Babel
    Smile.mnuEditorSizes(13).Caption = Babel
    Input #7, Babel
    Smile.mnuTileSize.Caption = Babel
    Input #7, Babel
    Smile.mnuViewOptions.Caption = Babel
    Input #7, Babel
    Smile.mnuBrightness.Caption = Babel
    Input #7, Babel
    Smile.mnuLightBulb(0).Caption = Babel
    Input #7, Babel
    Smile.mnuLightBulb(1).Caption = Babel
    Input #7, Babel
    Smile.mnuLightBulb(2).Caption = Babel
    Input #7, Babel
    Smile.mnuTransparentBTS.Caption = Babel
    Input #7, Babel
    Smile.mnuShowScrollAreas.Caption = Babel
    Input #7, Babel
    Smile.mnuDrawPLMBox.Caption = Babel
    Input #7, Babel
    Smile.mnuLayer1.Caption = Babel
    Input #7, Babel
    Smile.mnuLayer2.Caption = Babel
    Input #7, Babel
    Smile.mnuGrid.Caption = Babel
    Input #7, Babel
    Smile.mnuPLM.Caption = Babel
    Input #7, Babel
    Smile.mnuEnemies.Caption = Babel
    Input #7, Babel
    Smile.mnuShowAll.Caption = Babel
'TOOLS MENUS
    Input #7, Babel
    Smile.mnuTools.Caption = Babel
    Input #7, Babel
    Smile.mnuLevelEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuScrollEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuExceptionEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuMapEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuGraphicsEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuSpecial_Layer2.Caption = Babel
    Input #7, Babel
    Smile.mnuBackgroundEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuLayer2Scroll.Caption = Babel
    Input #7, Babel
    Smile.mnuAddLayer2(0).Caption = Babel
    Input #7, Babel
    Smile.mnuAddLayer2(1).Caption = Babel
    Input #7, Babel
    Smile.mnuBeautySalon.Caption = Babel
    Input #7, Babel
    Smile.mnuTextEditor.Caption = Babel
    Input #7, Babel
    Smile.mnuROMHeader.Caption = Babel
    Input #7, Babel
    Smile.mnuAddRemoveHeader(0).Caption = Babel
    Input #7, Babel
    Smile.mnuAddRemoveHeader(1).Caption = Babel
    Input #7, Babel
    Smile.mnuExpandRom.Caption = Babel
    Input #7, Babel
    Smile.mnuIPSPatcher(0).Caption = Babel
    Input #7, Babel
    Smile.mnuIPSPatcher(2).Caption = Babel
    Input #7, Babel
    Smile.mnuIPSPatcher(3).Caption = Babel
    Input #7, Babel
    Smile.mnuIPSPatcher(4).Caption = Babel
    Input #7, Babel
    Smile.mnuFileCompare.Caption = Babel
    Input #7, Babel
    Smile.mnuPlugins.Caption = Babel
'QUICKMET
    Input #7, Babel
    Smile.mnuRun.Caption = Babel
    Input #7, Babel
    Smile.mnuRunEmulator.Caption = Babel
'HELP MENUS
    Input #7, Babel
    Smile.mnuHelp.Caption = Babel
    Input #7, Babel
    Smile.mnuAbout.Caption = Babel
    Input #7, Babel
    Smile.mnuContact.Caption = Babel
    Input #7, Babel
    'Smile.mnuCheckForUpdates.Caption = Babel
    Input #7, Babel
    'Smile.mnuSOLA.Caption = Babel
    Input #7, Babel
    Smile.mnuOffscreenEnemies.Caption = Babel
    Input #7, Babel
    Smile.mnuOffscreenPLM.Caption = Babel
 'POP UP MENUS
    Input #7, Babel
    Smile.mnuEnemy.Caption = Babel
    Input #7, Babel
    Smile.mnuEnemyMenu.Caption = Babel
    Input #7, Babel
    Smile.mnuSplitShip.Caption = Babel
    Input #7, Babel
    Smile.mnuPLM.Caption = Babel
    Input #7, Babel
    Smile.mnuPLMType.Caption = Babel
    Input #7, Babel
    Smile.mnuDoor.Caption = Babel
    Input #7, Babel
    Smile.mnuDoorPopOptions(0).Caption = Babel
    Input #7, Babel
    Smile.mnuDoorPopOptions(1).Caption = Babel
    Input #7, Babel
    Smile.mnuJumpToRoomOptions(0).Caption = Babel
    Input #7, Babel
    Smile.mnuJumpToRoomOptions(1).Caption = Babel
    Input #7, Babel
    Smile.mnuDoorPopOptions(2).Caption = Babel
    Input #7, Babel
    Smile.mnuPercentKey.Caption = Babel
    Input #7, Babel
    Smile.mnuOpenMostRecentRoom.Caption = Babel
Close #7
End Sub

Public Sub CheckForErrors()
'after openning a room (or refreshing it), we check all our ignored errors and list them (if there are any)
Dim ErrorString As String
Dim Triggered As Boolean    'if any errors detected, show the error message
Dim ErrorDescription(0 To 9) As String

ErrorDescription(0) = "[0] Subscript out of Range = Most likely caused by overwriting the graphic sheet." & vbCrLf
ErrorDescription(1) = "[1]" & vbCrLf
ErrorDescription(2) = "[2]" & vbCrLf
ErrorDescription(3) = "[3]" & vbCrLf
ErrorDescription(4) = "[4]" & vbCrLf
ErrorDescription(5) = "[5]" & vbCrLf
ErrorDescription(6) = "[6]" & vbCrLf
ErrorDescription(7) = "[7]" & vbCrLf
ErrorDescription(8) = "[8]" & vbCrLf
ErrorDescription(9) = "[9]" & vbCrLf

ErrorString = "The following errors were triggered when opening this room." & vbCrLf & vbCrLf
For I = 0 To UBound(SkippedError)
    If SkippedError(I) = True Then
        Triggered = True
        ErrorString = ErrorString & ErrorDescription(I)
    End If
    SkippedError(I) = False
Next I

'show error report
If Triggered = True Then MsgBox ErrorString, vbCritical, "SMILE ran into some problems!"
End Sub


Public Sub FixMissingFiles()
'original files that people sometimes overwrite (intentionally)
'these get overwritten upon unzipping a new smile
'smile will check to see if they exist and decide whether or not they need to be "created"
Dim OPath As String 'path of original files
Dim FPATH As String 'destination path

FPATH = App.Path & "\files\"
OPath = App.Path & "\files\ORIGINALS\"

If FileExists(FPATH & "mdb.txt") = False Then MoveOriginalFile "mdb.txt"
If FileExists(FPATH & "level_entries.txt") = False Then MoveOriginalFile "level_entries.txt"
If FileExists(FPATH & "special_gfx.txt") = False Then MoveOriginalFile "special_gfx.txt"
If FileExists(FPATH & "menus\1.val", True) = False Then MoveOriginalFile "menus\1.val"
For I = 2 To 29
    If FileExists(FPATH & "menus\" & I & ".val") = False Then MoveOriginalFile "menus\" & I & ".val"
Next I
End Sub

