VERSION 5.00
Begin VB.Form InfoForm1 
   Appearance      =   0  'Flat
   BackColor       =   &H00800000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   405
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4575
   LinkTopic       =   "Form1"
   ScaleHeight     =   27
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   305
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   405
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4575
   End
End
Attribute VB_Name = "InfoForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
SetWindowPos hwnd, _
HWND_TOPMOST, 0, 0, 0, 0, _
SWP_NOMOVE + SWP_NOSIZE

Text1.BackColor = TopicNotSelected
Text1.ForeColor = TopicSelected
End Sub
