VERSION 5.00
Begin VB.Form Watcher 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Stopped."
   ClientHeight    =   735
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3975
   ClipControls    =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   735
   ScaleWidth      =   3975
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      BackColor       =   &H00FFC0C0&
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Grab Original Value"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   480
      Width           =   3375
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   2280
      MaxLength       =   6
      TabIndex        =   0
      Text            =   "000000"
      Top             =   0
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   1560
      Top             =   120
   End
   Begin VB.Label Label2 
      Height          =   735
      Left            =   3360
      TabIndex        =   4
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Address to watch: "
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   2160
   End
End
Attribute VB_Name = "Watcher"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const HWND_TOPMOST = -1


Private OriginalValue As Byte
Private NewValue As Byte
Private watchslash As String

Private Sub Command1_Click()
Open watchslash For Binary As #1
    If Val("&H" & Text1.Text & "&") < LOF(1) Then
        Get #1, Val("&H" & Text1.Text & "&"), OriginalValue
        Watcher.Caption = "Watching..." & "$" & Text1.Text
        Timer1.Enabled = True
    Else
        MsgBox "Address is passed the end of the file.", vbInformation, "Can't watch this address."
        Watcher.Caption = "Stopped."
        Timer1.Enabled = False
    End If
Close #1
End Sub

Private Sub Command1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command2.Visible = False
End Sub

Private Sub Command2_Click()
MsgBox "Ever had a ROM get corrupted at a specific location that you know for a fact you didn't edit? Then, of course, your ROM is screwed over beyond belief. No matter how well you back up, it keeps happening." & vbCrLf & vbCrLf & "Watcher can 'watch' this location for you. When the value at that location changes, you'll be notified (hopefully giving some clue as to what exactly caused it to change, so you can tell me to fix it.", vbInformation, "Watcher Help"
End Sub

Private Sub Form_Load()
SetWindowPos hWnd, _
HWND_TOPMOST, 0, 0, 0, 0, _
SWP_NOMOVE + SWP_NOSIZE

watchslash = Command
If watchslash = "" Then End
End Sub


Public Function TypeHex(KeyAscii As Integer) As Integer
If KeyAscii = 8 Then Exit Function  'backspace
If KeyAscii = 13 Then Exit Function 'enter

'numbers
If KeyAscii >= 48 And KeyAscii <= 57 Then GoTo Hexed
'a-f become A-F
If KeyAscii >= 97 And KeyAscii <= 102 Then KeyAscii = KeyAscii - 32
'A-F
If KeyAscii >= 65 And KeyAscii <= 70 Then GoTo Hexed
'not a match
KeyAscii = 0

Hexed:
TypeHex = KeyAscii
End Function



Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command2.Visible = False
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command2.Visible = False
End Sub


Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command2.Visible = True
End Sub

Private Sub Text1_Change()
Timer1.Enabled = False
Watcher.Caption = "Stopped."
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
KeyAscii = TypeHex(KeyAscii)
End Sub

Private Sub Text1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command2.Visible = False
End Sub

Private Sub Timer1_Timer()
Open watchslash For Binary As #1
    Get #1, Val("&H" & Text1.Text & "&"), NewValue
Close #1

If NewValue <> OriginalValue Then
    DD = MsgBox("Original: " & Hex$(OriginalValue) & vbCrLf & "Modified: " & Hex$(NewValue) & vbCrLf & vbCrLf & "Return this byte to its original value?", vbExclamation + vbYesNo, "Watched value has changed!")
    If DD = vbYes Then
        Open watchslash For Binary As #1
            Put #1, Val("&H" & Text1.Text & "&"), OriginalValue
        Close #1
    Else
        OriginalValue = NewValue
    End If
End If
End Sub
