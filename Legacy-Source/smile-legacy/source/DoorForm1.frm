VERSION 5.00
Begin VB.Form DoorForm1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Door Editor"
   ClientHeight    =   4200
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6990
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   6990
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Use Current Door To Point At Save/Load Point"
      Height          =   735
      Left            =   5400
      TabIndex        =   28
      Top             =   3360
      Width           =   1575
   End
   Begin VB.OptionButton Door1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Going UP"
      Height          =   375
      Index           =   3
      Left            =   1620
      TabIndex        =   27
      Top             =   3765
      Width           =   1350
   End
   Begin VB.OptionButton Door1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Going DOWN"
      Height          =   375
      Index           =   2
      Left            =   1620
      TabIndex        =   26
      Top             =   3390
      Width           =   1350
   End
   Begin VB.OptionButton Door1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Going LEFT"
      Height          =   375
      Index           =   1
      Left            =   1620
      TabIndex        =   25
      Top             =   3015
      Width           =   1350
   End
   Begin VB.OptionButton Door1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Going RIGHT"
      Height          =   375
      Index           =   0
      Left            =   1620
      TabIndex        =   24
      Top             =   2640
      Width           =   1350
   End
   Begin VB.CheckBox Bubble1 
      BackColor       =   &H00E0E0E0&
      Height          =   1515
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   23
      ToolTipText     =   "I'm a button, you n00b!"
      Top             =   2640
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Remember --->"
      Height          =   375
      Left            =   4200
      TabIndex        =   22
      Top             =   0
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "^---Transfer Properties---^"
      Height          =   255
      Left            =   0
      TabIndex        =   21
      Top             =   390
      Width           =   4180
   End
   Begin VB.ListBox CloneDoorList1 
      BackColor       =   &H00E0E0E0&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1260
      ItemData        =   "DoorForm1.frx":0000
      Left            =   0
      List            =   "DoorForm1.frx":0007
      TabIndex        =   20
      Top             =   1035
      Width           =   4170
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Index           =   8
      Left            =   3510
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   19
      Text            =   "0000"
      ToolTipText     =   "Scroll pointer"
      Top             =   645
      Width           =   680
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Index           =   7
      Left            =   2835
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   18
      Text            =   "0000"
      ToolTipText     =   "Distance from door"
      Top             =   645
      Width           =   680
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Left            =   2475
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   17
      Text            =   "00"
      ToolTipText     =   "Y"
      Top             =   645
      Width           =   360
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Left            =   2115
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   16
      Text            =   "00"
      ToolTipText     =   "X"
      Top             =   645
      Width           =   360
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Left            =   1755
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   15
      Text            =   "00"
      ToolTipText     =   "Yi"
      Top             =   645
      Width           =   360
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Left            =   1395
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   14
      Text            =   "00"
      ToolTipText     =   "Xi"
      Top             =   645
      Width           =   360
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Left            =   1035
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   13
      Text            =   "00"
      ToolTipText     =   "Direction"
      Top             =   645
      Width           =   360
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Left            =   675
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   12
      Text            =   "00"
      ToolTipText     =   "BitFlag"
      Top             =   645
      Width           =   360
   End
   Begin VB.TextBox CloneDoor1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   11
      Text            =   "0000"
      ToolTipText     =   "RoomID"
      Top             =   645
      Width           =   680
   End
   Begin VB.ListBox DoorList1 
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2490
      ItemData        =   "DoorForm1.frx":001B
      Left            =   5400
      List            =   "DoorForm1.frx":0022
      TabIndex        =   10
      Top             =   0
      Width           =   1575
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
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
      Index           =   8
      Left            =   3510
      MaxLength       =   4
      TabIndex        =   9
      Text            =   "0000"
      ToolTipText     =   "Scroll pointer"
      Top             =   0
      Width           =   680
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
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
      Index           =   7
      Left            =   2835
      MaxLength       =   4
      TabIndex        =   8
      Text            =   "0000"
      ToolTipText     =   "Distance from door"
      Top             =   0
      Width           =   680
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
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
      Left            =   2475
      MaxLength       =   2
      TabIndex        =   7
      Text            =   "00"
      ToolTipText     =   "Y"
      Top             =   0
      Width           =   360
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
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
      Left            =   2115
      MaxLength       =   2
      TabIndex        =   6
      Text            =   "00"
      ToolTipText     =   "X"
      Top             =   0
      Width           =   360
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
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
      Index           =   4
      Left            =   1755
      MaxLength       =   2
      TabIndex        =   5
      Text            =   "00"
      ToolTipText     =   "Yi"
      Top             =   0
      Width           =   360
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
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
      Index           =   3
      Left            =   1395
      MaxLength       =   2
      TabIndex        =   4
      Text            =   "00"
      ToolTipText     =   "Xi"
      Top             =   0
      Width           =   360
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
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
      Left            =   1035
      MaxLength       =   2
      TabIndex        =   3
      Text            =   "00"
      ToolTipText     =   "Direction"
      Top             =   0
      Width           =   360
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
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
      Left            =   675
      MaxLength       =   2
      TabIndex        =   2
      Text            =   "00"
      ToolTipText     =   "BitFlag"
      Top             =   0
      Width           =   360
   End
   Begin VB.TextBox DoorProp1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
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
      TabIndex        =   1
      Text            =   "0000"
      ToolTipText     =   "RoomID"
      Top             =   0
      Width           =   680
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Clear Clone Doors"
      Height          =   240
      Left            =   0
      TabIndex        =   0
      Top             =   2295
      Width           =   4180
   End
End
Attribute VB_Name = "DoorForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Bubble1_Click()
DoorProp1(2).Text = Right$("00" & Hex$((Val(DoorProp1(2).Text) Mod 4) + (Bubble1.Value * 4)), 2)
End Sub

Private Sub Command1_Click()
ReDim CloneDoorset(0 To 0) As CloneDoor
CloneDoorList1.Clear
End Sub

Private Sub Command2_Click()
For I = 0 To 8
    DoorProp1(I).Text = CloneDoor1(I).Text
Next I
End Sub

Private Sub Command3_Click()
RememberCurrentDoor DoorList1.ListIndex
End Sub



Private Sub Command4_Click()
WhichDoorDataOffset = MyDoorDataOffset(DoorList1.ListIndex)
End Sub

Private Sub Door1_Click(Index As Integer)
Dim BubblePicture As String
Dim NoBubblePicture As String


NoBubblePicture = App.Path & "\files\controls\smile_no_bubble_" & Index & ".gif"
BubblePicture = App.Path & "\files\controls\smile_bubble_" & Index & ".gif"
Bubble1.Picture = LoadPicture(NoBubblePicture)
Bubble1.DownPicture = LoadPicture(BubblePicture)
DoorProp1(2).Text = Right$("00" & Hex$((Index) + (Bubble1.Value * 4)), 2)
'depending on direction of door, set distance from door
If Val(DoorProp1(2).Text) Mod 4 = 3 Then
    DoorProp1(7).Text = "01C0"
Else
    DoorProp1(7).Text = "8000"
End If

'setting Xi and Yi
Select Case Index
    Case 0: DoorProp1(3).Text = Right$(DoorProp1(5).Text, 1) & "1": DoorProp1(4).Text = Right$(DoorProp1(6).Text, 1) & "6"
    Case 1: DoorProp1(3).Text = Right$(DoorProp1(5).Text, 1) & "E": DoorProp1(4).Text = Right$(DoorProp1(6).Text, 1) & "6"
    Case 2: DoorProp1(3).Text = Right$(DoorProp1(5).Text, 1) & "6": DoorProp1(4).Text = Right$(DoorProp1(6).Text, 1) & "2"
    Case 3: DoorProp1(3).Text = Right$(DoorProp1(5).Text, 1) & "6": DoorProp1(4).Text = Right$(DoorProp1(6).Text, 1) & "D"
End Select

End Sub

Private Sub DoorList1_Click()
RefreshCurrentDoor DoorList1.ListIndex
End Sub


Private Sub DoorList1_DblClick()
    'why not use the following instead?
    'save for use with load point editor
    'MyDoorDataOffset(DoorI) = DoorDataOffset
    
Dim DoorPointer1 As ThreeByte
Dim TempDoorDataThreeByte As ThreeByte
Dim TempInteger As Integer

Open needslash For Binary As #1
    Get #1, Val(Smile.DoorLabel.Caption) + (DoorList1.ListIndex * 2) + 1, TempInteger
Close #1
MsgBox "Pointer for load station in destination room:" & vbcrolf & "   $" & Right$("0000" & Hex$(TempInteger), 4), vbInformation, "Pointer to door"
End Sub
Private Sub DoorProp1_Change(Index As Integer)
If Index = 2 Then GoTo DirectionalChange
If Index = 5 Or Index = 6 Then GoTo XYChange
Exit Sub

DirectionalChange:
If Val("&H" & DoorProp1(Index).Text) > 3 Then
    Bubble1.Value = 1
Else
    Bubble1.Value = 0
End If
Door1(Val(DoorProp1(Index).Text) Mod 4).Value = True
Exit Sub

XYChange:
'setting Xi and Yi
DoorProp1(3).Text = Right$(DoorProp1(5).Text, 1) & Right$(DoorProp1(3).Text, 1): DoorProp1(4).Text = Right$(DoorProp1(6).Text, 1) & Right$(DoorProp1(4).Text, 1)
Exit Sub
End Sub

Private Sub CloneDoorList1_Click()
RefreshCloneDoor CloneDoorList1.ListIndex + 1
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Dim DoorI As Byte

Me.Icon = Smile.Icon
DoorList1.Clear
For I = 0 To UBound(Doorset)
    DoorList1.AddItem ("Door $" & Right$("00" & Hex$(I), 2))
Next I

'1 is our first door... 0 is left blank, always
CloneDoorList1.Clear
For I = 1 To UBound(CloneDoorset)
    CloneDoorList1.AddItem (CloneDoorset(I).Name)
Next I


'was a door clicked to get here?
If RoomTile(MapTileNumber).PatternByte \ 16 = 9 Then
    DoorI = RoomClip(MapTileNumber)
Else
    DoorI = 0
End If
'select door, depending on if one was clicked...
DoorList1.Text = "Door $" & Right$("00" & Hex$(DoorI), 2)
CloneDoorList1.Text = CloneDoorset(UBound(CloneDoorset)).Name
End Sub


Public Sub RefreshCurrentDoor(WhichDoor As Byte)
DoorProp1(0).Text = Right$("0000" & Hex$(Doorset(WhichDoor).RoomID), 4)
DoorProp1(1).Text = Right$("00" & Hex$(Doorset(WhichDoor).DoorBitFlag), 2)
DoorProp1(2).Text = Right$("00" & Hex$(Doorset(WhichDoor).Direction), 2)
DoorProp1(3).Text = Right$("00" & Hex$(Doorset(WhichDoor).Xi), 2)
DoorProp1(4).Text = Right$("00" & Hex$(Doorset(WhichDoor).Yi), 2)
DoorProp1(5).Text = Right$("00" & Hex$(Doorset(WhichDoor).X), 2)
DoorProp1(6).Text = Right$("00" & Hex$(Doorset(WhichDoor).Y), 2)
DoorProp1(7).Text = Right$("0000" & Hex$(Doorset(WhichDoor).Distance), 4)
DoorProp1(8).Text = Right$("0000" & Hex$(Doorset(WhichDoor).ScrollData), 4)
End Sub

Public Sub RememberCurrentDoor(WhichDoor As Byte)
'does NOT save door changes... only saves them *temporarily*, until a real save (ReadDoors)
Dim DoorI As Byte

DoorI = DoorList1.ListIndex
Doorset(DoorI).RoomID = Val("&H" & DoorProp1(0).Text)
Doorset(DoorI).DoorBitFlag = Val("&H" & DoorProp1(1).Text)
Doorset(DoorI).Direction = Val("&H" & DoorProp1(2).Text)
Doorset(DoorI).Xi = Val("&H" & DoorProp1(3).Text)
Doorset(DoorI).Yi = Val("&H" & DoorProp1(4).Text)
Doorset(DoorI).X = Val("&H" & DoorProp1(5).Text)
Doorset(DoorI).Y = Val("&H" & DoorProp1(6).Text)
Doorset(DoorI).Distance = Val("&H" & DoorProp1(7).Text)
Doorset(DoorI).ScrollData = Val("&H" & DoorProp1(8).Text)

End Sub

Public Sub RefreshCloneDoor(WhichDoor As Byte)
CloneDoor1(0).Text = Right$("0000" & Hex$(CloneDoorset(WhichDoor).DoorProperties.RoomID), 4)
CloneDoor1(1).Text = Right$("00" & Hex$(CloneDoorset(WhichDoor).DoorProperties.DoorBitFlag), 2)
CloneDoor1(2).Text = Right$("00" & Hex$(CloneDoorset(WhichDoor).DoorProperties.Direction), 2)
CloneDoor1(3).Text = Right$("00" & Hex$(CloneDoorset(WhichDoor).DoorProperties.Xi), 2)
CloneDoor1(4).Text = Right$("00" & Hex$(CloneDoorset(WhichDoor).DoorProperties.Yi), 2)
CloneDoor1(5).Text = Right$("00" & Hex$(CloneDoorset(WhichDoor).DoorProperties.X), 2)
CloneDoor1(6).Text = Right$("00" & Hex$(CloneDoorset(WhichDoor).DoorProperties.Y), 2)
CloneDoor1(7).Text = Right$("0000" & Hex$(CloneDoorset(WhichDoor).DoorProperties.Distance), 4)
CloneDoor1(8).Text = Right$("0000" & Hex$(CloneDoorset(WhichDoor).DoorProperties.ScrollData), 4)
End Sub

