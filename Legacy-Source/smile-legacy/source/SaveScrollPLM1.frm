VERSION 5.00
Begin VB.Form SaveScrollPLM1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Save Scroll PLM"
   ClientHeight    =   3810
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5820
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3810
   ScaleWidth      =   5820
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      BackColor       =   &H000000FF&
      Caption         =   "Cancel"
      Height          =   495
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   480
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H0000C000&
      Caption         =   "Save"
      Height          =   495
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   480
      Width           =   3855
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FF8080&
      Caption         =   "Have SMILE Find Blank Space For Me"
      Height          =   375
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   0
      Width           =   3855
   End
   Begin VB.TextBox ManualEntryText1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      MaxLength       =   4
      TabIndex        =   0
      Text            =   "8000"
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$8F:"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4440
      TabIndex        =   2
      Top             =   60
      Width           =   615
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   2655
      Left            =   0
      TabIndex        =   1
      Top             =   1080
      Width           =   5775
   End
End
Attribute VB_Name = "SaveScrollPLM1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private ScrollPLMSize As Integer


Private Sub Command1_Click()    'smile looks for free space
Dim tempSpot As Long            'where we are checking for free space
Dim tempDataArray() As Byte     'array the same size as our scroll data
Dim tempDataArrayDud() As Byte  'FF'ed out copy to compare tempDataArray to
Dim lSearch As Long             'lower bound of where we'll search
Dim uSearch As Long             'upper bound of where we'll search
Dim TempThree As ThreeByte

If ScrollPLMSize > 4 Then
    ReDim tempDataArray(0 To ScrollPLMSize + 2 - 1) As Byte 'the first 2 bytes will be left as FF FF, incase terminating other data
Else
    ReDim tempDataArray(0 To 6) As Byte                     'FF block must be at least 7 bytes long
End If

ReDim tempDataArrayDud(0 To UBound(tempDataArray)) As Byte
For tempSpot = 0 To UBound(tempDataArrayDud)
    tempDataArrayDud(tempSpot) = &HFF&
Next tempSpot

Open needslash For Binary As #1

'grab lower and upper bounds of where to search
TempThree.Byte1 = 0
TempThree.Byte2 = 0
TempThree.Byte3 = ScrollPLMBank
lSearch = ThreePoint2Offset(TempThree) + ROM_HEADER + 1
uSearch = ThreePoint2Offset(TempThree) + &H7FFF + ROM_HEADER - UBound(tempDataArray) + 1

For tempSpot = lSearch To uSearch
    Get #1, tempSpot + ROM_HEADER + 1, tempDataArray()
    For TempI = 0 To UBound(tempDataArray)
        If tempDataArray(TempI) <> tempDataArrayDud(TempI) Then GoTo NotBlankSpace
    Next TempI
BlankSpace:         'blank space found!
    GoTo SearchingForBlankSpaceDone
NotBlankSpace:      'haven't found blank space, so continue the loop
Next tempSpot

NoBlankSpaceFoundAndSearchIsDone:
MsgBox "SMILE was unable to find enough blank space in the bank.", vbOKOnly, "Oh well."
Exit Sub

SearchingForBlankSpaceDone:
Close #1

If Val("&H" & Right$("000000" & Hex$(tempSpot), 4) & "&") < &H8000& Then tempSpot = tempSpot + &H8000&
ManualEntryText1.Text = Right$("0000" & Hex$(tempSpot + 2), 4)

End Sub

Private Sub Command2_Click()    'save
Dim SavingOffset As Long
Dim TempThree As ThreeByte
Dim BankStart As Long
Dim DepthIntoBank As Long

If Val("&H" & ManualEntryText1.Text & "&") < &H8000& Then ManualEntryText1.Text = Right$("0000" & Hex$(Val("&H" & ManualEntryText1.Text & "&") + &H8000&), 4)

DD = MsgBox("About to write scroll changing data at $7" & ManualEntryText1.Text & "." & vbCrLf & "You need to document this offset, if you haven't already!" & vbCrLf & vbCrLf & "Are you sure?", vbYesNo, "Really save scroll changing data?")
If DD = vbNo Then Exit Sub
'save data
TempThree.Byte1 = 0
TempThree.Byte2 = 0
TempThree.Byte3 = ScrollPLMBank   '8F by default
BankStart = ThreePoint2Offset(TempThree)
DepthIntoBank = Val("&H" & ManualEntryText1.Text & "&") - &H8000&
SavingOffset = BankStart + DepthIntoBank

Open needslash For Binary As #1
    Put #1, SavingOffset + ROM_HEADER + 1, ScrollPLMBytes()
Close #1


DD = MsgBox("Reset scroll values of this room to their original values so you can continue editing the room?", vbYesNo, "Reset scroll values?")
If DD = vbYes Then
    ScrollArray = ScrollArrayCopy
    ShowScrollBoxes
End If
Unload Me
End Sub

Private Sub Command3_Click()    'cancel
DD = MsgBox("Reset scroll values of this room to their original values?", vbYesNo, "Reset scroll values?")
If DD = vbYes Then
    ScrollArray = ScrollArrayCopy
    ShowScrollBoxes
End If
Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Label2.Caption = "$" & Hex$(ScrollPLMBank)
ScrollPLMSize = UBound(ScrollPLMBytes) + 1
Label1.Caption = "All Scroll PLM's are stored in Bank $" & Hex$(ScrollPLMBank) & "($8F by default)." & vbCrLf & "Your scroll changing data is " & Right$("00" & Hex$(ScrollPLMSize), 2) & " bytes long." & vbCrLf & vbCrLf & "If you know what you're doing, you may manually enter in an offset to save your Scroll changes to. Make sure to account for your header, if your rom has one. Again, know what you're doing. SMILE doesn't care if you overwrite things!" & vbCrLf & vbCrLf & "If you trust SMILE, you can have SMILE locate a section of free space in the bank for you. SMILE will find a chunk of FF's in the bank. Usually, this is blank space. If you're planning on adding to certain sections of the ROM though, keep in mind that SMILE doesn't know your future plans."
End Sub

Private Sub Label2_Click()
MsgBox "Bank is changable in a hex editor at: $20B60" & vbCrLf & "Only do this if you know what you're doing."
End Sub


