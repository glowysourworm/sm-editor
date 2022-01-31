Attribute VB_Name = "LunarMod"
'compression formats
Public Const LC_LZ1 As Long = 0
Public Const LC_LZ2 As Long = 1
Public Const LC_LZ3 As Long = 2
Public Const LC_LZ4 As Long = 3
Public Const LC_LZ5 As Long = 4
Public Const LC_LZ6 As Long = 5
Public Const LC_LZ7 As Long = 6
Public Const LC_LZ8 As Long = 7
Public Const LC_LZ9 As Long = 8
Public Const LC_LZ10 As Long = 9
Public Const LC_LZ11 As Long = 10
Public Const LC_LZ12 As Long = 11
Public Const LC_LZ13 As Long = 12
Public Const LC_RLE1 As Long = 100
Public Const LC_RLE2 As Long = 101
Public Const LC_RLE3 As Long = 102

'file flags
Public Const LC_READONLY As Long = 0
Public Const LC_READWRITE As Long = 1
Public Const LC_CREATEREADWRITE As Long = 2
Public Const LC_NOSEEK As Long = 0
Public Const LC_SEEK As Long = 1

'address flags
Public Const LC_NOBANK As Long = 0
Public Const LC_LOROM As Long = 1 'LoROM
Public Const LC_HIROM As Long = 2 'HiROM
Public Const LC_EXROM As Long = 4 'Extended HiROM
Public Const LC_NOHEADER As Long = 0
Public Const LC_HEADER As Long = 1

'graphics formats
Public Const LC_1BPP As Long = 1
Public Const LC_2BPP As Long = 2
Public Const LC_3BPP As Long = 3
Public Const LC_4BPP As Long = 4
Public Const LC_5BPP As Long = 5
Public Const LC_6BPP As Long = 6
Public Const LC_7BPP As Long = 7
Public Const LC_8BPP As Long = 8

'flags for LunarRender8x8
Public Const LC_INVERT_TRANSPARENT As Long = &H1&
Public Const LC_INVERT_OPAQUE As Long = &H2&
Public Const LC_INVERT As Long = (LC_INVERT_TRANSPARENT Or LC_INVERT_OPAQUE)
Public Const LC_RED_TRANSPARENT As Long = &H4&
Public Const LC_RED_OPAQUE As Long = &H8&
Public Const LC_RED As Long = (LC_RED_TRANSPARENT Or LC_RED_OPAQUE)
Public Const LC_GREEN_TRANSPARENT As Long = &H10&
Public Const LC_GREEN_OPAQUE As Long = &H20&
Public Const LC_GREEN As Long = (LC_GREEN_TRANSPARENT Or LC_GREEN_OPAQUE)
Public Const LC_BLUE_TRANSPARENT As Long = &H40&
Public Const LC_BLUE_OPAQUE As Long = &H80&
Public Const LC_BLUE As Long = (LC_BLUE_TRANSPARENT Or LC_BLUE_OPAQUE)
Public Const LC_TRANSLUCENT As Long = &H100&
Public Const LC_HALF_COLOR As Long = &H200& 'half-color mode
Public Const LC_SCREEN_ADD As Long = &H400& 'sub-screen addition
Public Const LC_SCREEN_SUB As Long = &H800& 'sub-screen subtraction
Public Const LC_PRIORITY_0 As Long = &H1000&
Public Const LC_PRIORITY_1 As Long = &H2000&
Public Const LC_PRIORITY_2 As Long = &H4000&
Public Const LC_PRIORITY_3 As Long = &H8000&
Public Const LC_DRAW As Long = (LC_PRIORITY_0 Or LC_PRIORITY_1 Or LC_PRIORITY_2 Or LC_PRIORITY_3)
Public Const LC_OPAQUE As Long = &H10000
Public Const LC_SPRITE As Long = &H20000
Public Const LC_SPRITE_TRANSLUCENT As Long = &H40000
Public Const LC_2BPP_GFX As Long = &H80000
Public Const LC_TILE_16 As Long = &H100000
Public Const LC_TILE_32 As Long = &H200000
Public Const LC_TILE_64 As Long = &H400000

'flags for RAT-related functions
Public Const RATF_FORMAT As Long = &HFF& 'bits reserved to specify LC compressed format (DO NOT USE THIS VALUE AS A FLAG!)
Public Const RATF_LOROM As Long = &H100& 'use LoROM banks
Public Const RATF_HIROM As Long = &H200& 'use HiROM banks
Public Const RATF_EXROM As Long = &H400& 'use ExROM banks (same as HiROM)
Public Const RATF_COMPRESSED As Long = &H800& 'data to erase is compressed; can decompress to get size using LC format specified
Public Const RATF_NOERASERAT As Long = &H1000& 'don't erase RAT tag
Public Const RATF_NOWRITERAT As Long = &H2000& 'don't write RAT tag
Public Const RATF_NOERASEDATA As Long = &H4000& 'don't erase user data
Public Const RATF_NOWRITEDATA As Long = &H8000& 'don't write user data

' Lunar Functions
Public Declare Function LunarCloseFile Lib "Lunar Compress.dll" () As Long
Public Declare Function LunarOpenFile Lib "Lunar Compress.dll" (ByVal FileName As String, ByVal FileMode As Long) As Long
Public Declare Function LunarDecompress Lib "Lunar Compress.dll" (Destination As Byte, ByVal AddressToStart As Long, ByVal MaxDataSize As Long, ByVal Format As Long, ByVal Format2 As Long, LastROMPosition As Long) As Long
Public Declare Function LunarRecompress Lib "Lunar Compress.dll" (Source As Byte, Destination As Byte, ByVal DataSize As Long, ByVal MaxDataSize As Long, ByVal Format As Long, ByVal Format2 As Long) As Long
Public Declare Function LunarCreatePixelMap Lib "Lunar Compress.dll" (Source As Byte, Destination As Byte, ByVal NumTiles As Long, ByVal GFXType As Long) As Long
Public Declare Function LunarSNEStoPCRGB Lib "Lunar Compress.dll" (ByVal SNESColor As Long) As Long

Public Declare Function LunarVersion Lib "Lunar Compress.dll" () As Long
Public Declare Function LunarGetFileSize Lib "Lunar Compress.dll" () As Long
Public Declare Function LunarReadFile Lib "Lunar Compress.dll" (Destination As Byte, ByVal Size As Long, ByVal Address As Long, ByVal SeekPos As Long) As Long
Public Declare Function LunarWriteFile Lib "Lunar Compress.dll" (Source As Byte, ByVal Size As Long, ByVal Address As Long, ByVal SeekPos As Long) As Long
Public Declare Function LunarPCtoSNES Lib "Lunar Compress.dll" (ByVal Pointer As Long, ByVal ROMType As Long, ByVal Header As Long) As Long
Public Declare Function LunarEraseArea Lib "Lunar Compress.dll" (ByVal Address As Long, ByVal Size As Long) As Long
Public Declare Function LunarExpandROM Lib "Lunar Compress.dll" (ByVal Mbits As Long) As Long
Public Declare Function LunarVerifyFreeSpace Lib "Lunar Compress.dll" (ByVal AddressStart As Long, ByVal AddressEnd As Long, ByVal Size As Long, ByVal BankType As Long) As Long
Public Declare Function LunarCreateBppMap Lib "Lunar Compress.dll" (Source As Byte, Destination As Byte, ByVal NumTiles As Long, ByVal GFXType As Long) As Long
Public Declare Function LunarSNEStoPC Lib "Lunar Compress.dll" (ByVal Pointer As Long, ByVal ROMType As Long, ByVal Header As Long) As Long
Public Declare Function LunarPCtoSNESRGB Lib "Lunar Compress.dll" (ByVal PcColor As Long) As Long
Public Declare Function LunarRender8x8 Lib "Lunar Compress.dll" (ByVal TheMapBits As Long, ByVal TheWidth As Long, ByVal TheHeight As Long, ByVal DisplayAtX As Long, ByVal DisplayAtY As Long, Pixelmap As Byte, PcPalette As Long, ByVal Map8Tile As Long, ByVal Extra As Long) As Long
Public Declare Function LunarWriteRatArea Lib "Lunar Compress.dll" (TheData As Byte, ByVal Size As Long, ByVal PreferredAddress As Long, ByVal MinRange As Long, ByVal MaxRange As Long, ByVal Flags As Long) As Long
Public Declare Function LunarEraseRatArea Lib "Lunar Compress.dll" (ByVal Address As Long, ByVal Size As Long, ByVal Flags As Long) As Long
Public Declare Function LunarGetRatAreaSize Lib "Lunar Compress.dll" (ByVal Address As Long, ByVal Flags As Long) As Long



Public Sub ConvertToPixels(ExtTiles As String, ExtPalette As String, ExtTable As String, ExtFinal As String)
Dim NumTiles As Integer
Dim OnePixel As Byte
'Dim PixelArray(40000) As Byte
Dim tsX As Byte 'tile sheet X
Dim tsY As Byte 'tile sheet Y
ReDim MyPixelMap(0 To (UBound(MyTileSet) * 2) + 3) As Byte
'ReDim MyPixelMap(0 To 40000) As Byte

NumTiles = (UBound(MyTileSet) \ 32) + 1

'make pixel map
LunarCreatePixelMap MyTileSet(0), MyPixelMap(0), NumTiles, 4

'show preview of picture map
'to be removed
tsX = 0
tsY = 0
ii = 1

For i = 1 To UBound(MyPixelMap)
OnePixel = MyPixelMap(i - 1)
Smile.TestTile1.PSet ((i Mod 8) + (tsX * 8), Int(ii) + (tsY * 8)), QBColor(OnePixel)


If i Mod 64 = 0 Then tsX = tsX + 1
If tsX > 15 Then tsX = 0: tsY = tsY + 1
ii = ii + 1 / 8
If ii = 9 Then ii = 1
Next i

End Sub


Public Sub DeCompress(Offset As Long, Ext As String, Optional What As String)
Dim Destination() As Byte
ReDim Destination(0 To 65536) As Byte
ReDim MyDecompress(0 To 65536) As Byte

LunarOpenFile needslash & ".smc", 1
DecompressedSize = LunarDecompress(MyDecompress(0), Offset + ROM_HEADER, 65536, 4, 0, 0)

If DecompressedSize = 0 Then Exit Sub
ReDim Preserve MyDecompress(0 To DecompressedSize - 1) As Byte

'If What = "MyTileSet" Then MyTileSet() = MyDecompress()
'If What = "MyPalette" Then MyPalette() = MyDecompress()
'If What = "MyTileTable" Then MyTileTable() = MyDecompress()

'MyTileSet() = MyDecompress()
'Open needslash & Ext For Binary As #1
'Close #1
'Kill needslash & Ext
'Open needslash & Ext For Binary As #1
'    Put #1, , MyDecompress()
'Close #1

LunarCloseFile
End Sub


Public Sub Recompress(Offset As Long, InputArray() As Byte)
'ALL UNTESTED > > > NEEDS TO BE REWRITTEN ANYWAY
Dim LunarArray() As Byte
ReDim LunarArray(0 To 65536) As Byte

LunarOpenFile needslash & ".smc", 1
ReCompressedSize = LunarRecompress(InputArray(0), LunarArray(0), UBound(InputArray) + 1, 65536, 4, 0)
If ReCompressedSize = 0 Then Exit Sub

ReDim Preserve LunarArray(0 To ReCompressedSize - 1) As Byte

Open needslash & ".smc" For Binary As #1
    Put #1, Offset + ROM_HEADER + 1, LunarArray()
Close #1

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
LunarOpenFile needslash & ".smc", 1

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
