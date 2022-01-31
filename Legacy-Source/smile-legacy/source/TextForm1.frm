VERSION 5.00
Begin VB.Form TextForm 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Green Text (SABS)"
   ClientHeight    =   5310
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4140
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5310
   ScaleWidth      =   4140
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton JathysTextSearchCommand1 
      Caption         =   ">"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3840
      TabIndex        =   6
      Top             =   2400
      Width           =   255
   End
   Begin VB.TextBox JathysTextPointer1 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3120
      MaxLength       =   4
      TabIndex        =   5
      Text            =   "8000"
      Top             =   2400
      Width           =   735
   End
   Begin VB.ComboBox AreaNamesIndexCombo1 
      Height          =   315
      ItemData        =   "TextForm1.frx":0000
      Left            =   2520
      List            =   "TextForm1.frx":0019
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   2400
      Width           =   1575
   End
   Begin VB.ComboBox TextLocationCombo1 
      Height          =   315
      ItemData        =   "TextForm1.frx":0068
      Left            =   0
      List            =   "TextForm1.frx":0078
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   2400
      Width           =   4095
   End
   Begin VB.CommandButton SaveCommand1 
      Caption         =   "Save Text"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   4920
      Width           =   4095
   End
   Begin VB.TextBox SMILETEXT1 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   2415
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   4095
   End
   Begin VB.Label InfoLabel1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   2175
      Left            =   0
      TabIndex        =   2
      Top             =   2760
      Width           =   4095
   End
End
Attribute VB_Name = "TextForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type ItemText
    Text As Byte
    Palette As Byte
End Type

Private Type GreenText      'green text from intro
    Delay As Integer        '$0005 by default (delay comes after letter placed)
    X As Byte               '1 = 1 column
    Y As Byte               '1 = 1 row
    Character As Integer    'pointer to tile graphic
End Type

Private Type AreaNamesText  'area names
    Character As Byte       'character
    Properties As Byte      'palette and flip
End Type

Private TextLocation As Long    'offset of text
Private TextLocationThreeByte As ThreeByte  'only use in JathysTextEngine
Private TextType As Byte        'type of text (green, bomb, credits, etc...)
'0 = green

Private textGREEN() As GreenText   'stored array of a maximum of 779 characters
Private textGREENpointer(0 To 5) As ThreeByte   'pointers ($8C) to text chunks (ie- start, after movies1-4, and after wait)
Private textAREANAMES(0 To 11) As AreaNamesText   'stored array of 12 characters of an area's name
Private textJTE() As Byte        'store bank (E0 by default... can be changed) of text



Public Function GreenToText(GreenVal) As String
'convert green text character values (ie- pointers) to asci characters
Select Case GreenVal
    Case &HD67D: GreenToText = " "
    Case &HD685: GreenToText = "A"
    Case &HD68B: GreenToText = "B"
    Case &HD691: GreenToText = "C"
    Case &HD697: GreenToText = "D"
    Case &HD69D: GreenToText = "E"
    Case &HD6A3: GreenToText = "F"
    Case &HD6A9: GreenToText = "G"
    Case &HD6AF: GreenToText = "H"
    Case &HD6B5: GreenToText = "I"
    Case &HD6BB: GreenToText = "J"
    Case &HD6C1: GreenToText = "K"
    Case &HD6C7: GreenToText = "L"
    Case &HD6CD: GreenToText = "M"
    Case &HD6D3: GreenToText = "N"
    Case &HD6D9: GreenToText = "O"
    Case &HD6DF: GreenToText = "P"
    Case &HD6E5: GreenToText = "Q"
    Case &HD6EB: GreenToText = "R"
    Case &HD6F1: GreenToText = "S"
    Case &HD6F7: GreenToText = "T"
    Case &HD6FD: GreenToText = "U"
    Case &HD703: GreenToText = "V"
    Case &HD709: GreenToText = "W"
    Case &HD70F: GreenToText = "X"
    Case &HD715: GreenToText = "Y"
    Case &HD71B: GreenToText = "Z"
    Case &HD721: GreenToText = "0"
    Case &HD727: GreenToText = "1"
    Case &HD72D: GreenToText = "2"
    Case &HD733: GreenToText = "3"
    Case &HD739: GreenToText = "4"
    Case &HD73F: GreenToText = "5"
    Case &HD745: GreenToText = "6"
    Case &HD74B: GreenToText = "7"
    Case &HD751: GreenToText = "8"
    Case &HD757: GreenToText = "9"
    Case &HD75D: GreenToText = "."
    Case &HD763: GreenToText = ","
    Case &HD76F: GreenToText = "'"
    Case &HD77B: GreenToText = "!"
    Case &HAE79: GreenToText = "<MOVIE1>"
    Case &HB074: GreenToText = "<MOVIE2>"
    Case &HB0B3: GreenToText = "<MOVIE3>"
    Case &HB19B: GreenToText = "<MOVIE4>"
    Case &HB228: GreenToText = "<WAIT>"
    'AE43 = face??
    Case &HD683: GreenToText = "<NEW>"      'removed before user sees
    Case &H0:   'buffer
    Case Else: GreenToText = "WTF!!!": MsgBox Hex$(GreenVal)

'D781
'D7A1
'D7F7
End Select

End Function


Public Function TextToGreen(TextVal) As Integer
'convert asci characters to the pointers used in green text
Select Case TextVal
    Case " ": TextToGreen = &HD67D
    Case "A": TextToGreen = &HD685
    Case "B": TextToGreen = &HD68B
    Case "C": TextToGreen = &HD691
    Case "D": TextToGreen = &HD697
    Case "E": TextToGreen = &HD69D
    Case "F": TextToGreen = &HD6A3
    Case "G": TextToGreen = &HD6A9
    Case "H": TextToGreen = &HD6AF
    Case "I": TextToGreen = &HD6B5
    Case "J": TextToGreen = &HD6BB
    Case "K": TextToGreen = &HD6C1
    Case "L": TextToGreen = &HD6C7
    Case "M": TextToGreen = &HD6CD
    Case "N": TextToGreen = &HD6D3
    Case "O": TextToGreen = &HD6D9
    Case "P": TextToGreen = &HD6DF
    Case "Q": TextToGreen = &HD6E5
    Case "R": TextToGreen = &HD6EB
    Case "S": TextToGreen = &HD6F1
    Case "T": TextToGreen = &HD6F7
    Case "U": TextToGreen = &HD6FD
    Case "V": TextToGreen = &HD703
    Case "W": TextToGreen = &HD709
    Case "X": TextToGreen = &HD70F
    Case "Y": TextToGreen = &HD715
    Case "Z": TextToGreen = &HD71B
    Case "0": TextToGreen = &HD721
    Case "1": TextToGreen = &HD727
    Case "2": TextToGreen = &HD72D
    Case "3": TextToGreen = &HD733
    Case "4": TextToGreen = &HD739
    Case "5": TextToGreen = &HD73F
    Case "6": TextToGreen = &HD745
    Case "7": TextToGreen = &HD74B
    Case "8": TextToGreen = &HD751
    Case "9": TextToGreen = &HD757
    Case ".": TextToGreen = &HD75D
    Case ",": TextToGreen = &HD763
    Case "'": TextToGreen = &HD76F
    Case "!": TextToGreen = &HD77B
    'symbols of the scripts
    Case "%": TextToGreen = &HAE79
    Case "^": TextToGreen = &HB074
    Case "&": TextToGreen = &HB0B3
    Case "*": TextToGreen = &HB19B
    Case "(": TextToGreen = &HB228
    Case ")": TextToGreen = &HD683
    Case Empty:
    Case Else: MsgBox TextVal, vbCritical
End Select
End Function






Public Function EscapeToText(EscapeVal) As String
'convert bomb text character values (ie- pointers) to asci characters
Select Case EscapeVal
    Case &H20: EscapeToText = " "
    Case &H21: EscapeToText = "!" 'ONLY IN ESCAPE SEQUENCE
    Case &H41: EscapeToText = "A"
    Case &H42: EscapeToText = "B"
    Case &H43: EscapeToText = "C"
    Case &H44: EscapeToText = "D"
    Case &H45: EscapeToText = "E"
    Case &H46: EscapeToText = "F"
    Case &H47: EscapeToText = "G"
    Case &H48: EscapeToText = "H"
    Case &H49: EscapeToText = "I"
    Case &H4A: EscapeToText = "J"
    Case &H4B: EscapeToText = "K"
    Case &H4C: EscapeToText = "L"
    Case &H4D: EscapeToText = "M"
    Case &H4E: EscapeToText = "N"
    Case &H4F: EscapeToText = "O"
    Case &H50: EscapeToText = "P"
    Case &H51: EscapeToText = "Q"
    Case &H52: EscapeToText = "R"
    Case &H53: EscapeToText = "S"
    Case &H54: EscapeToText = "T"
    Case &H55: EscapeToText = "U"
    Case &H56: EscapeToText = "V"
    Case &H57: EscapeToText = "W"
    Case &H58: EscapeToText = "X"
    Case &H59: EscapeToText = "Y"
    Case &H5A: EscapeToText = "Z"
    Case &H0: EscapeToText = "<END>"
    Case &HD: escapetotest = vbCrLf
    Case Else: EscapeToText = "WTF!!!": MsgBox Hex$(EscapeVal)
End Select

End Function

Public Function TextToEscape(TextVal) As Byte
'convert bomb text character values (ie- pointers) to asci characters
Select Case TextVal
    Case " ": TextToEscape = &H20
    Case "!": TextToEscape = &H21 'ONLY IN ESCAPE SEQUENCE
    Case "A": TextToEscape = &H41
    Case "B": TextToEscape = &H42
    Case "C": TextToEscape = &H43
    Case "D": TextToEscape = &H44
    Case "E": TextToEscape = &H45
    Case "F": TextToEscape = &H46
    Case "G": TextToEscape = &H47
    Case "H": TextToEscape = &H48
    Case "I": TextToEscape = &H49
    Case "J": TextToEscape = &H4A
    Case "K": TextToEscape = &H4B
    Case "L": TextToEscape = &H4C
    Case "M": TextToEscape = &H4D
    Case "N": TextToEscape = &H4E
    Case "O": TextToEscape = &H4F
    Case "P": TextToEscape = &H50
    Case "Q": TextToEscape = &H51
    Case "R": TextToEscape = &H52
    Case "S": TextToEscape = &H53
    Case "T": TextToEscape = &H54
    Case "U": TextToEscape = &H55
    Case "V": TextToEscape = &H56
    Case "W": TextToEscape = &H57
    Case "X": TextToEscape = &H57
    Case "Y": TextToEscape = &H58
    Case "Z": TextToEscape = &H59
    Case "0": TextToEscape = &H0
    Case "+": TextToEscape = &HD
    Case Else: MsgBox TextVal
End Select
End Function






Public Function AreaNamesToText(AreaNamesVal) As String
'convert area names text character values (ie- pointers) to asci characters
'''numbers are asc(48-56)
'letters are asc(65-90)
'&H32 and &H43
Select Case AreaNamesVal
    Case &H1: AreaNamesToText = " "
    Case &H2: AreaNamesToText = "%"
    Case &H4: AreaNamesToText = "0"
    Case &H5 To &HD: AreaNamesToText = Chr$(AreaNamesVal + 44)
    Case &H30 To &H49: AreaNamesToText = Chr$(AreaNamesVal + 17)
    Case &H4A: AreaNamesToText = "."
    Case &H4B: AreaNamesToText = "?"
    Case &H4C: AreaNamesToText = "!"
    Case Else: AreaNamesToText = " "
End Select
End Function

Public Function TextToAreaNames(TextVal) As Byte
'convert area names text character values (ie- pointers) to asci characters
Select Case TextVal
    Case Asc(" "): TextToAreaNames = &H1
    Case Asc("%"): TextToAreaNames = &H2
    Case Asc("0"): TextToAreaNames = &H4
    Case Asc("1") To Asc("9"): TextToAreaNames = TextVal - 44
    Case Asc("A") To Asc("Z"): TextToAreaNames = TextVal - 17
    Case Asc("."): TextToAreaNames = &H4A
    Case Asc("?"): TextToAreaNames = &H4B
    Case Asc("!"): TextToAreaNames = &H4C
    Case Else: TextToAreaNames = &H1
End Select
End Function






Public Function ItemTextToText(ItemTextValue) As String
'convert item text to asci characters
'ignore colors
Select Case ItemTextValue
    Case &H0 To &H8: ItemTextToText = temtextvalue + 1
    Case &H9: ItemTextToText = 0
    Case &HA: ItemTextToText = "%"
    Case &H4E: ItemTextToText = " "
    Case &HC8: ItemTextToText = "&"
    Case &HC9: ItemTextToText = "@"
    Case &HE0 To &HF9: ItemTextToText = Chr$(ItemTextValue - 159)
    Case &HFA: ItemTextToText = "."
    Case &HFB: ItemTextToText = ","
    Case &HFE: ItemTextToText = "?"
    Case &HFF: ItemTextToText = "!"
    Case Else: ItemTextToText = "*"
End Select
End Function







Private Sub AreaNamesIndexCombo1_Click()
GrabText
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub




Private Sub JathysTextPointer1_Change()
If Len(JathysTextPointer1.Text) <> 4 Then Exit Sub  'prevent constant resetting of this as we type
TextLocationCombo1_Click
End Sub

Private Sub JathysTextSearchCommand1_Click()
Dim TempInteger As Integer

If Val("&H" & JathysTextPointer1.Text & "&") < &H8000& Then JathysTextPointer1.Text = Val("&H" & JathysTextPointer1.Text & "&") + &H8000&
Open needslash For Binary As #1
    For IStart = 1 To &H7FFF&   '1, because we skip over the very first character (which would match a starting byte)
        Get #1, &H300000 + (Val("&H" & JathysTextPointer1.Text & "&") - &H8000&) + IStart + ROM_HEADER + 1, TempInteger
        'check for starting bytes
        If TempInteger = &HE080 Then Exit For
        If TempInteger = &HE180 Then Exit For
        If TempInteger = &HEE80 Then Exit For
        If TempInteger = &HF080 Then Exit For
        If TempInteger = &HF180 Then Exit For
        If TempInteger = &HF280 Then Exit For
    Next IStart
Close #1
    If IStart = &H8000& Then
        IStart = 0
        JathysTextPointer1.Text = "8000"
    End If
    JathysTextPointer1.Text = Hex$(Val("&H" & JathysTextPointer1.Text & "&") + IStart)


End Sub

Private Sub SaveCommand1_Click()
'saving the text (duh)
SaveText
'refresh textbox
TextLocationCombo1_Click

End Sub



Private Sub GrabText()
Dim TempCharacter
Dim TempCharacter2               'only used when making a pointer/value little endian
Dim SmileText1String As String
Dim TempByte As Byte
Dim TempInteger As Integer
Dim IEnd As Long                 'used to find ending byte in JathysText
Dim TempItemText(0 To 18) As ItemText

SmileText1String = ""

If TextType = 0 Then GoTo PULL_GREEN_TEXT
If TextType = 1 Then GoTo PULL_ESCAPE_TEXT
If TextType = 2 Then GoTo PULL_AREA_NAMES_TEXT
If TextType = 3 Then GoTo PULL_JATHYS_TEXT_ENGINE_TEXT
If TextType = 4 Then GoTo PULL_ITEM_PICK_UP_TEXT
Exit Sub

PULL_GREEN_TEXT:
'fill array with emptiness
ReDim textGREEN(0 To 780) As GreenText
Open needslash For Binary As #1
    Get #1, TextLocation + ROM_HEADER + 1, textGREEN()
Close #1

For I = 0 To UBound(textGREEN)
    TempCharacter = GreenToText(textGREEN(I).Character)
    If I = 0 Then GoTo FirstCharacterDone
    'new line(s)
    If textGREEN(I).Y <> textGREEN(I - 1).Y Then
        SmileText1String = SmileText1String & vbCrLf
    End If
    'add extra if 2 increases (not doing more than that, as scripts may interfere
    If textGREEN(I).Y = textGREEN(I - 1).Y + 4 Then SmileText1String = SmileText1String & vbCrLf
    
FirstCharacterDone:
    SmileText1String = SmileText1String & TempCharacter
Next I
'<NEW> doesn't need to be visible, as this is added by SMILE
SmileText1String = Replace(SmileText1String, "<NEW>", "", , , vbTextCompare)
'no new line after scripts, unless user put them in
SmileText1String = Replace(SmileText1String, ">" & vbCrLf, ">", , , vbTextCompare)
If Right$(SmileText1String, 2) = vbCrLf Then SmileText1String = Left$(SmileText1String, Len(SmileText1String) - 2)

SMILETEXT1.Text = SmileText1String
'remove carriage at very start of text
If Left$(SMILETEXT1.Text, 2) = vbCrLf Then
    SMILETEXT1.Text = Right$(SMILETEXT1.Text, Len(SMILETEXT1.Text) - 2)
End If
Exit Sub


PULL_ESCAPE_TEXT:
'will need to redim this as we find how long the text sequence is
Open needslash For Binary As #1
    '01 00 to start off, followed by delay (02 00 by default)
    Get #1, TextLocation + ROM_HEADER + 1, TempByte
    Get #1, , TempByte
    Get #1, , TempByte
    Get #1, , TempByte
    'get text now
    Do
        Get #1, , TempByte
        If TempByte = &HD Then
            Get #1, , TempByte  'pass the second byte of $000D (0D 00)
            Get #1, , TempByte  'X/Y byte
            Get #1, , TempByte  'X/Y screen byte
            'go to new line.... for loading, this is all we need to to
            If SmileText1String <> "" Then SmileText1String = SmileText1String & vbCrLf
            Get #1, , TempByte  'THE NEXT LETTER
        End If
        SmileText1String = SmileText1String & EscapeToText(TempByte)
    Loop Until TempByte = 0
Close #1
SMILETEXT1.Text = SmileText1String
Exit Sub

PULL_AREA_NAMES_TEXT:
Open needslash For Binary As #1
    Get #1, TextLocation + (AreaNamesIndexCombo1.ListIndex * 24) + ROM_HEADER + 1, textAREANAMES()
Close #1
For I = 0 To 11
    SmileText1String = SmileText1String & AreaNamesToText(textAREANAMES(I).Character)
    'take out space before "text" start
    If SmileText1String = " " Then SmileText1String = ""
Next I
Do
    If Right$(SmileText1String, 1) = " " Then
        SmileText1String = Left$(SmileText1String, Len(SmileText1String) - 1)
    Else
        Exit Do
    End If
Loop Until Len(SmileText1String) = 1    'if no text (all spaces), we'll leave it alone

SMILETEXT1.Text = SmileText1String
Exit Sub



PULL_JATHYS_TEXT_ENGINE_TEXT:
Open needslash For Binary As #1
    For IEnd = 0 To &H7FFF&
        Get #1, TextLocation + IEnd + ROM_HEADER + 1, TempInteger
        'check for ending bytes
        If TempInteger = &HFC80 Then IEnd = IEnd + 1: Exit For
        If TempInteger = &HFD80 Then IEnd = IEnd + 1: Exit For
        If TempInteger = &HFE80 Then IEnd = IEnd + 1: Exit For
        If TempInteger = &HFF80 Then IEnd = IEnd + 1: Exit For
    Next IEnd
    'at end of for..next loop, IEnd is increased to be compared again
    If IEnd = &H8000& Then IEnd = &H7FFF&
    'get from start of our text to the end byte
    ReDim textJTE(0 To IEnd) As Byte
    Get #1, TextLocation + ROM_HEADER + 1, textJTE()
Close #1

'go through array of text bytes to translate into text
'don't forget to check for codes
For I = 0 To UBound(textJTE)
    TempCharacter = JTEToText(textJTE(I))
    SmileText1String = SmileText1String & TempCharacter
    'special commands
    If TempCharacter = "<" Then
        I = I + 1               'move ahead to code #
        TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
        SmileText1String = SmileText1String & TempCharacter & ">"
        'sound exception (ie- 3 bytes instead of 2)
        If TempCharacter >= "10" And TempCharacter <= "1F" Then
            I = I + 1
            TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
            SmileText1String = SmileText1String & "{" & TempCharacter & "}"
        End If
        If TempCharacter = "E1" Then
            I = I + 1
            TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
            SmileText1String = SmileText1String & "{" & TempCharacter & "}"
            I = I + 1
            TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
            SmileText1String = SmileText1String & "{" & TempCharacter & "}"
        End If
        If TempCharacter = "62" Or TempCharacter = "63" Or TempCharacter = "64" Or TempCharacter = "65" Or TempCharacter = "E8" Or TempCharacter = "E9" Then
            I = I + 1
            TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
            I = I + 1
            TempCharacter2 = Right$("00" & Hex$(textJTE(I)), 2)
            SmileText1String = SmileText1String & "{" & TempCharacter2 & TempCharacter & "}"
            I = I + 1
            TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
            I = I + 1
            TempCharacter2 = Right$("00" & Hex$(textJTE(I)), 2)
            SmileText1String = SmileText1String & "{" & TempCharacter2 & TempCharacter & "}"
        End If
        If TempCharacter = "60" Or TempCharacter = "61" Then
            I = I + 1
            TempCharacter = Right$("00" & Hex$(textJTE(I)), 2)
            I = I + 1
            TempCharacter2 = Right$("00" & Hex$(textJTE(I)), 2)
            SmileText1String = SmileText1String & "{" & TempCharacter2 & TempCharacter & "}"
        End If
    End If
Next I
SmileText1String = Replace(SmileText1String, "<7F>", vbCrLf & "\" & vbCrLf)               'NEW LINE
SmileText1String = Replace(SmileText1String, "<81>", vbCrLf & "|" & vbCrLf)               'go to line 1
SmileText1String = Replace(SmileText1String, "<A1>", vbCrLf & "||" & vbCrLf)              'go to line 2
SmileText1String = Replace(SmileText1String, "<C1>", vbCrLf & "|||" & vbCrLf)             'go to line 3
SmileText1String = Replace(SmileText1String, ">", ">" & vbCrLf)         'CR after code
SmileText1String = Replace(SmileText1String, "<", vbCrLf & "<")         'CR before code
SmileText1String = Replace(SmileText1String, vbCrLf & "{", "{")         'sound marker next to sound call
SmileText1String = Replace(SmileText1String, "}", "}" & vbCrLf)         'sound marker has CR after it
SmileText1String = Replace(SmileText1String, "}" & vbCrLf & "{", "}{")  '2 variables for an opcode... keep them on one line
SmileText1String = Replace(SmileText1String, vbCrLf & vbCrLf, vbCrLf)   'no double CR's
If Left$(SmileText1String, 2) = vbCrLf Then SmileText1String = Right$(SmileText1String, Len(SmileText1String) - 2)
SMILETEXT1.Text = SmileText1String
Exit Sub



PULL_ITEM_PICK_UP_TEXT:
Open needslash For Binary As #1
    'Get #1, TextLocation + (AreaNamesIndexCombo1.ListIndex * 19) + ROM_HEADER + 1, TempItemText()
    Get #1, TextLocation + ROM_HEADER + 1, TempItemText()
Close #1
For I = 0 To 18
    SmileText1String = SmileText1String & ItemTextToText(TempItemText(I).Text)
    'take out space before "text" start
    If SmileText1String = " " Then SmileText1String = ""
Next I
'remove spaces on the right
Do
    If Right$(SmileText1String, 1) = " " Then
        SmileText1String = Left$(SmileText1String, Len(SmileText1String) - 1)
    Else
        Exit Do
    End If
Loop Until Len(SmileText1String) = 1    'if no text (all spaces), we'll leave it alone
'remove spaces on the left
Do
    If Left$(SmileText1String, 1) = " " Then
        SmileText1String = Right$(SmileText1String, Len(SmileText1String) - 1)
    Else
        Exit Do
    End If
Loop Until Len(SmileText1String) = 1    'if no text (all spaces), we'll leave it alone


SMILETEXT1.Text = SmileText1String
Exit Sub
End Sub


Private Sub SaveText()
Dim TempCharacter As String
Dim TempCharacter2 As String
Dim TempX As Byte
Dim TempY As Byte
Dim TempDelay As Integer
Dim TempCharVal As Integer
Dim CharI As Integer    'to keep track of where in text array we are
Dim SmileText1String As String
Dim TempByte As Byte

If TextType = 0 Then GoTo SAVE_GREEN_TEXT
If TextType = 1 Then GoTo SAVE_ESCAPE_TEXT
If TextType = 2 Then GoTo SAVE_AREA_NAMES_TEXT
If TextType = 3 Then GoTo SAVE_JATHYS_TEXT_ENGINE_TEXT
If TextType = 4 Then GoTo SAVE_ITEM_PICK_UP_TEXT
Exit Sub

SAVE_GREEN_TEXT:
'placing starting <NEW> and text in our array
SmileText1String = "<NEW>" & SMILETEXT1.Text
'delete previously stored text, so we can add a buffer if new text is shorter
ReDim textGREEN(0 To 780) As GreenText

TempX = 0   'actually 1, but we increase X before the text is placed
TempY = 4
'no new line before any script, as this drops the blinking green cursor down a line
SmileText1String = Replace(SmileText1String, vbCrLf & "<", "<", , , vbTextCompare)
'no new line after any script, as new line will be made anyway
SmileText1String = Replace(SmileText1String, ">" & vbCrLf, ">", , , vbTextCompare)
'translate scripts into single characters (carriage returns as well)
SmileText1String = Replace(SmileText1String, "<MOVIE1>", "%)", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, "<MOVIE2>", "^)", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, "<MOVIE3>", "&)", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, "<MOVIE4>", "*)", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, "<WAIT>", "()", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, "<NEW>", ")", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, vbCrLf, "+", , , vbTextCompare)
'in case they mistyped a command, we remove these symbols and their text gets typed
SmileText1String = Replace(SmileText1String, "<", "")
SmileText1String = Replace(SmileText1String, ">", "")

'how buffer at end??? (00000, I think)
CharI = 0
For I = 1 To Len(SmileText1String)
    'find next character
    TempCharacter = Mid$(SmileText1String, I, 1)
    'check for script
    Select Case TempCharacter
        Case "%": TempDelay = &HAE5B: TempX = &H98: TempY = &H96: TempCharVal = &HAE79: textGREENpointer(1) = Offset2ThreePoint(TextLocation + (CharI * 6) + 4, &H60000): GoTo StoreCharacter
        Case "^": TempDelay = &HAE91: TempX = &H98: TempY = &H96: TempCharVal = &HB074: textGREENpointer(2) = Offset2ThreePoint(TextLocation + (CharI * 6) + 4, &H60000): GoTo StoreCharacter
        Case "&": TempDelay = &HB08C: TempX = &H98: TempY = &H96: TempCharVal = &HB0B3: textGREENpointer(3) = Offset2ThreePoint(TextLocation + (CharI * 6) + 4, &H60000): GoTo StoreCharacter
        Case "*": TempDelay = &HB0CB: TempX = &H98: TempY = &H96: TempCharVal = &HB19B: textGREENpointer(4) = Offset2ThreePoint(TextLocation + (CharI * 6) + 4, &H60000): GoTo StoreCharacter
        Case "(": TempDelay = &HB1B3: TempX = &H98: TempY = &H96: TempCharVal = &HB228: textGREENpointer(5) = Offset2ThreePoint(TextLocation + (CharI * 6) + 4, &H60000): GoTo StoreCharacter
        Case ")": TempDelay = &H1: TempX = 1: TempY = 1:  TempCharVal = &HD683: GoTo StoreCharacter
        Case "+": TempDelay = &HAE5B: TempX = 0: TempY = TempY + 2: GoTo NextCycle 'carriage return
    End Select
        
    'increase X
    TempX = TempX + 1
    TempDelay = &H5
    'XXXXX
    TempCharVal = TextToGreen(UCase$(TempCharacter))
StoreCharacter:   'needed as a jump point for scripts
    If CharI > UBound(textGREEN) Then
        MsgBox "Too much text." & vbCrLf & "Some will be chopped off the end.", vbInformation, "Oops!"
        Exit For
    End If
    textGREEN(CharI).X = TempX
    textGREEN(CharI).Y = TempY
    textGREEN(CharI).Delay = TempDelay
    textGREEN(CharI).Character = TempCharVal
    'after scripts, X and Y go back to starters
    If TempX = &H98 Then TempX = 0
    If TempY = &H96 Then TempY = 4
    If TempCharacter = ")" Then TempX = 0: TempY = 4
    'increase position in text array
    CharI = CharI + 1
NextCycle:  'carriage returns will skip to next character
Next I

'make buffer
If CharI <= UBound(textGREEN) Then
    For CharI = CharI To UBound(textGREEN)
        textGREEN(CharI).Delay = 1
        textGREEN(CharI).X = 1
        textGREEN(CharI).Y = 1
        textGREEN(CharI).Character = &HD683
    Next CharI
End If

Open needslash For Binary As #1
    Put #1, TextLocation + ROM_HEADER + 1, textGREEN()
    'save pointers to new green text chunks (after movies/pause)
    For I = 1 To 5
        Put #1, &H5CF43 + (I * 6) + ROM_HEADER + 1, textGREENpointer(I).Byte1
        Put #1, , textGREENpointer(I).Byte2
    Next I
Close #1
Exit Sub


SAVE_ESCAPE_TEXT:
SmileText1String = UCase$(SMILETEXT1.Text)

TempX = 5
TempY = 0
'convert <END> to 0
SmileText1String = Replace(SmileText1String, vbCrLf & "<END>", "0", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, "<END>", "0", , , vbTextCompare)
SmileText1String = Replace(SmileText1String, vbCrLf, "+", , , vbTextCompare)
SMILETEXT1.Text = SmileText1String
Open needslash For Binary As #1
    TempByte = 1
    Put #1, TextLocation + ROM_HEADER + 1, TempByte
    TempByte = 0
    Put #1, , TempByte
    TempByte = 2    'delay
    Put #1, , TempByte
    TempByte = 0
    Put #1, , TempByte
    For I = 1 To Len(SmileText1String)
        TempCharacter = Mid$(SmileText1String, I, 1)

        TempByte = TextToEscape(TempCharacter)
        Put #1, , TempByte
        
        If TempCharacter = "0" Then
            Put #1, , TempByte
            Exit For
        End If
        
        If TempByte = &HD Then
            TempX = 5
            TempY = TempY + 2
            TempByte = 0
            Put #1, , TempByte  'place 0
            'X/Y byte
            TempByte = Val("&H" & Right$("0" & Hex$(TempY), 1) & Right$("0" & Hex$(TempX), 1))
            Put #1, , TempByte
            'X/Y half screen byte
            If TextLocationCombo1.Text = "Ceres Escape" Then
                TempByte = &H51
            Else
                TempByte = &H49
            End If
            Put #1, , TempByte
        End If
    Next I

Close #1
Exit Sub


SAVE_AREA_NAMES_TEXT:
'upper case and padding
SmileText1String = UCase$(SMILETEXT1.Text)
For I = 0 To (12 - Len(SmileText1String)) \ 2
    If I > 0 Then SmileText1String = " " & SmileText1String
Next I
SmileText1String = Left$(SmileText1String & "       ", 12)
'place changes in array
For I = 0 To 11
    textAREANAMES(I).Character = TextToAreaNames(Asc(Mid$(SmileText1String, I + 1, 1)))
    textAREANAMES(I).Properties = &H38
Next I
'save array to rom
Open needslash For Binary As #1
    Put #1, TextLocation + (AreaNamesIndexCombo1.ListIndex * 24) + ROM_HEADER + 1, textAREANAMES()
Close #1
Exit Sub





SAVE_JATHYS_TEXT_ENGINE_TEXT:
Dim III As Long
ReDim textJTE(0 To 0) As Byte    'erase previous data as a safeguard

'convert textbox to a string for quicker handling
SmileText1String = SMILETEXT1.Text
SmileText1String = Replace(SmileText1String, "|||", "<C1>") 'new line goes to 3rd row
SmileText1String = Replace(SmileText1String, "||", "<A1>")  'new line goes to 2nd row
SmileText1String = Replace(SmileText1String, "|", "<81>")   'new line goes to 1st row (won't be used?)
SmileText1String = Replace(SmileText1String, "\", "<7F>")   'NEW LINE
SmileText1String = Replace(SmileText1String, vbCrLf, "")    'eliminate carraige returns
SmileText1String = Replace(SmileText1String, "{", "")       'eliminate sound markers
SmileText1String = Replace(SmileText1String, "}", "")       'eliminate sound markers
'For I = 1 To Len(SMILETEXT1.Text)
For I = 1 To Len(SmileText1String)
    'get a single character from the string of text, then get its value
    TempCharacter = Mid$(SmileText1String, I, 1)
    If TempCharacter = "=" Then
        I = I + 1
        TempCharacter = Mid$(SmileText1String, I, 2)
        TempCharVal = Val("&H" & TempCharacter & "&")
        I = I + 1
    Else
        TempCharVal = TextToJTE(TempCharacter)
    End If
    'place the value in array of data that will go into the rom
    ReDim Preserve textJTE(0 To III) As Byte
    textJTE(III) = TempCharVal
    III = III + 1
    'check to see a special code
    If TempCharVal = &H80& Then
        'go to code value and save value to array (80 has already been saved)
        I = I + 1   'skip the <.... 80
        TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
        ReDim Preserve textJTE(0 To III) As Byte
        textJTE(III) = TempCharVal
        III = III + 1
        I = I + 2   'skip the ##>
        'check if sound
        If TempCharVal >= &H10& And TempCharVal <= &H1F& Then
            I = I + 1
            TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            ReDim Preserve textJTE(0 To III) As Byte
            textJTE(III) = TempCharVal
            III = III + 1
            I = I + 1   'skip the ##
        End If
        'check if border menu (ship)
        If TempCharVal = &HE1& Then
            I = I + 1
            TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            ReDim Preserve textJTE(0 To III) As Byte
            textJTE(III) = TempCharVal
            III = III + 1
            I = I + 2       'skip the }{
            TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            ReDim Preserve textJTE(0 To III) As Byte
            textJTE(III) = TempCharVal
            III = III + 1
            I = I + 1
        End If
        'check value/bit... math subs
        If TempCharVal = &H62& Or TempCharVal = &H63& Or TempCharVal = &H64& Or TempCharVal = &H65& Or TempCharVal = &HE8& Or TempCharVal = &HE9& Then
            I = I + 1
            III = III + 1
            ReDim Preserve textJTE(0 To III) As Byte
            TempCharVal2 = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            TempCharVal = Val("&H" & Mid$(SmileText1String, I + 2, 2) & "&")
            textJTE(III) = TempCharVal2
            textJTE(III - 1) = TempCharVal
            I = I + 4
            III = III + 2
            ReDim Preserve textJTE(0 To III) As Byte
            TempCharVal2 = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            TempCharVal = Val("&H" & Mid$(SmileText1String, I + 2, 2) & "&")
            textJTE(III) = TempCharVal2
            textJTE(III - 1) = TempCharVal
            III = III + 1
            I = I + 3
            
            'I = I + 1
            'TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            'ReDim Preserve textJTE(0 To III) As Byte
            'textJTE(III) = TempCharVal
            'III = III + 1
            'I = I + 2
            'TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            'ReDim Preserve textJTE(0 To III) As Byte
            'textJTE(III) = TempCharVal
            'III = III + 1
            'I = I + 2
            'TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            'ReDim Preserve textJTE(0 To III) As Byte
            'textJTE(III) = TempCharVal
            'III = III + 1
            'I = I + 2
            'TempCharVal = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            'ReDim Preserve textJTE(0 To III) As Byte
            'textJTE(III) = TempCharVal
            'III = III + 1
            'I = I + 1
        End If
        'code pointers
        If TempCharVal = &H60& Or TempCharVal = &H61& Then
            I = I + 1
            III = III + 1
            ReDim Preserve textJTE(0 To III) As Byte
            TempCharVal2 = Val("&H" & Mid$(SmileText1String, I, 2) & "&")
            TempCharVal = Val("&H" & Mid$(SmileText1String, I + 2, 2) & "&")
            textJTE(III) = TempCharVal2
            textJTE(III - 1) = TempCharVal
            III = III + 1
            I = I + 3
        End If
    End If
    'main exit will be on special closing code... the loop assumes end of text block though
Next I
'save data to rom
Open needslash For Binary As #1
    Put #1, TextLocation + ROM_HEADER + 1, textJTE()
Close #1
Exit Sub

SAVE_ITEM_PICK_UP_TEXT:
Exit Sub
End Sub

Private Sub Form_Load()
Me.Icon = Smile.Icon
If JTEBank > 0 Then TextLocationCombo1.AddItem "Jathys Text Engine"
TextLocationCombo1.Text = TextLocationCombo1.List(0)
AreaNamesIndexCombo1.Text = AreaNamesIndexCombo1.List(0)
End Sub




Private Sub SMILETEXT1_GotFocus()
    TextForm.KeyPreview = False
End Sub

Private Sub SMILETEXT1_LostFocus()
    TextForm.KeyPreview = True
End Sub



Private Sub TextLocationCombo1_Click()
'plm text
'<Drewiiseph> !A = $28E0

'set helper text to nothing (to help prevent glitches later on)
InfoLabel1.Caption = ""
AreaNamesIndexCombo1.Visible = False
JathysTextPointer1.Visible = False
JathysTextSearchCommand1.Visible = False
TextLocationCombo1.Width = 4095
'what text and type?
Select Case TextLocationCombo1.Text
    Case "Green Text": TextType = 0
    Case "Ceres Escape": TextType = 1
    Case "Tourian Escape": TextType = 1
    Case "Area Names": TextType = 2
    Case "Item Pick-Ups": TextType = 4
    Case "Jathys Text Engine": TextType = 3
End Select

'individual pointers for GREEN TEXT
If TextType = 0 Then
SMILETEXT1.MaxLength = 0
Open needslash For Binary As #1
    For I = 0 To 5
        Get #1, &H5CF43 + (I * 6) + ROM_HEADER + 1, textGREENpointer(I).Byte1
        Get #1, , textGREENpointer(I).Byte2
        textGREENpointer(I).Byte3 = &H8C
    Next I
Close #1
'sets location of start of text (+2 due to way game handles)
TextLocation = ThreePoint2Offset(textGREENpointer(0)) + 2
'set helper text
InfoLabel1.Caption = "Acceptable scripts are:" & vbCrLf & "<MOVIE1>" & vbCrLf & "<MOVIE2>" & vbCrLf & "<MOVIE3>" & vbCrLf & "<MOVIE4>" & vbCrLf & "<WAIT>" & vbCrLf & vbCrLf & "------------------" & vbCrLf & "<NEW> - (added automatically by other scripts)"
End If

'BOMB TEXT
If TextType = 1 Then
    SMILETEXT1.MaxLength = 0
    'change to pointers later
    If TextLocationCombo1.Text = "Ceres Escape" Then
        TextLocation = &H134450
    Else
        TextLocation = &H13449C
    End If
    'set helper text
    InfoLabel1.Caption = "Acceptable scripts are:" & vbCrLf & "<END>" & vbCrLf & vbCrLf & "------------------" & vbCrLf & "! is only allowed in Tourian" & vbCrLf & "------------------" & vbCrLf & "Support for this text sucks... Sorry.  Use at your own risk."
End If

'AREA NAMES TEXT
If TextType = 2 Then
    AreaNamesIndexCombo1.Visible = True
    TextLocationCombo1.Width = 2535
    SMILETEXT1.MaxLength = 12
    TextLocation = &H1166F
    InfoLabel1.Caption = "What you see is what you get:" & vbCrLf & "0123456789%.?!" & vbCrLf & "ABCDEFGHIJKLMN" & vbCrLf & "OPQRSTUVWXYZ"
End If

'JATHYS ENGINE (my text engine)
If TextType = 3 Then
    JathysTextPointer1.Visible = True
    JathysTextSearchCommand1.Visible = True
    TextLocationCombo1.Width = 3100
    SMILETEXT1.MaxLength = 0
    TextLocationThreeByte.Byte1 = Val("&H" & Right$(Right$("0000" & JathysTextPointer1.Text, 4), 2) & "&")
    TextLocationThreeByte.Byte2 = Val("&H" & Left$(Right$("0000" & JathysTextPointer1.Text, 4), 2) & "&")
    'TextLocationThreeByte.Byte3 = &HE0&
    TextLocationThreeByte.Byte3 = JTEBank
    TextLocation = ThreePoint2Offset(TextLocationThreeByte)
    InfoLabel1.Caption = "Homemade text engine:" & vbCrLf & "See JTEhelp.txt for reference." & vbCrLf & vbCrLf & vbCrLf & "*Make sure you have patched JTE.IPS!!!*"
End If

'ITEM PICK-UP TEXT
If TextType = 4 Then
    SMILETEXT1.MaxLength = 19
    TextLocation = &H2878B
    InfoLabel1.Caption = "What you see is what you get:" & vbCrLf & "0123456789%,.?!" & vbCrLf & "ABCDEFGHIJKLMN" & vbCrLf & "OPQRSTUVWXYZ" & vbCrLf & vbCrLf & "@ = morphball" & vbCrLf & "* = unrecognized character"
End If


'grab the text and allow us to read it
GrabText

'hide helper text if nothing is in it
If InfoLabel1.Caption = "" Then InfoLabel1.Visible = False Else InfoLabel1.Visible = True
End Sub





Public Function JTEToText(JTEVal As Byte) As String
'convert green text character values (ie- pointers) to asci characters
'MsgBox Asc("A") & vbCrLf & Asc("Z")
Select Case JTEVal
    Case &H0& To &H19&: JTEToText = Chr$(JTEVal + 65)    'A-Z
    Case &H1A& To &H33&: JTEToText = Chr$(JTEVal + 71)  'a-z
    Case &H34&: JTEToText = "."
    Case &H35&: JTEToText = ","
    Case &H36&: JTEToText = "!"
    Case &H37&: JTEToText = "?"
    Case &H38&: JTEToText = "'"
    Case &H39&: JTEToText = "%"
    Case &H4B&: JTEToText = " "
    'case 57-63: border and blanks
    'case 74-?: border and blanks
    Case &H40& To &H49&: JTEToText = JTEVal - &H40   '0-9 (not 1-9,0)
    Case &H80&: JTEToText = "<"                      'special code next
    Case Else: JTEToText = "=" & Right$("00" & Hex$(JTEVal), 2)
End Select
End Function


Public Function TextToJTE(TextVal) As Integer
'convert asci characters to the pointers used in green text
Select Case TextVal
    Case "A" To "Z": TextToJTE = Asc(TextVal) - 65
    Case "a" To "z": TextToJTE = Asc(TextVal) - 71
    Case ".": TextToJTE = &H34&
    Case ",": TextToJTE = &H35&
    Case "!": TextToJTE = &H36&
    Case "?": TextToJTE = &H37&
    Case "'": TextToJTE = &H38&
    Case "%": TextToJTE = &H39&
    Case " ": TextToJTE = &H4B&
    'blanks and borders
    Case 0 To 9: TextToJTE = TextVal + &H40&
    Case "<": TextToJTE = &H80&
    Case "#": TextToJTE = &HFF&
End Select
End Function


Public Sub SwapLittleEndian(poop)

End Sub
