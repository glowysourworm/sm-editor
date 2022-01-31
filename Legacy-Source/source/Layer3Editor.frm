VERSION 5.00
Begin VB.Form Layer3Editor 
   BackColor       =   &H00404040&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Layer 3 Editor (FX1)"
   ClientHeight    =   7935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11580
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   529
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   772
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   16
      Top             =   4080
      Width           =   3840
      Begin VB.PictureBox Picture1 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   1905
         Left            =   1560
         ScaleHeight     =   127
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   127
         TabIndex        =   17
         Top             =   1560
         Visible         =   0   'False
         Width           =   1905
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   0
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Refresh Menu"
      Height          =   375
      Left            =   120
      TabIndex        =   15
      Top             =   1560
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton L3Command_FillAll 
      Caption         =   "Fill All"
      Height          =   495
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   1815
   End
   Begin VB.CommandButton L3Command1 
      Caption         =   "Save Layer 3"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   8
      Top             =   3720
      Width           =   3630
   End
   Begin VB.ComboBox TileTableMenuPalette 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   15
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      ItemData        =   "Layer3Editor.frx":0000
      Left            =   0
      List            =   "Layer3Editor.frx":001C
      Style           =   2  'Dropdown List
      TabIndex        =   13
      ToolTipText     =   "Palette to use to draw 8x8 previews"
      Top             =   2040
      Width           =   975
   End
   Begin VB.PictureBox Palette1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1920
      Left            =   2640
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   64
      TabIndex        =   12
      Top             =   0
      Width           =   960
   End
   Begin VB.PictureBox L3Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   7920
      Left            =   3900
      ScaleHeight     =   528
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   512
      TabIndex        =   11
      Top             =   0
      Width           =   7680
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   1
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.CommandButton L3Command1 
      Caption         =   "Open Layer 3"
      Height          =   315
      Index           =   0
      Left            =   120
      TabIndex        =   10
      Top             =   3360
      Width           =   3630
   End
   Begin VB.TextBox L3Text1 
      Height          =   375
      Left            =   1200
      MaxLength       =   6
      TabIndex        =   9
      Text            =   "50000"
      ToolTipText     =   "Multi-CRE box"
      Top             =   2040
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "0"
      Height          =   255
      Index           =   0
      Left            =   3600
      TabIndex        =   0
      Top             =   0
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "1"
      Height          =   255
      Index           =   1
      Left            =   3600
      TabIndex        =   1
      Top             =   240
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "2"
      Height          =   255
      Index           =   2
      Left            =   3600
      TabIndex        =   2
      Top             =   480
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "3"
      Height          =   255
      Index           =   3
      Left            =   3600
      TabIndex        =   3
      Top             =   720
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "4"
      Height          =   255
      Index           =   4
      Left            =   3600
      TabIndex        =   4
      Top             =   960
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "5"
      Height          =   255
      Index           =   5
      Left            =   3600
      TabIndex        =   5
      Top             =   1200
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "6"
      Height          =   255
      Index           =   6
      Left            =   3600
      TabIndex        =   6
      Top             =   1440
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Caption         =   "7"
      Height          =   255
      Index           =   7
      Left            =   3600
      TabIndex        =   7
      Top             =   1680
      Width           =   285
   End
End
Attribute VB_Name = "Layer3Editor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type L3Type
    Tile As Byte
    DrawMethod As Byte
End Type
Private L3DATA(0 To 1055) As L3Type     'actual L3 data (8x8 tile map) (full screen, plus one extra row)
Private DraggedDroppedL3 As L3Type      'clipboard

Private Sub Command2_Click()
Dim TileI As Integer
Dim TileX As Integer
Dim TileY As Integer
Dim ReplacementGFXAddress As Long

TileX = -8
TileY = 0
For TileI = 0 To 255
    TileX = TileX + 8
    If TileX > 127 Then
        TileY = TileY + 8
        TileX = 0
    End If
MakeOne8x8_GB &HD3200 + (TileI * &H10), Picture1.hdc, TileX, TileY
Next TileI

'adjust for lava/acid/rain/spores
Select Case Left$(FX1_1.Layer3Type1.Text, 2)
    Case "02": ReplacementGFXAddress = &H3A564
    Case "04": ReplacementGFXAddress = &H3A6A4
    Case "08": ReplacementGFXAddress = &H3A7E4
    Case "0A": ReplacementGFXAddress = &H3A974
    Case Else: ReplacementGFXAddress = 0
End Select

If ReplacementGFXAddress = 0 Then GoTo FinishedDrawingTiles
TileX = 0
TileY = 40
For TileI = 0 To 3
    MakeOne8x8_GB ReplacementGFXAddress + (TileI * &H10), Picture1.hdc, TileX, TileY
    TileX = TileX + 8
Next TileI

'refresh visible menu
FinishedDrawingTiles:
Picture2.Cls
StretchBlt Picture2.hdc, 0, 0, 256, 256, Picture1.hdc, 0, 0, 128, 128, SRCCOPY
Picture2.Refresh
End Sub


Private Sub Form_Unload(Cancel As Integer)
FX1_1.Command2.Tag = 0
End Sub

Private Sub L3Command_FillAll_Click()
For I = 0 To 1023
    L3DATA(I).Tile = DraggedDroppedL3.Tile
    L3DATA(I).DrawMethod = DraggedDroppedL3.DrawMethod
Next I
RefreshL3Preview
End Sub

Public Sub L3Command1_Click(Index As Integer)
Dim L3Path As String
Dim L3Offset As Long
Dim NewData() As Byte
Dim CMD1 As New OpenSave


Select Case Index
    Case 0: GoTo READ_L3
    Case 1: GoTo SAVE_L3
    Case Else: Exit Sub
End Select

READ_L3:
Open needslash For Binary As #1
    Get #1, Val("&H" & L3Text1.Text) + ROM_HEADER + 1, L3DATA
Close #1
GoTo FinishREADSAVE

SAVE_L3:
Open needslash For Binary As #1
    Put #1, Val("&H" & L3Text1.Text) + ROM_HEADER + 1, L3DATA
Close #1

FinishREADSAVE:
RefreshL3Preview
Exit_2:     'open or save data... do the same
End Sub







Private Sub L3Picture1_KeyDown(KeyCode As Integer, Shift As Integer)
Dim TempL3Index
Dim XXX As Single
Dim YYY As Single

XXX = Target(1).Left
YYY = Target(1).Top
TempL3Index = (XXX \ 16) + ((YYY \ 16) * 32)

Select Case KeyCode
    Case 37: GoTo FlipHorizontal
    Case 38: GoTo FlipVertical
    Case 39: GoTo FlipHorizontal
    Case 40: GoTo FlipVertical
    Case Else: Exit Sub
End Select

FlipHorizontal:
L3DATA(TempL3Index).DrawMethod = L3DATA(TempL3Index).DrawMethod Xor &H40
GoTo FinishFlipping

FlipVertical:
L3DATA(TempL3Index).DrawMethod = L3DATA(TempL3Index).DrawMethod Xor &H80

FinishFlipping:
RefreshL3Preview
End Sub


Private Sub L3Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempL3Index As Integer
Dim TempValue As Integer
Dim TempTargetX As Integer
Dim TempTargetY As Integer

'If Y > L3Picture1.Top Then Y = L3Picture1.Top
If Y > L3Picture1.Height - 1 Then Y = L3Picture1.Height - 1
TempL3Index = (X \ 16) + ((Y \ 16) * 32)
If Button = 2 Then GoTo CopyTile

PlaceTile:
L3DATA(TempL3Index).Tile = DraggedDroppedL3.Tile
'adjust for color chosen by list
L3DATA(TempL3Index).DrawMethod = DraggedDroppedL3.DrawMethod
RefreshL3Preview
Exit Sub

CopyTile:
DraggedDroppedL3.Tile = (L3DATA(TempL3Index).Tile)
DraggedDroppedL3.DrawMethod = (L3DATA(TempL3Index).DrawMethod)
'hide the target cursor if we have selected with a right click on the editor
Target(0).Move -100, -100
RefreshL3Preview
End Sub

Private Sub L3Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'FOR MOVING TARGET BOX
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > L3Picture1.Width Then X = L3Picture1.Width - 1
If Y > L3Picture1.Height Then Y = L3Picture1.Height - 1

Dim RealX
Dim RealY
RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16
Target(1).Move RealX, RealY

If Button <> 1 Then Exit Sub    'if pressing a button, we'll do mouse_down

L3Picture1_MouseDown Button, Shift, X, Y
End Sub

Private Sub Command1_Click(Index As Integer)
TileTableMenuPalette.Text = Index
End Sub

Private Sub Command1_GotFocus(Index As Integer)
TileTableMenuPalette.Text = Index

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub


Private Sub Form_Load()
Dim TempString As String * 5
Dim TempL3Offset As ThreeByte
Dim TempTableIndex As Byte
Dim TempLayer3Pointer As ThreeByte

Me.Icon = Smile.Icon
TempTableIndex = Val("&H" & Left$(FX1_1.Layer3Type1.Text, 2))
Open needslash For Binary As #1
    Get #1, &H1ABF0 + TempTableIndex + ROM_HEADER + 1, TempLayer3Pointer.Byte1
    Get #1, &H1ABF0 + TempTableIndex + ROM_HEADER + 2, TempLayer3Pointer.Byte2
Close #1
TempLayer3Pointer.Byte3 = &H8A

L3Text1.Text = Right$("000000" & Hex$(ThreePoint2Offset(TempLayer3Pointer)), 6)

Picture1.Move 0, 0, 256, 256
Picture2.DragIcon = Smile.Icon
'palette data
UpdatePalettePreview
'Palette1_MouseDown 1, 0, 4, 6
'8x8 Data
TileTableMenuPalette.Text = 0

GoodL3:
Open needslash For Binary As #1
    Get #1, Val(L3Text1.Text) + ROM_HEADER + 2 + 1, TempL3Offset
Close #1
'L3Text1.Text = Hex$(ThreePoint2Offset(TempL3Offset))
L3Command1_Click 0
End Sub


Private Sub Picture2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempL3Index As Integer
Dim TempValue As Integer

DraggedDroppedL3.Tile = ((Y \ 16) * 16) + (X \ 16) + 0
DraggedDroppedL3.DrawMethod = Val(TileTableMenuPalette.Text) * 4
End Sub

Private Sub Picture2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'FOR MOVING TARGET BOX
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > Picture2.Width Then X = Picture2.Width - 1
If Y > Picture2.Height Then Y = Picture2.Height - 1

Dim RealX
Dim RealY
RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16
Target(0).Move RealX, RealY
End Sub



Public Sub UpdatePalettePreview()
'128 colors for scenery
'2nd 128, not sure
For I = 0 To 31
    YY = (I \ 4) * 16
    XX = (I Mod 4) * 16
    Palette1.Line (XX, YY)-(XX + 16, YY + 16), FlipRGB(PcPalette(I)), BF 'PcPalette(i), BF
Next I
Palette1.Refresh
End Sub



Private Sub RefreshL3Preview()
Dim TempTile As Integer         'actual # of the tile
Dim TempPalette As Integer
Dim TempHorizontal As Integer   'simply 0 or not
Dim TempVertical As Integer     'simply 0 or not
Dim L3Index As Integer
Dim L3X As Integer
Dim L3Y As Integer
Dim Xof8x8 As Integer
Dim Yof8x8 As Integer
Dim TypeOfFlip As Byte          'H, V, HV, or neither

'get tile # for each 8x8
L3X = 0
L3Y = 0
For L3Index = 0 To UBound(L3DATA)
    'getting data
    TempTile = L3DATA(L3Index).Tile
    TempHorizontal = L3DATA(L3Index).DrawMethod And &H40
    TempVertical = L3DATA(L3Index).DrawMethod And &H80
        If TempHorizontal = 0 And TempVertical = 0 Then TypeOfFlip = 0
        If TempHorizontal <> 0 And TempVertical = 0 Then TypeOfFlip = 1
        If TempHorizontal = 0 And TempVertical <> 0 Then TypeOfFlip = 2
        If TempHorizontal <> 0 And TempVertical <> 0 Then TypeOfFlip = 3
    'figure X/Y of 8x8 tile in menu
    Xof8x8 = (TempTile Mod 16) * 8
    Yof8x8 = (TempTile \ 2) - (Xof8x8 \ 16)
    Select Case TypeOfFlip
        Case 0: StretchBlt L3Picture1.hdc, L3X, L3Y, 16, 16, Picture1.hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
        Case 1: StretchBlt L3Picture1.hdc, L3X + 16, L3Y, -17, 16, Picture1.hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
        Case 2: StretchBlt L3Picture1.hdc, L3X, L3Y + 16, 16, -17, Picture1.hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
        Case 3: StretchBlt L3Picture1.hdc, L3X + 16, L3Y + 16, -17, -17, Picture1.hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
    End Select
    'preparing for the next tile
    L3X = L3X + 16
    If L3X > 511 Then
        L3X = 0
        L3Y = L3Y + 16
    End If
Next L3Index
L3Picture1.Refresh
End Sub



Public Sub AllowScrollOfL3()
Dim TempInteger As Integer
'whether or not we can scroll the L3 editor (ie- larger than $800?)
TempInteger = (UBound(L3DATA) \ &H400)
If TempInteger < 0 Then TempInteger = 0
End Sub


Private Sub TileTableMenuPalette_Click()
Dim PointX As Single
Dim PointY As Single

PointX = 1
PointY = 1 + (TileTableMenuPalette.ListIndex * 16)
MyGBColor(0) = Palette1.Point(PointX, PointY)
MyGBColor(1) = Palette1.Point(PointX + 16, PointY)
MyGBColor(2) = Palette1.Point(PointX + 32, PointY)
MyGBColor(3) = Palette1.Point(PointX + 48, PointY)
'refresh the menu
Command2_Click
'refresh our map
RefreshL3Preview
End Sub
