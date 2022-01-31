VERSION 5.00
Begin VB.Form Mapper1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   ClientHeight    =   4200
   ClientLeft      =   120
   ClientTop       =   120
   ClientWidth     =   9600
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   9600
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton TaskCommand1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      DownPicture     =   "Mapper1.frx":0000
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   2
      Left            =   9330
      Picture         =   "Mapper1.frx":027E
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   0
      Width           =   270
   End
   Begin VB.CommandButton KejMapCommand1 
      BackColor       =   &H0000FF00&
      Caption         =   "Kej Map"
      Height          =   255
      Left            =   2460
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   5145
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CheckBox RevealHiddenTilesCheck1 
      BackColor       =   &H00FF8080&
      Caption         =   "Reveal Hidden Tiles"
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Left            =   2565
      TabIndex        =   6
      Top             =   5505
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.CheckBox ShowStation1 
      BackColor       =   &H00FF8080&
      Caption         =   "Mapping station reveals tile"
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Left            =   2550
      TabIndex        =   5
      Top             =   5745
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.CheckBox MoveRoomCheck1 
      BackColor       =   &H00FF8080&
      Caption         =   "Move  Room's X/Y With On Next Click (or hold ""M"")"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   495
      Left            =   2550
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   6000
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.CommandButton LoadMap 
      Caption         =   "Load Map"
      Height          =   255
      Left            =   60
      TabIndex        =   3
      Top             =   5490
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton SaveMap 
      Caption         =   "Save Map"
      Height          =   255
      Left            =   60
      TabIndex        =   2
      Top             =   5730
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   128
      TabIndex        =   10
      Top             =   360
      Width           =   1920
      Begin VB.ComboBox MapTypeCombo1 
         Height          =   315
         ItemData        =   "Mapper1.frx":0506
         Left            =   0
         List            =   "Mapper1.frx":0522
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   1590
         Width           =   630
      End
      Begin VB.PictureBox MapPicture3 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   720
         Left            =   405
         ScaleHeight     =   46
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   46
         TabIndex        =   12
         Top             =   705
         Width           =   720
      End
      Begin VB.PictureBox MapMenu1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000080&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1920
         Left            =   0
         ScaleHeight     =   128
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   128
         TabIndex        =   11
         Top             =   1920
         Width           =   1920
      End
      Begin VB.CommandButton MapCommand1 
         Height          =   975
         Index           =   1
         Left            =   645
         TabIndex        =   14
         Top             =   578
         Width           =   240
      End
      Begin VB.CommandButton MapCommand1 
         Height          =   240
         Index           =   0
         Left            =   270
         TabIndex        =   13
         Top             =   945
         Width           =   990
      End
      Begin VB.Label MapColorLabel 
         Height          =   315
         Index           =   0
         Left            =   615
         TabIndex        =   19
         Top             =   1575
         Width           =   300
      End
      Begin VB.Label MapColorLabel 
         Height          =   315
         Index           =   1
         Left            =   915
         TabIndex        =   18
         Top             =   1575
         Width           =   300
      End
      Begin VB.Label MapColorLabel 
         Height          =   315
         Index           =   2
         Left            =   1215
         TabIndex        =   17
         Top             =   1575
         Width           =   300
      End
      Begin VB.Label MapColorLabel 
         Height          =   315
         Index           =   3
         Left            =   1515
         TabIndex        =   16
         Top             =   1575
         Width           =   300
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   2
         Left            =   1320
         Picture         =   "Mapper1.frx":053E
         Stretch         =   -1  'True
         Tag             =   "Options"
         ToolTipText     =   "Options"
         Top             =   0
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   1
         Left            =   660
         Picture         =   "Mapper1.frx":0A4D
         Stretch         =   -1  'True
         Tag             =   "Save Map"
         ToolTipText     =   "Save Map"
         Top             =   0
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   0
         Left            =   0
         Picture         =   "Mapper1.frx":1012
         Stretch         =   -1  'True
         Tag             =   "Refresh"
         ToolTipText     =   "Refresh"
         Top             =   0
         Width           =   480
      End
   End
   Begin VB.PictureBox MapPicture2 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00400000&
      BorderStyle     =   0  'None
      FillColor       =   &H00FBC593&
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FBC593&
      Height          =   3840
      Left            =   1920
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   512
      TabIndex        =   0
      Top             =   360
      Width           =   7680
      Begin VB.PictureBox MapMagnify1 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         DrawStyle       =   2  'Dot
         Enabled         =   0   'False
         Height          =   1080
         Left            =   7650
         ScaleHeight     =   72
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   120
         TabIndex        =   1
         Top             =   3825
         Width           =   1800
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   240
         Index           =   3
         Left            =   720
         Top             =   720
         Width           =   240
      End
      Begin VB.Image ShipIconImage1 
         Enabled         =   0   'False
         Height          =   120
         Left            =   4320
         Picture         =   "Mapper1.frx":1602
         Top             =   360
         Width           =   240
      End
   End
   Begin VB.Image MapIconImage1 
      DragMode        =   1  'Automatic
      Height          =   360
      Index           =   0
      Left            =   5190
      Picture         =   "Mapper1.frx":1691
      Stretch         =   -1  'True
      Top             =   0
      Width           =   720
   End
   Begin VB.Label MAPCaption 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "Map Editor"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   195
      Left            =   0
      TabIndex        =   9
      Top             =   60
      Width           =   1770
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "Options"
      Visible         =   0   'False
      Begin VB.Menu mnuRevealHiddenTiles 
         Caption         =   "Reveal Hidden Tiles"
      End
      Begin VB.Menu mnuShowStation 
         Caption         =   "Mapping Station Reveals Tile"
      End
      Begin VB.Menu mnuMoveRoom 
         Caption         =   "Move Room's X/Y On Next Click (M)"
      End
      Begin VB.Menu mnuSpacer1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuKejMap 
         Caption         =   "Kej Map"
      End
   End
End
Attribute VB_Name = "Mapper1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private MenuTileNumber As Byte   'which value is attributed to tile clicked on in menu
Private FlipNumber As Byte  'flip/palette value of currently selected tile
Private MiniMapTileNumber As Integer   'which value is attributed to tile clicked on on map
Private MapTiles As Integer
Private MapStart As Long    'start of current map
Private MapStationStart As Long 'location of mapping station for an area
Private MenuX As Integer    'where we are on the iddy bitty menu we last clicked
Private MenuY As Integer    '"
Private MenuShowStation As Byte '0 or 1, whether or not the map station will reveal a tile
Private mdbBack As String
Private mdbForward As String
Public MAPMOVEX As Single
Public MAPMOVEY As Single




Private Sub BrowserButtons1_Click(Index As Integer)
Select Case Index
    Case 0: LoadMap_Click
    Case 1: SaveMap_Click
    Case 2: PopupMenu mnuOptions, , BrowserButtons1(2).Left, Picture1.Top + BrowserButtons1(2).Top + BrowserButtons1(2).Height
End Select
End Sub

Private Sub BrowserButtons1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
    BrowserButtons1(Index).BorderStyle = 1
End If

End Sub


Private Sub BrowserButtons1_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
BrowserButtons1(Index).BorderStyle = 0
End Sub


Private Sub Form_Load()
'MsgBox "For 4bpp map tiles, research starting from FourBppTilesToPixelMap."
Me.Picture = Smile.BrowserBar1.Picture
Picture1.Picture = Me.Picture
BrowserButtons1(0).Picture = Icons1.REFRESH1.Picture
BrowserButtons1(1).Picture = Icons1.SAVE.Picture

SetWindowPos hWnd, _
HWND_TOPMOST, 0, 0, 0, 0, _
SWP_NOMOVE + SWP_NOSIZE
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MAPMOVEX = X
MAPMOVEY = Y
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim DifX As Single
Dim DifY As Single

'ClearMenuHighlights

'difference between last time and this time, but only if button down
'If Button <> 1 Then Exit Sub
If Button = 0 Then Exit Sub
'If Smile.WindowState <> vbNormal Then Exit Sub

DifX = X - MAPMOVEX
DifY = Y - MAPMOVEY
Mapper1.Move Mapper1.Left + DifX, Mapper1.Top + DifY


End Sub

Private Sub Form_Unload(Cancel As Integer)
Smile.mnuMapEditor.Checked = False
End Sub

Private Sub MapCommand1_Click(Index As Integer)
Dim Nybble(0 To 1) As String 'left/flip and right/palette
Dim NewNybble As String

Nybble(0) = Left$(Right$("00" & Hex$(FlipNumber), 2), 1)
Nybble(1) = Right$(Right$("00" & Hex$(FlipNumber), 2), 1)
NewNybble = "0"
If Index = 0 Then GoTo HorizontalFlip
If Index = 1 Then GoTo VerticalFlip

'need to flip only one nybble
HorizontalFlip:
Select Case Nybble(0)
    Case "0": NewNybble = "4"
    Case "1": NewNybble = "5"
    Case "2": NewNybble = "6"
    Case "3": NewNybble = "7"
    Case "4": NewNybble = "0"
    Case "5": NewNybble = "1"
    Case "6": NewNybble = "2"
    Case "7": NewNybble = "3"
    Case "8": NewNybble = "C"
    Case "9": NewNybble = "D"
    Case "A": NewNybble = "E"
    Case "B": NewNybble = "F"
    Case "C": NewNybble = "8"
    Case "D": NewNybble = "9"
    Case "E": NewNybble = "A"
    Case "F": NewNybble = "B"
    Case Else: Exit Sub
End Select
GoTo UpdateMap

VerticalFlip:
Select Case Nybble(0)
    Case "0": NewNybble = "8"
    Case "1": NewNybble = "9"
    Case "2": NewNybble = "A"
    Case "3": NewNybble = "B"
    Case "4": NewNybble = "C"
    Case "5": NewNybble = "D"
    Case "6": NewNybble = "E"
    Case "7": NewNybble = "F"
    Case "8": NewNybble = "0"
    Case "9": NewNybble = "1"
    Case "A": NewNybble = "2"
    Case "B": NewNybble = "3"
    Case "C": NewNybble = "4"
    Case "D": NewNybble = "5"
    Case "E": NewNybble = "6"
    Case "F": NewNybble = "7"
    Case Else: Exit Sub
End Select
GoTo UpdateMap

UpdateMap:
Dim TempAreaByte As MapType
FlipNumber = Val("&H" & NewNybble & Nybble(1))
DrawTilePreview FlipNumber
End Sub





Private Sub MapMenu1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MenuX = (X \ 8) Mod 16
MenuY = Y \ 8
'MenuTileNumber = AreaMap(MiniMapTileNumber).Tile
'FlipNumber = AreaMap(MiniMapTileNumber).Flip

'tile to use
MenuTileNumber = (MenuY * 16) + MenuX
'map colors
FlipNumber = Val("&H" & MapTypeCombo1.Text) * 4
'for stretchblt'ing, since we already have MenuTileNumber
MenuX = MenuX * 8
MenuY = MenuY * 8

StretchBlt Smile.MenuPictureMask1.hdc, 0, 0, 64, 64, MapMenu1.hdc, MenuX, MenuY, 8, 8, SRCCOPY
DrawTilePreview FlipNumber
'switch to non-hidden tiles by default
ShowStation1.Value = 1
End Sub


Public Sub MapPicture2_DragDrop(Source As Control, X As Single, Y As Single)
Dim TempIconX As Integer
Dim TempIconY As Integer
Dim MapIconX() As Integer
Dim MapIconY() As Integer
Dim TempThreeByte As ThreeByte
Dim MapIconOffset As Long       'offset for current set of map icons by type


MapEditorX = X
MapEditorY = Y
TempIconX = ((MapEditorX - 2) \ 8) * 8
TempIconY = ((MapEditorY) \ 8) * 8
SelectedArea = RoomHeader1.RegionCombo1.ListIndex

Select Case Source.Index
    Case 0: GoTo ShipIconLocation
    Case 1: GoTo BossIconLocation
    Case Else: MsgBox Source.Index
End Select

ShipIconLocation:
Open needslash For Binary As #1
    Put #1, ShipIconOffset + ROM_HEADER + 1, TempIconX
    Put #1, ShipIconOffset + ROM_HEADER + 2 + 1, TempIconY
Close #1
ShipIconImage1.Move TempIconX, TempIconY
Exit Sub

BossIconLocation:
Open needslash For Binary As #1
    'find start of boss icon entries
    Get #1, BossIconOffset + ROM_HEADER + (SelectedArea * 2) + 1, TempThreeByte.Byte1
    Get #1, , TempThreeByte.Byte2
    TempThreeByte.Byte3 = &H82&
    MapIconOffset = ThreePoint2Offset(TempThreeByte)
    'loop through
    ReDim MapIconX(0 To 0) As Integer
    ReDim MapIconY(0 To 0) As Integer
    For I = 0 To 9  'allows up to 10 of each type of icon... should be plenty
        Get #1, MapIconOffset + (I * 4) + ROM_HEADER + 1, MapIconX(UBound(MapIconX))
        Get #1, MapIconOffset + (I * 4) + ROM_HEADER + 3, MapIconY(UBound(MapIconY))
        If MapIconX(UBound(MapIconX)) = Val("&HFFFF") Then Exit For
        'increase size of array
        ReDim Preserve MapIconX(0 To UBound(MapIconX) + 1) As Integer
        ReDim Preserve MapIconY(0 To UBound(MapIconY) + 1) As Integer
    Next I
    ReDim Preserve MapIconX(0 To UBound(MapIconX) - 1) As Integer
    ReDim Preserve MapIconY(0 To UBound(MapIconY) - 1) As Integer
Close #1

MsgBox UBound(MapIconX) & vbCrLf & "Not yet supported."
Exit Sub
End Sub


Private Sub MapPicture2_KeyDown(KeyCode As Integer, Shift As Integer)
Dim TempMapIndex
Dim XXX As Single
Dim YYY As Single

XXX = Target(3).Left
YYY = Target(3).Top
TempMapIndex = (XXX \ 16) + ((YYY \ 16) * 32)

Select Case KeyCode
    'Case 13: TestRoom: Exit Sub
    Case 37: GoTo FlipHorizontal
    Case 38: GoTo FlipVertical
    Case 39: GoTo FlipHorizontal
    Case 40: GoTo FlipVertical
    Case 123: Smile.TakeSnapshot: Exit Sub
    Case Else: Exit Sub
End Select
MsgBox MiniMapTileNumber

FlipHorizontal:
AreaMap(MiniMapTileNumber).Flip = AreaMap(MiniMapTileNumber).Flip Xor &H40
GoTo FinishFlipping

FlipVertical:
AreaMap(MiniMapTileNumber).Flip = AreaMap(MiniMapTileNumber).Flip Xor &H80


FinishFlipping:
'refreshes map view
RefreshMap
'refresh zoomer
StretchBlt MapMagnify2.hdc, 0, 0, MapMagnify2.Width, MapMagnify2.Height, MapPicture2.hdc, MapEditorX - 8, MapEditorY - 8, MapMagnify1.Width \ 3, MapMagnify1.Height \ 3, SRCCOPY
End Sub


Private Sub MapPicture2_KeyPress(KeyAscii As Integer)
Dim MapTileX As Integer
Dim MapTileY As Integer
Dim TempOffset As Long
Dim TempMyHeader As mdb_Header
Dim CurrentRoomRegion As Byte
Dim RoomToGoTo As String * 5

If KeyAscii = 13 Then GoTo EnterRoomFromMap
Select Case UCase$(Chr$(KeyAscii))
    Case "E": GoTo EnterRoomFromMap
    Case "M": GoTo MoveRoomOnMap
    Case Else: Exit Sub
End Select

EnterRoomFromMap:
ReDim Preserve FoundRooms(0 To 0) As String * 5
FoundRooms(0) = "None!"
'find X/Y of screen
MapTileX = (MapEditorX \ 8)
MapTileY = ((MapEditorY) \ 8) - 1   'room's Y doesn't line up with map view's Y
If MapTileY < 0 Then MsgBox "Top row of map doesn't link to any rooms.", vbOKOnly, "No rooms here.": Exit Sub
CurrentRoomRegion = RoomHeader1.RegionCombo1.ListIndex
'XXXXXXXXXWill that work before a room has been opened?XXXXXXXX
'skim list of rooms for ones that contain location
Open needslash For Binary As #1
For II = 0 To Smile.mdbCombo.ListCount
    TempOffset = Val("&H" & Smile.mdbCombo.List(II) & "&") + ROM_HEADER + 1
    Get #1, TempOffset, TempMyHeader
    'compare regions... must be the same
    If TempMyHeader.Region <> CurrentRoomRegion Then GoTo NextRoomInTheList
    If MapTileX < TempMyHeader.X Or MapTileX > (TempMyHeader.X + TempMyHeader.Width - 1) Then GoTo NextRoomInTheList
    If MapTileY < TempMyHeader.Y Or MapTileY > (TempMyHeader.Y + TempMyHeader.Height - 1) Then GoTo NextRoomInTheList
    'room has been matched!  add to list of found rooms
    'array expanded afterwards, instead of before, because we started with 0 to 0 before the loop
    FoundRooms(UBound(FoundRooms)) = Smile.mdbCombo.List(II)
    ReDim Preserve FoundRooms(0 To UBound(FoundRooms) + 1) As String * 5
NextRoomInTheList:
Next II
Close #1
'if no rooms found, alert the user to the fact
If FoundRooms(0) = "None!" Then MsgBox "No rooms found for this point!": Exit Sub
'cut off the last index in the array, as it wasn't written to
ReDim Preserve FoundRooms(0 To UBound(FoundRooms) - 1)
'if more than one room found, open a list and let them choose
If UBound(FoundRooms) > 0 Then RoomFromMap1.Show 1
If FoundRooms(0) = "None!" Then Exit Sub    'they canceled
'open room
OpenTheChosenRoom:
Smile.mdbCombo.Text = FoundRooms(0)
Exit Sub

MoveRoomOnMap:
MoveRoomCheck1.Value = Checked
MapPicture2_MouseDown 1, 0, Val(MapEditorX), Val(MapEditorY)
Exit Sub
End Sub


Private Sub MapPicture2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'if holding shift and holding left button, select the room to drag
If Shift = 1 And Button = 1 Then Target(3).Enabled = True: Exit Sub
'if right clicking while holding shift, open tile properties
'If Shift = 1 And Button = 2 Then OpenTileProperties: Exit Sub
Target(3).Enabled = False

'there is a value, now just need location in map
Dim MapTileX As Integer    'where we are on the map
Dim MapTileY As Integer    '"
Dim OverHalf As Integer
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If Y > 255 Then Y = 255
'where clicked
MapTileX = (X \ 8)
MapTileY = (Y \ 8)
'on right half?
If MapTileX > 31 Then OverHalf = 1024 Else OverHalf = 0
'figure MiniMapTileNumber (which is where in the map array we are editing)
MiniMapTileNumber = (MapTileX Mod 32) + (MapTileY * 32) + OverHalf

'to move the x/y of a room
If MoveRoomCheck1.Value > 0 Then
    mnuMoveRoom.Checked = False
    MoveRoomCheck1.Value = 0
    RoomHeader1.XText1 = Hex$(MapTileX)
    RoomHeader1.YText1 = Hex$(MapTileY - 1)
    RefreshMapHighlight
    Exit Sub
End If

'place or copy?
If Button = 1 Then GoTo PlaceMapData
If Button = 2 Then GoTo CopyMapData

PlaceMapData:
'place new data in the array
AreaMap(MiniMapTileNumber).Tile = MenuTileNumber
AreaMap(MiniMapTileNumber).Flip = FlipNumber
'place hide/show data in the appropriate array
AreaMapStation(MiniMapTileNumber) = MenuShowStation
'to get right position for stretchblt'ing
MapTileX = (X \ 8) * 8
MapTileY = (Y \ 8) * 8
'place new image down
'StretchBlt MapPicture2.hdc, MapTileX, MapTileY, 8, 8, MapPicture1.hdc, MenuX, MenuY, 8, 8, SRCCOPY
DrawMapTile Val(MiniMapTileNumber), MapTileX, MapTileY, MenuX, MenuY
MapPicture2.Refresh
Exit Sub

CopyMapData:
'place new data in the array
MenuTileNumber = AreaMap(MiniMapTileNumber).Tile
FlipNumber = AreaMap(MiniMapTileNumber).Flip
'place hide/show data in the menu
'MenuShowStation = AreaMapStation(MiniMapTileNumber)
ShowStation1.Value = AreaMapStation(MiniMapTileNumber)
'figure new x/y for menu

MenuY = (MenuTileNumber \ 16)
MenuX = ((MenuTileNumber - MenuY * 16))
MenuX = MenuX * 8: MenuY = MenuY * 8

StretchBlt Smile.MenuPictureMask1.hdc, 0, 0, 64, 64, MapMenu1.hdc, MenuX, MenuY, 8, 8, SRCCOPY
DrawTilePreview FlipNumber
End Sub


Private Sub MapPicture2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Smile.ClearMenuHighlights
'if holding shift, we want to select the room to drag
If Shift = 1 Then Target(3).Enabled = True: Exit Sub
Target(3).Enabled = False
'there is a value, now just need location in map
Dim MapTileX As Integer    'where we are on the map
Dim MapTileY As Integer    '"
Dim OverHalf As Integer

'where clicked
MapTileX = (X \ 8)
MapTileY = (Y \ 8)
'on right half?
If MapTileX > 31 Then OverHalf = 1024 Else OverHalf = 0
'figure MiniMapTileNumber (which is where in the map array we are editing)
MiniMapTileNumber = (MapTileX Mod 32) + (MapTileY * 32) + OverHalf


'change X/Y to values divisible by 8
MapEditorX = (X \ 8) * 8
MapEditorY = (Y \ 8) * 8

MapPicture2.SetFocus
MapMagnify1.Move MapEditorX - (MapMagnify1.Width \ 2) + 8, MapEditorY - (MapMagnify1.Height \ 2) + 4

'refresh zoomer
StretchBlt MapMagnify1.hdc, 0, 0, MapMagnify1.Width, MapMagnify1.Height, MapPicture2.hdc, MapEditorX - 16, MapEditorY - 8, MapMagnify1.Width \ 3, MapMagnify1.Height \ 3, SRCCOPY
'StretchBlt MapMagnify1.hdc, 0, 0, MapMagnify1.Width, MapMagnify1.Height, MapPicture2.hdc, MapMagnify1.Left, MapMagnify1.Top, MapMagnify1.Width, MapMagnify1.Height, SRCPAINT

'DSTINVERT
'top grid
For YYI = 0 To 120 Step 24
    MapMagnify1.Line (0, YYI)-(23, YYI + 23), vbRed, B
    MapMagnify1.Line (24, YYI)-(47, YYI + 23), vbRed, B
    MapMagnify1.Line (48, YYI)-(71, YYI + 23), vbRed, B
    MapMagnify1.Line (72, YYI)-(95, YYI + 23), vbRed, B
    MapMagnify1.Line (96, YYI)-(119, YYI + 23), vbRed, B
Next YYI
MapMagnify1.Refresh


'do mousedown, if appropriate
If Button = 1 Then MapPicture2_MouseDown 1, Shift, X, Y
End Sub



Public Sub MapTypeCombo1_Click()
Dim PointX As Single
Dim PointY As Single
Dim TileI As Integer
Dim TileX As Integer
Dim TileY As Integer

'find new colors to use for GB tiles
MyGBColor(0) = FlipRGB(PcPalette((Mapper1.MapTypeCombo1.ListIndex * 16) + 0))
MyGBColor(1) = FlipRGB(PcPalette((Mapper1.MapTypeCombo1.ListIndex * 16) + 1))
MyGBColor(2) = FlipRGB(PcPalette((Mapper1.MapTypeCombo1.ListIndex * 16) + 2))
MyGBColor(3) = FlipRGB(PcPalette((Mapper1.MapTypeCombo1.ListIndex * 16) + 3))
'give the user a preview of these colors
Mapper1.MapColorLabel(0).BackColor = MyGBColor(0)
Mapper1.MapColorLabel(1).BackColor = MyGBColor(1)
Mapper1.MapColorLabel(2).BackColor = MyGBColor(2)
Mapper1.MapColorLabel(3).BackColor = MyGBColor(3)
'refresh the menu
TileX = -8
TileY = 0
For TileI = 0 To 255
    TileX = TileX + 8
    If TileX > 127 Then
        TileY = TileY + 8
        TileX = 0
    End If
MakeOne8x8_GB &HD3200 + (TileI * &H10), Mapper1.MapMenu1.hdc, TileX, TileY
'MakeOne8x8 &H1B0000 + (TileI * &H10), Mapper1.MapMenu1.hdc, TileX, TileY
Next TileI
Mapper1.MapMenu1.Refresh
RefreshMap              'refresh map data (doesn't reload it from the rom)
End Sub


Public Sub KejMapCommand1_Click()
Dim PatchSize As Integer    'used to tell whether or not the patches exist
Dim Patch00 As String
Dim Patch01 As String
Dim Patch00Data(0 To 186) As Byte
Dim Patch01Data(0 To 399) As Byte
Dim GroupSizeByte(0 To 6) As Byte

Patch00 = App.Path & "\Files\Public Patches\K_AMS_00.bin"
Patch01 = App.Path & "\Files\Public Patches\K_AMS_01.bin"
'check existence of patch 00
Open Patch00 For Binary As #1
PatchSize = LOF(1)
Close #1
If PatchSize = 0 Then
    Kill Patch00
    MsgBox "K_AMS_00.bin not found!", vbInformation, "Oops."
    Exit Sub
End If
'check for existence of patch 01
Open Patch01 For Binary As #1
PatchSize = LOF(1)
Close #1
If PatchSize = 0 Then
    Kill Patch01
    MsgBox "K_AMS_01.bin not found!", vbInformation, "Oops."
    Exit Sub
End If

DD = MsgBox("This patch will allow SMILE to tell the game to map your game correctly." & vbCrLf & vbCrLf & "Data will be written from $00F800-$00F98F." & vbCrLf & "If this is okay, please continue.", vbOKCancel, "Continue?")
If DD = vbCancel Then Exit Sub
Open Patch00 For Binary As #1
    Get #1, 1, Patch00Data()
Close #1
Open Patch01 For Binary As #1
    Get #1, 1, Patch01Data()
Close #1
'set bytes to write to group sizes
GroupSizeByte(0) = &H50
GroupSizeByte(1) = &H50
GroupSizeByte(2) = &H50
GroupSizeByte(3) = &H20
GroupSizeByte(4) = &H50
GroupSizeByte(5) = &H20
GroupSizeByte(6) = &H10
'Change the bytes at 8131: 50 50 50 20 50 20 10 (Yes, last byte is for Ceres. By default it's not used though)
Open needslash For Binary As #1
    Put #1, &H8131& + ROM_HEADER + 1, GroupSizeByte(0)
    Put #1, , GroupSizeByte(1)
    Put #1, , GroupSizeByte(2)
    Put #1, , GroupSizeByte(3)
    Put #1, , GroupSizeByte(4)
    Put #1, , GroupSizeByte(5)
    Put #1, , GroupSizeByte(6)
    Put #1, &H82E4& + ROM_HEADER + 1, Patch00Data()
    Put #1, &HF800& + ROM_HEADER + 1, Patch01Data()
Close #1
KejMapCommand1.Visible = False
mnuKejMap.Visible = False
MsgBox "Now that KejMap has been applied to your ROM, you should resave your maps to see the changes in the game."
End Sub


Public Sub LoadMap_Click()
Dim Adjuster As Long    'needed, because Brinstar and Crateria are in reverse order
Dim AdjusterStation As Long 'needed for the same reason as above, but for mapstation instead
Dim OverHalf As Long    'add to x when we are half way through the map
Dim SmallStationArray(0 To 7) As Byte   'used to convert from bytes to bits
Dim ArrayDepth As Byte  'how deep in smallstationarray we are
Dim CurrentArrayLocation As Integer    'how deep in areamapstation we are

MapTypeCombo1_Click 'force refresh of map gfx
MapStart = Val("&H1A8000") + (RoomHeader1.RegionCombo1.ListIndex * Val("&H1000"))
MapStationStart = Val("&H11727") + (RoomHeader1.RegionCombo1.ListIndex * Val("&H100"))
'XXXFIXXXX
'FourBppTilesToPixelMap Tiles, Pixelmap

'if crateria or brinstar, flip them around
Select Case Hex$(MapStart)
    Case "1A8000": Adjuster = Val("&H1000")
    Case "1A9000": Adjuster = 0 - Val("&H1000")
    Case Else: Adjuster = 0
End Select

'needed because brinstar and crateria are reversed for some reason
MapStart = MapStart + Adjuster
MapStationStart = MapStationStart + AdjusterStation

'grab the $1000 bytes of data to work with
Open needslash For Binary As #1
    Get #1, MapStart + ROM_HEADER + 1, AreaMap()
Close #1

'grab the $100 bytes for mapping station and convert them to usable data
Open needslash For Binary As #1
    Get #1, MapStationStart + ROM_HEADER + 1, AreaMapStationBytes()
Close #1

CurrentArrayLocation = 0
For I = 0 To 255
ToBin AreaMapStationBytes(I), AreaMapStation(CurrentArrayLocation)
CurrentArrayLocation = CurrentArrayLocation + 8
Next I

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
RefreshMap

'CurrentX = 0
'CurrentY = 0
'OverHalf = 0
'For I = 0 To 2047
'    MenuX = (AreaMap(I).Tile Mod 16) * 8
'    MenuY = (AreaMap(I).Tile \ 16) * 8

'DrawMapTile Val(I), CurrentX, CurrentY, MenuX, MenuY

'CurrentX = CurrentX + 8
'If CurrentX >= 256 + OverHalf Then CurrentY = CurrentY + 8: CurrentX = 0 + OverHalf
'If CurrentY >= 256 Then OverHalf = 256: CurrentY = 0: CurrentX = 0 + OverHalf
'Next I

Mapper1.MapPicture2.Refresh

MenuY = (MenuTileNumber \ 16)
MenuX = ((MenuTileNumber - MenuY * 16))
MenuX = MenuX * 8: MenuY = MenuY * 8
'''''LOADING MAP ICONS'''''
Dim SelectedArea As Byte    'the area we are getting icons for
Dim MapIconX() As Integer
Dim MapIconY() As Integer

SelectedArea = RoomHeader1.RegionCombo1.ListIndex
Me.MAPCaption.Caption = RoomHeader1.RegionCombo1.Text

'SHIP ICON
LoadShipIconLocation:
If SelectedArea = 0 Then
    Mapper1.ShipIconImage1.Visible = True
Else
    Mapper1.ShipIconImage1.Visible = False
    GoTo LoadBossIconLocations
End If

ReDim MapIconX(0 To 0) As Integer
ReDim MapIconY(0 To 0) As Integer
Open needslash For Binary As #1
    Get #1, ShipIconOffset + ROM_HEADER + 1, MapIconX(0)
    Get #1, ShipIconOffset + ROM_HEADER + 2 + 1, MapIconY(0)
Close #1
Mapper1.ShipIconImage1.Move MapIconX(0), MapIconY(0)

'BOSS ICONS
LoadBossIconLocations:

End Sub




Private Sub mnuKejMap_Click()
KejMapCommand1_Click
End Sub

Private Sub mnuMoveRoom_Click()
MoveRoomCheck1.Value = Abs(MoveRoomCheck1.Value - 1)
mnuMoveRoom.Checked = MoveRoomCheck1.Value
End Sub


Private Sub mnuRevealHiddenTiles_Click()
RevealHiddenTilesCheck1.Value = Abs(RevealHiddenTilesCheck1.Value - 1)
mnuRevealHiddenTiles.Checked = RevealHiddenTilesCheck1.Value
End Sub

Private Sub mnuShowStation_Click()
ShowStation1.Value = Abs(ShowStation1.Value - 1)
mnuShowStation.Checked = ShowStation1.Value
End Sub



Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Y > 32 Then Exit Sub
MAPMOVEX = X
MAPMOVEY = Y
End Sub


Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Y > 32 Then Exit Sub
Dim DifX As Single
Dim DifY As Single

If Button = 0 Then Exit Sub

DifX = X - MAPMOVEX
DifY = Y - MAPMOVEY
Mapper1.Move Mapper1.Left + DifX, Mapper1.Top + DifY

End Sub


Private Sub RevealHiddenTilesCheck1_Click()
RefreshMap
End Sub

Private Sub SaveMap_Click()
Dim SmallStationArray(0 To 7) As Byte   'used to convert from bits to bytes
Dim ArrayDepth As Byte  'how deep in smallstationarray we are
Dim CurrentArrayLocation As Integer    'how deep in areamapstation we are

'saving the map
Open needslash For Binary As #1
    Put #1, MapStart + ROM_HEADER + 1, AreaMap()
Close #1

'converting map station bits to bytes
For CurrentArrayLocation = 0 To 2047 Step 8
    AreaMapStationBytes(CurrentArrayLocation \ 8) = FromBin(AreaMapStation(CurrentArrayLocation))
Next CurrentArrayLocation
'saving the map station
Open needslash For Binary As #1
    Put #1, MapStationStart + ROM_HEADER + 1, AreaMapStationBytes()
Close #1

If newmdbText1 = "" Then Exit Sub
DD = MsgBox("For this change to happen, SMILE must save and re-open this room!", vbOKCancel, "Save and Re-Open?")

If DD = vbOK Then
    RoomHeader1.Tag = 1
    ReDim Preserve RoomTile(0 To (Val("&H" & RoomHeader1.WidthText1.Text) * Val("&H" & RoomHeader1.HeightText1.Text) * 256) - 1) As Tile
    ReDim Preserve RoomClip(0 To (Val("&H" & RoomHeader1.WidthText1.Text) * Val("&H" & RoomHeader1.HeightText1.Text) * 256) - 1) As Byte '
    If UBound(RoomTile2) > 0 Then ReDim Preserve RoomTile2(0 To (Val("&H" & RoomHeader1.WidthText1.Text) * Val("&H" & RoomHeader1.HeightText1.Text) * 256) - 1) As Tile
    Smile.mnuSaveRoom_Click
    DoEvents
    Smile.TestCodeList1_Click
Else
    RoomHeader1.Tag = 0
End If

'if Kejardon's map code has been installed, save tile groups to F800
If KejMapCommand1.Visible = False Then UpdateMapSaveGroups
End Sub



Private Sub ShowStation1_Click()
MenuShowStation = ShowStation1.Value
If MenuShowStation > 1 Then MenuShowStation = 1
End Sub


Private Sub TaskCommand1_Click(Index As Integer)
Me.Visible = False
Smile.mnuMapEditor.Checked = False
End Sub


