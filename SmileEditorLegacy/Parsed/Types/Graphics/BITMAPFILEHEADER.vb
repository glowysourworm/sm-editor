'file header, total 14 bytes
Public Type BITMAPFILEHEADER
     FileType As String * 2 ' file type always 4D42h or "BM"
     FileSize As Long       'size in bytes usually 0 for uncompressed
     Reserved1 As Integer   ' always 0
     Reserved2 As Integer   ' always 0
     BitmapOffset As Long   'starting position of image data in bytes
End Type