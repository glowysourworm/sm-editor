VERSION 5.00
Begin VB.Form SamusForm2 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Samus Draw"
   ClientHeight    =   7980
   ClientLeft      =   150
   ClientTop       =   105
   ClientWidth     =   7470
   FillColor       =   &H00E0E0E0&
   ForeColor       =   &H00000000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   532
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   498
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Palette Editor"
      ForeColor       =   &H00000000&
      Height          =   615
      Index           =   1
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   3375
      Begin VB.PictureBox Palette1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FF8080&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         ScaleHeight     =   16
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   192
         TabIndex        =   17
         Top             =   240
         Width           =   2880
         Begin VB.Shape Shape1 
            BorderColor     =   &H000000FF&
            BorderStyle     =   0  'Transparent
            BorderWidth     =   3
            DrawMode        =   6  'Mask Pen Not
            FillColor       =   &H000000FF&
            FillStyle       =   0  'Solid
            Height          =   120
            Left            =   2880
            Shape           =   3  'Circle
            Top             =   960
            Width           =   120
         End
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "0"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   0
         Left            =   3000
         TabIndex        =   16
         Top             =   240
         Width           =   255
      End
   End
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H00000000&
      Height          =   7935
      Index           =   0
      Left            =   3360
      TabIndex        =   0
      Top             =   0
      Width           =   4095
      Begin VB.VScrollBar Menu8x8VScroll1 
         Height          =   7935
         LargeChange     =   16
         Left            =   3840
         Max             =   31
         TabIndex        =   14
         Top             =   0
         Width           =   255
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   50
         Left            =   120
         Top             =   3960
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "GraphicForm.frx":0000
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   3
         Left            =   3120
         Picture         =   "GraphicForm.frx":0064
         Style           =   1  'Graphical
         TabIndex        =   10
         ToolTipText     =   "Priority"
         Top             =   3960
         Visible         =   0   'False
         Width           =   300
      End
      Begin VB.ComboBox TileTablePalette 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Index           =   3
         ItemData        =   "GraphicForm.frx":00C5
         Left            =   600
         List            =   "GraphicForm.frx":00E1
         Style           =   2  'Dropdown List
         TabIndex        =   12
         ToolTipText     =   "Palette Number"
         Top             =   3960
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.ComboBox TileTablePalette 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Index           =   2
         ItemData        =   "GraphicForm.frx":00FD
         Left            =   3120
         List            =   "GraphicForm.frx":0119
         Style           =   2  'Dropdown List
         TabIndex        =   11
         ToolTipText     =   "Palette Number"
         Top             =   3960
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "GraphicForm.frx":0135
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   2
         Left            =   3120
         Picture         =   "GraphicForm.frx":0199
         Style           =   1  'Graphical
         TabIndex        =   9
         ToolTipText     =   "Priority"
         Top             =   3840
         Visible         =   0   'False
         Width           =   300
      End
      Begin VB.TextBox TileTable8x8 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Index           =   3
         Left            =   2880
         TabIndex        =   8
         Text            =   "000"
         ToolTipText     =   "8x8 Number"
         Top             =   4560
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox TileTable8x8 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Index           =   0
         Left            =   3120
         TabIndex        =   7
         Text            =   "000"
         ToolTipText     =   "8x8 Number"
         Top             =   3840
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.ComboBox TileTablePalette 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Index           =   0
         ItemData        =   "GraphicForm.frx":01FA
         Left            =   3000
         List            =   "GraphicForm.frx":0216
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Palette Number"
         Top             =   3960
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "GraphicForm.frx":0232
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   0
         Left            =   3120
         Picture         =   "GraphicForm.frx":0296
         Style           =   1  'Graphical
         TabIndex        =   5
         ToolTipText     =   "Priority"
         Top             =   3960
         Visible         =   0   'False
         Width           =   300
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "GraphicForm.frx":02F7
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   1
         Left            =   3000
         Picture         =   "GraphicForm.frx":035B
         Style           =   1  'Graphical
         TabIndex        =   4
         ToolTipText     =   "Priority"
         Top             =   3840
         Visible         =   0   'False
         Width           =   300
      End
      Begin VB.ComboBox TileTablePalette 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Index           =   1
         ItemData        =   "GraphicForm.frx":03BC
         Left            =   2880
         List            =   "GraphicForm.frx":03D8
         Style           =   2  'Dropdown List
         TabIndex        =   3
         ToolTipText     =   "Palette Number"
         Top             =   3960
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.TextBox TileTable8x8 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Index           =   1
         Left            =   3000
         TabIndex        =   2
         Text            =   "000"
         ToolTipText     =   "8x8 Number"
         Top             =   3840
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox TileTable8x8 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Index           =   2
         Left            =   3000
         TabIndex        =   1
         Text            =   "000"
         ToolTipText     =   "8x8 Number"
         Top             =   3840
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   7920
         Left            =   0
         ScaleHeight     =   528
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   256
         TabIndex        =   13
         Top             =   0
         Width           =   3840
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H80000005&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   840
            Left            =   360
            ScaleHeight     =   840
            ScaleWidth      =   960
            TabIndex        =   23
            Top             =   960
            Visible         =   0   'False
            Width           =   960
         End
         Begin VB.Image Target 
            BorderStyle     =   1  'Fixed Single
            Enabled         =   0   'False
            Height          =   255
            Index           =   0
            Left            =   0
            Top             =   0
            Width           =   255
         End
      End
   End
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Tile Editing (Export)"
      ForeColor       =   &H00000000&
      Height          =   3135
      Index           =   2
      Left            =   0
      TabIndex        =   18
      Top             =   4800
      Visible         =   0   'False
      Width           =   3375
      Begin VB.CommandButton PointerPopUpCommand1 
         Caption         =   "Show CRE Pointers"
         Height          =   375
         Index           =   0
         Left            =   480
         TabIndex        =   28
         Top             =   240
         Width           =   2655
      End
      Begin VB.VScrollBar TileTableScroll1 
         Height          =   1900
         LargeChange     =   32
         Left            =   0
         Max             =   1023
         TabIndex        =   34
         Tag             =   "0"
         Top             =   0
         Value           =   333
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.ComboBox TileTableMenuPalette 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   15
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         ItemData        =   "GraphicForm.frx":03F4
         Left            =   840
         List            =   "GraphicForm.frx":0410
         Style           =   2  'Dropdown List
         TabIndex        =   33
         ToolTipText     =   "Palette Number"
         Top             =   480
         Visible         =   0   'False
         Width           =   4095
      End
      Begin VB.CommandButton TileTableSaveArray1 
         Caption         =   "Save To Temp Array"
         Height          =   255
         Left            =   1320
         TabIndex        =   32
         Top             =   360
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Export Tile Table"
         Height          =   495
         Left            =   1920
         TabIndex        =   31
         Top             =   240
         Width           =   2175
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Import CRE TileTable"
         Height          =   255
         Index           =   0
         Left            =   2280
         TabIndex        =   30
         Top             =   1200
         Width           =   2775
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Import SCENERY TileTable"
         Height          =   255
         Index           =   1
         Left            =   1440
         TabIndex        =   29
         Top             =   480
         Width           =   2775
      End
      Begin VB.CommandButton PointerPopUpCommand1 
         Caption         =   "Show Scenery Pointers"
         Height          =   375
         Index           =   1
         Left            =   1080
         TabIndex        =   27
         Top             =   360
         Width           =   2655
      End
      Begin VB.CommandButton SavePaletteFile1 
         Caption         =   "Export Palette"
         Height          =   375
         Left            =   720
         TabIndex        =   26
         Top             =   480
         Width           =   1455
      End
      Begin VB.CommandButton LoadPaletteFile1 
         Caption         =   "Import Palette"
         Height          =   375
         Left            =   720
         TabIndex        =   25
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton PaletteCommand1 
         Caption         =   "Save ROM"
         Height          =   495
         Left            =   840
         TabIndex        =   24
         Top             =   360
         Width           =   3120
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Save Scenery GFX File to ROM"
         Height          =   375
         Index           =   4
         Left            =   1200
         TabIndex        =   22
         Top             =   480
         Width           =   2655
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Save CRE GFX File to ROM"
         Height          =   375
         Index           =   3
         Left            =   1080
         TabIndex        =   21
         Top             =   480
         Width           =   2655
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Make Scenery GFX File"
         Height          =   375
         Index           =   1
         Left            =   2160
         TabIndex        =   20
         Top             =   960
         Width           =   2655
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Make CRE GFX File"
         Height          =   375
         Index           =   0
         Left            =   840
         TabIndex        =   19
         Top             =   480
         Width           =   2655
      End
   End
End
Attribute VB_Name = "SamusForm2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private ColorRow(0 To 15) As Long




Private Sub Command1_Click()

End Sub



Public Sub GraphicsMenuPreview_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 1 Then Exit Sub
TileTableScroll1.Value = ((Y \ 16) * 32) + (X \ 16)
End Sub


Private Sub GraphicsMenuPreview_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > 511 Then X = 511
If Y > 511 Then Y = 511
GraphicsMenuPreview_MouseDown Button, Shift, X, Y
End Sub

Private Sub FastScrollCommand1_Click(Index As Integer)

End Sub



Private Sub Command2_Click()
RoomHeader1.RoomIndexText1.Text = Text1.Text
End Sub


Public Sub Command3_Click()
'save most recent changed tiles (on screen changes)
TileTableSaveArray1_Click
'Save CRE Tile Table
Open Left$(needslash, Len(needslash) - 4) & "_CRE.ttb" For Binary As #1
    Put #1, 1, CRETileTableBytes()
Close #1
'Save URE Tile Table
Open Left$(needslash, Len(needslash) - 4) & "_SCENERY.ttb" For Binary As #1
    Put #1, 1, URETileTableBytes()
Close #1
'Smile.StateGraphicSetCombo1_Click
MsgBox Left$(needslash, Len(needslash) - 4) & "_CRE.ttb" & vbCrLf & Left$(needslash, Len(needslash) - 4) & "_SCENERY.ttb", vbInformation, "Tile Tables Saved"
End Sub



Private Sub mnuGFXCREExport_Click()
RipSaveCommand1_Click 0
End Sub

Private Sub mnuGFXCREImport_Click()
RipSaveCommand1_Click 3
End Sub






Private Sub Form_DblClick()
SamusForm.Show 1
End Sub

Private Sub Palette1_DragDrop(Source As Control, X As Single, Y As Single)
'only allow dropping from the clipboard palette
If DraggedDropped.Index <> 255 Then Exit Sub
TileTablePalette2_DragDrop (Y \ 16), Palette1, 0, 0
End Sub



Public Sub PaletteCommand1_Click()
'saving palette changes
Dim i As Long
Dim GraphicsSetPointers() As Long
Dim GraphicsSet As Long
Dim SnesPalette(0 To 127) As Integer
Dim SnesByteArray(0 To 255) As Byte 'recompression requires bytes   'to speed up, may make a C++ function later to do this automatically
Dim RecompressedPaletteSize As Long 'new size of data, to resize array
Dim CurrentOffset As Long   'to speed up loop
Dim NextHighest As Long   'nearest higher offset
Dim AllowedSpace As Long 'space before next palette entry
Dim CompressedSnesPalette() As Byte 'data to put in ROM

ReDim CompressedSnesPalette(0 To 1023) As Byte  'larger than needed, to prevent crash, then shrink
'need to save

For i = 0 To 127
    SnesPalette(i) = PcPaletteToSnesPalette(PcPalette(i))
    SnesByteArray(i * 2) = Val("&H" & Right$("0000" & Hex$(SnesPalette(i)), 2))
    SnesByteArray((i * 2) + 1) = Val("&H" & Left$(Right$("0000" & Hex$(SnesPalette(i)), 4), 2))
Next i
'recompress data
RecompressedPaletteSize = RecompressPalette(SnesByteArray(), CompressedSnesPalette())
'resize output array
ReDim Preserve CompressedSnesPalette(0 To RecompressedPaletteSize - 1)
'find place to put data, then save it to the ROM

'ReadGraphicsSetPointers GraphicsSetPointers
GraphicsSet = Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
CurrentOffset = GetPaletteOffset(GraphicsSet)
NextHighest = 0
For i = 1 To 29
    If GetPaletteOffset(i) > CurrentOffset Then
        If NextHighest = 0 Then NextHighest = i
        If GetPaletteOffset(i) < GetPaletteOffset(NextHighest) Then NextHighest = i
    End If
Next i

'figure location of next palette and if we're overwriting it
AllowedSpace = GetPaletteOffset(NextHighest) - GetPaletteOffset(GraphicsSet)
'if highest palette offset, figure imaginary limit
If NextHighest = 0 Then
    DDDD = MsgBox("There is no palette listed after this one." & vbCrLf & "To prevent overwriting data, it is recommended that you keep the palette below 214.  Do you wish to limit this palette?", vbYesNo)
    If DDDD = vbYes Then AllowedSpace = 213 Else AllowedSapce = 256
End If

'if overwriting another palette, exit
If UBound(CompressedSnesPalette) >= AllowedSpace Then
    MsgBox "Data too large and will overwrite next palette." & vbCrLf & "Adjust pointers to make more room or change the palette.", vbCritical, "Allowed=" & (AllowedSpace - 1) & " | Used=" & UBound(CompressedSnesPalette)
    DD = MsgBox("Allow anyway (not recommended if you don't know what you're doing)?", vbYesNo, "Overwrite?")
    If DD = 6 Then GoTo WritingPalette
    Exit Sub
End If

WritingPalette:
Open needslash For Binary As #1
    Put #1, GetPaletteOffset(GraphicsSet) + ROM_HEADER + 1, CompressedSnesPalette
Close #1
TileTableMenuPalette_Click
Smile.StateGraphicSetCombo1_Click
End Sub

Private Sub Form_Load()
Dim TempString As String * 5

GraphicEditor.Icon = Smile.Icon

'palette data
UpdateSamusPalette
End Sub


Private Sub Picture2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
DraggedDropped.Trait = 0
DraggedDropped.Index = ((Y \ 16) * 16) + (X \ 16) + (Menu8x8VScroll1.Value * 16)
DraggedDropped.Shift = Shift
'FOR MOVING TARGET BOX
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > Picture2.Width Then X = Picture2.Width - 1
If Y > Picture2.Height Then Y = Picture2.Height - 1

Dim RealX
Dim RealY
RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16
Target(0).Move RealX, RealY
End Sub

Public Sub PointerPopUpCommand1_Click(Index As Integer)
Dim GraphicsSetPointers() As Long
Dim ArrayIndex
Dim DataAddress As Long

LunarOpenFile needslash, LC_READWRITE
ReadGraphicsSetPointers GraphicsSetPointers
ArrayIndex = (Smile.StateGraphicSetCombo1.Text * 3) - 1
DataAddress = GraphicsSetPointers(ArrayIndex)
LunarCloseFile
Select Case Index
    Case 0: PopThePopper "The CRE GFX", CRETilesOffset, 0
    Case 1: PopThePopper "The Scenery GFX", DataAddress, 1
End Select
End Sub






Public Sub UpdateSamusPalette()
Dim SamusPaletteOffset As Long
Dim SamusPalette(0 To 255) As Long
Dim TempLong As Long
Dim TempByte(1) As Byte

SamusPaletteOffset = Val("&HD9400&")

Open needslash For Binary As #1
'grab the palette
For i = 0 To 255
    Get #1, SamusPaletteOffset + ROM_HEADER + (i * 2) + 1 + 0, TempByte(0)
    Get #1, SamusPaletteOffset + ROM_HEADER + (i * 2) + 1 + 1, TempByte(1)
    
    TempLong = Val("&H" & Right$("00" & Hex$(TempByte(1)), 2) & Right$("00" & Hex$(TempByte(0)), 2) & "&")

    PaletteFromBytes TempLong
    SamusPalette(i) = RGB(pRR * 8, pGG * 8, pBB * 8)
Next i
Close #1


'display the preview
For i = 0 To 15
    YY = (i \ 16) * 16
    XX = (i Mod 16) * 12
    Palette1.Line (XX, YY)-(XX + 12, YY + 16), FlipRGB(SamusPalette(i)), BF
    
Next i
Palette1.Refresh


End Sub




Private Sub SpecialGFXCombo1_Click(Index As Integer)
'make sure listboxes "line up"
SpecialGFXCombo1(1).Text = SpecialGFXCombo1(1).List(SpecialGFXCombo1(0).ListIndex)
SpecialGFXCombo1(1).Tag = "4bpp"
Select Case SpecialGFXCombo1(0).ListIndex
    Case 0: SpecialGFXCombo1(1).Tag = "Mode 7 8bpp"
    Case 2 To 3: SpecialGFXCombo1(1).Tag = "Mode 7 8bpp"
    Case 4 To 5: SpecialGFXCombo1(1).Tag = "2bpp gb"
    Case 13: SpecialGFXCombo1(1).Tag = "2bpp/gb or 4bpp?"
    Case 15: SpecialGFXCombo1(1).Tag = "Mode 7 8bpp"
End Select
End Sub

Private Sub SpecialGFXRipSave1_Click(Index As Integer)
Dim GFXTiles() As Byte
Dim GFXPath As String
Dim GFXOffset As Long

If Index = 1 Then GoTo SAVE_SPECIALGFX

RIP_SPECIALGFX:
GFXOffset = Val("&H" & SpecialGFXCombo1(1).Text) + ROM_HEADER
'decompress the gfx
LunarOpenFile needslash, LC_READWRITE
Decompress GFXOffset, GFXTiles
LunarCloseFile
'save to file
GFXPath = Left$(needslash, Len(needslash) - 4) & "_" & SpecialGFXCombo1(1).Text & ".gfx"
'GFXPath = "c:\windows\desktop\test.gfx"
Open GFXPath For Binary As #1
    Put #1, 1, GFXTiles()
Close #1
MsgBox "GFX save to:" & vbCrLf & GFXPath & vbCrLf & vbCrLf & "These graphics are " & SpecialGFXCombo1(1).Tag
Exit Sub

SAVE_SPECIALGFX:
'locating GFX file
Dim CMD1 As New OpenSave
CMD1.Filter = "GFX|*.GFX"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For i = 1 To Len(DD)
    If Asc(Mid$(DD, i, 1)) = 0 Then Exit For
Next i
DD = Mid$(DD, 1, i - 1)
If DD = "" Then MsgBox "No file selected!", vbOKOnly, "Oops!": Exit Sub
GFXPath = DD

ReDim GFXTiles(0 To &HFFFF&) As Byte
ReDim NewData(0 To &HFFFF&) As Byte
Dim ArrayIndex

'open decompressed sheet
Open GFXPath For Binary As #1
    If LOF(1) = 0 Then MsgBox "No file, so nothing will be done.", vbOKOnly, "Not going to do it.": Close #1: Exit Sub
    Get #1, , GFXTiles
    ReDim Preserve GFXTiles(0 To LOF(1) - 1) As Byte
Close #1
'recompress
DD = RecompressData(GFXTiles(), NewData())
ReDim Preserve NewData(0 To DD - 1) As Byte
'save data to rom
Open needslash For Binary As #1
    Put #1, Val("&H" & SpecialGFXCombo1(1).Text) + ROM_HEADER + 1, NewData()
Close #1
Exit Sub



End Sub

Private Sub TileTable8x8_Change(Index As Integer)
UpdateLarge8x8 Index
End Sub



Private Sub TileTableCopy_Click(Index As Integer)

End Sub

Private Sub TileTableFrame1_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
Palette2_DragDrop TileTableFrame1(5), 0, 0
End Sub

Private Sub TileTableFrame1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
DraggedDropped.Trait = 255
DraggedDropped.Index = 255
End Sub


Public Sub TileTableMenuPalette_Click()
Dim Test As New cDIBSection
Dim TempI As Long
Dim TempX As Long
Dim TempY As Long
Dim GraphicsSet As Long
Dim URESecondHalfMax As Long

GraphicsSet = Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
'decompress all 8x8's
Get8x8GFX
'choose palette to use
Test.CreatePalette TileTableMenuPalette.Text

'make "table" for first half of URE 8x8's
Test.CreateMetaTable App.Path & "\files\temp\ure.gfx", 0, 512
For TempI = 0 To 511
    Test.RenderToDC Picture1.hDC, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI

'make "table" for second half of URE 8x8's
Select Case GraphicsSet
    Case 27: URESecondHalfMax = 511         'kraid's room exception (longer gfx, force no cre)
    Case Else: URESecondHalfMax = 63        'all others? (ceres will simply have a shorter scroll here)
End Select
'draw the last bit of the gfx
Test.CreateMetaTable App.Path & "\files\temp\ure.gfx", &H4000&, URESecondHalfMax + 1
For TempI = 0 To URESecondHalfMax
    Test.RenderToDC Picture1.hDC, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI


'make "table" for CRE 8x8's (unless Kraid's room)
If GraphicsSet = 27 Then GoTo Render8x8TileSheetPreview         'if Kraid's room, don't draw CRE (it would cover up some of the graphics)
TempY = 320
Test.CreateMetaTable App.Path & "\files\temp\cre.gfx", 0, 384
For TempI = 0 To 383
    Test.RenderToDC Picture1.hDC, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI

Render8x8TileSheetPreview:
Menu8x8VScroll1_Change
End Sub




Private Sub TileTablePalette_Click(Index As Integer)
TileTablePaletteCommand1(Index).Caption = TileTablePalette(Index).Text
UpdateLarge8x8 Index
End Sub


Private Sub TileTablePalette2_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
DraggedDropped.Trait = 1
DraggedDropped.Index = Index
DraggedDropped.Shift = Shift
End Sub


Private Sub TileTablePaletteCommand1_Click(Index As Integer)

End Sub

Private Sub TileTablePriority_Click(Index As Integer)
TileTablePicture3(Index).ZOrder Abs(TileTablePriority(Index).Value - 1)
End Sub


Private Sub TileTableSave1_Click()

End Sub

Public Sub TileTableSaveArray1_Click()
Dim IntegerPieces(0 To 3) As Byte
Dim TempInt As Integer
Dim TempLong As Long
Dim TempLong2 As Long
Dim TempBytes(0 To 7) As Byte
Dim TempBits(0 To 7) As Byte
Dim TempTempBits(0 To 7) As Byte
Dim IsURE As Boolean

If TileTableScroll1.Value > 255 Then
    IsURE = True
Else
    IsURE = False
End If

For iiiii = 0 To 6 Step 2
'palette
ToBin Val(TileTablePalette(iiiii / 2).Text), TempTempBits(0)
TempBits(7) = 0
TempBits(6) = 0
TempBits(5) = TempTempBits(7)
TempBits(4) = TempTempBits(6)
TempBits(3) = TempTempBits(5)
'priority
TempBits(2) = Val(TileTablePriority(iiiii / 2).Value)
'horizontal flip
TempBits(1) = Val(TileTableHFlip(iiiii / 2).Value)
'vertical flip
TempBits(0) = Val(TileTableVFlip(iiiii / 2).Value)
'find value of multi-byte part of the long
TempLong2 = FromBin(TempBits(0))    'byte value
TempLong2 = TempLong2 * 256         'raise to next byte
'8x8's
TempLong = Val("&H" & TileTable8x8(iiiii / 2).Text & "&")
'merge the values to make new value to save to array
TempLong = TempLong Or TempLong2
'turn textbox into 2 bytes
LongToBytes TempBytes, TempLong
'put the 2 bytes into the array
If RoomHeader1.RegionCombo1.Text = "CERES" And Val("&H" & RoomHeader1.Unknown4Text1) <> 6 Then GoTo CeresArray8x8s
If IsURE = False Then
    CRETileTableBytes((TileTableScroll1.Value * 8) + iiiii) = TempBytes(0)
    CRETileTableBytes((TileTableScroll1.Value * 8) + iiiii + 1) = TempBytes(1)
Else
    URETileTableBytes((TileTableScroll1.Value * 8) - 2048 + iiiii) = TempBytes(0)
    URETileTableBytes((TileTableScroll1.Value * 8) - 2048 + iiiii + 1) = TempBytes(1)
End If
GoTo ArrayTransferOver

CeresArray8x8s:
    URETileTableBytes((TileTableScroll1.Value * 8) + iiiii) = TempBytes(0)
    URETileTableBytes((TileTableScroll1.Value * 8) + iiiii + 1) = TempBytes(1)
ArrayTransferOver:
Next iiiii
End Sub

Public Sub TileTableScroll1_Change()
Dim TempScrollValue As Integer
'update all boxes
UpdateTileTable1

End Sub

Private Sub TileTableScroll1_Scroll()
TileTableScroll1_Change
End Sub

Public Sub UpdateTileTable1()
Dim IntegerPieces(0 To 3) As Byte
Dim TempInt As Long
Dim TempTemp As Long
Dim TempBits(0 To 7) As Byte
Dim NewTempBits(0 To 7) As Byte 'to rotate bits
Dim TempXX As Integer
Dim TempYY As Integer
Dim IsURE As Boolean
Dim FakeScrollValue As Integer  'because scroll must change for ceres

'which 16x16 tile?
TileTableLabel1.Caption = Right$("000" & Hex$(TileTableScroll1.Value), 3)
FakeScrollValue = TileTableScroll1.Value
If RoomHeader1.RegionCombo1.Text = "CERES" And Val("&H" & RoomHeader1.Unknown4Text1) <> 6 Then FakeScrollValue = FakeScrollValue + 256
If FakeScrollValue > 255 Then
    IsURE = True
Else
    IsURE = False
End If
'get four sets of 8x8's
For iiii = 0 To 6 Step 2
'get 2 bytes to form integer
If IsURE = True Then
    IntegerPieces(0) = URETileTableBytes((FakeScrollValue * 8) - 2048 + iiii)    'taking away 2048 (256*8 per 8x8) because we are at the *start* of the URE file
    IntegerPieces(1) = URETileTableBytes((FakeScrollValue * 8) - 2048 + iiii + 1)
Else
    IntegerPieces(0) = CRETileTableBytes((FakeScrollValue * 8) + iiii)
    IntegerPieces(1) = CRETileTableBytes((FakeScrollValue * 8) + iiii + 1)
End If

TempInt = BytesToLong(IntegerPieces)
'breaking multi-used byte for bit by bit access
ToBin IntegerPieces(1), TempBits(0)
'which 8x8?
TempTemp = TempInt And &H3FF&
TileTable8x8(iiii / 2).Text = Hex$(TempTemp)
'which palette (rotate bits to make new value)
NewTempBits(7) = TempBits(5)
NewTempBits(6) = TempBits(4)
NewTempBits(5) = TempBits(3)

TileTablePalette(iiii / 2).Text = FromBin(NewTempBits(0))
'which priority
TileTablePriority(iiii / 2).Value = TempBits(2)
'which hflip
TileTableHFlip(iiii / 2).Value = TempBits(1)
'which vflip
TileTableVFlip(iiii / 2).Value = TempBits(0)
Next iiii

'place preview in smile's main gfx menu
TempXX = (TileTableScroll1.Value)
TempYY = (TempXX \ 32) * 16
TempXX = (TempXX Mod 32) * 16
Smile.Target(0).Move TempXX, TempYY, 16, 16
Smile.PictureScroll1.Value = ((TempYY \ 16) \ 8) * 8
End Sub


Private Sub Get8x8GFX()
Dim OutputArray() As Byte
Dim RipTiles() As Byte

CREFile:
DecompressTilesForRip8x8 Smile.StateGraphicSetCombo1.Text, RipTiles, True
UREFile:
DecompressTilesForRip8x8 Smile.StateGraphicSetCombo1.Text, RipTiles, False


End Sub

Public Sub Menu8x8VScroll1_Change()
Picture2.Cls
StretchBlt Picture2.hDC, 0, -(Menu8x8VScroll1.Value * 16), 256, 2048, Picture1.hDC, 0, 0, 128, 1024, SRCCOPY
Picture2.Refresh
End Sub

Private Sub Menu8x8VScroll1_Scroll()
Menu8x8VScroll1_Change
End Sub


Public Sub UpdateLarge8x8(Index As Integer)
Dim Temp8x8Index As Long
Dim Test As New cDIBSection

Temp8x8Index = Val("&H" & TileTable8x8(Index).Text & "&")

Test.CreatePalette Val(TileTablePalette(Index).Text)

If Temp8x8Index < 640 Or Smile.StateGraphicSetCombo1.Text = 27 Then
    Test.CreateMetaTable App.Path & "\files\temp\ure.gfx", Temp8x8Index * 32, 1
Else
    Test.CreateMetaTable App.Path & "\files\temp\cre.gfx", (Temp8x8Index - 640) * 32, 1

End If
    Test.RenderToDC TileTablePicture3(Index).hDC, TempI, 0, 0, 0
    LeftEdge = 0
    RightEdge = 48
    TopEdge = 0
    BottomEdge = 48
    If TileTableHFlip(Index).Value = 1 Then
        LeftEdge = 48
        RightEdge = -49
    End If
    If TileTableVFlip(Index).Value = 1 Then
        TopEdge = 48
        BottomEdge = -49
    End If
    
    StretchBlt TileTablePicture3(Index).hDC, LeftEdge, TopEdge, RightEdge, BottomEdge, TileTablePicture3(Index).hDC, 0, 0, 8, 8, SRCCOPY
    TileTablePicture3(Index).Refresh
End Sub

Private Sub TileTableVFlip_Click(Index As Integer)

End Sub

Private Sub Timer1_Timer()
Dim TempScrollValue As Integer
Dim Index As Integer

Index = Val(FastScrollCommand1(0).Tag)
TempScrollValue = TileTableScroll1.Value
Timer1.Interval = 50
Select Case Index
    Case 0: TempScrollValue = TempScrollValue - 1
    Case 1: TempScrollValue = TempScrollValue + 1
    Case 2: TempScrollValue = TempScrollValue - 32
    Case 3: TempScrollValue = TempScrollValue + 32
End Select

If TempScrollValue < 0 Then TempScrollValue = 0
If TempScrollValue > TileTableScroll1.Max Then TempScrollValue = TileTableScroll1.Max
TileTableScroll1.Value = TempScrollValue

End Sub


Public Sub VScroll1_Change()
GraphicsMenuPreview.Top = -(ScaleY(VScroll1.Value * 16, vbPixels, vbTwips))
End Sub


Private Sub VScroll1_Scroll()
VScroll1_Change
End Sub



