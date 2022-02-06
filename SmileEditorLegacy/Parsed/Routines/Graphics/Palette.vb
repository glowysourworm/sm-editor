Public Sub DecompressPalette(GraphicsSet, OutputArray() As Byte)
Dim GraphicsSetPointers(), ArrayIndex

ReadGraphicsSetPointers GraphicsSetPointers
ArrayIndex = (GraphicsSet * 3)

Decompress GraphicsSetPointers(ArrayIndex) + ROM_HEADER, OutputArray


End Sub

Public Function RecompressPalette(InputArray() As Byte, OutputArray() As Byte) As Long
'recompress palette
'save in command sub
'returns size of recompressed data, so outputarray can be "fitted"
RecompressPalette = LunarRecompress(InputArray(0), OutputArray(0), UBound(InputArray) + 1, 65536, 4, 0)
'Lunar.LunarCloseFile
End Function