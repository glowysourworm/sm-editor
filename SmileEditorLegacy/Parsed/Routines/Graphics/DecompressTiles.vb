Public Sub DecompressTiles(GraphicsSet, OutputArray() As Byte)
Dim CRETiles() As Byte
Dim VarTiles() As Byte
Dim SizeOfCRETiles, SizeOfVarTiles
Dim GraphicsSetPointers()
Dim ArrayIndex
Dim TempVarPath As String   'path to temp var file used for editing special ceres/kraid graphics

ReadGraphicsSetPointers GraphicsSetPointers
ArrayIndex = (GraphicsSet * 3) - 1

'&H203004 for ceres tiles
Decompress CRETilesOffset + ROM_HEADER, CRETiles
Decompress GraphicsSetPointers(ArrayIndex) + ROM_HEADER, VarTiles
TempVarPath = App.Path & "\files\temp\var.bin"
'kill file... ensures data file is never larger than the data we pull
KillFile TempVarPath

'create temp var file
Open TempVarPath For Binary As #9
Put #9, 1, VarTiles()
Close #9

SizeOfCRETiles = GetSizeOfDecompData(CRETilesOffset + ROM_HEADER)
SizeOfVarTiles = GetSizeOfDecompData(GraphicsSetPointers(ArrayIndex) + ROM_HEADER)
'Smile.Tag = CStr(((SizeOfCRETiles + &H5000&) / 32))
Smile.Tag = CStr(((SizeOfCRETiles + &H6000&) / 32))
                                            '  was &H6000&
' With tiles, the variable tiles go before the common
' room element tiles.

'ReDim OutputArray(0 To (SizeOfVarTiles - 1))
'CopyMemory OutputArray(0), VarTiles(0), SizeOfVarTiles
Select Case GraphicsSet
    Case 27: CombineArrays VarTiles, CRETiles, SizeOfVarTiles, SizeOfCRETiles, &H0, &H8000&, OutputArray
    Case Else: CombineArrays VarTiles, CRETiles, SizeOfVarTiles, SizeOfCRETiles, &H0, &H5000&, OutputArray
End Select
End Sub