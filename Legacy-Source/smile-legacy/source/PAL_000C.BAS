Attribute VB_Name = "PaletteChooser"
Public Function BytesFromPalette(CC As Long) As String
Dim TempLong As String * 4

RR = (CC Mod 256) \ 8
GG = ((CC \ 256) Mod 256) \ 8
BB = (CC \ 65536) \ 8
TempLong = Right$("0000" & Hex$((BB * 1024) + (GG * 32) + (RR)), 4)
BytesFromPalette = TempLong
End Function


Public Sub PaletteFromBytes(TempLong As Long)
RR = TempLong Mod 32
GG = (TempLong \ 32) Mod 32
BB = (TempLong \ 1024) Mod 32
End Sub


Public Sub Fader(ColorValue As String)
Dim ii As Long
Dim TempByte(1) As Byte
Dim TempInt(1) As Integer

Open needslash & ".SMC" For Binary As #1
TempByte(0) = Val("&H" & Right$(ColorValue, 2) & "&")
TempByte(1) = Val("&H" & Left$(ColorValue, 2) & "&")
'handle fading when charging beam
For ii = 0 To 196 Step 32
Put #1, FadeAddress + 1 + 0 + ii + (ColorID * 2), TempByte(0)
Put #1, FadeAddress + 1 + 1 + ii + (ColorID * 2), TempByte(1)
Next ii
'handle palette when starting
Put #1, StarterAddress + 1 + 0 + (ColorID * 2), TempByte(0)
Put #1, StarterAddress + 1 + 1 + (ColorID * 2), TempByte(1)
'handle palette for dark areas
Put #1, DarkAddress + 1 + 0 + (ColorID * 2), TempByte(0)
Put #1, DarkAddress + 1 + 1 + (ColorID * 2), TempByte(1)
Close #1


End Sub
