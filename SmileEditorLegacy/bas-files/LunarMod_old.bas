Attribute VB_Name = "LunarMod"
Public Sub DecompressOld(Offset As Long, Ext As String, Optional What As String)
Dim Destination() As Byte
Dim EndPosition1 As Long         'where the compressed data stopped being read (for kejardon)
Dim CompressedSize1 As Long      'for kejardon
Dim CompressedData1() As Byte    'for kejardon
Dim needslashkej As String       'for kejardon
ReDim Destination(0 To 65536) As Byte
ReDim MyDecompress(0 To 65536) As Byte
Dim KejChar As Byte

LunarOpenFile needslash, 1
DecompressedSize = LunarDecompress(MyDecompress(0), Offset + ROM_HEADER, 65536, 4, 0, EndPosition1)
'''''FOR KEJARDON'''''
If UCase$(Right$(App.EXEName, 1)) <> "K" Then GoTo NotKejardon
CompressedSize1 = EndPosition1 - (Offset + ROM_HEADER)
ReDim CompressedData1(0 To CompressedSize1 - 1) As Byte
needslashkej = Left$(needslash, Len(needslash) - 4) & ".kej"

'kill old file (if it's there) to ensure the only data in it is what we are about to put in it
KillFile needslashkej

Open needslash For Binary As #1
    Open needslashkej For Binary As #2
        Get #1, Offset + ROM_HEADER + 1, CompressedData1()
        Put #2, 1, CompressedData1()
    Close #2
Close #1
''''''''''''''''''''''
NotKejardon:
If DecompressedSize = 0 Then Exit Sub
ReDim Preserve MyDecompress(0 To DecompressedSize - 1) As Byte

'MyTileSet() = MyDecompress()
'kill to make sure we have ONLY the data we're putting in
KillFile needslash & Ext

Open needslash & Ext For Binary As #1
    Put #1, , MyDecompress()
Close #1

LunarCloseFile
End Sub



Public Sub RecompressOld(Offset As Long, InputArray() As Byte)
Dim Destination() As Byte
ReDim Destination(0 To 65536) As Byte
ReDim MyRecompress(0 To 65536) As Byte
Dim LunarArray() As Byte
ReDim LunarArray(0 To 65536) As Byte
Dim WarningString As String
Dim WarningTitle As String

LunarOpenFile needslash, 1
RecompressedSize = LunarRecompress(InputArray(0), LunarArray(0), UBound(InputArray) + 1, 65536, 4, 0)
'''''''''''check new vs old data size''''''''''''''''''''''
'NoCompressedSize = GetSizeOfCompData(Offset + ROM_HEADER)
'If RecompressedSize > NoCompressedSize Then
'    WarningString = "New data is larger than old." & vbCrLf & "Data from another room could be erased!" & vbCrLf & vbCrLf & "Save anyway? (no)" & vbCrLf & vbCrLf
'    WarningTitle = "Old = " & NoCompressedSize & " bytes / New = " & RecompressedSize & " bytes"
'    dd = MsgBox(WarningString, vbYesNo, WarningTitle)
'    If dd = vbNo Then GoTo NoSave
'End If
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

''''''''''find available space by nearest pointer'''''''''''''''
Dim dd6 As String * 6
Open App.Path & "\files\level_entries.txt" For Binary As #1
For I = 1 To LOF(1) Step 8
    Get #1, I, dd6
    If dd6 = Hex$(Offset) Then I = I + 8: Get #1, I, dd6: Exit For
Next I
Close #1
'last room
If Val("&H" & dd6 & "&") = 0 Then GoTo Saving
If RecompressedSize > Val("&H" & dd6 & "&") - Offset Then
    WarningString = "Room Space = " & Val("&H" & dd6 & "&") - Offset & " bytes" & vbCrLf
    WarningString = WarningString & "Used Space = " & RecompressedSize & " bytes" & vbCrLf & vbCrLf
    WarningString = WarningString & "Room is too large.  Data from other rooms could be overwritten!" & vbCrLf & "Save anyway? (Hint: No)"
    
    WarningTitle = "Watch out!"
    If needslash <> App.Path & "\files\temp\quickmet.smc" Then
        DD = MsgBox(WarningString, vbYesNo, WarningTitle)
        If DD = vbNo Then GoTo NoSave
    End If
End If
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

If RecompressedSize = 0 Then GoTo NoSave
Saving:
Smile.SMILECaption.Caption = RecompressedSize & " / " & Val("&H" & dd6 & "&") - Offset
ReDim Preserve LunarArray(0 To RecompressedSize - 1) As Byte
Open needslash For Binary As #1
    Put #1, Offset + ROM_HEADER + 1, LunarArray()
Close #1
NoSave:
LunarCloseFile
End Sub



Public Sub DecompressGraphics(TablePointer As ThreeByte, TilePointer As ThreeByte, PalettePointer As ThreeByte)
Dim TableOffset As Long
Dim TileOffset As Long
Dim PaletteOffset As Long
ReDim MyTileTable(0 To 65536) As Byte
ReDim MyTileSet(0 To 65536) As Byte
ReDim MyPalette(0 To 65536) As Byte

Dim TableSize As Long
Dim TileSize As Long    '18432 if accepted graphics... 32768 if 8bpp
Dim PaletteSize As Long

TableOffset = ThreePoint2Offset(TablePointer)
TileOffset = ThreePoint2Offset(TilePointer)
PaletteOffset = ThreePoint2Offset(PalettePointer)


'OPEN DLL ONLY ONCE
LunarOpenFile needslash, 1

'Decompress graphics, while checking for success
TableSize = LunarDecompress(MyTileTable(0), TableOffset + ROM_HEADER, 65536, 4, 0, 0)
TileSize = LunarDecompress(MyTileSet(0), TileOffset + ROM_HEADER, 65536, 4, 0, 0)
PaletteSize = LunarDecompress(MyPalette(0), PaletteOffset + ROM_HEADER, 65536, 4, 0, 0)

'size graphic arrays
If TableSize = 0 Then MsgBox "!": GoTo Closing
    ReDim Preserve MyTileTable(0 To TableSize - 1) As Byte
If TileSize = 0 Then MsgBox "!": GoTo Closing
    ReDim Preserve MyTileSet(0 To TileSize - 1) As Byte
If PaletteSize = 0 Then MsgBox "!": GoTo Closing
    ReDim Preserve MyPalette(0 To PaletteSize - 1) As Byte

'CLOSE DLL ONLY ONCE
Closing:
LunarCloseFile
End Sub
