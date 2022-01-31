VERSION 5.00
Begin VB.Form RoomFromMap1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "More than one room found!"
   ClientHeight    =   3690
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   2655
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   2655
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "Cancel"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   1920
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Enter Room"
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   1560
      Width           =   2655
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1560
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2655
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   0
      TabIndex        =   0
      Top             =   2280
      Width           =   2655
   End
End
Attribute VB_Name = "RoomFromMap1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
FoundRooms(0) = "None!"
Unload Me
End Sub

Private Sub Command2_Click()
FoundRooms(0) = List1.Text
Unload Me
End Sub

Private Sub Form_Load()
Label1.Caption = "More than one room is on this part of the map. Select a room from the list to open it."
For II = 0 To UBound(FoundRooms)
    List1.AddItem FoundRooms(II)
Next II
List1.Text = List1.List(0)
End Sub

Private Sub List1_DblClick()
FoundRooms(0) = List1.Text
Unload Me
End Sub
