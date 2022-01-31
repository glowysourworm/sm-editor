VERSION 5.00
Begin VB.Form PLMForm 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0FFFF&
   BorderStyle     =   0  'None
   Caption         =   "PLM"
   ClientHeight    =   3210
   ClientLeft      =   0
   ClientTop       =   -105
   ClientWidth     =   5955
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   214
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   397
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox LowText1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   1515
      MaxLength       =   2
      TabIndex        =   23
      Text            =   "00"
      Top             =   330
      Width           =   375
   End
   Begin VB.TextBox HighText1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   1125
      MaxLength       =   2
      TabIndex        =   22
      Text            =   "00"
      Top             =   330
      Width           =   375
   End
   Begin VB.PictureBox Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      ForeColor       =   &H80000008&
      Height          =   855
      Index           =   0
      Left            =   345
      ScaleHeight     =   825
      ScaleWidth      =   1590
      TabIndex        =   10
      Top             =   990
      Visible         =   0   'False
      Width           =   1620
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   5
         Left            =   1080
         MaxLength       =   2
         TabIndex        =   13
         Text            =   "00"
         Top             =   40
         Width           =   375
      End
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0E0FF&
         Caption         =   "Save"
         Height          =   255
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Hits to Open:"
         Height          =   195
         Index           =   2
         Left            =   105
         TabIndex        =   14
         Top             =   105
         Width           =   930
      End
   End
   Begin VB.PictureBox Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      ForeColor       =   &H80000008&
      Height          =   1500
      Index           =   1
      Left            =   75
      ScaleHeight     =   1470
      ScaleWidth      =   1770
      TabIndex        =   11
      Top             =   1020
      Width           =   1800
      Begin VB.ComboBox Combo1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         ItemData        =   "PLMForm.frx":0000
         Left            =   510
         List            =   "PLMForm.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "Index"
         Top             =   825
         Width           =   1215
      End
      Begin VB.CommandButton Command2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0E0FF&
         Caption         =   "Save"
         Height          =   255
         Left            =   30
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   1185
         Width           =   1710
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   2
         Left            =   510
         MaxLength       =   2
         TabIndex        =   16
         Text            =   "00"
         Top             =   60
         Width           =   375
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   4
         Left            =   510
         MaxLength       =   4
         TabIndex        =   15
         Text            =   "0000"
         Top             =   435
         Width           =   645
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Music:"
         Height          =   195
         Index           =   3
         Left            =   15
         TabIndex        =   21
         Top             =   870
         Width           =   465
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Type:"
         Height          =   195
         Index           =   0
         Left            =   75
         TabIndex        =   20
         Top             =   90
         Width           =   405
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Value:"
         Height          =   195
         Index           =   1
         Left            =   30
         TabIndex        =   19
         Top             =   495
         Width           =   450
      End
   End
   Begin VB.ComboBox PLMList 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      ItemData        =   "PLMForm.frx":0039
      Left            =   45
      List            =   "PLMForm.frx":003B
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   330
      Width           =   930
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Index           =   6
      Left            =   3465
      MaxLength       =   4
      TabIndex        =   5
      Top             =   1950
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Index           =   3
      Left            =   3465
      MaxLength       =   2
      TabIndex        =   4
      Top             =   1830
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Index           =   1
      Left            =   3465
      MaxLength       =   2
      TabIndex        =   1
      Top             =   1710
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Index           =   0
      Left            =   3465
      MaxLength       =   8
      TabIndex        =   3
      Top             =   1470
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.FileListBox File1 
      Height          =   480
      Left            =   3705
      Pattern         =   "*.gif"
      TabIndex        =   2
      Top             =   1350
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.TextBox PLMType 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   3465
      MaxLength       =   4
      TabIndex        =   0
      Top             =   1350
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      ForeColor       =   &H80000008&
      Height          =   2385
      Left            =   2040
      TabIndex        =   9
      Top             =   780
      Width           =   3870
      Begin VB.TextBox PLMQuirksText1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1890
         Left            =   10
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   25
         Top             =   225
         Width           =   3840
      End
      Begin VB.CommandButton PLMQuirksCommand1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0E0FF&
         Caption         =   "Save changes to PLM's text file"
         Height          =   255
         Left            =   10
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   2115
         Width           =   3850
      End
   End
   Begin VB.Shape SquareBorder 
      BorderStyle     =   3  'Dot
      FillColor       =   &H00808080&
      Height          =   3210
      Left            =   735
      Top             =   0
      Width           =   5955
   End
   Begin VB.Image PLMCommandButton 
      Height          =   750
      Index           =   0
      Left            =   4425
      Picture         =   "PLMForm.frx":003D
      Stretch         =   -1  'True
      Top             =   15
      Width           =   1500
   End
   Begin VB.Image PLMCommandButton 
      Height          =   750
      Index           =   1
      Left            =   2895
      Picture         =   "PLMForm.frx":032C
      Stretch         =   -1  'True
      Top             =   15
      Width           =   1500
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "High"
      Height          =   195
      Index           =   1
      Left            =   1125
      TabIndex        =   8
      Top             =   105
      Width           =   330
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "Low"
      Height          =   195
      Index           =   0
      Left            =   1515
      TabIndex        =   7
      Top             =   105
      Width           =   300
   End
   Begin VB.Image PLMPreview 
      Appearance      =   0  'Flat
      Height          =   1920
      Left            =   60
      Top             =   690
      Width           =   1920
   End
End
Attribute VB_Name = "PLMForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub Combo1_Click()
Text1(1).Text = Left$(Combo1.Text, 2)
End Sub




Private Sub Command2_Click()
Dim Structure1 As h8BDD8899_Type
Dim Structure2 As hsuit8BDD8899_Type    'in case it's a suit

If Text1(2).Tag = "9D" Then GoTo SavingASuit

Structure1.h8BDD8899 = Val("&H" & Text1(0).Text)
Structure1.Music = Val("&H" & Text1(1).Text)
Structure1.Type = Val("&H" & Text1(2).Text)
Structure1.Unknown1 = Val("&H" & Text1(3).Text)
Structure1.Amount = Val("&H" & Text1(4).Text)
Structure1.Unknown2 = Val("&H" & Text1(6).Text)
Open needslash For Binary As #1
    Put #1, Val(PLMForm.Tag) + ROM_HEADER + 1, Structure1
Close #1
Exit Sub

SavingASuit:
Structure2.h8BDD8899 = Val("&H" & Text1(0).Text)
Structure2.Music = Val("&H" & Text1(1).Text)
Structure2.Unknown2 = Val("&H" & Text1(6).Text)
Structure2.Type = Val("&H" & Text1(2).Text)
Structure2.Unknown1 = Val("&H" & Text1(3).Text)
Structure2.Amount = Val("&H" & Text1(4).Text)
Open needslash For Binary As #1
    Put #1, Val(PLMForm.Tag) + ROM_HEADER + 1, Structure2
Close #1
End Sub



Private Sub Command3_Click()
Dim HitsToOpen As Byte
HitsToOpen = Val("&H" & Text1(5).Text)
Open needslash For Binary As #1
    Put #1, Val("&H" & Right$(Frame2.Caption, 5)) + ROM_HEADER + 20 + 1, HitsToOpen
Close #1
End Sub



Private Sub Command4_Click()
MsgBox "!"
End Sub



Private Sub Form_Deactivate()
Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
If PLMForm.ActiveControl.Name = "PLMQuirksText1" Then Exit Sub
If KeyAscii = 27 Then PLMCommandButton_Click 0
TypeHex KeyAscii
End Sub


Private Sub Form_Load()
Dim FakeIndex As Byte
Dim TempFormX As Long
Dim TempFormY As Long

'figure X position compared to screen dimensions
If GetSystemMetrics(SM_CXFULLSCREEN) > (MouseX + ScaleX(Me.Width, vbTwips, vbPixels)) Then
    'place on right of plm
    TempFormX = ScaleX(MouseX - MouseMyX + TileSize, vbPixels, vbTwips)
Else
    'place on left of plm
    TempFormX = ScaleX(MouseX - MouseMyX, vbPixels, vbTwips) - Me.Width
End If
'figure Y position compared to screen dimensions
If GetSystemMetrics(SM_CYFULLSCREEN) > (MouseY + ScaleY(Me.Height, vbTwips, vbPixels)) Then
    'below plm
    TempFormY = ScaleY(MouseY - MouseMyY, vbPixels, vbTwips)
Else
    'above plm
    TempFormY = ScaleY(MouseY - MouseMyY + TileSize, vbPixels, vbTwips) - Me.Height
End If
Me.Move TempFormX, TempFormY

'Me.Icon = Smile.Icon
File1.Path = App.Path & "\files\PLM\"
For I = 0 To File1.ListCount - 1
TempItem = UCase$(File1.List(I))
TempItem = Replace(TempItem, ".GIF", "")
PLMList.AddItem TempItem
Next I

'load type into list box
For I = 0 To PLMList.ListCount
If PLMList.List(I) = UCase$(Right$("0000" & Hex$(PLMSet(Smile.PLMBox(0).Tag).Type), 4)) Then PLMList.Text = PLMList.List(I)
Next I
PLMType.Text = Right$("0000" & Hex$(PLMSet(Smile.PLMBox(0).Tag).Type), 4)
'load I into LowText1
LowText1.Text = Right$("00" & Hex$(PLMSet(Smile.PLMBox(0).Tag).I), 2)
'load Unknown into hightext1
HighText1.Text = Right$("00" & Hex$(PLMSet(Smile.PLMBox(0).Tag).Unknown), 2)

SquareBorder.Move 0, 0
End Sub





Private Sub HighText1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
HighText1.SetFocus
End Sub

Public Sub PLMCommandButton_Click(Index As Integer)
Dim VBNeg As Boolean
Dim TempLOF As Long

If Index = 0 Then GoTo UnloadNow
'set picture
File1.Path = App.Path & "\files\PLM\"
Open File1.Path & "\" & PLMList.List(PLMList.ListIndex) & ".gif" For Binary As #1
TempLOF = LOF(1)
Close #1
If TempLOF = 0 Then Kill File1.Path & "\" & PLMList.List(PLMList.ListIndex) & ".gif": GoTo UnknownPLM

PLMPreview.Picture = LoadPicture(File1.Path & "\" & PLMList.List(PLMList.ListIndex) & ".gif")
PLMPreview.Refresh

UnknownPLM:
'save type (1st and 2nd bytes)
PLMSet(Smile.PLMBox(0).Tag).Type = Val("&H" & PLMType.Text)
'save index (5th byte)
PLMSet(Smile.PLMBox(0).Tag).I = Val("&H" & LowText1.Text & "&")
'save unknown (6th byte)
PLMSet(Smile.PLMBox(0).Tag).Unknown = Val("&H" & HighText1.Text & "&")

RefreshPLM Val(Smile.PLMBox(0).Tag)

UnloadNow:
Unload PLMForm
End Sub

Private Sub PLMCommandButton_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
PLMCommandButton(Index).BorderStyle = 1
End Sub

Private Sub PLMCommandButton_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 1 Then Exit Sub
If X >= 0 And X <= PLMCommandButton(Index).Width Then
    If Y >= 0 And Y <= PLMCommandButton(Index).Height Then
        PLMCommandButton(Index).BorderStyle = 1
    Else
        PLMCommandButton(Index).BorderStyle = 0
    End If
Else
    PLMCommandButton(Index).BorderStyle = 0
End If
End Sub

Private Sub PLMCommandButton_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
PLMCommandButton(Index).BorderStyle = 0
End Sub

Public Sub PLMList_Click()
File1.Path = App.Path & "\files\PLM\"
PLMPreview.Picture = LoadPicture(File1.Path & "\" & PLMList.List(PLMList.ListIndex) & ".gif")
PLMType.Text = PLMList.List(PLMList.ListIndex)
Find_PLM_Structure_Pointer

PLMQuirksTextRefresh
End Sub


Public Sub Find_PLM_Structure_Pointer()
Dim CurrentItemType As ThreeByte
Dim OldItemType As ThreeByte
Dim ItemStructureOffset As Long
Dim h8BDD8899 As Long   'known structure offset
Dim Structure1 As h8BDD8899_Type        'actual structure
Dim Structure2 As hsuit8BDD8899_Type    'actual structure (suits)
Dim FoundKnown As Boolean
Dim HitsToOpen As Byte  'for pink/green doors

'hide frames
Frame1(0).Visible = False
Frame1(1).Visible = False
'turn item type into pointer
CurrentItemType.Byte1 = Val("&H" & Right$(PLMList.List(PLMList.ListIndex), 2) & "&")
CurrentItemType.Byte2 = Val("&H" & Left$(PLMList.List(PLMList.ListIndex), 2) & "&")
CurrentItemType.Byte3 = &H84&
OldItemType = CurrentItemType
'unknown pointer (1st)

'find pointer to item structure from current pointer (2nd)
Open needslash For Binary As #1
    Get #1, ThreePoint2Offset(OldItemType) + ROM_HEADER + 1, CurrentItemType.Byte1
    Get #1, ThreePoint2Offset(OldItemType) + ROM_HEADER + 2, CurrentItemType.Byte2
        ItemStructureOffset = ThreePoint2Offset(CurrentItemType)
        Frame2.Caption = Hex$(ItemStructureOffset)
    Get #1, ThreePoint2Offset(OldItemType) + ROM_HEADER + 3, CurrentItemType.Byte1
    Get #1, ThreePoint2Offset(OldItemType) + ROM_HEADER + 4, CurrentItemType.Byte2
        ItemStructureOffset = ThreePoint2Offset(CurrentItemType)
        Frame2.Caption = Frame2.Caption & " | " & Hex$(ItemStructureOffset)
    Get #1, ThreePoint2Offset(CurrentItemType) + ROM_HEADER + 21, HitsToOpen
        Text1(5).Text = Right$("00" & Hex$(HitsToOpen), 2)
    'if found a pink/green door, make door definition frame visible, otherwise, hide it
    If Val("&H" & PLMForm.PLMList.Text) > Val("&HC871") And Val("&H" & PLMForm.PLMList.Text) < Val("&HC89D") Then
        Frame1(0).Visible = True
    Else
        Frame1(0).Visible = False
    End If
    'byte #21 = # of missiles to open pink/green
        
FoundKnown = False
    For I = 0 To 50
        Get #1, ItemStructureOffset + ROM_HEADER + 1 + I, h8BDD8899
        If Hex$(h8BDD8899) = "8BDD8899" Then h8BDD8899 = ItemStructureOffset + I: FoundKnown = True: Exit For
    Next I


If FoundKnown = True Then
    'is an item, so show the item definition frame
    Frame1(1).Visible = True
    Get #1, h8BDD8899 + ROM_HEADER + 1, Structure1
    Get #1, h8BDD8899 + ROM_HEADER + 1, Structure2
    If Structure1.Type = &H9D Then
    'had previously left the text boxes in order for suits for some reason?
        Text1(2).Tag = "9D"
        Text1(0).Text = Hex$(Structure2.h8BDD8899)
        Text1(1).Text = Right$("00" & Hex$(Structure2.Music), 2)
        Text1(6).Text = Right$("0000" & Hex$(Structure2.Unknown2), 4)
        Text1(2).Text = Right$("00" & Hex$(Structure2.Type), 2)
        Text1(3).Text = Right$("00" & Hex$(Structure2.Unknown1), 2)
        Text1(4).Text = Right$("0000" & Hex$(Structure2.Amount), 4)
    Else
        Text1(2).Tag = "00"
        Text1(0).Text = Hex$(Structure1.h8BDD8899)
        Text1(1).Text = Right$("00" & Hex$(Structure1.Music), 2)
        Text1(2).Text = Right$("00" & Hex$(Structure1.Type), 2)
        Text1(3).Text = Right$("00" & Hex$(Structure1.Unknown1), 2)
        Text1(4).Text = Right$("0000" & Hex$(Structure1.Amount), 4)
        Text1(6).Text = Right$("0000" & Hex$(Structure1.Unknown2), 4)
    End If
Else
    'is not an item, so hide the item definition frame
    Frame1(1).Visible = False
End If
Close #1

If ItemStructureOffset >= 155801 And ItemStructureOffset <= 159245 Then
    Command2.Enabled = True
Else
    Command2.Enabled = False
End If
PLMForm.Tag = h8BDD8899
Text1(1).BackColor = vbWhite
Select Case Text1(1).Text
    Case "00": Combo1.ListIndex = 0
    Case "01": Combo1.ListIndex = 1
    Case "02": Combo1.ListIndex = 2
    Case "FF": Combo1.ListIndex = 3
    Case Else: Text1(1).BackColor = vbRed
End Select
End Sub


Private Sub PLMQuirksTextRefresh()
Dim TestingTextPath
Dim TextExists As Integer
Dim TempTextString As String

TestingTextPath = File1.Path & "\" & PLMList.List(PLMList.ListIndex) & ".txt"
Open TestingTextPath For Binary As #1
TextExists = LOF(1)
Close #1

'if doesn't exist, use blank text
If TextExists = 0 Then
    Kill TestingTextPath
    PLMQuirksText1.Text = "[NO TEXT FILE FOUND]"
Else
Open TestingTextPath For Input As #1
    TempTextString = Input(LOF(1), 1)
Close #1
    PLMQuirksText1.Text = TempTextString
    Close #1
End If
End Sub

Private Sub PLMQuirksCommand1_Click()
Dim TextPath
Dim TextExists As Integer
Dim TempTextString As String

TextPath = File1.Path & "\" & PLMList.List(PLMList.ListIndex) & ".txt"

Open TextPath For Binary As #1
    TextExists = LOF(1)
Close #1

'if doesn't exist, use blank text
If TextExists > 0 Then
    DD = MsgBox("This will overwrite the existing text file for this item.", vbOKCancel, "Overwrite entry?")
    If DD = vbCancel Then Exit Sub
End If

TempTextString = PLMQuirksText1.Text  'textbox into textstring
Open TextPath For Output As #1
    Print #1, TempTextString
Close #1
End Sub

