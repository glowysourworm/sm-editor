VERSION 5.00
Begin VB.Form Magnifier 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Magnifier"
   ClientHeight    =   3840
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3840
   ClipControls    =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   256
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   256
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer UpdateTimer1 
      Interval        =   100
      Left            =   1650
      Top             =   1230
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1680
      Left            =   735
      Top             =   1545
      Width           =   1275
   End
End
Attribute VB_Name = "Magnifier"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
SetWindowPos hWnd, _
HWND_TOPMOST, 0, 0, 0, 0, _
SWP_NOMOVE + SWP_NOSIZE
End Sub

Private Sub UpdateTimer1_Timer()
If Val(Magnifier.Tag) = 0 Then
    StretchBlt Me.hdc, 0, 0, 256, 256, Smile.Picture2.hdc, Smile.Target(1).Left - TileSize, Smile.Target(1).Top - TileSize, TileSize * 3, TileSize * 3, SRCCOPY
Else
    StretchBlt Me.hdc, 0, 0, 256, 256, Smile.MenuPicture1.hdc, Smile.Target(0).Left - TileSize, Smile.Target(0).Top - TileSize, TileSize * 3, TileSize * 3, SRCCOPY
End If
End Sub
