VERSION 5.00
Begin VB.Form RoomHeader1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " "
   ClientHeight    =   3510
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3060
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "RoomHeader1.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3510
   ScaleWidth      =   3060
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Tag             =   "1"
   Begin VB.CommandButton HelpCommand1 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   3
      Left            =   2640
      TabIndex        =   22
      Top             =   3120
      Width           =   345
   End
   Begin VB.CommandButton HelpCommand1 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   2
      Left            =   2640
      TabIndex        =   21
      Top             =   2760
      Width           =   345
   End
   Begin VB.CommandButton HelpCommand1 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   2640
      TabIndex        =   20
      Top             =   2400
      Width           =   345
   End
   Begin VB.CommandButton HelpCommand1 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   2640
      TabIndex        =   19
      Top             =   2040
      Width           =   345
   End
   Begin VB.TextBox Unknown4Text1 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   2280
      MaxLength       =   2
      TabIndex        =   17
      ToolTipText     =   "Refreshes graphic set methods?"
      Top             =   3120
      Width           =   405
   End
   Begin VB.TextBox RoomIndexText1 
      Height          =   315
      Left            =   2280
      MaxLength       =   2
      TabIndex        =   15
      Top             =   2760
      Width           =   405
   End
   Begin VB.TextBox DownScrollerText1 
      Height          =   315
      Left            =   2280
      MaxLength       =   2
      TabIndex        =   13
      Top             =   2400
      Width           =   405
   End
   Begin VB.TextBox UpScrollerText1 
      Height          =   315
      Left            =   2280
      MaxLength       =   2
      TabIndex        =   11
      Top             =   2040
      Width           =   405
   End
   Begin VB.TextBox YText1 
      Height          =   315
      Left            =   1980
      MaxLength       =   2
      TabIndex        =   8
      Top             =   1200
      Width           =   915
   End
   Begin VB.TextBox XText1 
      Height          =   315
      Left            =   1980
      MaxLength       =   2
      TabIndex        =   7
      Top             =   900
      Width           =   915
   End
   Begin VB.TextBox HeightText1 
      Height          =   315
      Left            =   750
      MaxLength       =   1
      TabIndex        =   6
      Top             =   1200
      Width           =   765
   End
   Begin VB.TextBox WidthText1 
      Height          =   315
      Left            =   750
      MaxLength       =   1
      TabIndex        =   5
      Top             =   900
      Width           =   765
   End
   Begin VB.ComboBox RegionCombo1 
      Height          =   315
      ItemData        =   "RoomHeader1.frx":030A
      Left            =   120
      List            =   "RoomHeader1.frx":030C
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   450
      Width           =   2865
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   315
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   2865
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Special Graphics Bitflags"
      Height          =   195
      Index           =   7
      Left            =   480
      TabIndex        =   18
      Top             =   3180
      Width           =   1755
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Room Index"
      Height          =   195
      Index           =   6
      Left            =   1320
      TabIndex        =   16
      Top             =   2880
      Width           =   855
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Down scroller"
      Height          =   195
      Index           =   5
      Left            =   1200
      TabIndex        =   14
      Top             =   2520
      Width           =   960
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Up scroller"
      Height          =   195
      Index           =   4
      Left            =   1440
      TabIndex        =   12
      Top             =   2160
      Width           =   750
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Y"
      Height          =   195
      Index           =   3
      Left            =   1680
      TabIndex        =   10
      Top             =   1200
      Width           =   105
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      Height          =   195
      Index           =   2
      Left            =   1680
      TabIndex        =   9
      Top             =   900
      Width           =   105
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Height"
      Height          =   195
      Index           =   1
      Left            =   150
      TabIndex        =   4
      Top             =   1200
      Width           =   465
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Width"
      Height          =   195
      Index           =   0
      Left            =   150
      TabIndex        =   3
      Top             =   900
      Width           =   420
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00C86464&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Room Header"
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
      Height          =   340
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3040
   End
End
Attribute VB_Name = "RoomHeader1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub Command1_Click()
'prevent user from putting bad values for x/y
If Val("&H" & XText1.Text) < 0 Then XText1.Text = "00"
If Val("&H" & XText1.Text) > 255 Then XText1.Text = "FF"
If Val("&H" & YText1.Text) < 0 Then YText1.Text = "00"
If Val("&H" & YText1.Text) > 255 Then YText1.Text = "FF"

'prevent user from putting 0 as width/height
If Val("&H" & WidthText1.Text) < 1 Then WidthText1.Text = "1"
If Val("&H" & HeightText1.Text) < 1 Then HeightText1.Text = "1"

'maximum room size = 50 screens
'51 screens could fit in memory at the end of the RAM, but #x# cannot equal 51
'52 screens fills all existing memory, plus one... might work, but really shouldn't do it
If Val("&H" & WidthText1.Text) * Val("&H" & HeightText1.Text) > 50 Then
    MsgBox "Room is " & Val("&H" & WidthText1.Text) * Val("&H" & HeightText1.Text) & " screens." & vbCrLf & "Room must be 50 screens or less.", vbOKOnly, "Room too large"
    Exit Sub
End If
RoomHeader1.Visible = False

DD = MsgBox("For this change to happen, SMILE must save and re-open this room!", vbOKCancel, "Save and Re-Open?")

If DD = vbOK Then
    RoomHeader1.Tag = 1
    ReDim Preserve RoomTile(0 To (Val("&H" & WidthText1.Text) * Val("&H" & HeightText1.Text) * 256) - 1) As Tile
    ReDim Preserve RoomClip(0 To (Val("&H" & WidthText1.Text) * Val("&H" & HeightText1.Text) * 256) - 1) As Byte '
    If UBound(RoomTile2) > 0 Then ReDim Preserve RoomTile2(0 To (Val("&H" & WidthText1.Text) * Val("&H" & HeightText1.Text) * 256) - 1) As Tile
    Smile.mnuSaveRoom_Click
    DoEvents
    Smile.TestCodeList1_Click
Else
    RoomHeader1.Tag = 0
End If
RefreshMapHighlight
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub





Private Sub HelpCommand1_Click(Index As Integer)
Dim TempHelp As String
Select Case Index
    Case 0: TempHelp = "How far a room scrolls up." & vbCrLf & "Usually 70.  Not much point in changing."
    Case 1: TempHelp = "How far a room scrolls down." & vbCrLf & "Usually A0.  Not much point in changing."
    Case 2: TempHelp = "A unique index value to give each room." & vbCrLf & "Serves absolutely no purpose in the game."
    Case 3: TempHelp = "Forces special graphic condtions:" & vbCrLf & "*00 = Normal Rooms" & vbCrLf & "_01 = Boss and mini-boss rooms that overwrite part of the CRE?" & vbCrLf & "*02 = Force a refresh of the CRE.  Use in rooms that change/clear the CRE (01/05)." & vbCrLf & "_05 = Special rooms that wipe out the CRE.  Used in Ceres shaft, Ceres Ridley, and Kraid's Room."
End Select

MsgBox TempHelp, vbInformation, Label2(Index + 4).Caption

End Sub

Private Sub RegionCombo1_Click()
'BitDescriptions RoomHeader1.RegionCombo1.ListIndex, States1.TestCodeList1.ListIndex
End Sub

