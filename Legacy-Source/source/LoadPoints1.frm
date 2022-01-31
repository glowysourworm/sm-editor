VERSION 5.00
Begin VB.Form LoadPoints1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " Load Stations"
   ClientHeight    =   4395
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   2835
   ClipControls    =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4395
   ScaleWidth      =   2835
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton DoorDataCommand1 
      Caption         =   "Door Data"
      Enabled         =   0   'False
      Height          =   375
      Left            =   840
      TabIndex        =   20
      ToolTipText     =   "Door Data for a door that points to this room"
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton RoomIDCommand1 
      Caption         =   "RoomID"
      Height          =   375
      Left            =   840
      TabIndex        =   19
      ToolTipText     =   "RoomID of save/load point"
      Top             =   1080
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   435
      Left            =   0
      TabIndex        =   18
      Top             =   3960
      Width           =   1425
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Done/Cancel"
      Height          =   435
      Left            =   1440
      TabIndex        =   3
      Top             =   3960
      Width           =   1395
   End
   Begin VB.TextBox ASTEXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   0
      Left            =   0
      MaxLength       =   4
      TabIndex        =   10
      Text            =   "0000"
      Top             =   1080
      Width           =   765
   End
   Begin VB.TextBox ASTEXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   1
      Left            =   0
      MaxLength       =   4
      TabIndex        =   9
      Text            =   "0000"
      Top             =   1470
      Width           =   765
   End
   Begin VB.TextBox ASTEXT 
      BackColor       =   &H00C0C0FF&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   2
      Left            =   0
      MaxLength       =   4
      TabIndex        =   8
      Text            =   "0000"
      Top             =   1860
      Width           =   765
   End
   Begin VB.TextBox ASTEXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   3
      Left            =   0
      MaxLength       =   4
      TabIndex        =   7
      Text            =   "0000"
      Top             =   2250
      Width           =   765
   End
   Begin VB.TextBox ASTEXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   4
      Left            =   0
      MaxLength       =   4
      TabIndex        =   6
      Text            =   "0000"
      Top             =   2640
      Width           =   765
   End
   Begin VB.TextBox ASTEXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   5
      Left            =   0
      MaxLength       =   4
      TabIndex        =   5
      Text            =   "0000"
      Top             =   3030
      Width           =   765
   End
   Begin VB.TextBox ASTEXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   6
      Left            =   0
      MaxLength       =   4
      TabIndex        =   4
      Text            =   "0000"
      Top             =   3420
      Width           =   765
   End
   Begin VB.ComboBox ASINDEX1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      ItemData        =   "LoadPoints1.frx":0000
      Left            =   1990
      List            =   "LoadPoints1.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   360
      Width           =   825
   End
   Begin VB.ComboBox RegionCombo1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      ItemData        =   "LoadPoints1.frx":0004
      Left            =   0
      List            =   "LoadPoints1.frx":0006
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   360
      Width           =   2025
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Index"
      Height          =   195
      Index           =   1
      Left            =   2280
      TabIndex        =   17
      Top             =   720
      Width           =   390
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Region"
      Height          =   195
      Index           =   0
      Left            =   0
      TabIndex        =   16
      Top             =   720
      Width           =   510
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Unknown"
      Height          =   390
      Index           =   10
      Left            =   840
      TabIndex        =   15
      ToolTipText     =   "Almost always 0000, rarely 0001"
      Top             =   1980
      Width           =   690
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Scroll X"
      Height          =   390
      Index           =   11
      Left            =   840
      TabIndex        =   14
      Top             =   2370
      Width           =   540
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Scroll Y"
      Height          =   390
      Index           =   12
      Left            =   840
      TabIndex        =   13
      Top             =   2760
      Width           =   540
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Samus Y (from top)"
      Height          =   390
      Index           =   13
      Left            =   840
      TabIndex        =   12
      Top             =   3150
      Width           =   1335
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Samus X (from middle)"
      Height          =   390
      Index           =   14
      Left            =   840
      TabIndex        =   11
      Top             =   3540
      Width           =   1560
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00C86464&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Load Points (8) and Other"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2835
   End
   Begin VB.Menu mnuRoomIDCommand 
      Caption         =   "RoomID"
      Visible         =   0   'False
      Begin VB.Menu mnuRoomIDCommand1 
         Caption         =   "Use CURRENT Room For This Load Point"
         Index           =   0
      End
      Begin VB.Menu mnuRoomIDCommand1 
         Caption         =   "ENTER This Room"
         Index           =   1
      End
   End
   Begin VB.Menu mnuDoorDataCommand 
      Caption         =   "Door Data"
      Visible         =   0   'False
      Begin VB.Menu mnuDoorDataCommand1 
         Caption         =   "From Door Tile you last pressed ""L"" over"
         Index           =   0
      End
   End
End
Attribute VB_Name = "LoadPoints1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub ASINDEX1_Click()
'only click regioncombo1 if changing the value
If ASINDEX1.Tag <> ASINDEX1.Text Then
    ASINDEX1.Tag = ASINDEX1.Text
    RegionCombo1_Click
End If
End Sub

Private Sub Command1_Click()
Dim AreaSpecial1 As AreaSave
Dim IndexOffset As Integer
Dim CrateriaSaveOffset As Integer
Dim AreaSaveOffset As Integer
Dim AreaSaveThreeByte As ThreeByte

AreaSpecial1.RoomID = Val("&H" & ASTEXT(0).Text)
AreaSpecial1.RoomLoad = Val("&H" & ASTEXT(1).Text)
AreaSpecial1.Unknown = Val("&H" & ASTEXT(2).Text)
AreaSpecial1.ScrollX = Val("&H" & ASTEXT(3).Text)
AreaSpecial1.ScrollY = Val("&H" & ASTEXT(4).Text)
AreaSpecial1.SamusY = Val("&H" & ASTEXT(5).Text)
AreaSpecial1.SamusX = Val("&H" & ASTEXT(6).Text)

IndexOffset = Val("&H" & ASINDEX1.Text) * &HE&

Open needslash For Binary As #1
    Get #1, AreaSavePointerTable + (RegionCombo1.ListIndex * 2) + ROM_HEADER + 1, AreaSaveThreeByte.Byte1
    Get #1, AreaSavePointerTable + (RegionCombo1.ListIndex * 2) + ROM_HEADER + 2, AreaSaveThreeByte.Byte2
    AreaSaveThreeByte.Byte3 = &H80&
    AreaSaveOffset = ThreePoint2Offset(AreaSaveThreeByte)
    Put #1, AreaSaveOffset + IndexOffset + ROM_HEADER + 1, AreaSpecial1
Close #1

End Sub

Private Sub Command2_Click()
Unload Me
End Sub



Private Sub DoorDataCommand1_Click()
ASTEXT(1).Text = Right$("0000" & DoorDataCommand1.Caption, 4)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Me.Icon = Smile.Icon
DoorDataCommand1.Caption = "<- " & Right$("0000" & Hex$(WhichDoorDataOffset), 4)

RegionCombo1.Clear
For I = 0 To 7
    RegionCombo1.AddItem RoomHeader1.RegionCombo1.List(I)
Next I

'in only until load entries from pointers
ASINDEX1.Clear
For I = 0 To 31
    ASINDEX1.AddItem Right$("00" & Hex$(I), 2)
Next I
'''''''''''''''''''''''''''''''''''''''''

RegionCombo1.Text = RoomHeader1.RegionCombo1.Text
ASINDEX1.Text = "00"
End Sub

Private Sub LoadSaveCommand1_Click(Index As Integer)
Select Case Index
    Case 0: GoTo UseCurrentRoom
    Case 1: GoTo EnterThisRoom
    Case 2: GoTo SetToLChosen
End Select
Exit Sub

UseCurrentRoom:
ASTEXT(0).Text = Right$(Smile.mdbCombo.Text, 4)
Exit Sub

EnterThisRoom:
On Error GoTo NotARoom
Smile.mdbCombo.Text = "7" & ASTEXT(0).Text
Exit Sub
NotARoom:
MsgBox "This room is not in the list!"
Exit Sub

SetToLChosen:
'ASTEXT(1).Text = Right$("0000" & Hex$(MyDoorDataOffset(WhichDoorDataOffset)), 4)
ASTEXT(1).Text = Right$("0000" & Hex$(WhichDoorDataOffset), 4)
Exit Sub
End Sub



Private Sub mnuRoomIDCommand1_Click(Index As Integer)
Select Case Index
    Case 0: GoTo UseCurrentRoom
    Case 1: GoTo EnterThisRoom
End Select

UseCurrentRoom:
ASTEXT(0).Text = Right$(Smile.mdbCombo.Text, 4)
Exit Sub

EnterThisRoom:
On Error GoTo NotARoom
Smile.mdbCombo.Text = "7" & ASTEXT(0).Text
Exit Sub
NotARoom:
MsgBox "This room is not in the list!"
Exit Sub
End Sub

Private Sub RegionCombo1_Click()
Dim AreaSpecial1 As AreaSave
Dim IndexOffset As Integer
Dim CrateriaSaveOffset As Integer
Dim AreaSaveOffset As Integer
Dim NextAreaSaveOffset As Integer
Dim AreaSaveThreeByte As ThreeByte
Dim NumberOfEntries As Integer

'BitDescriptions RoomHeader1.RegionCombo1.ListIndex, States1.TestCodeList1.ListIndex

IndexOffset = Val("&H" & ASINDEX1.Text) * &HE&

'get the entry after the one we want
Open needslash For Binary As #1
    Get #1, AreaSavePointerTable + ((RegionCombo1.ListIndex + 1) * 2) + ROM_HEADER + 1, AreaSaveThreeByte.Byte1
    Get #1, AreaSavePointerTable + ((RegionCombo1.ListIndex + 1) * 2) + ROM_HEADER + 2, AreaSaveThreeByte.Byte2
    AreaSaveThreeByte.Byte3 = &H80&
    NextAreaSaveOffset = ThreePoint2Offset(AreaSaveThreeByte)
'get the entry we want
    Get #1, AreaSavePointerTable + (RegionCombo1.ListIndex * 2) + ROM_HEADER + 1, AreaSaveThreeByte.Byte1
    Get #1, AreaSavePointerTable + (RegionCombo1.ListIndex * 2) + ROM_HEADER + 2, AreaSaveThreeByte.Byte2
    AreaSaveThreeByte.Byte3 = &H80&
    AreaSaveOffset = ThreePoint2Offset(AreaSaveThreeByte)
    Get #1, AreaSaveOffset + IndexOffset + ROM_HEADER + 1, AreaSpecial1
Close #1

ASTEXT(0).Text = Right$("0000" & Hex$(AreaSpecial1.RoomID), 4)
ASTEXT(1).Text = Right$("0000" & Hex$(AreaSpecial1.RoomLoad), 4)
ASTEXT(2).Text = Right$("0000" & Hex$(AreaSpecial1.Unknown), 4)
ASTEXT(3).Text = Right$("0000" & Hex$(AreaSpecial1.ScrollX), 4)
ASTEXT(4).Text = Right$("0000" & Hex$(AreaSpecial1.ScrollY), 4)
ASTEXT(5).Text = Right$("0000" & Hex$(AreaSpecial1.SamusY), 4)
ASTEXT(6).Text = Right$("0000" & Hex$(AreaSpecial1.SamusX), 4)

'if changing areas, update list
If RegionCombo1.ListIndex = 7 Then NextAreaSaveOffset = AreaSaveOffset + &HEE
If RegionCombo1.Tag <> RegionCombo1.Text Then
    NumberOfEntries = (NextAreaSaveOffset - AreaSaveOffset) \ &HE&
    ASINDEX1.Clear
    For I = 0 To NumberOfEntries - 1
        ASINDEX1.AddItem Right$("00" & Hex$(I), 2)
    Next I
    ASINDEX1.Text = "00"
End If

RegionCombo1.Tag = RegionCombo1.Text
End Sub

Private Sub RoomIDCommand1_Click()
PopupMenu mnuRoomIDCommand
End Sub
