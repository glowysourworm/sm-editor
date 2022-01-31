VERSION 5.00
Begin VB.Form plugin 
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
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
      Index           =   0
      Left            =   0
      MaxLength       =   4
      TabIndex        =   0
      Text            =   "0000"
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "Value 1"
      Height          =   360
      Index           =   0
      Left            =   615
      TabIndex        =   1
      Tag             =   "000010"
      Top             =   0
      Width           =   2640
   End
End
Attribute VB_Name = "plugin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Me.Icon = Smile.Icon

'grab form type and title from form
'read label caption, then offset.... repeate
'if a label caption is "EOF" then done
OpenFourText
End Sub


Private Sub OpenFourText()
Dim TempInteger As Integer
Dim LabelCaption As String
Dim ValueOffset As String

'open text boxes with length of 4
Open needslash For Input As #1
I = 0
Do
    If I <> 0 Then
        Load Text1(I)
        Text1(I).Top = Text1(I - 1).Top + Text1(I - 1).Height
        Text1(I).Visible = True
        Load Label1(I)
        Label1(I).Top = Label1(I - 1).Top + Label1(I - 1).Height
        Label1(I).Visible = True
    End If
    
    Get #1, Val("&H" & Label1(I).Tag & "&") + ROM_HEADER + 1, TempInteger
    Text1(I).Text = Right$("0000" & Hex$(TempInteger), 4)
    I = I + 1
Loop Until LabelCaption = "EOF"
Close #1
End Sub
