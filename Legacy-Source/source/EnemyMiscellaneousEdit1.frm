VERSION 5.00
Begin VB.Form EnemyMiscellaneousEdit1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Item Drop Edit"
   ClientHeight    =   2520
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3360
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2520
   ScaleWidth      =   3360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Item Drop"
      Height          =   2535
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3375
      Begin VB.CommandButton ItemDropCommand1 
         Caption         =   "Cancel"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   14
         Top             =   2160
         Width           =   3015
      End
      Begin VB.CommandButton ItemDropCommand1 
         Caption         =   "Save Changes"
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   7
         Top             =   1800
         Width           =   3015
      End
      Begin VB.HScrollBar ItemDropScroll1 
         Height          =   255
         Index           =   0
         LargeChange     =   10
         Left            =   1680
         Max             =   255
         TabIndex        =   6
         Top             =   240
         Width           =   1455
      End
      Begin VB.HScrollBar ItemDropScroll1 
         Height          =   255
         Index           =   1
         LargeChange     =   10
         Left            =   1680
         Max             =   255
         TabIndex        =   5
         Top             =   480
         Width           =   1455
      End
      Begin VB.HScrollBar ItemDropScroll1 
         Height          =   255
         Index           =   2
         LargeChange     =   10
         Left            =   1680
         Max             =   255
         TabIndex        =   4
         Top             =   720
         Width           =   1455
      End
      Begin VB.HScrollBar ItemDropScroll1 
         Height          =   255
         Index           =   3
         LargeChange     =   10
         Left            =   1680
         Max             =   255
         TabIndex        =   3
         Top             =   960
         Width           =   1455
      End
      Begin VB.HScrollBar ItemDropScroll1 
         Height          =   255
         Index           =   4
         LargeChange     =   10
         Left            =   1680
         Max             =   255
         TabIndex        =   2
         Top             =   1200
         Width           =   1455
      End
      Begin VB.HScrollBar ItemDropScroll1 
         Height          =   255
         Index           =   5
         LargeChange     =   10
         Left            =   1680
         Max             =   255
         TabIndex        =   1
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label ItemDropLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Power Bomb"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   13
         Top             =   1440
         Width           =   1600
      End
      Begin VB.Label ItemDropLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Super Missile"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   12
         Top             =   1200
         Width           =   1600
      End
      Begin VB.Label ItemDropLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Nothing?"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   11
         Top             =   960
         Width           =   1600
      End
      Begin VB.Label ItemDropLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Missile"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   10
         Top             =   720
         Width           =   1600
      End
      Begin VB.Label ItemDropLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Big Energy"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   9
         Top             =   480
         Width           =   1600
      End
      Begin VB.Label ItemDropLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Energy"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   1600
      End
   End
End
Attribute VB_Name = "EnemyMiscellaneousEdit1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ItemDropCommand1_Click(Index As Integer)
If Index = 1 Then GoTo KillItemDrop 'cancelled

Dim tempobyte(0 To 5) As Byte

For I = 0 To 5
tempobyte(I) = ItemDropScroll1(I).Value
Next I

Open needslash For Binary As #1
Put #1, pEnemyEditing + ROM_HEADER + 1, tempobyte()
Close #1

KillItemDrop:
Unload Me
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Dim tempobyte(0 To 5) As Byte

Me.Icon = Smile.Icon
Open needslash For Binary As #1
Get #1, pEnemyEditing + ROM_HEADER + 1, tempobyte()
Close #1
For I = 0 To 5
ItemDropLabel1(I).Tag = ItemDropLabel1(I).Caption
'force scroll for caption, in case a value starts as 00
If tempobyte(I) = 0 Then ItemDropScroll1(I).Value = 1

ItemDropScroll1(I).Value = tempobyte(I)
Next I
End Sub

Private Sub ItemDropScroll1_Change(Index As Integer)
ItemDropLabel1(Index).Caption = "[" & Right$("00" & Hex$(ItemDropScroll1(Index).Value), 2) & "]" & ItemDropLabel1(Index).Tag
End Sub

Private Sub ItemDropScroll1_Scroll(Index As Integer)
ItemDropLabel1(Index).Caption = "[" & Right$("00" & Hex$(ItemDropScroll1(Index).Value), 2) & "]" & ItemDropLabel1(Index).Tag
End Sub
