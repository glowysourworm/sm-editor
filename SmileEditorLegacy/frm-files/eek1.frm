VERSION 5.00
Begin VB.Form eek1 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5400
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   3750
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "eek1.frx":0000
   ScaleHeight     =   5400
   ScaleWidth      =   3750
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      BackColor       =   &H00808080&
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   4920
      Width           =   1815
   End
End
Attribute VB_Name = "eek1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub
