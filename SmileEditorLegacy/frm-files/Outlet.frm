VERSION 5.00
Begin VB.Form Outlet 
   Caption         =   "Outlet"
   ClientHeight    =   7095
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7065
   LinkTopic       =   "Form1"
   ScaleHeight     =   473
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   471
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   0
      Width           =   5295
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   3375
      Left            =   5040
      TabIndex        =   2
      Top             =   1320
      Width           =   255
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFC0&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   0
      TabIndex        =   1
      Top             =   4680
      Width           =   5295
      Begin VB.CommandButton Command1 
         Caption         =   "CANCEL"
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   4
         Top             =   480
         Width           =   5295
      End
      Begin VB.CommandButton Command1 
         Caption         =   "SAVE"
         Height          =   375
         Index           =   0
         Left            =   0
         TabIndex        =   3
         Top             =   120
         Width           =   5295
      End
   End
   Begin VB.Frame Frame2 
      Height          =   3375
      Left            =   0
      TabIndex        =   0
      Tag             =   "0"
      Top             =   1320
      Width           =   5055
      Begin VB.CheckBox Check1 
         Caption         =   "Check1"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Visible         =   0   'False
         Width           =   4815
      End
   End
End
Attribute VB_Name = "Outlet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type CheckSet
    Address As String
    Clean As String
    Checked As String
End Type

Private Type MaxCheck
    Caption As String
    SetCheck(0 To 3) As CheckSet
End Type


Private AllChecks() As MaxCheck


Private Sub Command1_Click(Index As Integer)
Dim TEMP_SPI_OFFSET As Long
Dim TEMP_SPI_BYTE() As Byte

'cancel
If Index = 1 Then Unload Me

'saving
Open needslash For Binary As #8
If Index = 0 Then
    If Check1.UBound > 0 Then
        For TempIndex = 1 To Check1.UBound
            For II = 0 To 3
                'offset for this entry in this checkbox
                TEMP_SPI_OFFSET = Val("&H" & AllChecks(TempIndex).SetCheck(II).Address & "&")
                If TEMP_SPI_OFFSET = 0 Then GoTo DoneII
                'assumed that clean/checked should have the same # of values
                ReDim Preserve TEMP_SPI_BYTE(0 To ((Len(AllChecks(TempIndex).SetCheck(II).Checked) \ 2) - 1)) As Byte
                'parse the clean/checked data so we can put it in the rom
                For KK = 0 To UBound(TEMP_SPI_BYTE)
                    If Check1(TempIndex).Value = vbChecked Then
                        TEMP_SPI_BYTE(KK) = Val("&H" & Mid$(AllChecks(TempIndex).SetCheck(II).Checked, 1 + (KK * 2), 2) & "&")
                    Else
                        TEMP_SPI_BYTE(KK) = Val("&H" & Mid$(AllChecks(TempIndex).SetCheck(II).Clean, 1 + (KK * 2), 2) & "&")
                    End If
                Next KK
                'MsgBox Hex$(TEMP_SPI_OFFSET)
                Put #8, TEMP_SPI_OFFSET + ROM_HEADER + 1, TEMP_SPI_BYTE()
DoneII:
            Next II
        Next TempIndex
    End If
End If
Close #8
Unload Me

End Sub

Private Sub Form_Load()
Dim tempCaption As String

VScroll1.Max = (Frame2.Height - VScroll1.Height) / 10
ReDim AllChecks(0 To 0) As MaxCheck

tempCaption = MY_SPI_HEADER.Title
RemoveTitleSpaces1:
If Right$(tempCaption, 1) = " " Then
    tempCaption = Left$(tempCaption, Len(tempCaption) - 1)
    GoTo RemoveTitleSpaces1
End If

tempCaption = tempCaption & " by " & MY_SPI_HEADER.Author & vbCrLf
tempCaption = tempCaption & "Version " & MY_SPI_HEADER.UserVersion & " (" & MY_SPI_HEADER.Date & ")" & vbCrLf & vbCrLf
tempCaption = tempCaption & MY_SPI_HEADER.Description

RemoveTitleSpaces2:
If Right$(tempCaption, 1) = " " Then
    tempCaption = Left$(tempCaption, Len(tempCaption) - 1)
    GoTo RemoveTitleSpaces2
End If

Text1.Text = tempCaption
LoadFields      'load the data
OpenAllCells    'store as cells

'read the data and interpret appropriately
For I = 0 To UBound(SPI_CellData)
    If SPI_CellData(I) = "" Then Exit For
    ReadCell Val(I)
Next I
End Sub

Private Sub VScroll1_Change()
Frame2.Move 0, VScroll1.Top - (VScroll1.Value * 10)
If Frame2.Top < VScroll1.Top - VScroll1.Height Then
    Frame2.Move 0, VScroll1.Top - VScroll1.Height
End If
End Sub




Private Sub LoadFields()
Dim OneCharacter As String * 1
Dim DataSize As Integer

SPI_FullString = ""
SPI_TempString = ""
Open PlugInPath For Binary As #6
    Get #6, 1, MY_SPI_HEADER    'redundant, but works... for future compatibility?
    DataSize = LOF(6) - &H200
    Do
        Get #6, , OneCharacter
        SPI_FullString = SPI_FullString & OneCharacter
    Loop Until EOF(6)
Close #6
End Sub


Private Sub OpenAllCells()
Dim EndOfCell As Integer
Dim CaptionStart As Integer
Dim CaptionEnd As Integer
I = 0
Do
    EndOfCell = InStr(1, SPI_FullString, "EndCell") + 6
    If EndOfCell = 6 Then Exit Sub
    SPI_TempString = Left$(SPI_FullString, EndOfCell)
    SPI_FullString = Right$(SPI_FullString, Len(SPI_FullString) - EndOfCell)
    
    SPI_CellData(I) = SPI_TempString
    CaptionStart = InStr(1, SPI_TempString, "Caption=") + 8
    CaptionEnd = InStr(CaptionStart, SPI_TempString, vbCrLf)
    'CellMarker1 is apparently nowhere to be found in the program
    'CellMarker1(I).Caption = Mid$(SPI_TempString, CaptionStart, CaptionEnd - CaptionStart)
    I = I + 1
Loop Until Len(SPI_FullString) = 0
End Sub


Private Sub ParseAutomated(ByVal WhichCell As Integer)
Dim DoSpaces As Boolean
Dim TempIndex As Integer
Dim SPI_Offset As Long
Dim SPI_Byte As Byte

'set up the next checkbox
TempIndex = Check1.UBound + 1
Load Check1(TempIndex)
Check1(TempIndex).Visible = True
Frame2.Tag = Frame2.Tag + Check1(TempIndex).Height
Check1(TempIndex).Top = Frame2.Tag

'remove the non-user data
SPI_TempString = Replace(SPI_TempString, "StartCell=Automated" & vbCrLf, "")
SPI_TempString = Replace(SPI_TempString, "EndCell", "")

'connect data to the checkbox
Check1(TempIndex).Caption = SPI_GrabData(False)     'caption of checkbox
Check1(TempIndex).Tag = WhichCell                   'depth into plugin

'remember data for open/save
ReDim Preserve AllChecks(0 To TempIndex) As MaxCheck
AllChecks(TempIndex).Caption = Check1(TempIndex).Caption
For II = 0 To 3
    AllChecks(TempIndex).SetCheck(II).Address = SPI_GrabData(False)
    AllChecks(TempIndex).SetCheck(II).Clean = SPI_GrabData(False)
    AllChecks(TempIndex).SetCheck(II).Checked = SPI_GrabData(False)
Next II
'checkbox only checks first byte to tell whether this is clean or checked
Open needslash For Binary As #6
    Get #6, Val("&H" & AllChecks(TempIndex).SetCheck(0).Address & "&") + ROM_HEADER + 1, SPI_Byte
Close #6
'check the checkbox, if not the original value
If SPI_Byte <> Val("&H" & Left$(AllChecks(TempIndex).SetCheck(0).Clean, 2)) Then Check1(TempIndex).Value = vbChecked

'fill the rest of the fields
'For I = 0 To Text2.ubound
'    If Len(TempString) = 0 Then Exit For
'    If Text2(I).Tag = 1 Then DoSpaces = True Else DoSpaces = False
'    Text2(I).Text = GrabData(DoSpaces)
'Next I
End Sub


Private Sub ParseText2()
'Dim DoSpaces As Boolean
''focus on the correct frame
'HScroll1.Value = 2
''remove the non-user data
'TempString = Replace(TempString, "StartCell=Text2" & vbCrLf, "")
'TempString = Replace(TempString, "EndCell", "")
''clear all fields
'For I = 0 To Text3.ubound
'    Text3(I).Text = ""
'Next I
''fill the rest of the fields
'For I = 0 To Text3.ubound
'    If Len(TempString) = 0 Then Exit For
'    If Text3(I).Tag = 1 Then DoSpaces = True Else DoSpaces = False
'    Text3(I).Text = GrabData(DoSpaces)
'Next I
End Sub



Private Sub ParseText4()
'Dim DoSpaces As Boolean
''focus on the correct frame
'HScroll1.Value = 3
''remove the non-user data
'TempString = Replace(TempString, "StartCell=Text4" & vbCrLf, "")
'TempString = Replace(TempString, "EndCell", "")
''clear all fields
'For I = 0 To Text4.ubound
'    Text4(I).Text = ""
'Next I
''fill the rest of the fields
'For I = 0 To Text4.ubound
'    If Len(TempString) = 0 Then Exit For
'    If Text4(I).Tag = 1 Then DoSpaces = True Else DoSpaces = False
'    Text4(I).Text = GrabData(DoSpaces)
'Next I
End Sub



Private Sub ReadCell(CellIndex As Integer)
SPI_TempString = SPI_CellData(CellIndex)
If SPI_TempString = "" Then Exit Sub
If Left$(SPI_TempString, 19) = "StartCell=Automated" Then ParseAutomated CellIndex   'check boxes
If Left$(SPI_TempString, 15) = "StartCell=Text2" Then ParseText2 CellIndex            '2 byte hex
'If Left$(SPI_TempString, 15) = "StartCell=Text4" Then ParseText4            '4 byte hex
End Sub


Private Function SPI_GrabData(AddSpaces As Boolean) As String
Dim EStart As Integer
Dim VStart As Integer
Dim TempGrab As String

EStart = InStr(1, SPI_TempString, "=") + 1
VStart = InStr(EStart, SPI_TempString, vbCrLf)
If VStart < EStart Then Exit Function
SPI_GrabData = Mid$(SPI_TempString, EStart, Val(VStart - EStart))
SPI_TempString = Right$(SPI_TempString, Len(SPI_TempString) - VStart - 1)
'If AddSpaces = True Then
'    TempGrab = GrabData
'    If Len(TempGrab) Mod 2 <> 0 Then TempGrab = TempGrab & "0"
'    GrabData = ""
'    Do
'        GrabData = GrabData & Left$(TempGrab, 2) & " "
'        TempGrab = Right$(TempGrab, Len(TempGrab) - 2)
'    Loop Until Len(TempGrab) = 0
'    If Right$(GrabData, 1) = " " Then GrabData = Left$(GrabData, Len(GrabData) - 1)
'End If
End Function

