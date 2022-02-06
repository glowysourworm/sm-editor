Private Sub AutoOpenROM()

    Dim TestByte As Byte    'check for RoomVar and other special coding
    Dim TempByte As Byte    'check to make sure it's not a PAL ROM
    Dim TempROM_HEADER As Integer

    '.bin file is the temporary file for editing a rom - opened by SMILE
    KillFile needslash & ".bin"

    Open needslash For Binary As #1
    If (LOF(1) / 32768) - (LOF(1) \ 32768) = 0 Then
        TempROM_HEADER = 0
    Else
        TempROM_HEADER = 512
    End If
        Get #1, &H7FD9& + TempROM_HEADER + 1, TempByte
    Close #1

    ROM_HEADER = TempROM_HEADER
    Open needslash For Binary As #1
        Get #1, &H16B20 + ROM_HEADER + 1, TestByte
        Get #1, &H204AC + ROM_HEADER + 1, PLMBank
        Get #1, &H20B60 + ROM_HEADER + 1, ScrollPLMBank
    Close #1

    'show/hide RoomVarData menus
    If TestByte = &H20 Then mnuRoomVarData.Enabled = True Else mnuRoomVarData.Enabled = False

    'show or hide the ability to add Kejardon's AutoSave Map Code
    'check for the availability of JTE
    Open needslash For Binary As #1
        Get #1, &H82EA& + ROM_HEADER + 1, TestByte
        Get #1, &H11F320 + ROM_HEADER + 1, JTEBank
        If JTEBank = &HBF& Then
            Get #1, &H11F320 + ROM_HEADER + 3 + 1, JTEBank       'JTE Bank for this ROM
        Else
            JTEBank = 0             'no JTE installed
        End If
    Close #1

    'show or hide the ability to add Kejardon's AutoSave Map Code
    If TestByte = &HA2 Then
        Mapper1.KejMapCommand1.Visible = True
        Mapper1.mnuKejMap.Visible = True
    Else
        Mapper1.KejMapCommand1.Visible = False
        Mapper1.mnuKejMap.Visible = False
    End If
    
End Sub