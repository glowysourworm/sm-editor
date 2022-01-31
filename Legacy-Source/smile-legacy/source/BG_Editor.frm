VERSION 5.00
Begin VB.Form BG_Editor 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Background Editor"
   ClientHeight    =   7665
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   12060
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   511
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   804
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer TimedKill 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   3480
      Top             =   6840
   End
   Begin VB.CommandButton ClipboardToBG 
      Caption         =   "Clipboard From Level Editor (Hot Key ""C"")"
      Height          =   375
      Index           =   1
      Left            =   240
      TabIndex        =   36
      TabStop         =   0   'False
      ToolTipText     =   "Hit ""C"" over the editor view to place in a specific location."
      Top             =   6360
      Visible         =   0   'False
      Width           =   3855
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   0
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   0
         Left            =   240
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   28
         Top             =   0
         Visible         =   0   'False
         Width           =   960
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
   Begin VB.CommandButton ClipboardToBG 
      Caption         =   "Clipboard From Level Editor (Hot Key ""C"")"
      Height          =   375
      Index           =   0
      Left            =   120
      TabIndex        =   19
      TabStop         =   0   'False
      ToolTipText     =   "Hit ""C"" over the editor view to place in a specific location."
      Top             =   6240
      Width           =   3855
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   7
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   1680
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   1440
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   1200
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   960
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   720
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   480
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   240
      Width           =   285
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   0
      Width           =   285
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   7695
      Left            =   11805
      Max             =   1
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.CommandButton BGCommand1 
      Caption         =   "Save Background File"
      Height          =   375
      Index           =   2
      Left            =   6240
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   7680
      Visible         =   0   'False
      Width           =   3855
   End
   Begin VB.TextBox BGText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4680
      MaxLength       =   6
      TabIndex        =   9
      TabStop         =   0   'False
      Text            =   "1D0437"
      ToolTipText     =   "Multi-CRE box"
      Top             =   7680
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.CommandButton BGCommand1 
      Caption         =   "Save Background To ROM"
      Height          =   375
      Index           =   3
      Left            =   5880
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   7680
      Visible         =   0   'False
      Width           =   3855
   End
   Begin VB.CommandButton BGCommand1 
      Caption         =   "Open Background File"
      Height          =   375
      Index           =   1
      Left            =   6840
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   7680
      Visible         =   0   'False
      Width           =   3855
   End
   Begin VB.CommandButton BGCommand1 
      Caption         =   "Rip Background From ROM"
      Height          =   495
      Index           =   0
      Left            =   5400
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   7680
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.PictureBox BGPicture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   7680
      Left            =   4125
      ScaleHeight     =   512
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   512
      TabIndex        =   4
      Top             =   0
      Width           =   7680
      Begin VB.Image Target2 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.PictureBox Palette1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1920
      Left            =   0
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   3
      Top             =   0
      Width           =   3840
      Begin VB.Image Target3 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Left            =   0
         Top             =   0
         Width           =   3855
      End
   End
   Begin VB.VScrollBar Menu8x8VScroll1 
      Height          =   3855
      LargeChange     =   16
      Left            =   3840
      Max             =   48
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   2160
      Width           =   255
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
      ItemData        =   "BG_Editor.frx":0000
      Left            =   4920
      List            =   "BG_Editor.frx":001C
      Style           =   2  'Dropdown List
      TabIndex        =   0
      ToolTipText     =   "Palette to use to draw 8x8 previews"
      Top             =   7680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   6
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   26
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   6
         Left            =   0
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   34
         Top             =   0
         Visible         =   0   'False
         Width           =   960
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   6
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   2
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   2
         Left            =   0
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   30
         Top             =   0
         Visible         =   0   'False
         Width           =   960
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   2
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   4
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   4
         Left            =   0
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   32
         Top             =   0
         Visible         =   0   'False
         Width           =   960
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   4
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   1
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   1
         Left            =   480
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   29
         Top             =   240
         Visible         =   0   'False
         Width           =   960
      End
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
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   7
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   7
         Left            =   360
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   35
         Top             =   120
         Visible         =   0   'False
         Width           =   960
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   7
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   5
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   25
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   5
         Left            =   480
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   33
         Top             =   240
         Visible         =   0   'False
         Width           =   960
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   5
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Index           =   3
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   2160
      Width           =   3840
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   840
         Index           =   3
         Left            =   360
         ScaleHeight     =   840
         ScaleWidth      =   960
         TabIndex        =   31
         Top             =   360
         Visible         =   0   'False
         Width           =   960
      End
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   3
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00000000&
      Caption         =   "Force to background"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   20
      TabStop         =   0   'False
      ToolTipText     =   "If checked, tiles will be forced behind Samus.  Otherwise, the typical priority of the tile takes over."
      Top             =   6600
      Value           =   1  'Checked
      Width           =   3855
   End
   Begin VB.Menu mnuExternalFiles 
      Caption         =   "&External Files     "
      Begin VB.Menu mnuBackgroundFile 
         Caption         =   "Open Background File"
         Index           =   0
      End
      Begin VB.Menu mnuBackgroundFile 
         Caption         =   "Save Background File"
         Index           =   1
      End
   End
   Begin VB.Menu mnuROMData 
      Caption         =   "&ROM"
      Begin VB.Menu mnuBackgroundFromROM 
         Caption         =   "Re-Open/Refresh Background from ROM"
         Index           =   0
      End
      Begin VB.Menu mnuBackgroundFromROM 
         Caption         =   "Save Changes to ROM"
         Index           =   1
      End
   End
End
Attribute VB_Name = "BG_Editor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type BGDATATYPE     '11 bytes long
    Header As Integer
    '0002 = normal
    '0004 = spore spawn
    '000E = landing zone
    'next 3 are the offset of the actual BG, if Header is 0002
    Unknown(0 To 9) As Byte
End Type

'Private BGDATA(0 To 1023) As Integer    'actual BG data (8x8 tile map)
Private BGDATA() As Integer         'actual BG data (8x8 tile map)
Private BGDATA_as_bytes() As Byte   'BG data as bytes
Private HasPalette As Boolean       'true = copied, false = menu
Private PaletteNumber As Byte       '# of the palette, if we have one

Public Sub BGCommand1_Click(Index As Integer)
Dim BGPath As String
Dim BGOffset As Long
Dim NewData() As Byte
Dim CMD1 As New OpenSave


Select Case Index
    Case 0: GoTo RIP_BG
    Case 1: GoTo OPEN_BG_FROM_FILE
    Case 2: GoTo SAVE_BG_TO_FILE
    Case 3: GoTo INSERT_BG
    Case Else: Exit Sub
End Select

RIP_BG: 'rip from rom, to allow displaying in editor
BGOffset = Val("&H" & BGText1.Text) + ROM_HEADER
LunarOpenFile needslash, LC_READWRITE
Decompress BGOffset, BGDATA_as_bytes
LunarCloseFile
'save to temporary file
BGPath = App.Path & "\files\temp\background.tmp"
Open BGPath For Binary As #1
    Put #1, 1, BGDATA_as_bytes()
    ReDim BGDATA_as_bytes(0 To LOF(1) - 1) As Byte
    ReDim BGDATA(0 To (LOF(1) \ 2) - 1) As Integer
    AllowScrollOfBG
    Get #1, 1, BGDATA()
Close #1
Kill BGPath
GoTo Exit_1

OPEN_BG_FROM_FILE:  'open from an external file
'CHOOSE BG FILE
CMD1.Filter = "BG|*.BG"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then MsgBox "No file selected!", vbOKOnly, "Oops!": Exit Sub
BGPath = DD
'open bg data from decompressed sheet
Open BGPath For Binary As #1
    If LOF(1) = 0 Then MsgBox "No file, so nothing will be done.", vbOKOnly, "Not going to do it.": Close #1: Exit Sub
    ReDim BGDATA_as_bytes(0 To LOF(1) - 1) As Byte
    ReDim BGDATA(0 To (LOF(1) \ 2) - 1) As Integer
    AllowScrollOfBG
    Get #1, , BGDATA
Close #1
GoTo Exit_1

SAVE_BG_TO_FILE:    'save to an external file
BGPath = Left$(needslash, Len(needslash) - 4) & "_" & BGText1.Text & ".BG"
Open BGPath For Binary As #1
    Put #1, 1, BGDATA()
Close #1
MsgBox "Background data (tile map) saved as:" & vbCrLf & BGPath
GoTo Exit_2

INSERT_BG:          'take existing bg data and store it to the rom
'save current BG data as a temp file
BGPath = App.Path & "\files\temp\background.tmp"
Open BGPath For Binary As #1
    Put #1, 1, BGDATA()
    Get #1, 1, BGDATA_as_bytes()
Close #1
Kill BGPath
'recompress
'ReDim BGDATA_as_bytes(0 To &HFFFF&) As Byte
ReDim NewData(0 To &HFFFF&) As Byte
Dim ArrayIndex

DD = RecompressData(BGDATA_as_bytes, NewData())
ReDim Preserve NewData(0 To DD - 1) As Byte
MsgBox "Recompressed size is: $" & Hex$(UBound(NewData))
'save data to rom
Open needslash For Binary As #1
    Put #1, Val("&H" & BGText1.Text) + ROM_HEADER + 1, NewData()
Close #1
GoTo Exit_2

Exit_1:     'open data
'now that we have some bg data, saving can be allowed
'BGCommand1(2).Enabled = True
'BGCommand1(3).Enabled = True
'update the background window with our new data
RefreshBackgroundPreview
Exit_2:     'open or save data... do the same
End Sub






Private Sub BGPicture1_KeyDown(KeyCode As Integer, Shift As Integer)
Dim TempBGIndex
Dim XXX As Single
Dim YYY As Single

XXX = Target2.Left
YYY = Target2.Top
TempBGIndex = (XXX \ 16) + ((YYY \ 16) * 32)

Select Case KeyCode
    Case 37: GoTo FlipHorizontal
    Case 38: GoTo FlipVertical
    Case 39: GoTo FlipHorizontal
    Case 40: GoTo FlipVertical
    Case 67: GoTo ClipboardFromLevelEditor
    Case Else: Exit Sub
End Select

ClipboardFromLevelEditor:
ClipboardToBG_Click 1
Exit Sub

FlipHorizontal:
BGDATA(TempBGIndex) = BGDATA(TempBGIndex) Xor &H4000
GoTo FinishFlipping

FlipVertical:
BGDATA(TempBGIndex) = BGDATA(TempBGIndex) Xor &H8000

FinishFlipping:
RefreshBackgroundPreview
End Sub


Private Sub BGPicture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempBGIndex As Integer
Dim TempValue As Integer
Dim TempTargetX As Integer
Dim TempTargetY As Integer

TempBGIndex = (X \ 16) + ((Y \ 16) * 32)
If Button = 2 Then GoTo CopyTile

PlaceTile:
If TempBGIndex > 1023 Then Exit Sub
'xor to remove existing tile number... or to replace it with our new one
'BGDATA(TempBGIndex) = (BGDATA(TempBGIndex) - (BGDATA(TempBGIndex) And &H3FF)) Or DraggedDropped.Index
BGDATA(TempBGIndex) = (BGDATA(TempBGIndex) - (BGDATA(TempBGIndex) And &H3FF)) Or DraggedDropped.Index
'adjust for color and flip chosen by list
BGDATA(TempBGIndex) = (BGDATA(TempBGIndex) - (BGDATA(TempBGIndex) And &HDC00)) 'Or ASL(Val(TileTableMenuPalette.Text), 10)
'adjust for selected palette
If HasPalette = False Then
    BGDATA(TempBGIndex) = BGDATA(TempBGIndex) Or ASL(Val(TileTableMenuPalette.Text), 10)
Else
    BGDATA(TempBGIndex) = BGDATA(TempBGIndex) Or ASL(PaletteNumber, 10)
End If

RefreshBackgroundPreview
Exit Sub

CopyTile:
    'TempTile = BGDATA(BGIndex) And &H3FF
    'TempHorizontal = BGDATA(BGIndex) And &H4000
    'TempVertical = BGDATA(BGIndex) And &H8000
'tempbgindex = which entry we click on
'DraggedDropped.Index = (BGDATA(TempBGIndex)) - 4096 'Or DraggedDropped.Index
DraggedDropped.Index = (BGDATA(TempBGIndex))
PaletteNumber = ConvertToOAM(BGDATA(TempBGIndex)).Palette
'DraggedDropped.Trait
'two following lines needed?
TempTargetX = (DraggedDropped.Index Mod 16) * 16
TempTargetY = (DraggedDropped.Index \ 16) * 16
'hide the target cursor if we have selected with a right click on the editor
Target(0).Move -100, -100
RefreshBackgroundPreview
HasPalette = True
End Sub

Private Sub BGPicture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'FOR MOVING TARGET BOX
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > BGPicture1.Width Then X = BGPicture1.Width - 1
If Y > BGPicture1.Height Then Y = BGPicture1.Height - 1

Dim RealX
Dim RealY
RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16
Target2.Move RealX, RealY

If Button <> 1 Then Exit Sub    'if pressing a button, we'll do mouse_down

BGPicture1_MouseDown Button, Shift, X, Y
End Sub

Private Sub BGText1_Change()
BG_Editor.Caption = "Background located at:  $" & BGText1.Text
End Sub

Private Sub Command1_Click(Index As Integer)
TileTableMenuPalette.Text = Index

For I = 0 To 7
Command1(I).FontBold = False
Command1(I).BackColor = RGB(150, 150, 150)
Command1(I).FontSize = 10
Next I
Command1(Index).FontBold = True
Command1(Index).BackColor = RGB(255, 255, 200)
Command1(Index).FontSize = 11
Target3.Top = Command1(Index).Top
End Sub

Private Sub Command1_GotFocus(Index As Integer)
Command1_Click Index
End Sub



Public Sub ClipboardToBG_Click(Index As Integer)
Dim ArrayOf8x8s(0 To 8191) As Integer    'each integer is 16 bits worth of data for an 8x8 tile
Dim TileTableData(0 To 8191) As OAM      'the above array, converted into usable OAM data
Dim Temp16x16(0 To 3) As Integer         'each corner of a 16x16
Dim FlipDirection As Byte
Dim SwapInteger As Integer
Dim TempSheet As Integer
Dim TempTile As Integer

'grab the current tile tables for the room from our temporary copy of it
Open App.Path & "\files\temp\ttable.bin" For Binary As #68
    Get #68, , ArrayOf8x8s
Close #68
'convert the raw integers into usable OAM data
For I = 0 To 1023
    TileTableData(I) = ConvertToOAM(ArrayOf8x8s(I))
Next I

'currently have the tile table converted to usable OAM data
'clipboard tells us the 16x16 to use, plus the flips associated (ignore solidity)
'need to use tile # to determine the proper integer to input into the BG tile table
'flips applied to all 8x8's, as appropriate

If Index = 0 Then
    XXX = 0: YYY = 0
Else
    XXX = Target2.Left \ 16: YYY = (Target2.Top \ 16) * 32
End If
II = XXX + YYY

BG_Editor.Caption = Hex$(XXX) & "     " & Hex$(YYY)
For I = 1 To 256
If FakeClip(I).Visible = False Then GoTo AdvancePosition
    'figure what 16x16 we're grabbing from in the room's tile tables
    TempSheet = ClipBoardTile(I).PatternByte Mod 4
    TempTile = ClipBoardTile(I).BlockID + (TempSheet * 256) 'correct 16x16 tile selected
    'grab the appropriate OAM data for that 16x16
    Temp16x16(0) = ArrayOf8x8s((TempTile * 4))
    Temp16x16(1) = ArrayOf8x8s((TempTile * 4) + 1)
    Temp16x16(2) = ArrayOf8x8s((TempTile * 4) + 2)
    Temp16x16(3) = ArrayOf8x8s((TempTile * 4) + 3)
    FlipDirection = (ClipBoardTile(I).PatternByte Mod 16) \ 4
    If FlipDirection = 0 Then GoTo FlipsDone
    If FlipDirection = 1 Then GoTo FlipHor
    If FlipDirection = 2 Then GoTo FlipVer
    
FlipBoth:
    SwapInteger = Temp16x16(0)
    Temp16x16(0) = Temp16x16(3) Or &HC000
    Temp16x16(3) = SwapInteger Or &HC000
    SwapInteger = Temp16x16(1)
    Temp16x16(1) = Temp16x16(2) Or &HC000
    Temp16x16(2) = SwapInteger Or &HC000
    GoTo FlipsDone
FlipVer:
    SwapInteger = Temp16x16(0)
    Temp16x16(0) = Temp16x16(2) Or &H8000
    Temp16x16(2) = SwapInteger Or &H8000
    SwapInteger = Temp16x16(1)
    Temp16x16(1) = Temp16x16(3) Or &H8000
    Temp16x16(3) = SwapInteger Or &H8000
    GoTo FlipsDone
FlipHor:
    SwapInteger = Temp16x16(0)
    Temp16x16(0) = Temp16x16(1) Or &H4000
    Temp16x16(1) = SwapInteger Or &H4000
    SwapInteger = Temp16x16(2)
    Temp16x16(2) = Temp16x16(3) Or &H4000
    Temp16x16(3) = SwapInteger Or &H4000
FlipsDone:
    If Check1.Value = 1 Then
        Temp16x16(0) = Temp16x16(0) Xor &H2000
        Temp16x16(1) = Temp16x16(1) Xor &H2000
        Temp16x16(2) = Temp16x16(2) Xor &H2000
        Temp16x16(3) = Temp16x16(3) Xor &H2000
    End If
    If II > UBound(BGDATA) Then GoTo AdvancePosition
    BGDATA(II) = Temp16x16(0)
    If II + 1 > UBound(BGDATA) Then GoTo AdvancePosition
    BGDATA(II + 1) = Temp16x16(1)
    If II + 32 > UBound(BGDATA) Then GoTo AdvancePosition
    BGDATA(II + 32) = Temp16x16(2)
    If II + 33 > UBound(BGDATA) Then GoTo AdvancePosition
    BGDATA(II + 33) = Temp16x16(3)
AdvancePosition:
    'II = II + 2
    XXX = XXX + 2
    Select Case XXX
        Case 32: XXX = 0: YYY = YYY + 64
        Case 33: XXX = 1: YYY = YYY + 64
        Case Else:  'do nothing here
    End Select
    
    II = XXX + YYY
    If II > 1023 Then Exit For
Next I
RefreshBackgroundPreview
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub


Private Sub Form_Load()
Dim TempString As String * 5
Dim TempBGOffset As ThreeByte
Dim TempBGDATA As BGDATATYPE
Dim BGDATADEPTH As Integer  '# of BG_Data's we've gone into to find our "real" data

Me.Icon = Smile.Icon
'redimension bgdata at very start to prevent an error
ReDim BGDATA(0 To 1023) As Integer

For I = 0 To 7
    Picture1(I).Move 0, 0, 128, 1024
Next I

Picture2(0).DragIcon = Smile.Icon
'palette data
UpdatePalettePreview
'Palette1_MouseDown 1, 0, 4, 6
'8x8 Data
TileTableMenuPalette.Text = 0
DrawColoredSheets

'If RoomHeader1.RegionCombo1.Text = "CERES" Then TileTableScroll1.Max = TileTableScroll1.Max - 256

Select Case SmileMod1.MyState.BG_Data
    Case Is >= 0: GoTo BadBG
    Case Is < 0: GoTo GoodBG
End Select

BadBG:
MsgBox "Room doesn't use a valid background pointer.", vbInformation, "No pointer."
TimedKill = True
BGCommand1(3).Visible = False
Exit Sub

GoodBG:
'$8F:B8B4
BGDATADEPTH = 0
TempBGOffset.Byte1 = Val("&H" & Right$(Hex$(SmileMod1.MyState.BG_Data), 2) & "&")
TempBGOffset.Byte2 = Val("&H" & Left$(Hex$(SmileMod1.MyState.BG_Data), 2) & "&")
TempBGOffset.Byte3 = &H8F&
Open needslash For Binary As #1
AdvanceInDepth:
    'grab BG_DATA
    Get #1, ThreePoint2Offset(TempBGOffset) + BGDATADEPTH + ROM_HEADER + 1, TempBGDATA
    'to prevent a never ending loop
    If BGDATADEPTH > 300 Then
KillBackground:
        MsgBox "Apparently an unidentified background format?", vbOKOnly, "Whoops?"
        Close #1
        TimedKill.Enabled = True
        Exit Sub
    End If
    'check the header
    Select Case TempBGDATA.Header
        'Case &H0: BGDATADEPTH = BGDATADEPTH + 2: GoTo AdvanceInDepth
        'boss data (advance a set, repeat)
        'Case &H2: MsgBox "Background data retrieved from RAM. Cannot be read by SMILE.": Close #1: TimedKill.Enabled = True: Exit Sub
        'read data (do nothing)
        Case &H4: 'real data
        'kraid
        'Case &H8: MsgBox Hex$(ThreePoint2Offset(TempBGOffset))
        'transition (advance 4 bytes... repeat just in case there's an unusual format somewhere that requires it)
        'Case &HA: BGDATADEPTH = BGDATADEPTH + 4: GoTo AdvanceInDepth
        'landing zone
        'Case &HE: BGDATADEPTH = BGDATADEPTH + 11: GoTo AdvanceInDepth
        Case Else: GoTo KillBackground
    End Select
    Get #1, ThreePoint2Offset(TempBGOffset) + BGDATADEPTH + ROM_HEADER + 2 + 1, TempBGOffset
Close #1
BGText1.Text = Hex$(ThreePoint2Offset(TempBGOffset))
BGCommand1_Click 0
Command1_Click 0
End Sub


Private Sub Menu8x8VScroll1_Scroll()
Menu8x8VScroll1_Change
End Sub


Private Sub mnuBackgroundFile_Click(Index As Integer)
Select Case Index
    Case 0: BGCommand1_Click 1
    Case 1: BGCommand1_Click 2
End Select
End Sub

Private Sub mnuBackgroundFromROM_Click(Index As Integer)
Select Case Index
    Case 0: BGCommand1_Click 0
    Case 1: BGCommand1_Click 3
End Select
End Sub


Private Sub Picture2_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempBGIndex As Integer
Dim TempValue As Integer

DraggedDropped.Trait = 0
DraggedDropped.Index = ((Y \ 16) * 16) + (X \ 16) + (Menu8x8VScroll1.Value * 16)
HasPalette = False
End Sub

Private Sub Picture2_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
'FOR MOVING TARGET BOX
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > Picture2(Index).Width Then X = Picture2(Index).Width - 1
If Y > Picture2(Index).Height Then Y = Picture2(Index).Height - 1

Dim RealX
Dim RealY
RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16
Target(Index).Move RealX, RealY
End Sub



Public Sub UpdatePalettePreview()
'128 colors for scenery
'2nd 128, not sure
For I = 0 To 127
    YY = (I \ 16) * 16
    XX = (I Mod 16) * 16
    Palette1.Line (XX, YY)-(XX + 16, YY + 16), FlipRGB(PcPalette(I)), BF 'PcPalette(i), BF
Next I
Palette1.Refresh
End Sub


Public Sub TileTableMenuPalette_Click()
Picture2(Val(TileTableMenuPalette.Text)).ZOrder 0
End Sub


Private Sub Get8x8GFX()
Dim OutputArray() As Byte
Dim RipTiles() As Byte

CREFile:
DecompressTilesForRip8x8 Smile.StateGraphicSetCombo1.Text, RipTiles, True
UREFile:
DecompressTilesForRip8x8 Smile.StateGraphicSetCombo1.Text, RipTiles, False
End Sub

Public Sub Menu8x8VScroll1_Change()
For I = 0 To 7
    Picture2(I).Cls
    StretchBlt Picture2(I).hdc, 0, -(Menu8x8VScroll1.Value * 16), 256, 2048, Picture1(I).hdc, 0, 0, 128, 1024, SRCCOPY
    Picture2(I).Refresh
Next I
End Sub

Private Sub RefreshBackgroundPreview()
Dim TempTile As Integer         'actual # of the tile
Dim TempPalette As Integer
Dim TempHorizontal As Integer   'simply 0 or not
Dim TempVertical As Integer     'simply 0 or not
Dim BGIndex As Integer
Dim BGX As Integer
Dim BGY As Integer
Dim Xof8x8 As Integer
Dim Yof8x8 As Integer
Dim TypeOfFlip As Byte          'H, V, HV, or neither

'get tile # for each 8x8
BGX = 0
BGY = 0
For BGIndex = 0 To UBound(BGDATA)
    'grab palette for this 8x8
    TempPalette = ConvertToOAM(BGDATA(BGIndex)).Palette
    'getting data
    TempTile = BGDATA(BGIndex) And &H3FF
    TempHorizontal = BGDATA(BGIndex) And &H4000
    TempVertical = BGDATA(BGIndex) And &H8000
        If TempHorizontal = 0 And TempVertical = 0 Then TypeOfFlip = 0
        If TempHorizontal <> 0 And TempVertical = 0 Then TypeOfFlip = 1
        If TempHorizontal = 0 And TempVertical <> 0 Then TypeOfFlip = 2
        If TempHorizontal <> 0 And TempVertical <> 0 Then TypeOfFlip = 3
    'figure X/Y of 8x8 tile in menu
    Xof8x8 = (TempTile Mod 16) * 8
    Yof8x8 = (TempTile \ 2) - (Xof8x8 \ 16)
    Select Case TypeOfFlip
        Case 0: StretchBlt BGPicture1.hdc, BGX, BGY, 16, 16, Picture1(TempPalette).hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
        Case 1: StretchBlt BGPicture1.hdc, BGX + 16, BGY, -17, 16, Picture1(TempPalette).hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
        Case 2: StretchBlt BGPicture1.hdc, BGX, BGY + 16, 16, -17, Picture1(TempPalette).hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
        Case 3: StretchBlt BGPicture1.hdc, BGX + 16, BGY + 16, -17, -17, Picture1(TempPalette).hdc, Xof8x8, Yof8x8, 8, 8, SRCCOPY
    End Select
    'preparing for the next tile
    BGX = BGX + 16
    If BGX > 511 Then
        BGX = 0
        BGY = BGY + 16
    End If
Next BGIndex
BGPicture1.Refresh
End Sub


Private Sub TimedKill_Timer()
Unload BG_Editor
End Sub

Public Sub VScroll1_Change()
BGPicture1.Top = VScroll1.Value * -512
End Sub

Private Sub VScroll1_Scroll()
VScroll1_Change
End Sub

Public Sub AllowScrollOfBG()
Dim TempInteger As Integer
'whether or not we can scroll the BG editor (ie- larger than $800?)
TempInteger = (UBound(BGDATA) \ &H400)
If TempInteger < 0 Then TempInteger = 0
BG_Editor.VScroll1.Max = TempInteger
End Sub


Private Sub DrawColoredSheets()
Dim Test(0 To 7) As New cDIBSection
Dim TempI As Long
Dim TempX As Long
Dim TempY As Long
Dim PaletteIndex As Integer

'decompress all 8x8's
Get8x8GFX

'start of the stuff done for each sheet
For PaletteIndex = 0 To 7
'make "table" for first half of URE 8x8's
Test(PaletteIndex).CreateMetaTable App.Path & "\files\temp\ure.gfx", 0, 512

TempX = 0
TempY = 0
'choose palette to use
TempPaletteIndex = PaletteIndex
Test(PaletteIndex).CreatePalette Val(PaletteIndex)

For TempI = 0 To 511
    Test(PaletteIndex).RenderToDC Picture1(PaletteIndex).hdc, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI
'make "table" for second half of URE 8x8's
Test(PaletteIndex).CreateMetaTable App.Path & "\files\temp\ure.gfx", &H4000&, 64
For TempI = 0 To 63
    Test(PaletteIndex).RenderToDC Picture1(PaletteIndex).hdc, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI
'make "table" for CRE 8x8's

TempY = 320
Test(PaletteIndex).CreateMetaTable App.Path & "\files\temp\cre.gfx", 0, 384
For TempI = 0 To 383
    Test(PaletteIndex).RenderToDC Picture1(PaletteIndex).hdc, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI
Next PaletteIndex
Menu8x8VScroll1_Change
RefreshBackgroundPreview
End Sub
