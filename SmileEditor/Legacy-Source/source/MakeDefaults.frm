VERSION 5.00
Begin VB.Form MakeDefaults 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Make Defaults"
   ClientHeight    =   1995
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3180
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1995
   ScaleWidth      =   3180
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "OK (keep values)"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   1320
      Width           =   2895
   End
   Begin VB.CommandButton Command2 
      Caption         =   "OK (normal)"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   1680
      Width           =   2895
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   2520
      TabIndex        =   6
      Text            =   "00"
      Top             =   360
      Width           =   375
   End
   Begin VB.VScrollBar VScroll1a 
      Height          =   720
      Left            =   120
      Max             =   15
      TabIndex        =   3
      Top             =   360
      Width           =   255
   End
   Begin VB.TextBox PatternText 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   720
      Left            =   1080
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "MakeDefaults.frx":0000
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "BTS"
      Height          =   255
      Index           =   1
      Left            =   2520
      TabIndex        =   5
      Top             =   120
      Width           =   615
   End
   Begin VB.Label Label1 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Property Byte"
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   4
      Top             =   120
      Width           =   1815
   End
   Begin VB.Image PatternPreview 
      BorderStyle     =   1  'Fixed Single
      Height          =   720
      Left            =   360
      Stretch         =   -1  'True
      Top             =   360
      Width           =   720
   End
End
Attribute VB_Name = "MakeDefaults"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
ResultPattern = VScroll1a.Value
ResultBTS = Val("&H" & Text1.Text & "&")
ResultLoaded = False
Unload MakeDefaults
End Sub

Private Sub Command2_Click()
ResultPattern = VScroll1a.Value
ResultBTS = Val("&H" & Text1.Text & "&")
ResultLoaded = True
Unload MakeDefaults
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
VScroll1a.Value = ResultPattern
Text1.Text = Right$("00" & Hex$(ResultBTS), 2)
VScroll1a_Change
End Sub

Public Sub VScroll1a_Change()
Dim TV As Byte
Dim TVtext

TV = VScroll1a.Value

If TV = 0 Then TVtext = "Air. X-RAY."
If TV = 1 Then TVtext = "Slope."
If TV = 2 Then TVtext = "Air???"
If TV = 3 Then TVtext = "Treadmill."
If TV = 4 Then TVtext = "Shootable Air."
If TV = 5 Then TVtext = "Two Wide."
If TV = 6 Then TVtext = "Air???"
If TV = 7 Then TVtext = "Bombable Air."
If TV = 8 Then TVtext = "Solid block."
If TV = 9 Then TVtext = "Door."
If TV = 10 Then TVtext = "Spike Block."
If TV = 11 Then TVtext = "Crumble Block."
If TV = 12 Then TVtext = "Shot Block."
If TV = 13 Then TVtext = "Two High."
If TV = 14 Then TVtext = "Grapple Block."
If TV = 15 Then TVtext = "Bomb Block."
'2 - Used in glass in Wrecked Ship
'6 - Unknown


PatternText.Text = TVtext
PatternPreview.Picture = LoadPicture(App.Path & "\files\patterns\" & TV & ".gif")
ChangeProperties False
End Sub

