VERSION 5.00
Begin VB.Form AddSubtractEP 
   BackColor       =   &H000000FF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enemy/PLM (+/-)"
   ClientHeight    =   3015
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3135
   Icon            =   "AddSubtractEP.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   3135
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      BackColor       =   &H000000FF&
      Caption         =   "Save Changes"
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   1200
      Width           =   3135
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Index           =   1
      Left            =   0
      Max             =   50
      TabIndex        =   1
      Top             =   840
      Width           =   3135
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Index           =   0
      Left            =   0
      Max             =   50
      TabIndex        =   0
      Top             =   240
      Width           =   3135
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Warning"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   2895
   End
   Begin VB.Label Label1 
      BackColor       =   &H000000FF&
      Caption         =   "# of PLMs in room (00)"
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
      Left            =   0
      TabIndex        =   3
      Top             =   600
      Width           =   3135
   End
   Begin VB.Label Label1 
      BackColor       =   &H000000FF&
      Caption         =   "# of Enemies in room (00)"
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
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   3135
   End
End
Attribute VB_Name = "AddSubtractEP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
DD = MsgBox("If adding data to the ROM, you better know enough to move the data to a spot where it won't overwrite things.  Continue?", vbYesNo)
If DD = vbNo Then Exit Sub

'set new bounds for enemies
If HScroll1(0).Value > 0 Then
    ReDim Preserve EnemySet(0 To HScroll1(0).Value - 1) As Enemy
Else
    'ReDim EnemySet(0 To 0) As Enemy
    MsgBox "Don't set # of Enemies to 0 here.  Change the pointer instead.", vbCritical, "Oops."
    Exit Sub
End If

'set new bounds for PLMs
If HScroll1(1).Value > 0 Then
    ReDim Preserve PLMSet(0 To HScroll1(1).Value - 1) As PLM6
Else
    ReDim PLMSet(0 To 0) As PLM6
    PLMSet(0).Type = Val("&H0000&")
    Smile.PLMBox(0).Enabled = False
    MsgBox "You've set # of PLM's to 0." & vbCrLf & "This will work, but you really should just change the pointer instead.", vbInformation, "Zero PLM's."
End If
'MsgBox Hex$(PLMSet(0).Type)
Unload Me
End Sub

Private Sub Form_Load()
'find # of enemies
For I = 0 To Smile.EnemyBox.UBound - 1
    If Smile.EnemyBox(I).Enabled = False Then Exit For
Next I
HScroll1(0).Value = I

'find # of PLMs
For I = 0 To Smile.PLMBox.UBound - 1
    If Smile.PLMBox(I).Enabled = False Then Exit For
Next I
HScroll1(1).Value = I

Label2.Caption = "Warning:" & vbCrLf & vbCrLf & "Minor fixes since version 1.32, but still not recommended unless you're sure of what you're doing."
End Sub

Private Sub HScroll1_Change(Index As Integer)
If Index = 0 Then Label1(0).Caption = "# of Enemies in room (" & Right$("00" & Hex$(HScroll1(Index).Value), 2) & ")"
If Index = 1 Then Label1(1).Caption = "# of PLMs in room (" & Right$("00" & Hex$(HScroll1(Index).Value), 2) & ")"
End Sub

Private Sub HScroll1_Scroll(Index As Integer)
If Index = 0 Then Label1(0).Caption = "# of Enemies in room (" & Right$("00" & Hex$(HScroll1(Index).Value), 2) & ")"
If Index = 1 Then Label1(1).Caption = "# of PLMs in room (" & Right$("00" & Hex$(HScroll1(Index).Value), 2) & ")"
End Sub

