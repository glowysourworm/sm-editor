VERSION 5.00
Begin VB.Form Test 
   Caption         =   "TEH L33T R00M EDITER"
   ClientHeight    =   8250
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   ScaleHeight     =   550
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   792
   Begin VB.CommandButton cmdAddress 
      Caption         =   "Show Address"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2160
      TabIndex        =   16
      Top             =   2520
      Width           =   1455
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save Room"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2160
      TabIndex        =   15
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "Open Room"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2160
      TabIndex        =   14
      Top             =   840
      Width           =   1455
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "New Room"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2160
      TabIndex        =   13
      Top             =   240
      Width           =   1455
   End
   Begin VB.ListBox lstRoomstates 
      Height          =   840
      ItemData        =   "Test.frx":0000
      Left            =   0
      List            =   "Test.frx":0002
      TabIndex        =   7
      Top             =   3360
      Width           =   2055
   End
   Begin VB.VScrollBar vsbTiles 
      Height          =   1935
      Left            =   11520
      Max             =   512
      TabIndex        =   6
      Top             =   6240
      Width           =   255
   End
   Begin VB.ListBox lstRooms 
      Height          =   2790
      ItemData        =   "Test.frx":0004
      Left            =   0
      List            =   "Test.frx":0006
      TabIndex        =   5
      Top             =   240
      Width           =   2055
   End
   Begin VB.PictureBox picTiles 
      AutoRedraw      =   -1  'True
      Height          =   1980
      Left            =   3720
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   512
      TabIndex        =   4
      Top             =   6240
      Width           =   7740
   End
   Begin VB.HScrollBar hsbMain 
      Height          =   255
      Left            =   3720
      TabIndex        =   3
      Top             =   5880
      Width           =   7815
   End
   Begin VB.VScrollBar vsbMain 
      Height          =   5895
      Left            =   11520
      TabIndex        =   2
      Top             =   0
      Width           =   255
   End
   Begin VB.CommandButton cmdSaveRoom 
      Caption         =   "Save Edited Room"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   0
      TabIndex        =   1
      Top             =   5280
      Width           =   2055
   End
   Begin VB.PictureBox picMain 
      AutoRedraw      =   -1  'True
      Height          =   5820
      Left            =   3720
      ScaleHeight     =   384
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   512
      TabIndex        =   0
      Top             =   0
      Width           =   7740
   End
   Begin VB.Label lblTtableEntry 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Tiletable Entry (hex): NTS."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   6240
      Width           =   3495
   End
   Begin VB.Label lblWordInMapdata 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Word in Mapdata (zero-based): NTS."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   4800
      Width           =   3495
   End
   Begin VB.Label lblTileCoords 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Tile Coords: No tile selected."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   4440
      Width           =   3495
   End
   Begin VB.Label lblRoomstates 
      Caption         =   "Roomstates"
      Height          =   255
      Left            =   0
      TabIndex        =   9
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Label lblRooms 
      Caption         =   "Rooms"
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   855
   End
End
Attribute VB_Name = "Test"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
DefLng A-Z

Dim SecMain As New cDIBSection ' picMain
Dim SecTiles As New cDIBSection ' picTiles
Dim SecBakMain As New cDIBSection ' rep. tile for picMain
Dim SecBakTiles As New cDIBSection ' rep. tile for picTiles
Dim Ttables() As Byte
Dim Pixelmap() As Byte
Dim PcPalette()
Dim MapData() As Byte ' current decomp. room map
Dim OrigCMapDataSize ' size in bytes of MapData comp.
Dim LastSelectedX, LastSelectedY, LastSelectedX2, LastSelectedY2
Dim DragX, DragY, DragX2, DragY2
Dim TileSelected As Boolean ' is a tile to place selected?
Dim FirstClick As Boolean ' is this first tile placed?
Dim SelectedTileData ' tile replacement data
Dim MapWidthInTiles, MapHeightInTiles ' tiles = 16x16s
Dim CurrentMDB_Header As mdb_Header
Dim CurrentMDB_Roomstate As mdb_RoomState

Private Const PS_SOLID = 0
Private Const THIN_RECT = 28 '28

Public Sub Form_Load()

Main.varWorkingFile.Caption = AddAppPath("metroid.smc")

' ship room
' &H2142BB, 1, 9, 5

' crateria main
' &H215BC4, 1, 5, 5

' plasma door
' &H25A878, 12, 4, 6

If LoadLunar = True Then
  
  Dim MDBpointTxtPath$, LinesFromFile$()

  MDBpointTxtPath = AddAppPath("mdb_point.txt")
  AddTextfileLinesToListbox MDBpointTxtPath, lstRooms
End If

'DrawRoom &H215BC4, 1, 5, 5
'DrawTiles 1
'DoScroll

End Sub




Private Sub Draw_Block(InSection As cDIBSection, BlockIndex, x, y)
'jathys
    Dim i, j, tmpX, tmpY, tmpI
    Dim TtableEntry(4), Tmp
    Dim TempBytes(4) As Byte
    Dim ReturnVal
    
    'tmpX = x * 16 'the coordinate system I'm using is locigal to the blocks. in other words, placing a block
    'tmpY = y * 16 'at (0,0) will be the upper left corner, while (0,1) is below it... and (1,0) is the block beside it
    'tmpI = (BlockIndex And &H3FF) * 8 'convert index value to a val that can access the correct data in our array
    
    tmpX = 0
    tmpY = 0
    tmpI = 0
    
    'fill TtableEntry with indexes from the 'tile table'
    For i = 0 To 3
        TempBytes(0) = Ttables(tmpI)
        TempBytes(1) = Ttables(tmpI + 1)
        TtableEntry(i) = BytesToLong(TempBytes())
        tmpI = tmpI + 2
    Next i
    
    
    If BlockIndex And &H800& Then
        'vertical flip, change TtableEntry word order, also change Vflip in each index
        Tmp = TtableEntry(0)
        TtableEntry(0) = TtableEntry(2) Xor &H8000&
        TtableEntry(2) = Tmp Xor &H8000&
        Tmp = TtableEntry(1)
        TtableEntry(1) = TtableEntry(3) Xor &H8000&
        TtableEntry(3) = Tmp Xor &H8000&
    End If
    If BlockIndex And &H400& Then
        'horizontal flip, change TtableEntry word order, also change Hflip in each index
        Tmp = TtableEntry(0)
        TtableEntry(0) = TtableEntry(1) Xor &H4000&
        TtableEntry(1) = Tmp Xor &H4000&
        Tmp = TtableEntry(2)
        TtableEntry(2) = TtableEntry(3) Xor &H4000&
        TtableEntry(3) = Tmp Xor &H4000&
    End If
    
    
    Tmp = 0
    For j = 0 To 1
        For i = 0 To 1
            ReturnVal = LunarRender8x8(InSection.DIBSectionBitsPtr, InSection.Width, InSection.Height, tmpX + (i * 8), tmpY + (j * 8), Pixelmap(0), PcPalette(0), TtableEntry(Tmp), LC_DRAW)
            LunarRender8x8 PointerToDIB, 16, 16, 0, 0, MyPixelMap(0), MyPCPalette(0), MyTileTable(0), LC_DRAW
            ReturnVal = LunarRender8x8(Section.DIBSectionBitsPtr, 512, 512, 8, 8, Pixelmap(0), PcPalette1024(0), &H228E0000, LC_DRAW)
            Tmp = Tmp + 1
        Next i
    Next j
End Sub
