Attribute VB_Name = "Lunar"
Option Explicit
DefLng A-Z

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

'ROM expansion flags
Public Const LC_48_EXHIROM As Long = 48
Public Const LC_48_EXHIROM_1 As Long = (&H100& Or 48)   ' Higher compatibility, but uses up to 1 meg of the new space.  Do not use this unless the ROM doesn't load or has problems with the other options.
Public Const LC_64_EXHIROM As Long = 64
Public Const LC_64_EXHIROM_1 As Long = (&H100& Or 64)   ' Higher compatibility, but uses up to 2 meg of the new space.  Do not use this unless the ROM doesn't load or has problems with the other options.
Public Const LC_48_EXLOROM_1 As Long = (&H1000& Or 48)  ' For LoROMs that use the 00:8000-6F:FFFF
Public Const LC_48_EXLOROM_2 As Long = (&H2000& Or 48)  ' For LoROMs that use the 80:8000-FF:FFFF map.
Public Const LC_48_EXLOROM_3 As Long = (&H4000& Or 48)  ' Higher compatibility, but uses up most of the new space.  Do not use this unless the ROM doesn't load or has problems with the other options.
Public Const LC_64_EXLOROM_1 As Long = (&H1000& Or 64)  ' For LoROMs that use the 00:8000-6F:FFFF
Public Const LC_64_EXLOROM_2 As Long = (&H2000& Or 64)  ' For LoROMs that use the 80:8000-FF:FFFF map.
Public Const LC_64_EXLOROM_3 As Long = (&H4000& Or 64)  ' Higher compatibility, but uses up most of the new space.  Do not use this unless the ROM doesn't load or has problems with the other options.

'file flags
Public Const LC_READONLY As Long = &H0&
Public Const LC_READWRITE As Long = &H1&
Public Const LC_CREATEREADWRITE As Long = &H2&
Public Const LC_LOCKARRAYSIZE As Long = &H4&
Public Const LC_LOCKARRAYSIZE_2 As Long = &H8&
Public Const LC_CREATEARRAY As Long = &H10&
Public Const LC_SAVEONCLOSE As Long = &H20&
Public Const LC_NOSEEK As Long = &H0&
Public Const LC_SEEK As Long = &H1&

'address flags
Public Const LC_NOBANK As Long = &H0&
Public Const LC_LOROM As Long = &H1&    'LoROM
Public Const LC_HIROM As Long = &H2&    'HiROM
Public Const LC_EXHIROM As Long = &H4&  'Extended HiROM
Public Const LC_EXLOROM As Long = &H8&  'Extended LoROM
Public Const LC_LOROM_2 As Long = &H10& 'LoROM, always converts to 80:8000 map
Public Const LC_EXROM As Long = &H4&    'same as LC_EXHIROM (depreciated)

Public Const LC_NOHEADER As Long = 0
Public Const LC_HEADER As Long = 1

'IPS function flags
Public Const LC_IPSLOG As Long = &H80000000
Public Const LC_IPSQUIET As Long = &H40000000

'graphics formats
Public Const LC_1BPP As Long = 1
Public Const LC_2BPP As Long = 2
Public Const LC_3BPP As Long = 3
Public Const LC_4BPP As Long = 4
Public Const LC_5BPP As Long = 5
Public Const LC_6BPP As Long = 6
Public Const LC_7BPP As Long = 7
Public Const LC_8BPP As Long = 8
Public Const LC_4BPP_GBA As Long = &H14&

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
Public Const RATF_EXLOROM As Long = &H10000 'NOT same as RATF_LOROM
Public Const RATF_EXHIROM As Long = &H400& 'NOT same as RATF_HIROM
Public Const RATF_EXROM As Long = &H400& 'same as RATF_EXHIROM (old)
Public Const RATF_COMPRESSED As Long = &H800& 'data to erase is compressed; can decompress to get size using LC format specified
Public Const RATF_NOERASERAT As Long = &H1000& 'don't erase RAT tag
Public Const RATF_NOWRITERAT As Long = &H2000& 'don't write RAT tag
Public Const RATF_NOERASEDATA As Long = &H4000& 'don't erase user data
Public Const RATF_NOWRITEDATA As Long = &H8000& 'don't write user data

' Lunar Functions
'Public Declare Function LunarVersion Lib "lunar compress.dll" () As Long
Public Declare Function LunarCloseFile Lib "lunar compress.dll" () As Long
Public Declare Function LunarOpenFile Lib "lunar compress.dll" (ByVal FileName As String, ByVal FileMode As Long) As Long
Public Declare Function LunarGetFileSize Lib "lunar compress.dll" () As Long
Public Declare Function LunarReadFile Lib "lunar compress.dll" (Destination As Byte, ByVal Size As Long, ByVal Address As Long, ByVal SeekPos As Long) As Long
Public Declare Function LunarWriteFile Lib "lunar compress.dll" (Source As Byte, ByVal Size As Long, ByVal Address As Long, ByVal SeekPos As Long) As Long
Public Declare Function LunarSNEStoPC Lib "lunar compress.dll" (ByVal Pointer As Long, ByVal ROMType As Long, ByVal Header As Long) As Long
Public Declare Function LunarPCtoSNES Lib "lunar compress.dll" (ByVal Pointer As Long, ByVal ROMType As Long, ByVal Header As Long) As Long
Public Declare Function LunarDecompress Lib "lunar compress.dll" (Destination As Byte, ByVal AddressToStart As Long, ByVal MaxDataSize As Long, ByVal Format As Long, ByVal Format2 As Long, LastROMPosition As Long) As Long
Public Declare Function LunarRecompress Lib "lunar compress.dll" (Source As Byte, Destination As Byte, ByVal DataSize As Long, ByVal MaxDataSize As Long, ByVal Format As Long, ByVal Format2 As Long) As Long
'Public Declare Function LunarEraseArea Lib "lunar compress.dll" (ByVal Address As Long, ByVal Size As Long) As Long
'Public Declare Function LunarExpandROM Lib "lunar compress.dll" (ByVal Mbits As Long) As Long
'Public Declare Function LunarVerifyFreeSpace Lib "lunar compress.dll" (ByVal AddressStart As Long, ByVal AddressEnd As Long, ByVal Size As Long, ByVal BankType As Long) As Long
Public Declare Function LunarCreatePixelMap Lib "lunar compress.dll" (Source As Byte, Destination As Byte, ByVal NumTiles As Long, ByVal GFXType As Long) As Long
'Public Declare Function LunarCreateBppMap Lib "lunar compress.dll" (Source As Byte, Destination As Byte, ByVal NumTiles As Long, ByVal GFXType As Long) As Long
Public Declare Function LunarSNEStoPCRGB Lib "lunar compress.dll" (ByVal SNESColor As Long) As Long
Public Declare Function LunarPCtoSNESRGB Lib "lunar compress.dll" (ByVal PcColor As Long) As Long
Public Declare Function LunarRender8x8 Lib "lunar compress.dll" (ByVal TheMapBits As Long, ByVal TheWidth As Long, ByVal TheHeight As Long, ByVal DisplayAtX As Long, ByVal DisplayAtY As Long, Pixelmap As Byte, PcPalette As Long, ByVal Map8Tile As Long, ByVal Extra As Long) As Long
'Public Declare Function LunarWriteRatArea Lib "lunar compress.dll" (TheData As Byte, ByVal Size As Long, ByVal PreferredAddress As Long, ByVal MinRange As Long, ByVal MaxRange As Long, ByVal Flags As Long) As Long
'Public Declare Function LunarEraseRatArea Lib "lunar compress.dll" (ByVal Address As Long, ByVal Size As Long, ByVal Flags As Long) As Long
'Public Declare Function LunarGetRatAreaSize Lib "lunar compress.dll" (ByVal Address As Long, ByVal Flags As Long) As Long
'Public Declare Function LunarOpenRAMFile Lib "lunar compress.dll" (Data As Any, ByVal FileMode As Long, ByVal Size As Long) As Long
'Public Declare Function LunarSaveRAMFile Lib "lunar compress.dll" (ByVal FileName As String) As Long
Public Declare Function LunarIPSCreate Lib "lunar compress.dll" (ByVal hWnd As Long, ByVal IPSFileName As String, ByVal ROMFileName As String, ByVal ROM2Filename As String, ByVal IPSFlags As Long) As Long
Public Declare Function LunarIPSApply Lib "lunar compress.dll" (ByVal hWnd As Long, ByVal IPSFileName As String, ByVal ROMFileName As String, ByVal IPSFlags As Long) As Long


' My User Defined Functions for Working With Lunar

Public Sub Decompress(AddressToStart, OutputArray() As Byte, Optional DecompressedSize = 0)

Dim Destination(65536) As Byte

DecompressedSize = LunarDecompress(Destination(0), AddressToStart, 65536, 4, 0, 0)
TrimArray Destination, DecompressedSize, OutputArray
End Sub

Public Function GetSizeOfDecompData(AddressToStart)

Dim Destination(0 To 1) As Byte
Dim DecompressedSize

DecompressedSize = LunarDecompress(Destination(0), AddressToStart, 2, 4, 0, 0)
GetSizeOfDecompData = DecompressedSize

End Function

Public Function GetSizeOfCompData(AddressToStart)

Dim Destination(0 To 1) As Byte
Dim DecompressedSize, CompressedSize, LastROMPosition

DecompressedSize = LunarDecompress(Destination(0), AddressToStart, 2, 4, 0, LastROMPosition)
CompressedSize = LastROMPosition - AddressToStart
GetSizeOfCompData = CompressedSize

End Function


Public Sub UnloadLunar()
LunarCloseFile
End Sub
