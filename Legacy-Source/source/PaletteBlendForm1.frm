VERSION 5.00
Begin VB.Form PaletteBlendForm1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3780
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   3450
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   252
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton PaletteBlendCommand1 
      Caption         =   "Command1"
      Height          =   495
      Index           =   99
      Left            =   0
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   2640
      Width           =   1455
   End
End
Attribute VB_Name = "PaletteBlendForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private TempColor As Integer
Private tempRed As Byte
Private TempGreen As Byte
Private TempBlue As Byte


Private Sub Form_Load()
Dim XX As Integer
Dim YY As Integer

Open needslash For Binary As #1
    For I = 0 To &H7F Step 6
        Get #1, &H4AA02 + I + ROM_HEADER + 1, TempColor
        PaletteFromBytes (Val(TempColor))
        Me.Line (XX, YY)-(XX + 16, YY + 5), RGB(pRR, pGG, pBB), BF
        Get #1, &H4AA04 + I + ROM_HEADER + 1, TempColor
        PaletteFromBytes (Val(TempColor))
        Me.Line (XX, YY + 5)-(XX + 16, YY + 10), RGB(pRR, pGG, pBB), BF
        Get #1, &H4AA06 + I + ROM_HEADER + 1, TempColor
        PaletteFromBytes (Val(TempColor))
        Me.Line (XX, 10)-(XX + 16, YY + 15), RGB(pRR, pGG, pBB), BF
        XX = XX + 16
        If XX > 128 Then
            XX = 0
            YY = YY + 16
        End If
    Next I
Close #1
End Sub

Private Sub PaletteBlendCommand1_Click(Index As Integer)
Unload Me

End Sub
