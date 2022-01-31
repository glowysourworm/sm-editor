Attribute VB_Name = "PaletteSMILE"
Public Function BytesFromPalette(CC As Long) As String
Dim TempLong As String * 4

pRR = (CC Mod 256) \ 8
pGG = ((CC \ 256) Mod 256) \ 8
pBB = (CC \ 65536) \ 8
TempLong = Right$("0000" & Hex$((pBB * 1024) + (pGG * 32) + (pRR)), 4)
BytesFromPalette = TempLong
End Function


Public Sub PaletteFromBytes(TempLong As Long)
'MsgBox Hex$(TempLong)
pRR = TempLong Mod 32
pGG = (TempLong \ 32) Mod 32
pBB = (TempLong \ 1024) Mod 32
End Sub
