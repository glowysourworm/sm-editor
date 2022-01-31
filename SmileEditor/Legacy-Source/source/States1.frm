VERSION 5.00
Begin VB.Form States1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " "
   ClientHeight    =   3630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3030
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3630
   ScaleWidth      =   3030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox TestCodeList1 
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
      ItemData        =   "States1.frx":0000
      Left            =   0
      List            =   "States1.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Tag             =   "0"
      ToolTipText     =   "Alternate Rooms"
      Top             =   360
      Width           =   3015
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   3240
      Width           =   2745
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Event State"
      Height          =   2415
      Index           =   1
      Left            =   0
      TabIndex        =   12
      Top             =   720
      Width           =   3015
      Begin VB.ComboBox EventCombo1 
         Height          =   315
         ItemData        =   "States1.frx":0004
         Left            =   120
         List            =   "States1.frx":004A
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   720
         Width           =   2775
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Boss State"
      Height          =   2415
      Index           =   0
      Left            =   0
      TabIndex        =   3
      Top             =   720
      Width           =   3015
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   0
         Left            =   50
         TabIndex        =   11
         Top             =   1920
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   1
         Left            =   50
         TabIndex        =   10
         Top             =   1680
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   2
         Left            =   50
         TabIndex        =   9
         Top             =   1440
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   4
         Left            =   50
         TabIndex        =   7
         Top             =   960
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   5
         Left            =   50
         TabIndex        =   6
         Top             =   720
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   6
         Left            =   50
         TabIndex        =   5
         Top             =   480
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   7
         Left            =   50
         TabIndex        =   4
         Top             =   240
         Width           =   2850
      End
      Begin VB.CheckBox Bit1 
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   3
         Left            =   50
         TabIndex        =   8
         Top             =   1200
         Width           =   2850
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Item State"
      Height          =   2415
      Index           =   2
      Left            =   0
      TabIndex        =   18
      Top             =   720
      Width           =   3015
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "No values to change"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   2
         Left            =   360
         TabIndex        =   19
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Door State"
      Height          =   2415
      Index           =   3
      Left            =   0
      TabIndex        =   16
      Top             =   720
      Width           =   3015
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "No values to change"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   1
         Left            =   360
         TabIndex        =   17
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Standard State"
      Height          =   2415
      Index           =   9
      Left            =   0
      TabIndex        =   14
      Top             =   720
      Width           =   3015
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "No values to change"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   0
         Left            =   120
         TabIndex        =   15
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00C86464&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "State Header"
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
      TabIndex        =   2
      Top             =   0
      Width           =   3045
   End
End
Attribute VB_Name = "States1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
States1.Visible = False

End Sub



Public Sub States1_Load_Again()
Dim CodeString As String
Dim CodeNameString As String
Dim LevelPointerString As String

TestCodeList1.Clear
CodeString = Left$(Smile.TestCodeList1.Text, 4)

Select Case CodeString
    Case "E5E6": TestCodeList1.AddItem (CodeString & CodeDescription("E5E6")): GoTo FinishLoadingStates   'no changes to default states
    Case "E5FF": GoTo ItemTestCodes 'tourianboss1
    Case "E640": GoTo ItemTestCodes 'morph
    Case "E652": GoTo ItemTestCodes 'morph & missile
    Case "E669": GoTo ItemTestCodes 'power bomb
    Case "E678": GoTo ItemTestCodes 'speed booster
    Case "E612": GoTo EventBossTestCodes    'events
    Case "E629": GoTo EventBossTestCodes    'bosses
    Case "E5EB": GoTo DoorTestCodes 'doors
    Case Else: MsgBox "Unknown Code String": Exit Sub
End Select

ItemTestCodes:
'adding states to list
    TestCodeList1.AddItem ("E5FF" & CodeDescription("E5FF"))
    TestCodeList1.AddItem ("E640" & CodeDescription("E640"))
    TestCodeList1.AddItem ("E652" & CodeDescription("E652"))
    TestCodeList1.AddItem ("E669" & CodeDescription("E669"))
    TestCodeList1.AddItem ("E678" & CodeDescription("E678"))
'40E6 ssss
GoTo FinishLoadingStates

EventBossTestCodes:
'adding states to the list
    TestCodeList1.AddItem ("E612" & CodeDescription("E612"))
    TestCodeList1.AddItem ("E629" & CodeDescription("E629"))
'29E6 bb ssss
GoTo FinishLoadingStates

DoorTestCodes:
'adding states to the list
    TestCodeList1.AddItem ("E5EB" & CodeDescription("E5EB"))
'
GoTo FinishLoadingStates

FinishLoadingStates:
'set it to our state
TestCodeList1.Text = CodeString & CodeDescription(CodeString)
End Sub




Private Sub Command3_Click()
MyState.EnemySet = Val("&H" & EnemiesAllowed1.Text & "&")

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
States1.Icon = RoomHeader1.Icon

Do
    EventCombo1.AddItem ("(" & Right$("00" & Hex$(EventCombo1.ListCount), 2) & "?)")
Loop Until EventCombo1.ListCount = 256
End Sub


Private Sub TestCodeList1_Click()
Select Case Left$(TestCodeList1.Text, 4)
    Case "E629": Frame1(0).ZOrder 0
    Case "E612": Frame1(1).ZOrder 0
End Select
BitDescriptions RoomHeader1.RegionCombo1.ListIndex, States1.TestCodeList1.ListIndex, 0
End Sub

