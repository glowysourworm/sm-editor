Attribute VB_Name = "UCommon"
Option Explicit
DefLng A-Z
'Public Declare Function GetDrawBlockData Lib "Msdll.dll" (ByVal BlockIndex As Long, ByRef TtableEntry() As Long, ByRef Ttable() As Byte, ByVal NumElementsInTtable As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal numbytes As Long)


Public Function MouseX(Optional ByVal hWnd As Long) As Long
    Dim lpPoint As POINTAPI
    GetCursorPos lpPoint
    If hWnd Then ScreenToClient hWnd, lpPoint
    MouseX = lpPoint.X
End Function

Public Function MouseY(Optional ByVal hWnd As Long) As Long
    Dim lpPoint As POINTAPI
    GetCursorPos lpPoint
    If hWnd Then ScreenToClient hWnd, lpPoint
    MouseY = lpPoint.Y
End Function


Public Function FileExists(filepath As String, Optional CreateMenusFolder As Boolean = False) As Boolean
Dim TestFileSize As Long

If CreateMenusFolder = True Then GoTo CreateMenusFolderIfNeeded

CheckOnFile:
If filepath = "" Then FileExists = False: Exit Function
On Error GoTo ErrorFileExists
'linux fix... wine crashes if no file
If filepath = ".bin" Then Exit Function

Open filepath For Binary As #78
    TestFileSize = LOF(78)
Close #78
If TestFileSize = 0 Then
    Kill filepath
    FileExists = False
Else
    FileExists = True
End If
Exit Function

CreateMenusFolderIfNeeded:
On Error GoTo ErrorMakingMenusFolder
MkDir App.Path & "\files\menus\"
GoTo CheckOnFile

ErrorMakingMenusFolder:
If Err.Number = 75 Then Err.Clear: GoTo CheckOnFile
MsgBox "Oh noes!" & vbCrLf & vbCrLf & "Error " & Err.Number & " has set you up the bomb!" & vbCrLf & "It says '" & Err.Description & "' but I know the truth." & vbCrLf & "The truth is out there!", vbCritical, "Make your time!"
Err.Clear
Exit Function

ErrorFileExists:
MsgBox "Error #" & Err.Number & " in FileExists." & vbCrLf & vbCrLf & "Not sure if all is well.", vbOKOnly
Err.Clear
End Function


Public Sub KillFile(filepath As String)
'open, then close, to make sure it exists
'Linux fix
On Error GoTo ErrorKillFile
If filepath = ".bin" Then Exit Sub
'original coding (leave in, because a non-existing file may not be simply a non-named file
Open filepath For Binary As #78
Close #78
'now it's safe to kill, even if it hadn't existed before
Kill filepath
Exit Sub

ErrorKillFile:
MsgBox "Error #" & Err.Number & " in KillFile." & vbCrLf & vbCrLf & "Most likely, all is well.", vbOKOnly
Err.Clear
End Sub


Public Sub MoveOriginalFile(FileName As String)
Dim DPath As String
Dim OPath As String

DPath = App.Path & "\files\"
OPath = App.Path & "\files\Originals\"

FileCopy OPath & FileName, DPath & FileName
End Sub


Public Sub CombineArrays(Array1() As Byte, Array2() As Byte, Array1Len, Array2Len, Array1Pos, Array2Pos, OutputArray() As Byte)
Dim InputArray() As Byte
Dim Counter1, Counter2
Dim NewArrayTotalSize

NewArrayTotalSize = Array2Pos + Array2Len
ReDim InputArray(0 To (NewArrayTotalSize - 1))

If Array1Len > 0 Then CopyMemory InputArray(Array1Pos), Array1(0), Array1Len
If Array2Len > 0 Then CopyMemory InputArray(Array2Pos), Array2(0), Array2Len

TrimArray InputArray, NewArrayTotalSize, OutputArray
End Sub



Public Function ShowCommonDialog$(DialogTitle$, Save As Boolean)
Dim CommonDialog As New OpenSave

With CommonDialog
  .CancelError = False
  .DialogTitle = DialogTitle
  .Flags = OFN_HIDEREADONLY
  .InitDir = App.Path
  .Filter = "SNES|*.smc"
End With

' Filters that the user can select in drowpdown combo
' Usage: Friendlyname1|*.ex1|Freindlyname2|*.ex2 etc.
' Default: "All Files (*.*)|*.*"

If Save = True Then
  CommonDialog.ShowSave
Else
  CommonDialog.ShowOpen
End If

ShowCommonDialog = CommonDialog.FileName

End Function

' @@@@@@@@@@@@@@@@@@@@@@@@@
' String and File Functions
' @@@@@@@@@@@@@@@@@@@@@@@@@

Public Function PadString$(Text$, LengthToBecome)

Dim Length As Long
Dim TempString As String

Length = Len(Text)

While Length < LengthToBecome
  TempString = TempString & "0"
  Length = Length + 1
Wend

PadString = TempString & Text

End Function

Public Function AddAppPath$(RelativePath$)

If Right(App.Path, 1) = "\" Then
  AddAppPath = App.Path & RelativePath
Else
  AddAppPath = App.Path & "\" & RelativePath
End If

End Function

Public Sub AddTextfileLinesToListbox(FileName$, TheBox As ListBox)

Dim WorkingArray$(512)
Dim Counter

Open FileName For Input As #1
While Not EOF(1)
  Line Input #1, WorkingArray(Counter)
  TheBox.AddItem WorkingArray(Counter)
  Counter = Counter + 1
Wend
Close #1

End Sub

' @@@@@@@@@@@@@@@@@@@@@
' Array Functions
' @@@@@@@@@@@@@@@@@@@@@

Public Sub TrimArray(InputArray() As Byte, LengthToKeep, OutputArray() As Byte)

Dim Counter
If LengthToKeep > 0 Then ReDim OutputArray(LengthToKeep - 1)

While Counter < LengthToKeep
  OutputArray(Counter) = InputArray(Counter)
  Counter = Counter + 1
Wend

End Sub

Public Sub CopyArrays(Array1() As Byte, Array2() As Byte, Array1Len, Array2Len, Array1Pos, Array2Pos, OutputArray() As Byte)

Dim InputArray(65536) As Byte
Dim Counter1, Counter2

While Counter1 < Array1Len
  InputArray(Array1Pos + Counter1) = Array1(Counter1)
  Counter1 = Counter1 + 1
Wend

While Counter2 < Array2Len
  InputArray(Array2Pos + Counter2) = Array2(Counter2)
  Counter2 = Counter2 + 1
Wend

TrimArray InputArray, Array2Pos + Array2Len, OutputArray

End Sub

Public Sub SaveByteArrayToFile(ByteArray() As Byte, SizeOfArray, FileName$)

Dim Counter

Open FileName For Binary As #1

While Counter < SizeOfArray
  Put #1, Counter + 1, ByteArray(Counter)
  Counter = Counter + 1
Wend

Close #1

End Sub


Public Function SnesToHex(SnesAddress$)
Dim Bank, Pointer, ReturnValue
Dim PointerS$

Bank = CLng(Val("&H" & Left$(SnesAddress, 2) & "&"))
PointerS = Right$(SnesAddress, 4)
Pointer = CLng(Val("&H" & PointerS & "&")) - &H8000&

While Bank > &H80&
  ReturnValue = ReturnValue + &H8000& ' 32768 d
  Bank = Bank - 1
Wend

ReturnValue = (ReturnValue + Pointer)
SnesToHex = ReturnValue
End Function


Public Sub LoadFileIntoByteArray(FileName$, ByteArray() As Byte)

Dim Counter, FileLength
FileLength = FileLen(FileName)
ReDim ByteArray(FileLength)

Open FileName For Binary As #1

While Counter < FileLength
  Get #1, Counter + 1, ByteArray(Counter)
  Counter = Counter + 1
Wend

Close #1

End Sub

' @@@@@@@@@@@@@@@@@@@@@@@
' Memory Functions
' @@@@@@@@@@@@@@@@@@@@@@@

' The more signficant bytes go later into the array,
' for example:

' Bytes(0) = 255
' Bytes(1) = 127
' Bytes(2) = 0
' Bytes(3) = 0
' Long will be 32767 or $7FFF

Public Function BytesToLong(TheArray() As Byte) As Long
  Dim TempLong As Long

  Call CopyMemory(TempLong, TheArray(LBound(TheArray)), 4)
  BytesToLong = TempLong

End Function

Public Sub LongToBytes(ByRef TheArray() As Byte, ByRef TheLong As Long)

  Call CopyMemory(TheArray(LBound(TheArray)), TheLong, 4)

End Sub




Public Sub CombineArraysCRE(Array1() As Byte, Array1Len, Array1Pos, OutputArray() As Byte)
Dim InputArray() As Byte
'Dim Counter1
'Dim NewArrayTotalSize

ReDim InputArray(0 To (Array1Len - 1)) As Byte

CopyMemory InputArray(Array1Pos), Array1(0), Array1Len
TrimArray InputArray, Array1Len, OutputArray
End Sub

