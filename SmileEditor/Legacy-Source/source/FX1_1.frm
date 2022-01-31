VERSION 5.00
Begin VB.Form FX1_1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "FX1"
   ClientHeight    =   6270
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5880
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6270
   ScaleWidth      =   5880
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Tag             =   "1"
   Begin VB.TextBox Select1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   3240
      MaxLength       =   4
      TabIndex        =   49
      Tag             =   "0"
      Text            =   "0000"
      Top             =   120
      Width           =   735
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4680
      Top             =   1320
   End
   Begin VB.TextBox PaletteBlendCommand1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   3600
      MaxLength       =   2
      TabIndex        =   48
      Tag             =   "0"
      Text            =   "00"
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Layer 3 Type (Editor)"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   47
      Tag             =   "0"
      Top             =   510
      Width           =   1335
   End
   Begin VB.TextBox Surface_Delay1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1200
      MaxLength       =   2
      TabIndex        =   44
      Tag             =   "0"
      Text            =   "00"
      Top             =   2400
      Width           =   495
   End
   Begin VB.ComboBox Layer3Type1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "FX1_1.frx":0000
      Left            =   1560
      List            =   "FX1_1.frx":002E
      Style           =   2  'Dropdown List
      TabIndex        =   38
      Tag             =   "0"
      ToolTipText     =   "Alternate Rooms"
      Top             =   600
      Width           =   2415
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   0
      TabIndex        =   21
      Tag             =   "1"
      Top             =   5160
      Width           =   5895
   End
   Begin VB.TextBox Surface_Start1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1200
      MaxLength       =   4
      TabIndex        =   6
      Tag             =   "0"
      Text            =   "0000"
      Top             =   1320
      Width           =   735
   End
   Begin VB.TextBox Surface_New1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1200
      MaxLength       =   4
      TabIndex        =   5
      Tag             =   "0"
      Text            =   "0000"
      Top             =   1680
      Width           =   735
   End
   Begin VB.TextBox Surface_Speed1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1200
      MaxLength       =   4
      TabIndex        =   4
      Tag             =   "0"
      Text            =   "0000"
      Top             =   2040
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Cancel"
      Height          =   375
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Tag             =   "1"
      Top             =   5880
      Width           =   5895
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Remember Changes"
      Height          =   495
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Tag             =   "1"
      Top             =   5400
      Width           =   5895
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Animate Tile"
      Height          =   2295
      Index           =   0
      Left            =   0
      TabIndex        =   10
      Tag             =   "1"
      Top             =   2880
      Width           =   5895
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   7
         Left            =   50
         TabIndex        =   18
         Tag             =   "2"
         Top             =   220
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   6
         Left            =   50
         TabIndex        =   17
         Tag             =   "2"
         Top             =   480
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   5
         Left            =   50
         TabIndex        =   16
         Tag             =   "2"
         Top             =   735
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   4
         Left            =   50
         TabIndex        =   15
         Tag             =   "2"
         Top             =   990
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   3
         Left            =   50
         TabIndex        =   14
         Tag             =   "2"
         Top             =   1245
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   2
         Left            =   50
         TabIndex        =   13
         Tag             =   "2"
         Top             =   1500
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   1
         Left            =   50
         TabIndex        =   12
         Tag             =   "2"
         Top             =   1755
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   0
         Left            =   50
         TabIndex        =   11
         Tag             =   "2"
         Top             =   2010
         Width           =   2850
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Palette FX"
      Height          =   2295
      Index           =   1
      Left            =   0
      TabIndex        =   19
      Tag             =   "1"
      Top             =   2880
      Width           =   5895
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   7
         Left            =   50
         TabIndex        =   28
         Tag             =   "2"
         Top             =   230
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   6
         Left            =   50
         TabIndex        =   27
         Tag             =   "2"
         Top             =   480
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   5
         Left            =   50
         TabIndex        =   26
         Tag             =   "2"
         Top             =   735
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   4
         Left            =   50
         TabIndex        =   25
         Tag             =   "2"
         Top             =   990
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   3
         Left            =   50
         TabIndex        =   24
         Tag             =   "2"
         Top             =   1245
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   2
         Left            =   50
         TabIndex        =   23
         Tag             =   "2"
         Top             =   1500
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   1
         Left            =   50
         TabIndex        =   22
         Tag             =   "2"
         Top             =   1755
         Width           =   2850
      End
      Begin VB.CheckBox Bit2 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   0
         Left            =   50
         TabIndex        =   20
         Tag             =   "2"
         Top             =   2010
         Width           =   2850
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "A/B"
      Height          =   2295
      Index           =   3
      Left            =   0
      TabIndex        =   39
      Tag             =   "1"
      Top             =   2880
      Width           =   5895
      Begin VB.ComboBox BCombo1 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "FX1_1.frx":00FE
         Left            =   120
         List            =   "FX1_1.frx":0153
         TabIndex        =   41
         Text            =   "BCombo1"
         Top             =   1320
         Width           =   5655
      End
      Begin VB.ComboBox ACombo1 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "FX1_1.frx":064F
         Left            =   120
         List            =   "FX1_1.frx":069B
         TabIndex        =   40
         Text            =   "ACombo1"
         Top             =   600
         Width           =   5655
      End
      Begin VB.Label Label1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "B"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   43
         Tag             =   "1"
         Top             =   1080
         Width           =   1155
      End
      Begin VB.Label Label1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "A"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   42
         Tag             =   "1"
         Top             =   360
         Width           =   1155
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "C"
      Height          =   2295
      Index           =   2
      Left            =   0
      TabIndex        =   29
      Tag             =   "1"
      Top             =   2880
      Width           =   5895
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   7
         Left            =   50
         TabIndex        =   37
         Tag             =   "2"
         Top             =   230
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   6
         Left            =   50
         TabIndex        =   36
         Tag             =   "2"
         Top             =   480
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   5
         Left            =   50
         TabIndex        =   35
         Tag             =   "2"
         Top             =   735
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   4
         Left            =   50
         TabIndex        =   34
         Tag             =   "2"
         Top             =   990
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   3
         Left            =   50
         TabIndex        =   33
         Tag             =   "2"
         Top             =   1245
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   2
         Left            =   50
         TabIndex        =   32
         Tag             =   "2"
         Top             =   1500
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   1
         Left            =   50
         TabIndex        =   31
         Tag             =   "2"
         Top             =   1755
         Width           =   2850
      End
      Begin VB.CheckBox Bit3 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   0
         Left            =   50
         TabIndex        =   30
         Tag             =   "2"
         Top             =   2010
         Width           =   2850
      End
   End
   Begin VB.Label Label1 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Colors to be blended with water, lava, and fog."
      ForeColor       =   &H00000080&
      Height          =   885
      Index           =   6
      Left            =   2520
      TabIndex        =   46
      Tag             =   "1"
      Top             =   1680
      Width           =   1515
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Palette Blend:"
      Height          =   285
      Index           =   5
      Left            =   2400
      TabIndex        =   45
      Tag             =   "1"
      Top             =   1440
      Width           =   1155
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Surface Start"
      Height          =   285
      Index           =   9
      Left            =   0
      TabIndex        =   9
      Tag             =   "1"
      Top             =   1320
      Width           =   1155
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Surface New"
      Height          =   285
      Index           =   8
      Left            =   0
      TabIndex        =   8
      Tag             =   "1"
      Top             =   1680
      Width           =   1155
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Surface Speed"
      Height          =   285
      Index           =   7
      Left            =   0
      TabIndex        =   7
      Tag             =   "1"
      Top             =   2040
      Width           =   1155
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Surface Delay"
      Height          =   285
      Index           =   3
      Left            =   0
      TabIndex        =   3
      Tag             =   "1"
      Top             =   2400
      Width           =   1155
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Door Select"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   2
      Tag             =   "1"
      Top             =   120
      Width           =   1155
   End
End
Attribute VB_Name = "FX1_1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub ACombo1_Click()
ACombo1.ToolTipText = ACombo1.Text
End Sub

Private Sub BCombo1_Click()
BCombo1.ToolTipText = BCombo1.Text
End Sub

Private Sub Command1_Click(Index As Integer)
Dim MyTempArray1(0 To 7) As Byte
Dim MyTempArray2(0 To 7) As Byte
Dim MyTempArray3(0 To 7) As Byte

'if press cancel, then don't save
If Index = 1 Then GoTo FinallyUnload

'set values to what's in the text boxes
TempFX1.Select = Val("&H" & Select1.Text)
TempFX1.Surface_Speed = Val("&H" & Surface_Speed1.Text)
TempFX1.Surface_New = Val("&H" & Surface_New1.Text)
TempFX1.Surface_Start = Val("&H" & Surface_Start1.Text)
TempFX1.A = Val("&H" & Left$(ACombo1.Text, 2))
TempFX1.B = Val("&H" & Left$(BCombo1.Text, 2))

TempFX1.Layer3Type = Val("&H" & Left$(Layer3Type1.Text, 2))
TempFX1.Surface_Delay = Val("&H" & Surface_Delay1.Text)
TempFX1.Palette_Blend = Val("&H" & PaletteBlendCommand1.Text)


For III = 0 To 7
    MyTempArray1(III) = Bit1(III).Value
    MyTempArray2(III) = Bit2(III).Value
    MyTempArray3(III) = Bit3(III).Value
Next III
TempFX1.AnimateTile = FromBin(MyTempArray1(0))
TempFX1.Palette_FX = FromBin(MyTempArray2(0))
TempFX1.C = FromBin(MyTempArray3(0))

FinallyUnload:
Smile.Layer3Picture1.Top = TempFX1.Surface_Start
Unload Me
End Sub

Private Sub Command2_Click()
Command2.Tag = 1
Layer3Editor.Show 1
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Me.Icon = Smile.Icon
HScroll1.Max = Frame1.UBound
Label1(6).Caption = "Palette Blend:" & vbCrLf & "Colors to blend with water, lava, or fog."

Dim ThisPointer As ThreeByte
Dim MyTempArray1(0 To 7) As Byte
Dim MyTempArray2(0 To 7) As Byte
Dim MyTempArray3(0 To 7) As Byte


'0000 = no pointer, so leave... otherwise, pointer form should make it > $7FFF
If DisplayFX1 = False Then
    If FX1Pointer = 0 Then
        MsgBox "This room has no FX1, because the pointer is $0000.", vbInformation, "Whoops."
    Else
        MsgBox "Can't edit the FX1, because the pointer is below $8000.", vbInformation, "Whoops!"
    End If
    Command1(0).Enabled = False
    Exit Sub
End If

Select1.Text = Right$("0000" & Hex$(TempFX1.Select), 4)
'XXXXXXX
'FX1Pointer = MyState.FX1    'probably included to avoid a bug... should already be correct though
Surface_Speed1.Text = Right$("0000" & Hex$(TempFX1.Surface_Speed), 4)
Surface_New1.Text = Right$("0000" & Hex$(TempFX1.Surface_New), 4)
Surface_Start1.Text = Right$("0000" & Hex$(TempFX1.Surface_Start), 4)

For ComboAI = 0 To ACombo1.ListCount
    If Right$("00" & Hex$(TempFX1.A), 2) = Left$(ACombo1.List(ComboAI), 2) Then Exit For
Next ComboAI
ACombo1.Text = ACombo1.List(ComboAI)

For ComboBI = 0 To BCombo1.ListCount
    If Right$("00" & Hex$(TempFX1.B), 2) = Left$(BCombo1.List(ComboBI), 2) Then Exit For
Next ComboBI
BCombo1.Text = BCombo1.List(ComboBI)


For iiii = 0 To Layer3Type1.ListCount - 1
    If Left$(Layer3Type1.List(iiii), 2) = Right$("00" & Hex$(TempFX1.Layer3Type), 2) Then Layer3Type1.Text = Layer3Type1.List(iiii)
Next iiii
Surface_Delay1.Text = Right$("00" & Hex$(TempFX1.Surface_Delay), 2)
PaletteBlendCommand1.Text = Right$("00" & Hex$(TempFX1.Palette_Blend), 2)

ToBin TempFX1.AnimateTile, MyTempArray1(0)
ToBin TempFX1.Palette_FX, MyTempArray2(0)
ToBin TempFX1.C, MyTempArray3(0)
    For III = 0 To 7
        Bit1(III).Value = MyTempArray1(III)
        Bit2(III).Value = MyTempArray2(III)
        Bit3(III).Value = MyTempArray3(III)
    Next III
BitDescriptions RoomHeader1.RegionCombo1.ListIndex, 0, 1
BitDescriptions RoomHeader1.RegionCombo1.ListIndex, 0, 2
BitDescriptions RoomHeader1.RegionCombo1.ListIndex, 0, 3
ControlColor
If FX1_1.Visible = False Then Exit Sub


If Select1.Text = "0000" Then Select1.Enabled = False
End Sub




Private Sub HScroll1_Change()
Frame1(HScroll1.Value).ZOrder 0
End Sub

Private Sub HScroll1_Scroll()
Frame1(HScroll1.Value).ZOrder 0
End Sub


Private Sub ControlColor()
'if no current fx1, then red as a warning
'if not exact spot, then yellow as a warning
Dim ConCol As Long
Dim FakeControl

If TempFX1.Select = 0 Then ConCol = vbWhite
If TempFX1.Select = &HFFFF Then ConCol = vbRed
Select Case TempFX1.Select
    Case &H0: ConCol = vbWhite
    Case &HFFFF: ConCol = vbRed
    Case Else: ConCol = vbYellow
End Select

End Sub



Private Sub PaletteBlendCommand1_Click()
'Load PaletteBlendForm1
'PaletteBlendForm1.Move FX1_1.Left + PaletteBlendCommand1.Left + PaletteBlendCommand1.Width + 10, FX1_1.Top + PaletteBlendCommand1.Top + 280
'PaletteBlendForm1.Show 1
End Sub

Private Sub Timer1_Timer()
If Command2.Tag = 1 Then Exit Sub
If Command1(0).Enabled = False Then Unload FX1_1
End Sub
