VERSION 5.00
Begin VB.Form RoomVar1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "RoomVar - JathysCode"
   ClientHeight    =   5670
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8295
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5670
   ScaleWidth      =   8295
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "CANCEL"
      Height          =   375
      Left            =   6600
      TabIndex        =   24
      Top             =   5280
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SAVE"
      Height          =   375
      Left            =   0
      TabIndex        =   23
      Top             =   5280
      Width           =   6615
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   0
      Max             =   4
      TabIndex        =   21
      Top             =   4920
      Width           =   8295
   End
   Begin VB.TextBox RoomVarPointerText1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   15
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1920
      MaxLength       =   4
      TabIndex        =   20
      Tag             =   "1"
      Text            =   "0000"
      Top             =   0
      Width           =   855
   End
   Begin VB.Frame RoomVarFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "MultiVar 1 (also includes CRE, above)"
      Height          =   3855
      Index           =   0
      Left            =   0
      TabIndex        =   15
      Top             =   1080
      Width           =   8295
      Begin VB.ComboBox ScreenBrightnessCombo1 
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
         ItemData        =   "RoomVar1.frx":0000
         Left            =   1680
         List            =   "RoomVar1.frx":0025
         Style           =   2  'Dropdown List
         TabIndex        =   41
         ToolTipText     =   "000F"
         Top             =   3240
         Width           =   2775
      End
      Begin VB.ComboBox CRECombo1 
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
         ItemData        =   "RoomVar1.frx":0095
         Left            =   720
         List            =   "RoomVar1.frx":00C9
         Style           =   2  'Dropdown List
         TabIndex        =   25
         ToolTipText     =   "000F"
         Top             =   480
         Width           =   735
      End
      Begin VB.CheckBox MultiVar1Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Magnet Ball Shoots Up"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   3
         Left            =   120
         TabIndex        =   19
         ToolTipText     =   "0080"
         Top             =   2520
         Width           =   8055
      End
      Begin VB.CheckBox MultiVar1Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Reverse Magnet (yellow slopes attract, all other repels)"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   18
         ToolTipText     =   "0040"
         Top             =   2040
         Width           =   8055
      End
      Begin VB.CheckBox MultiVar1Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Use Alternate Bank For Enemy Populations ($E1)"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   17
         ToolTipText     =   "0020"
         Top             =   1560
         Width           =   8055
      End
      Begin VB.CheckBox MultiVar1Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Prevent Fade When Going Through Doors"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   16
         ToolTipText     =   "0010"
         Top             =   1080
         Width           =   8055
      End
      Begin VB.Label Label1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Screen Brightness:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   10
         Left            =   120
         TabIndex        =   42
         Top             =   3240
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CRE:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   26
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.Frame RoomVarFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "ItemVar"
      Height          =   3855
      Index           =   2
      Left            =   0
      TabIndex        =   9
      Top             =   1080
      Width           =   8295
      Begin VB.CheckBox ItemVarCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Refuse To Remove Item"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   13
         ToolTipText     =   "0200"
         Top             =   1920
         Width           =   8055
      End
      Begin VB.CheckBox ItemVarCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Refuse To Add Item"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   12
         ToolTipText     =   "0100"
         Top             =   1440
         Width           =   8055
      End
      Begin VB.CheckBox ItemVarCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Infect With Contagion"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   11
         ToolTipText     =   "8000"
         Top             =   960
         Width           =   8055
      End
      Begin VB.TextBox GetItemText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         MaxLength       =   2
         TabIndex        =   10
         Text            =   "00"
         ToolTipText     =   "00FF"
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Item Mask to add/remove (one bit at a time, preferably)"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   600
         TabIndex        =   14
         Top             =   480
         Width           =   6735
      End
   End
   Begin VB.Frame RoomVarFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "MultiVar 2 (for future expansion)"
      Height          =   3855
      Index           =   1
      Left            =   0
      TabIndex        =   8
      Top             =   1080
      Width           =   8295
      Begin VB.TextBox MultiVar2Text1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1200
         MaxLength       =   4
         TabIndex        =   34
         Text            =   "0000"
         ToolTipText     =   "CodePointer (FFFF)"
         Top             =   480
         Width           =   855
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Caption         =   "MultiVar2:"
         Height          =   255
         Left            =   240
         TabIndex        =   35
         Top             =   600
         Width           =   855
      End
   End
   Begin VB.Frame RoomVarFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "TextVar (Text Choices)"
      Height          =   3855
      Index           =   3
      Left            =   0
      TabIndex        =   28
      Top             =   1080
      Width           =   8295
      Begin VB.ComboBox TextVarCombo4 
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
         ItemData        =   "RoomVar1.frx":00FD
         Left            =   1320
         List            =   "RoomVar1.frx":0107
         Style           =   2  'Dropdown List
         TabIndex        =   38
         ToolTipText     =   "000F"
         Top             =   3000
         Width           =   1575
      End
      Begin VB.ComboBox TextVarCombo3 
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
         ItemData        =   "RoomVar1.frx":011F
         Left            =   1320
         List            =   "RoomVar1.frx":0129
         Style           =   2  'Dropdown List
         TabIndex        =   37
         ToolTipText     =   "000F"
         Top             =   2520
         Width           =   1575
      End
      Begin VB.TextBox TextVarText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1320
         MaxLength       =   2
         TabIndex        =   36
         Tag             =   "1"
         Text            =   "00"
         Top             =   1920
         Width           =   495
      End
      Begin VB.ComboBox TextVarCombo2 
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
         ItemData        =   "RoomVar1.frx":0138
         Left            =   1320
         List            =   "RoomVar1.frx":014B
         Style           =   2  'Dropdown List
         TabIndex        =   31
         ToolTipText     =   "000F"
         Top             =   1320
         Width           =   1575
      End
      Begin VB.ComboBox TextVarCombo1 
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
         ItemData        =   "RoomVar1.frx":0171
         Left            =   1320
         List            =   "RoomVar1.frx":017B
         Style           =   2  'Dropdown List
         TabIndex        =   29
         ToolTipText     =   "000F"
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Other Byte:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   9
         Left            =   240
         TabIndex        =   40
         Top             =   3000
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "Byte to Change:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   8
         Left            =   240
         TabIndex        =   39
         Top             =   2520
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Value:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   240
         TabIndex        =   33
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Method:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   240
         TabIndex        =   32
         Top             =   1440
         Width           =   1095
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "RAM Bank:"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   30
         Top             =   840
         Width           =   1095
      End
   End
   Begin VB.Frame RoomVarFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Code/BankVar"
      Height          =   3855
      Index           =   4
      Left            =   0
      TabIndex        =   0
      Top             =   1080
      Width           =   8295
      Begin VB.CheckBox CodeBankVarCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Run Only Once"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   5
         ToolTipText     =   "0400"
         Top             =   2160
         Width           =   8055
      End
      Begin VB.CheckBox CodeBankVarCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Run Every Frame (every second if unchecked)"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   4
         ToolTipText     =   "0200"
         Top             =   1560
         Width           =   8055
      End
      Begin VB.CheckBox CodeBankVarCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "JSL (JSR if unchecked)"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   3
         ToolTipText     =   "0100"
         Top             =   960
         Width           =   8055
      End
      Begin VB.TextBox CodeBankVarText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         MaxLength       =   2
         TabIndex        =   2
         Text            =   "00"
         ToolTipText     =   "00FF"
         Top             =   480
         Width           =   495
      End
      Begin VB.TextBox CodePointerText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   1
         Text            =   "0000"
         ToolTipText     =   "CodePointer (FFFF)"
         Top             =   480
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Caption         =   "Bank Of The Code"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   720
         TabIndex        =   7
         Top             =   600
         Width           =   2295
      End
      Begin VB.Label Label1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Pointer To Code"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   4560
         TabIndex        =   6
         Top             =   600
         Width           =   2415
      End
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      Height          =   855
      Left            =   2880
      TabIndex        =   27
      Top             =   0
      Width           =   4455
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "RoomVar Pointer"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   0
      TabIndex        =   22
      Top             =   120
      Width           =   1935
   End
End
Attribute VB_Name = "RoomVar1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
RoomVarSave
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Me.Icon = Smile.Icon
Label2.Caption = "0000-000F = Clear values, but use this CRE" & vbCrLf & "0010-7FFF = Use last room's values" & vbCrLf & "8000-FFFF = Pointer"
CRECombo1.Text = 0
RoomVarPointerText1.Text = Right$("0000" & Hex$(U1Pointer), 4)
RoomVarChange
End Sub

Private Sub HScroll1_Change()
RoomVarFrame1(HScroll1.Value).ZOrder 0
End Sub

Private Sub HScroll1_Scroll()
RoomVarFrame1(HScroll1.Value).ZOrder 0
End Sub


Private Sub NonPointerOption1_Click(Index As Integer)
If Index = 2 Then
    Frame1.Visible = False
Else
    Frame1.Visible = True
    'Frame1.ZOrder 0
End If
End Sub

Private Sub RoomVarPointerText1_Change()
RoomVarChange
End Sub



Public Sub RoomVarChange()
Dim TempThreeVar As ThreeByte
Dim FakeU1Pointer As Integer
Dim TempResult As Integer

FakeU1Pointer = Val("&H" & RoomVarPointerText1.Text)
If FakeU1Pointer < 0 Then GoTo PointerData
If FakeU1Pointer < &H10 Then
    RoomVarPointerText1.BackColor = RGB(100, 255, 100)
Else
    RoomVarPointerText1.BackColor = RGB(255, 255, 100)
End If
For FrameI = 0 To 4
    RoomVarFrame1(FrameI).Visible = False
Next FrameI
Exit Sub

PointerData:
RoomVarPointerText1.BackColor = vbWhite
For FrameI = 0 To 4
    RoomVarFrame1(FrameI).Visible = True
Next FrameI
'get the offset from the pointer/bank
TempThreeVar.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(FakeU1Pointer), 4), 2) & "&")
TempThreeVar.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(FakeU1Pointer), 4), 2) & "&")
TempThreeVar.Byte3 = &H80&
Open needslash For Binary As #1
    Get #1, ThreePoint2Offset(TempThreeVar) + ROM_HEADER + 1, MyRoomVar
Close #1

'MULTIVAR1
GetCREData:
CRECombo1.Text = Hex$(MyRoomVar.MultiVar1 And Val("&H000F"))
GetDoorPalData:
TempResult = MyRoomVar.MultiVar1 And Val("&H0010")
If TempResult <> 0 Then TempResult = 1
MultiVar1Check1(0).Value = TempResult
GetEnPopData:
TempResult = MyRoomVar.MultiVar1 And Val("&H0020")
If TempResult <> 0 Then TempResult = 1
MultiVar1Check1(1).Value = TempResult
GetReverseMagnetData:
TempResult = MyRoomVar.MultiVar1 And Val("&H0040")
If TempResult <> 0 Then TempResult = 1
MultiVar1Check1(2).Value = TempResult
GetBeamBallShootsUpData:
TempResult = MyRoomVar.MultiVar1 And Val("&H0080")
If TempResult <> 0 Then TempResult = 1
MultiVar1Check1(3).Value = TempResult
GetScreenBrightnessData:
For I = 0 To ScreenBrightnessCombo1.ListCount - 1
    If Val("&H" & Mid$(Right$("0000" & Hex$(MyRoomVar.MultiVar1 And Val("&H0F00")), 4), 2, 1)) = ScreenBrightnessCombo1.ItemData(I) Then
        ScreenBrightnessCombo1.Text = ScreenBrightnessCombo1.List(I)
    End If
Next I


'MULTIVAR2
GetMultiVar2Data:
MultiVar2Text1.Text = Right$("0000" & Hex$(MyRoomVar.MultiVar2), 4)

'ITEMVAR
GetGetItemMaskData:
GetItemText1.Text = Right$("00" & Hex$(MyRoomVar.ItemVar And Val("&H00FF")), 2)
GetContagionData:
TempResult = MyRoomVar.ItemVar And Val("&H8000")
If TempResult <> 0 Then TempResult = 1
ItemVarCheck1(0).Value = TempResult
GetRefuseToAddData:
TempResult = MyRoomVar.ItemVar And Val("&H0100")
If TempResult <> 0 Then TempResult = 1
ItemVarCheck1(1).Value = TempResult
GetRefuseToRemoveData:
TempResult = MyRoomVar.ItemVar And Val("&H0200")
If TempResult <> 0 Then TempResult = 1
ItemVarCheck1(2).Value = TempResult

'TEXTVAR
GetTextData:
'set bank to 7E or 7F.... was coming up with screwy VB errors, so I did a long way as a work around
TempResult = (MyRoomVar.TextVar And Val("&H0080")) - 1
If TempResult <> &H7F Then TempResult = &H7E
TextVarCombo1.Text = Hex$(TempResult)
'choose method
TempResult = MyRoomVar.TextVar And Val("&H0007")
If TempResult > 4 Then TempResult = 0
TextVarCombo2.Text = TextVarCombo2.List(TempResult)
'choose value
TextVarText1.Text = Left$(Right$("0000" & Hex$(MyRoomVar.TextVar And Val("&HFF00") / 256), 4), 2)
'choose high/low byte
Select Case MyRoomVar.TextVar And Val("&H0008")
    Case 0: TextVarCombo3.Text = TextVarCombo3.List(0)
    Case Else: TextVarCombo3.Text = TextVarCombo3.List(1)
End Select
'choose what to do for other byte
Select Case MyRoomVar.TextVar And Val("&H0010")
    Case 0: TextVarCombo4.Text = TextVarCombo4.List(0)
    Case Else: TextVarCombo4.Text = TextVarCombo4.List(1)
End Select

'CODEBANKVAR
GetCodePointerData:
CodePointerText1.Text = Right$("0000" & Hex$(MyRoomVar.CodePointer), 4)
GetCodeBankData:
CodeBankVarText1.Text = Right$("00" & Hex$(MyRoomVar.CodeBankVar), 2)
GetJSLorJSRData:
TempResult = MyRoomVar.CodeBankVar And Val("&H0100")
If TempResult <> 0 Then TempResult = 1
CodeBankVarCheck1(0).Value = TempResult
GetSecondFrameData:
TempResult = MyRoomVar.CodeBankVar And Val("&H0200")
If TempResult <> 0 Then TempResult = 1
CodeBankVarCheck1(1).Value = TempResult
GetRunOnceData:
TempResult = MyRoomVar.CodeBankVar And Val("&H0400")
If TempResult <> 0 Then TempResult = 1
CodeBankVarCheck1(2).Value = TempResult
Exit Sub

End Sub



Public Sub RoomVarSave()
Dim TempThreeVar As ThreeByte
Dim TempThree As ThreeByte
Dim FakeU1Pointer As Integer
Dim TempResult As Integer
Dim TempInteger As Integer

'save the RoomVar "pointer"
FakeU1Pointer = Val("&H" & RoomVarPointerText1.Text)
U1Pointer = FakeU1Pointer
MyState.U1 = U1Pointer
Open needslash For Binary As #1
    Put #1, RoomStatePointersOffset, MyState    'no header or + 1 needed
Close #1

'is this actually a pointer?
If FakeU1Pointer < 0 Then GoTo UsePointerData
RoomVarChange
Exit Sub

UsePointerData:
'create MultiVar1
TempResult = Val("&H0" & Hex$(ScreenBrightnessCombo1.ItemData(ScreenBrightnessCombo1.ListIndex)) & "0" & CRECombo1.Text)
If Val(MultiVar1Check1(0).Value) = 1 Then TempResult = TempResult Or Val("&H0010")
If Val(MultiVar1Check1(1).Value) = 1 Then TempResult = TempResult Or Val("&H0020")
If Val(MultiVar1Check1(2).Value) = 1 Then TempResult = TempResult Or Val("&H0040")
If Val(MultiVar1Check1(3).Value) = 1 Then TempResult = TempResult Or Val("&H0080")
MyRoomVar.MultiVar1 = TempResult
'create MultiVar2
MyRoomVar.MultiVar2 = Val("&H" & MultiVar2Text1.Text)

'create ItemVar
TempResult = Val("&H" & GetItemText1.Text)
If Val(ItemVarCheck1(0).Value) = 1 Then TempResult = TempResult Or Val("&H8000")
If Val(ItemVarCheck1(1).Value) = 1 Then TempResult = TempResult Or Val("&H0100")
If Val(ItemVarCheck1(2).Value) = 1 Then TempResult = TempResult Or Val("&H0200")
MyRoomVar.ItemVar = TempResult

'create TextVar
TempResult = 0
'get bank bit from 7E or 7F
If TextVarCombo1.ListIndex = 1 Then TempResult = TempResult Or Val("&H0080")
'get method
TempResult = TempResult Or TextVarCombo2.ListIndex
'get value
TempResult = TempResult Or Val("&H" & TextVarText1.Text & "00")
'get low/high byte to use
TempInteger = TextVarCombo3.ListIndex * &H8
TempResult = TempResult Or TempInteger
'get what to do with the other byte
TempInteger = TextVarCombo4.ListIndex * &H10
TempResult = TempResult Or TempInteger
MyRoomVar.TextVar = TempResult

'create CodePointer
MyRoomVar.CodePointer = Val("&H" & CodePointerText1.Text)
'create CodeBankVar
TempResult = Val("&H" & CodeBankVarText1.Text)
If Val(CodeBankVarCheck1(0).Value) = 1 Then TempResult = TempResult Or Val("&H0100")
If Val(CodeBankVarCheck1(1).Value) = 1 Then TempResult = TempResult Or Val("&H0200")
If Val(CodeBankVarCheck1(2).Value) = 1 Then TempResult = TempResult Or Val("&H0400")
MyRoomVar.CodeBankVar = TempResult

TempThreeVar.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(FakeU1Pointer), 4), 2) & "&")
TempThreeVar.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(FakeU1Pointer), 4), 2) & "&")
TempThreeVar.Byte3 = &H80&
Open needslash For Binary As #1
    Put #1, ThreePoint2Offset(TempThreeVar) + ROM_HEADER + 1, MyRoomVar
Close #1
End Sub


