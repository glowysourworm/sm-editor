VERSION 5.00
Begin VB.Form PointerForm1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Pointers to lead the way"
   ClientHeight    =   5130
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3390
   ClipControls    =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5130
   ScaleWidth      =   3390
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox PointerOffsetText1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Index           =   0
      Left            =   1005
      MaxLength       =   2
      TabIndex        =   35
      Top             =   4680
      Width           =   495
   End
   Begin VB.TextBox PointerOffsetText1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Index           =   1
      Left            =   1500
      MaxLength       =   4
      TabIndex        =   34
      Top             =   4680
      Width           =   855
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   11
      Left            =   450
      MaxLength       =   4
      TabIndex        =   31
      Text            =   "0000"
      Top             =   3750
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   6
      Left            =   450
      MaxLength       =   4
      TabIndex        =   20
      Text            =   "0000"
      Top             =   2055
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   10
      Left            =   450
      MaxLength       =   4
      TabIndex        =   18
      Text            =   "0000"
      Top             =   3315
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   9
      Left            =   450
      MaxLength       =   4
      TabIndex        =   16
      Text            =   "0000"
      Top             =   3000
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   8
      Left            =   450
      MaxLength       =   4
      TabIndex        =   14
      Text            =   "0000"
      Top             =   2685
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   7
      Left            =   450
      MaxLength       =   4
      TabIndex        =   12
      Text            =   "0000"
      Top             =   2370
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   5
      Left            =   450
      MaxLength       =   4
      TabIndex        =   10
      Text            =   "0000"
      Top             =   1740
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   3
      Left            =   450
      MaxLength       =   4
      TabIndex        =   8
      Text            =   "0000"
      Top             =   1110
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   2
      Left            =   450
      MaxLength       =   4
      TabIndex        =   6
      Text            =   "0000"
      Top             =   795
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   450
      MaxLength       =   4
      TabIndex        =   4
      Text            =   "0000"
      Top             =   480
      Width           =   600
   End
   Begin VB.TextBox PointerText1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0FF&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   15
      MaxLength       =   6
      TabIndex        =   2
      Text            =   "000000"
      Top             =   0
      Width           =   1050
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "CANCEL"
      Height          =   375
      Left            =   1695
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   4140
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Save Pointers"
      Height          =   375
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Pointers saved, but your room is not... Pointers lead to the data currently at those locations."
      Top             =   4140
      Width           =   1695
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "$"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   840
      TabIndex        =   36
      Top             =   4680
      Width           =   165
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Door Out"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   22
      Left            =   1050
      TabIndex        =   33
      Top             =   3750
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   21
      Left            =   0
      TabIndex        =   32
      Top             =   3750
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$83"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   20
      Left            =   0
      TabIndex        =   30
      Top             =   480
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$A1"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   19
      Left            =   0
      TabIndex        =   29
      Top             =   795
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$B4"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   18
      Left            =   0
      TabIndex        =   28
      Top             =   1110
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   16
      Left            =   0
      TabIndex        =   27
      Top             =   1740
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   15
      Left            =   0
      TabIndex        =   26
      Top             =   2370
      Width           =   450
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   14
      Left            =   0
      TabIndex        =   25
      Top             =   2685
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   13
      Left            =   0
      TabIndex        =   24
      Top             =   3000
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   12
      Left            =   0
      TabIndex        =   23
      Top             =   3315
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "?**"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   11
      Left            =   0
      TabIndex        =   22
      Top             =   2055
      Width           =   450
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H000040C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Unknown1/RoomVar"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   6
      Left            =   1050
      TabIndex        =   21
      Top             =   2055
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Layer1_2"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   10
      Left            =   1050
      TabIndex        =   19
      Top             =   3315
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "BG_Data"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   9
      Left            =   1050
      TabIndex        =   17
      Top             =   3000
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "PLM"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   8
      Left            =   1050
      TabIndex        =   15
      Top             =   2685
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "FX2"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   7
      Left            =   1050
      TabIndex        =   13
      Top             =   2370
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Scroll"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   5
      Left            =   1050
      TabIndex        =   11
      Top             =   1740
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Enemy Allowed"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   3
      Left            =   1050
      TabIndex        =   9
      Top             =   1110
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Enemy Population"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   2
      Left            =   1050
      TabIndex        =   7
      Top             =   795
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "FX1"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   1
      Left            =   1050
      TabIndex        =   5
      Top             =   480
      Width           =   2320
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H000040C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Level Data"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Index           =   0
      Left            =   1065
      TabIndex        =   3
      Top             =   0
      Width           =   2320
   End
End
Attribute VB_Name = "PointerForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private UseOld As Boolean
Private OldDoorPointer As Integer

Private Sub Command1_Click()
Dim DD As String
Dim PWString As String
Dim TempOffset As ThreeByte
Dim DoorDataOffset As Long
Dim TempHScroll As Integer
Dim TempVScroll As Integer

LevelDataPointer.Byte3 = Val("&H" & Left$(PointerText1(0).Text, 2))
LevelDataPointer.Byte2 = Val("&H" & Mid$(PointerText1(0).Text, 3, 2))
LevelDataPointer.Byte1 = Val("&H" & Right$(PointerText1(0).Text, 2))
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
FX1Pointer = Val("&H" & PointerText1(1)) + FX1Displacement
FX1Pointer = FX1Pointer - FX1Displacement
EnemyPopulationPointer = Val("&H" & PointerText1(2))
EnemySetPointer = Val("&H" & PointerText1(3))
ScrollPointer = Val("&H" & PointerText1(5))
U1Pointer = Val("&H" & PointerText1(6))
FX2Pointer = Val("&H" & PointerText1(7))
PLMPointer = Val("&H" & PointerText1(8))
BG_DataPointer = Val("&H" & PointerText1(9))
Layer1_2Pointer = Val("&H" & PointerText1(10))
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
DoorOutPointer = Val("&H" & PointerText1(11))
If Right$("0000" & Hex$(DoorOutPointer), 4) = "0000" Then
    MsgBox "What the fuck are you doing?  Making a room with no doors?!  Are you on crack?!!  Fix the pointer, you n00b!", vbDefaultButton4
    Exit Sub
End If
If Right$("0000" & Hex$(EnemyPopulationPointer), 4) = "0000" Then
    MsgBox "Must have an Enemy Population pointer.", vbInformation, "Whoops."
    Exit Sub
End If
If Right$("0000" & Hex$(EnemySetPointer), 4) = "0000" Then
    MsgBox "Must have an Enemy Set pointer.", vbInformation, "Whoops."
    Exit Sub
End If


If FX1Pointer <> 0 And Val("&H" & Hex$(FX1Pointer) & "&") < 32768 Then PWString = "FX1": GoTo PointerWarning
If EnemyPopulationPointer <> 0 And Val("&H" & Hex$(EnemyPopulationPointer) & "&") < 32768 Then PWString = "Enemy Population": GoTo PointerWarning
If EnemySetPointer <> 0 And Val("&H" & Hex$(EnemySetPointer) & "&") < 32768 Then PWString = "Enemy Set": GoTo PointerWarning
If PLMPointer <> 0 And Val("&H" & Hex$(PLMPointer) & "&") < 32768 Then PWString = "PLM": GoTo PointerWarning
If DoorOutPointer <> 0 And Val("&H" & Hex$(DoorOutPointer) & "&") < 32768 Then PWString = "DoorOut": GoTo PointerWarning

'save changes, if user says yes... does not move current data to the new locations though
'door data does move though... give option
DD = MsgBox("Copy data (when applicable) to the newly pointed to locations?" & vbCrLf & vbCrLf & "YES = copies data to the newly pointed to location." & vbCrLf & "NO = just change the pointer, using the data that's already at the new location." & vbCrLf & vbCrLf & "(Hint: If just pointed to data you want to use, choose NO)", vbYesNoCancel + vbDefaultButton2 + vbQuestion, "Copy data or leave it?")
If DD = vbCancel Then Exit Sub
PointerSavingOnly = (DD = vbNo)

RoomHeader1.Tag = "1"
Smile.mnuSaveRoom_Click
DoEvents

TempHScroll = Smile.MapHScroll1.Value
TempVScroll = Smile.MapVScroll1.Value
Smile.TestCodeList1_Click
Smile.MapHScroll1.Value = TempHScroll
Smile.MapVScroll1.Value = TempVScroll
'OldDoorPointer = Val("&H" & PointerText1(11).Text)
PointerSavingOnly = False
Exit Sub

PointerWarning:
MsgBox "Your pointer for " & PWString & " must be $0000, or between $8000-$FFFF." & vbCrLf & vbCrLf & "So should most other pointers.", vbInformation, "Whoops!"
End Sub

Private Sub Command2_Click()
Unload Me
End Sub




Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Public Sub RefreshPointerForm()
PointerText1(0) = Right$("00" & Hex$(LevelDataPointer.Byte3), 2) & Right$("00" & Hex$(LevelDataPointer.Byte2), 2) & Right$("00" & Hex$(LevelDataPointer.Byte1), 2)
'''''''''''''''''''''''''''''''''''''''''''''''''''''''
PointerText1(1) = Right$("0000" & Hex$(FX1Pointer - FX1Displacement), 4)
PointerText1(2) = Right$("0000" & Hex$(EnemyPopulationPointer), 4)
PointerText1(3) = Right$("0000" & Hex$(EnemySetPointer), 4)
PointerText1(5) = Right$("0000" & Hex$(ScrollPointer), 4)
PointerText1(6) = Right$("0000" & Hex$(U1Pointer), 4)
PointerText1(7) = Right$("0000" & Hex$(FX2Pointer), 4)
PointerText1(8) = Right$("0000" & Hex$(PLMPointer), 4)
PointerText1(9) = Right$("0000" & Hex$(BG_DataPointer), 4)
PointerText1(10) = Right$("0000" & Hex$(Layer1_2Pointer), 4)
'''''''''''''''''''''''''''''''''''''''''''''''''''''''
PointerText1(11) = Right$("0000" & Hex$(DoorOutPointer), 4)
End Sub


Private Sub Form_Load()
Label1(14).Caption = "$" & Hex$(PLMBank)
Me.Icon = Smile.Icon
SetWindowPos hWnd, _
HWND_TOPMOST, 0, 0, 0, 0, _
SWP_NOMOVE + SWP_NOSIZE

RefreshPointerForm
OldDoorPointer = Val("&H" & PointerText1(11).Text)
End Sub

Private Sub Label1_Click(Index As Integer)
Select Case Index
    Case 14: MsgBox "Bank is changable in a hex editor at: $16B6E and $204AC" & vbCrLf & "Only do this if you know what you're doing.", vbInformation
End Select
End Sub

Private Sub PointerOffsetText1_Change(Index As Integer)
Dim ThisPointer As ThreeByte
ThisPointer.Byte1 = Val("&H" & Right$(PointerOffsetText1(1).Text, 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(PointerOffsetText1(1).Text, 2) & "&")
ThisPointer.Byte3 = Val("&H" & PointerOffsetText1(0).Text & "&")

PointerForm1.Caption = Right$("000000" & (Hex$(ThreePoint2Offset(ThisPointer))), 6) & "  |  " & Right$("000000" & Hex$(ThreePoint2Offset(ThisPointer) + ROM_HEADER), 6)
End Sub

