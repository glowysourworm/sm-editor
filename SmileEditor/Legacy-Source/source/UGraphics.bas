Attribute VB_Name = "UGraphics"
Option Explicit
DefLng A-Z

Public Type OAM
    Tile As Long
    Palette As Integer
    Priority As Byte
    Horizontal As Byte
    Vertical As Byte
End Type

'file header, total 14 bytes
Public Type BITMAPFILEHEADER
     FileType As String * 2 ' file type always 4D42h or "BM"
     FileSize As Long       'size in bytes usually 0 for uncompressed
     Reserved1 As Integer   ' always 0
     Reserved2 As Integer   ' always 0
     BitmapOffset As Long   'starting position of image data in bytes
End Type

'image header, total 40 bytes
Public Type BitmapImageHeader
     Size As Long          'Size of this header
     Width As Long         'width of your image
     Height As Long        'height of your image
     Planes As Integer     'always 1
     BitCount As Integer   'number of bits per pixel 1, 4, 8, or 24
     Compression As Long   '0 data is not compressed
     SizeImage As Long     'size of bitmap in bytes, typically 0 when uncompressed
     XPelsPerMeter As Long 'preferred resolution in pixels per meter
     YPelsPerMeter As Long 'preferred resolution in pixels per meter
     ClrUsed As Long       'number of colors that are actually used (can be 0)
     ClrImportant As Long  'which color is most important (0 means all of them)
End Type

Public Type BitmapPalette
     Blue As Byte
     Green As Byte
     Red As Byte
     Reserved As Byte       'always zero
End Type

Public MyBitmapFileHeader As BITMAPFILEHEADER
Public MyBitmapImageHeader As BitmapImageHeader
Public MyBitMapPalette As BitmapPalette









' //////////////////////
' Graphics Functions
' //////////////////////

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


Public Function RecompressData(InputArray() As Byte, OutputArray() As Byte) As Long
'ReDim InputArray(0 To 0) As Byte

RecompressData = LunarRecompress(InputArray(0), OutputArray(0), UBound(InputArray) + 1, 65536, 4, 0)
End Function

Public Sub FourBppTilesToPixelMap(TileArray() As Byte, OutputArray() As Byte)
Dim Destination(80000) As Byte
Dim NumberOfTiles, SizeOfPixelmap, ReturnValue
NumberOfTiles = CLng(Val(Smile.Tag))
NumberOfTiles = 1024
SizeOfPixelmap = NumberOfTiles * 64

ReturnValue = LunarCreatePixelMap(TileArray(0), Destination(0), NumberOfTiles, LC_4BPP)
TrimArray Destination, SizeOfPixelmap, OutputArray

End Sub

Public Sub SnesPaletteToPcPalette(SnesPalette() As Byte, OutputArray())
Dim ByteCounter, IndexCounter, NumberOfColors
Dim Bytes(4) As Byte
Dim TempLong, PcColor

On Error GoTo NoPalette
NumberOfColors = (UBound(SnesPalette) + 1) \ 2
ReDim OutputArray(NumberOfColors)

Bytes(2) = 0
Bytes(3) = 0

While IndexCounter < NumberOfColors
  Bytes(0) = SnesPalette(ByteCounter)
  Bytes(1) = SnesPalette(ByteCounter + 1)
  
  TempLong = BytesToLong(Bytes)
  PcColor = LunarSNEStoPCRGB(TempLong)
  'normal color output * brightness factor
  If Mask = False Then
  'normal color output * brightness factor
    'OutputArray(IndexCounter) = PcColor * LightBulb    'CHECK THIS
    OutputArray(IndexCounter) = PcColor
  Else
  'masking
  OutputArray(IndexCounter) = RGB(255, 255, 255)
  End If
  
  ByteCounter = ByteCounter + 2
  IndexCounter = IndexCounter + 1
Wend
'MsgBox LightBulb

NoPalette:
If Err.Number = 9 Then Err.Number = 0
If Err.Number <> 0 Then MsgBox "Error #" & Err.Number & vbCrLf & Err.Description: Err.Number = 0
End Sub

' Assumes 29 graphics sets
Public Sub ReadGraphicsSetPointers(OutputArray())

' CurrentAddress in file we are reading from
Dim Address
' Array for storage of absolute/hex addresses pointed to
' in =P= Graphics Set Pointers
ReDim OutputArray(1 To 87)
' Temporary Bytes used to construct a 3-byte pointer
Dim TempBytes(0 To 8) As Byte
Dim Table1 As Byte
Dim Table2 As Byte
Dim Table3 As Byte
Dim Tile1 As Byte
Dim Tile2 As Byte
Dim Tile3 As Byte
Dim Palette1 As Byte
Dim Palette2 As Byte
Dim Palette3 As Byte
' Loop vars
Dim Counter
' Arguments to conversion functions
Dim TableString$, TileString$, PaletteString$
Dim ArrayIndex

Counter = 1

While Counter < 30
  Address = GetAddressOfGSP(Counter)
  LunarReadFile TempBytes(0), 9, Address, LC_SEEK
  
  Table1 = TempBytes(0)
  Table2 = TempBytes(1)
  Table3 = TempBytes(2)
  Tile1 = TempBytes(3)
  Tile2 = TempBytes(4)
  Tile3 = TempBytes(5)
  Palette1 = TempBytes(6)
  Palette2 = TempBytes(7)
  Palette3 = TempBytes(8)
  ' Bytes are in reverse order inside the rom, so
  ' when loaded in normal order they then have to be
  ' reversed.
  TableString = PadString(Hex(Table3), 2) & PadString(Hex(Table2), 2) & PadString(Hex(Table1), 2)
  TileString = PadString(Hex(Tile3), 2) & PadString(Hex(Tile2), 2) & PadString(Hex(Tile1), 2)
  PaletteString = PadString(Hex(Palette3), 2) & PadString(Hex(Palette2), 2) & PadString(Hex(Palette1), 2)

  ArrayIndex = (Counter * 3) - 2
  
  OutputArray(ArrayIndex) = SnesToHex(TableString)
  OutputArray(ArrayIndex + 1) = SnesToHex(TileString)
  OutputArray(ArrayIndex + 2) = SnesToHex(PaletteString)
  
  Counter = Counter + 1
Wend

End Sub

' Returns the hex address of the start of nine bytes of a
' graphics set pointer in =P= Graphics Set Pointers
Public Function GetAddressOfGSP(GraphicsSet)
' GraphicsSet = a number from 1-29

' Start of =P= Graphics Set Pointers
Dim Start
' Address to return
Dim Address

Start = &H7E6A2
Address = (Start) + ((GraphicsSet - 1) * 9)
GetAddressOfGSP = Address + ROM_HEADER

End Function



'ULTIMA
'draws the graphic sheets
Public Sub DrawTiles(GraphicsSet)
Dim TempRGB(0 To 2) As Byte
Dim TempLightBulb As Single   'simply because I don't feel like having to recode LightBulb again
Dim HowBright As Single   '0-.9 scale of how bright a color is. used to adjust TempLightBulb

Dim I As Byte
Dim II As Byte
'SPEED PROBLEM
Dim Tiles() As Byte
Dim Palette() As Byte
Dim TtableCounter, XCounter, YCounter, LineCounter
Dim III As Long
Dim NewTiles(0 To 65535) As Byte
SecTiles.Create 512, 512
DecompressTtable GraphicsSet, Ttable
KillFile App.Path & "\files\temp\ttable.bin"
Open App.Path & "\files\temp\ttable.bin" For Binary As #68
    Put #68, , Ttable
Close #68

DecompressTiles GraphicsSet, Tiles
DecompressPalette GraphicsSet, Palette

CERES_EXCEPTION:
'if CeresException, de-interlace graphics, then adjust pixelmap
'otherwise, just adjust pixelmap
If GraphicsSet > 17 And GraphicsSet < 22 Then
'THE EXCEPTION FIX DOESN'T WORK, SO WHY IS IT STILL HERE?!!
    FourBppTilesToPixelMap Tiles, Pixelmap  'added to fix 3 room start up bug
    'For III = 1 To 32767 Step 2
    '    NewTiles(III \ 2) = Tiles(III)
    'Next III
    
    'For III = 0 To 65535
    '    If III Mod 4 = 2 Then
    '        Pixelmap(III) = NewTiles(III \ 4)
    '    Else
    '        Pixelmap(III) = 0
    '    End If
    'Next III
'Pixelmap = NewTiles
Else
    FourBppTilesToPixelMap Tiles, Pixelmap
End If

'Change Palette
SnesPaletteToPcPalette Palette, PcPalette

Select Case LightBulb
    Case 1: GoTo LightAdjustmentsMade   'no change
    Case 2: TempLightBulb = 16
    Case 3: TempLightBulb = 10
End Select

For I = 0 To UBound(PcPalette)
    TempRGB(0) = (PcPalette(I) Mod 256)
    TempRGB(1) = ((PcPalette(I) \ 256) Mod 256)
    TempRGB(2) = (PcPalette(I) \ 65536)
    HowBright = ((Val(TempRGB(0)) + Val(TempRGB(1)) + Val(TempRGB(2))) / 765) + 0.01 '765, because it's 3 * 255... leads to a brightness scale of 0 to .9... + 0.01 to prevent 0
    For II = 0 To 2
        TempRGB(II) = TempRGB(II) + (255 - TempRGB(II)) / (TempLightBulb - HowBright)
    Next II
    PcPalette(I) = RGB(TempRGB(0), TempRGB(1), TempRGB(2))  'brightens
Next I

LightAdjustmentsMade:
While TtableCounter < &H400&
  If LineCounter > 31 Then 'if 32 blocks have been drawn across
    XCounter = 0
    YCounter = YCounter + 1
    LineCounter = 0
  End If
  Draw_Block SecTiles, TtableCounter, XCounter, YCounter
  TtableCounter = TtableCounter + 1
  XCounter = XCounter + 1
  LineCounter = LineCounter + 1
Wend
SecTiles.VFlip
End Sub


'draw a single block
Public Sub Draw_Block(InSection As cDIBSection, BlockIndex, TileX, TileY)
Dim PixelX, PixelY
Dim X, Y, Counter
Dim TtableEntry(0 To 3)

PixelX = TileX * 16
PixelY = TileY * 16


GetDrawBlockData BlockIndex, TtableEntry(), Ttable(), UBound(Ttable) - 1

'4 quarters drawn for 16x16 tile
For Y = 0 To 1
  For X = 0 To 1
    LunarRender8x8 InSection.DIBSectionBitsPtr, InSection.Width, InSection.Height, PixelX + (X * 8), PixelY + (Y * 8), Pixelmap(0), PcPalette(0), TtableEntry(Counter), LC_DRAW
    Counter = Counter + 1
  Next X
Next Y
End Sub


Public Sub RenderItNow(GraphicsSet As Integer)
'SPEED PROBLEM!!!
'graphicsset actually is graphicsset + 1
'draw graphics and mask
If Mask = False Then
    'If GraphicsSet >= 16 And GraphicsSet <= 21 Then
    If RoomHeader1.RegionCombo1.Text = "CERES" And Val("&H" & RoomHeader1.Unknown4Text1) <> 6 Then
    Smile.MenuPicture1.Cls
    Smile.PictureScroll1.Max = 2 * 8
        SecTiles.Render Smile.MenuPicture1.hdc, 0, -128
    Else
        Smile.PictureScroll1.Max = 3 * 8
        SecTiles.Render Smile.MenuPicture1.hdc
    End If
Else
    'If GraphicsSet >= 16 And GraphicsSet <= 21 Then
    If RoomHeader1.RegionCombo1.Text = "CERES" And Val("&H" & RoomHeader1.Unknown4Text1) <> 6 Then
        SecTiles.Render Smile.MenuPictureMask1.hdc, 0, -128
    Else
        SecTiles.Render Smile.MenuPictureMask1.hdc
    End If
End If

End Sub




Public Function FlipRGB(CurrentColor As Long) As Long
RR = (CurrentColor Mod 256)
GG = ((CurrentColor \ 256) Mod 256)
BB = (CurrentColor \ 65536)

FlipRGB = RGB(BB, GG, RR)

End Function




Public Function PcPaletteToSnesPalette(PcColor As Long) As Long 'Integer
'convert a single PC color into a SNES color
PcPaletteToSnesPalette = LunarPCtoSNESRGB(PcColor)
End Function



Public Function GetPaletteOffset(GraphicSheet As Long) As Long
'figures where the pointer is, then the offset pointed to
Dim TempThree As ThreeByte
GetPaletteOffset = GetAddressOfGSP(GraphicSheet) - ROM_HEADER

Open needslash For Binary As #6
    '+6 because palette is 3rd pointer in graphic data
    Get #6, GetPaletteOffset + ROM_HEADER + 6 + 1, TempThree
Close #6

'set function to offset value
GetPaletteOffset = ThreePoint2Offset(TempThree)
End Function


Public Function GetTTableOffset(GraphicSheet As Long) As Long
'figures where the pointer is, then the offset pointed to
Dim TempThree As ThreeByte
GetTTableOffset = GetAddressOfGSP(GraphicSheet) - ROM_HEADER

Open needslash For Binary As #6
    '+0 because palette is 1st pointer in graphic data
    Get #6, GetTTableOffset + ROM_HEADER + 0 + 1, TempThree
Close #6

'set function to offset value
GetTTableOffset = ThreePoint2Offset(TempThree)
End Function

Public Sub MakeOne8x8(TileOffset As Long, ControlHDC As Long, TileX As Integer, TileY As Integer)
'*get bytes from offset
'conversion
'draw on control at X,Y
'MsgBox ControlName
Dim BytesFromOffset(0 To 32) As Byte    'values ripped from rom
Dim PixelValue(0 To 63) As Byte 'store value of a single pixel
Dim TempBitArray1(0 To 7) As Byte   'temp values representing bits (used to figure ToBin)
Dim TempBitArray2(0 To 7) As Byte   'temp values representing bits (used to figure ToBin)
Dim TempPixel1(0 To 7) As Byte   'temp bit values for pixel, so we can figure out the pixel's value
Dim TempPixel2(0 To 7) As Byte   'temp bit values for pixel following the current one, so we can figure out the pixel's value
Dim TempPixel3(0 To 7) As Byte   'temp bit values for pixel following the current one, so we can figure out the pixel's value
Dim TempPixel4(0 To 7) As Byte   'temp bit values for pixel following the current one, so we can figure out the pixel's value
Dim CurrentPixel As Byte    'which pixel we are figuring




Open needslash For Binary As #1
    Get #1, TileOffset + 1, BytesFromOffset()
Close #1

'these value are always 0, so we set them now, so to avoid having this happen with each loop
TempPixel1(0) = 0: TempPixel1(1) = 0: TempPixel1(2) = 0: TempPixel1(3) = 0
TempPixel2(0) = 0: TempPixel2(1) = 0: TempPixel2(2) = 0: TempPixel2(3) = 0
TempPixel3(0) = 0: TempPixel3(1) = 0: TempPixel3(2) = 0: TempPixel3(3) = 0
TempPixel4(0) = 0: TempPixel4(1) = 0: TempPixel4(2) = 0: TempPixel4(3) = 0

'XXXXXXgood
For CurrentPixel = 0 To 63 Step 4
'current pixel
'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
ToBin BytesFromOffset(CurrentPixel \ 2), TempBitArray1(0)
ToBin BytesFromOffset((CurrentPixel \ 2) + 2), TempBitArray2(0)

'may need to reverse these??????
TempPixel1(4) = TempBitArray1(0): TempPixel1(5) = TempBitArray1(1): TempPixel1(6) = TempBitArray2(0): TempPixel1(7) = TempBitArray2(1)
TempPixel2(4) = TempBitArray1(2): TempPixel2(5) = TempBitArray1(3): TempPixel2(6) = TempBitArray2(2): TempPixel2(7) = TempBitArray2(3)
TempPixel3(4) = TempBitArray1(4): TempPixel3(5) = TempBitArray1(5): TempPixel3(6) = TempBitArray2(3): TempPixel3(7) = TempBitArray2(5)
TempPixel4(4) = TempBitArray1(6): TempPixel4(5) = TempBitArray1(7): TempPixel4(6) = TempBitArray2(4): TempPixel4(7) = TempBitArray2(7)
'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
TempPixel1(7) = TempBitArray1(0): TempPixel1(6) = TempBitArray1(1): TempPixel1(5) = TempBitArray2(0): TempPixel1(4) = TempBitArray2(1)
TempPixel2(7) = TempBitArray1(2): TempPixel2(6) = TempBitArray1(3): TempPixel2(5) = TempBitArray2(2): TempPixel2(4) = TempBitArray2(3)
TempPixel3(7) = TempBitArray1(4): TempPixel3(6) = TempBitArray1(5): TempPixel3(5) = TempBitArray2(3): TempPixel3(4) = TempBitArray2(5)
TempPixel4(7) = TempBitArray1(6): TempPixel4(6) = TempBitArray1(7): TempPixel4(5) = TempBitArray2(4): TempPixel4(4) = TempBitArray2(7)



PixelValue(CurrentPixel + 0) = FromBin(TempPixel1(0))
PixelValue(CurrentPixel + 1) = FromBin(TempPixel2(0))
PixelValue(CurrentPixel + 2) = FromBin(TempPixel3(0))
PixelValue(CurrentPixel + 3) = FromBin(TempPixel4(0))
Next CurrentPixel

Dim I As Byte
Dim PixelX As Integer
Dim PixelY As Integer
For I = 0 To 63
    PixelX = I Mod 8
    PixelY = I \ 8
    SetPixelV ControlHDC, TileX + PixelX, TileY + PixelY, FlipRGB(PcPalette(PixelValue(I)))
Next I
End Sub



Public Sub MakeOne8x8_GB(TileOffset As Long, ControlHDC As Long, TileX As Integer, TileY As Integer)
'dimensioned arrays set for 2bpp, $10 per tile, interlaced
Dim BytesFromOffset(0 To 15) As Byte    'values ripped from rom
Dim PixelValue(0 To 63) As Byte         'store value of a single pixel
Dim TempBitArray1(0 To 7) As Byte       'temp values representing bits (used to figure ToBin)
Dim TempBitArray2(0 To 7) As Byte       'temp values representing bits (used to figure ToBin)
Dim TempPixel1(0 To 7) As Byte          'temp copy of a pixel, in a bit array, that we'll turn into a byte
Dim CurrentRow As Byte                  'the row (0-7) we are figuring
Dim CurrentPixel As Byte                'which pixel we are figuring in the row
Dim I As Byte


'get $10 bytes of data for one full 8x8 tile
Open needslash For Binary As #1
    Get #1, TileOffset + ROM_HEADER + 1, BytesFromOffset()
Close #1

For CurrentRow = 0 To 7
ToBin BytesFromOffset(CurrentRow * 2), TempBitArray1(0)
ToBin BytesFromOffset((CurrentRow * 2) + 1), TempBitArray2(0)
    For CurrentPixel = 0 To 7
    TempPixel1(6) = TempBitArray1(CurrentPixel)
    TempPixel1(7) = TempBitArray2(CurrentPixel)
    PixelValue((CurrentRow * 8) + CurrentPixel) = FromBin(TempPixel1(0))
    Next CurrentPixel
Next CurrentRow

Dim PixelX As Integer
Dim PixelY As Integer
For I = 0 To 63
    PixelX = I Mod 8
    PixelY = I \ 8
    SetPixelV ControlHDC, TileX + PixelX, TileY + PixelY, MyGBColor(PixelValue(I))
Next I
End Sub




Public Sub MakeOne8x8_8BPP(TileOffset As Long, ControlHDC As Long, TileX As Integer, TileY As Integer, Optional filepath As String = "needslash")
'dimensioned arrays set for 8bpp (mode 7)
Dim PixelValue(0 To 63) As Byte         'store value of a single pixel

'if path left blank, just use the rom itself (ever needed?)
If filepath = "needslash" Then filepath = needslash
'get $40 bytes of data for one full 8x8 tile
Open filepath For Binary As #1
    Get #1, TileOffset + ROM_HEADER + 1, PixelValue()
Close #1

Dim I As Byte
Dim PixelX As Integer
Dim PixelY As Integer
For I = 0 To 63
    PixelX = I Mod 8
    PixelY = I \ 8
    SetPixelV ControlHDC, TileX + PixelX, TileY + PixelY, FlipRGB(PcPalette(PixelValue(I)))
Next I
End Sub



Public Sub DrawMapTile(TileIndex, DesX As Integer, DesY As Integer, SrcX As Integer, SrcY As Integer)
'draw color for AND'ing with tile
StretchBlt Mapper1.MapPicture2.hdc, DesX, DesY, 8, 8, Mapper1.MapMenu1.hdc, SrcX, SrcY, 8, 8, SRCCOPY

'draw tile
'can be shortenned to one stretchblt later, but needed to be forced to not miss lines.
Select Case Val("&H" & Left$(Right$("00" & Hex$(AreaMap(TileIndex).Flip), 2), 1)) \ 4
'normal
    Case 0: StretchBlt Mapper1.MapPicture2.hdc, DesX, DesY, 8, 8, Mapper1.MapMenu1.hdc, SrcX, SrcY, 8, 8, SRCCOPY
'horizontal
    Case 1: StretchBlt Mapper1.MapPicture2.hdc, DesX + 7, DesY, -8, 8, Mapper1.MapMenu1.hdc, SrcX, SrcY, 8, 8, SRCCOPY
'vertical
    Case 2: StretchBlt Mapper1.MapPicture2.hdc, DesX, DesY + 7, 8, -8, Mapper1.MapMenu1.hdc, SrcX, SrcY, 8, 8, SRCCOPY
'horizontal and vertical
    Case 3: StretchBlt Mapper1.MapPicture2.hdc, DesX + 7, DesY + 7, -8, -8, Mapper1.MapMenu1.hdc, SrcX, SrcY, 8, 8, SRCCOPY
'an odd value will lead to blech?
    Case Else: Smile.SMILECaption.Caption = "Uh oh"
End Select

If AreaMapStation(TileIndex) = 0 Then GoTo HiddenRegion
'Mapper1.MapPicture2.Circle (DesX + 4, DesY + 4), 1, vbRed
Exit Sub

HiddenRegion:
'draw red dots on hidden tiles
Mapper1.MapPicture2.PSet (DesX + 4, DesY + 4), vbRed
'leave, if we leave hidden tiles revealed
If Mapper1.RevealHiddenTilesCheck1.Value = 1 Then Exit Sub
'hide hidden grid tiles
If AreaMap(TileIndex).Tile = &H1F Then Mapper1.MapPicture2.Line (DesX, DesY)-(DesX + 8, DesY + 8), vbBlack, BF
End Sub


Public Sub DrawTilePreview(Flipper As Byte)

Select Case Val("&H" & Left$(Right$("00" & Hex$(Flipper), 2), 1)) \ 4
'normal
    Case 0: StretchBlt Mapper1.MapPicture3.hdc, 0, 0, 48, 48, Smile.MenuPictureMask1.hdc, 0, 0, 64, 64, SRCCOPY
'horizontal
    Case 1: StretchBlt Mapper1.MapPicture3.hdc, 47, 0, -48, 48, Smile.MenuPictureMask1.hdc, 0, 0, 64, 64, SRCCOPY
'vertical
    Case 2: StretchBlt Mapper1.MapPicture3.hdc, 0, 47, 48, -48, Smile.MenuPictureMask1.hdc, 0, 0, 64, 64, SRCCOPY
'horizontal and vertical
    Case 3: StretchBlt Mapper1.MapPicture3.hdc, 47, 47, -48, -48, Smile.MenuPictureMask1.hdc, 0, 0, 64, 64, SRCCOPY
'an odd value will lead to blech?
    Case Else:  Smile.SMILECaption.Caption = "Uh oh"
End Select


Mapper1.MapPicture3.Refresh
End Sub



Public Sub DecompressTilesForRip(GraphicsSet, OutputArray() As Byte, IsCRE As Boolean)
LunarOpenFile needslash, LC_READWRITE
'DrawTiles Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
'RenderItNow Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
Dim CRETiles() As Byte
Dim VarTiles() As Byte
Dim SizeOfCRETiles, SizeOfVarTiles
Dim GraphicsSetPointers()
Dim ArrayIndex

ReadGraphicsSetPointers GraphicsSetPointers
ArrayIndex = (GraphicsSet * 3) - 1

'&H203004 for ceres tiles
Decompress CRETilesOffset + ROM_HEADER, CRETiles
Decompress GraphicsSetPointers(ArrayIndex) + ROM_HEADER, VarTiles
SizeOfCRETiles = GetSizeOfDecompData(CRETilesOffset + ROM_HEADER)
SizeOfVarTiles = GetSizeOfDecompData(GraphicsSetPointers(ArrayIndex) + ROM_HEADER)

Smile.Tag = CStr(((SizeOfCRETiles + &H5000&) / 32))
                                            '  was &H6000&
' With tiles, the variable tiles go before the common
' room element tiles.

If IsCRE = True Then
    'CRE graphics'
    Open Left$(needslash, Len(needslash) - 4) & "_CRE.gfx" For Binary As #1
        Put #1, 1, CRETiles
        MsgBox "CRE graphics ripped to:" & vbCrLf & Left$(needslash, Len(needslash) - 4) & "_CRE.gfx", vbInformation
    Close #1
Else
    'Sheet graphics'
    Open Left$(needslash, Len(needslash) - 4) & "_" & Right$("000" & Smile.StateGraphicSetCombo1.Text, 3) & ".gfx" For Binary As #1
        Put #1, 1, VarTiles
        MsgBox "URE graphics ripped to:" & vbCrLf & Left$(needslash, Len(needslash) - 4) & "_" & Right$("000" & Smile.StateGraphicSetCombo1.Text, 3) & ".gfx", vbInformation
    Close #1
End If
'''''''

'ReDim OutputArray(0 To (SizeOfVarTiles - 1))
'CopyMemory OutputArray(0), VarTiles(0), SizeOfVarTiles
'CombineArrays VarTiles, CRETiles, SizeOfVarTiles, SizeOfCRETiles, &H0, &H5000&, OutputArray
LunarCloseFile
End Sub

Public Sub DecompressTilesForRip8x8(GraphicsSet, OutputArray() As Byte, IsCRE As Boolean)
LunarOpenFile needslash, LC_READWRITE
'DrawTiles Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
'RenderItNow Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
Dim CRETiles() As Byte
Dim VarTiles() As Byte
Dim SizeOfCRETiles, SizeOfVarTiles
Dim GraphicsSetPointers()
Dim ArrayIndex

ReadGraphicsSetPointers GraphicsSetPointers
ArrayIndex = (GraphicsSet * 3) - 1

'&H203004 for ceres tiles
Decompress CRETilesOffset + ROM_HEADER, CRETiles
Decompress GraphicsSetPointers(ArrayIndex) + ROM_HEADER, VarTiles
SizeOfCRETiles = GetSizeOfDecompData(CRETilesOffset + ROM_HEADER)
SizeOfVarTiles = GetSizeOfDecompData(GraphicsSetPointers(ArrayIndex) + ROM_HEADER)

Smile.Tag = CStr(((SizeOfCRETiles + &H5000&) / 32))

    'CRE graphics'
    Open App.Path & "\files\temp\cre.gfx" For Binary As #2
        Put #2, 1, CRETiles   'end of non-cre data
    Close #2
    'Sheet graphics'
    Open App.Path & "\files\temp\ure.gfx" For Binary As #2
        Put #2, 1, VarTiles
    Close #2

LunarCloseFile
End Sub


Public Function ConvertToOAM(RawData As Integer) As OAM
Dim HexOfRawData As String * 4
Dim Byte1 As Byte                   'only tile data
Dim Byte2 As Byte                   '2 tile bits, then other data
Dim BitArray(0 To 7) As Byte

HexOfRawData = Right$("0000" & Hex$(RawData), 4)
Byte1 = Val("&H" & Right$(HexOfRawData, 2) & "&")
Byte2 = Val("&H" & Left$(HexOfRawData, 2) & "&")

ToBin Byte2, BitArray(0)

ConvertToOAM.Vertical = BitArray(0)
ConvertToOAM.Horizontal = BitArray(1)
ConvertToOAM.Priority = BitArray(2)
ConvertToOAM.Palette = (BitArray(3) * 4) + (BitArray(4) * 2) + (BitArray(5))
ConvertToOAM.Tile = (BitArray(6) * &H200) + (BitArray(7) * &H100) + Byte1
End Function
