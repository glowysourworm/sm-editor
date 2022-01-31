VERSION 5.00
Begin VB.Form Plugins 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Plugins"
   ClientHeight    =   3855
   ClientLeft      =   45
   ClientTop       =   210
   ClientWidth     =   6630
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3855
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Open Plug-In"
      Enabled         =   0   'False
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   3600
      Width           =   2535
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3570
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2535
   End
   Begin VB.FileListBox File1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2520
      Left            =   0
      Pattern         =   "*.spi;*.exe"
      TabIndex        =   0
      Top             =   0
      Width           =   2535
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   3855
      Left            =   2520
      TabIndex        =   2
      Top             =   0
      Width           =   4095
   End
End
Attribute VB_Name = "Plugins"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False




Private Sub Command1_Click()
List1_DblClick
End Sub

Private Sub Form_Load()
File1.Path = App.Path & "\files\Plugins\"

If File1.ListCount = 0 Then Exit Sub
For I = 0 To File1.ListCount - 1
    List1.AddItem Left$(File1.List(I), Len(File1.List(I)) - 4)
Next I

End Sub

Private Sub List1_Click()
Dim tempCaption As String

Command1.Enabled = True
PlugInPath = File1.Path & "\" & List1.Text & ".spi"

Open PlugInPath For Binary As #6
    Get #6, 1, MY_SPI_HEADER
Close #6

'executable file, renamed as *.spi
If MY_SPI_HEADER.ID <> "SPI" Then
    Label1.Caption = "Executable file (*.exe)." & vbCrLf & "No description available."
    Exit Sub
End If

tempCaption = MY_SPI_HEADER.Title
RemoveTitleSpaces:
If Right$(tempCaption, 1) = " " Then
    tempCaption = Left$(tempCaption, Len(tempCaption) - 1)
    GoTo RemoveTitleSpaces
End If

tempCaption = tempCaption & " by " & MY_SPI_HEADER.Author & vbCrLf
tempCaption = tempCaption & "Version " & MY_SPI_HEADER.UserVersion & " (" & MY_SPI_HEADER.Date & ")" & vbCrLf & vbCrLf
tempCaption = tempCaption & MY_SPI_HEADER.Description
Label1.Caption = tempCaption

End Sub

Private Sub List1_DblClick()
PlugInPath = File1.Path & "\" & List1.Text & ".spi"

Open PlugInPath For Binary As #6
    Get #6, 1, MY_SPI_HEADER
Close #6

'executable file, renamed as *.spi
If MY_SPI_HEADER.ID <> "SPI" Then
    Shell PlugInPath & " " & needslash, vbNormalFocus
    Unload Me
Else
    Outlet.Show 1
    Unload Me
End If
End Sub
