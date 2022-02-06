Public Sub DecompressTtable(GraphicsSet, OutputArray() As Byte)
Dim CRETtable() As Byte, VarTtable() As Byte
Dim SizeOfCRETtable, SizeOfVarTtable
Dim GraphicsSetPointers()
Dim ArrayIndex

ReadGraphicsSetPointers GraphicsSetPointers

If GraphicsSet > 29 Then GraphicsSet = 29
ArrayIndex = (GraphicsSet * 3) - 2
Decompress CRETTableOffset + ROM_HEADER, CRETtable
URETTableOffset = GraphicsSetPointers(ArrayIndex)
Decompress URETTableOffset + ROM_HEADER, VarTtable
'for tile table editing'
Decompress CRETTableOffset + ROM_HEADER, CRETileTableBytes
Decompress URETTableOffset + ROM_HEADER, URETileTableBytes
''''''''''''''''''''''''

SizeOfCRETtable = GetSizeOfDecompData(CRETTableOffset + ROM_HEADER)
SizeOfVarTtable = GetSizeOfDecompData(URETTableOffset + ROM_HEADER)

' With tiletables, the common room element tiletable
' comes before the the variable tiletable.
CombineArrays CRETtable, VarTtable, SizeOfCRETtable, SizeOfVarTtable, &H0, SizeOfCRETtable, OutputArray

End Sub