VERSION 5.00
Begin VB.Form Palette1 
   BackColor       =   &H00808080&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enemy Palette Editor"
   ClientHeight    =   3555
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3495
   ClipControls    =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   237
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   233
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox PalettePreview1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1440
      Left            =   1830
      ScaleHeight     =   96
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   96
      TabIndex        =   10
      Top             =   240
      Width           =   1440
      Begin VB.Image PalettePreviewTarget1 
         Enabled         =   0   'False
         Height          =   255
         Left            =   840
         Picture         =   "Palette1.frx":0000
         Top             =   720
         Width           =   255
      End
   End
   Begin VB.CommandButton LoadTPL1 
      Caption         =   "Import Palette"
      Height          =   255
      Left            =   0
      TabIndex        =   9
      Top             =   240
      Width           =   1440
   End
   Begin VB.CommandButton SaveTPL1 
      Caption         =   "Export Palette"
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   1440
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cancel"
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   3300
      Width           =   3495
   End
   Begin VB.CommandButton SavePalette1 
      Caption         =   "Save ROM"
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   2940
      Width           =   3495
   End
   Begin VB.HScrollBar rgbScroll1 
      Height          =   255
      Index           =   2
      Left            =   480
      Max             =   31
      TabIndex        =   2
      Top             =   2640
      Width           =   2895
   End
   Begin VB.HScrollBar rgbScroll1 
      Height          =   255
      Index           =   1
      Left            =   480
      Max             =   31
      TabIndex        =   1
      Top             =   2400
      Width           =   2895
   End
   Begin VB.HScrollBar rgbScroll1 
      Height          =   255
      Index           =   0
      Left            =   480
      Max             =   31
      TabIndex        =   0
      Top             =   2100
      Width           =   2895
   End
   Begin VB.Label ColorLabel1 
      BackColor       =   &H00FFFFFF&
      Height          =   360
      Index           =   0
      Left            =   0
      TabIndex        =   12
      Top             =   480
      Width           =   360
   End
   Begin VB.Label ColorPreviewLabel1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1920
      Left            =   1575
      TabIndex        =   11
      Top             =   0
      Width           =   1920
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF0000&
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C0C0&
      Height          =   240
      Index           =   2
      Left            =   0
      TabIndex        =   6
      Top             =   2640
      Width           =   3495
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0000FF00&
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   240
      Index           =   1
      Left            =   0
      TabIndex        =   5
      Top             =   2400
      Width           =   3495
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H000000FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   360
      Index           =   0
      Left            =   0
      TabIndex        =   4
      Top             =   2040
      Width           =   3495
   End
End
Attribute VB_Name = "Palette1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'rgbScroll1(0).Tag . . . remember index of last clicked
'rgbScroll1(1).Tag . . . 1 to cancel color replace on scroll (when setting scrolls), else run it through as normal

Public Sub ColorLabel1_Click(Index As Integer)
RGBScroll1(0).Tag = Index
For I = 0 To 15
    ColorLabel1(I).BorderStyle = 0
Next I
ColorLabel1(Index).BorderStyle = 1
ColorLabel1_Retrieve (Index)
End Sub



Private Sub Command1_Click()
Unload Me
End Sub


Private Sub Form_Load()
Me.Icon = Smile.Icon
For I = 1 To 15
    Load ColorLabel1(I)
    ColorLabel1(I).Left = ColorLabel1(I - 1).Left + 24
    ColorLabel1(I).Top = ColorLabel1(I - 1).Top
    If ColorLabel1(I).Left > 71 + ColorLabel1(0).Width Then
        ColorLabel1(I).Left = ColorLabel1(0).Left
        ColorLabel1(I).Top = ColorLabel1(I).Top + ColorLabel1(0).Width
    End If
    ColorLabel1(I).Visible = True
Next I
ColorLabel1(0).BorderStyle = 1

ColorLabel1_Update
ColorLabel1_Click 0
End Sub


Public Sub ColorLabel1_Update()
'set colors in boxes
Dim MyColor1 As Integer

Open needslash For Binary As #1
For I = 0 To 15
    Get #1, pPaletteOffset + ROM_HEADER + (I * 2) + 1, MyColor1
    PaletteFromBytes (Val("&H" & Hex$(MyColor1) & "&"))
    ColorLabel1(I).BackColor = RGB(pRR * 8, pGG * 8, pBB * 8)
Next I
Close #1
End Sub

Public Sub ColorLabel1_Retrieve(Index As Integer)
'grab color in box
BytesFromPalette ColorLabel1(Index).BackColor
'don't allow replace color
RGBScroll1(1).Tag = 1
'set scroll values
RGBScroll1(0).Value = pRR
RGBScroll1(1).Value = pGG
RGBScroll1(2).Value = pBB
'allow replace color
RGBScroll1(1).Tag = 0
RGBScroll1(0).Tag = Index
End Sub


Public Sub ColorLabel1_Replace()
If RGBScroll1(1).Tag = 1 Then Exit Sub
ColorLabel1(Val(RGBScroll1(0).Tag)).BackColor = RGB(RGBScroll1(0) * 8, RGBScroll1(1) * 8, RGBScroll1(2) * 8)
End Sub

Private Sub LoadTPL1_Click()
Dim PalettePath As String
Dim PaletteHeader As String * 4
Dim PaletteExtention As String
Dim CMD1 As New OpenSave

CMD1.Filter = "Usable Palettes|*.TPL;*.PAL;*.FPL;*.BMP"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then GoTo NoPalette
PalettePath = DD
PaletteExtention = UCase$(Right$(PalettePath, 4))
GoTo OpenPalette

NoPalette:
MsgBox "No palette chosen!"
Exit Sub

OpenPalette:
'loads colors to boxes
If PaletteExtention = ".BMP" Then
    'VerifyBMP
    Open PalettePath For Binary As #1
        Get #1, , MyBitmapFileHeader
        Get #1, , MyBitmapImageHeader
        If MyBitmapImageHeader.BitCount = 4 Then GoTo Colors16
        If MyBitmapImageHeader.BitCount = 8 Then GoTo Colors256
'neither 16 or 256 color image
        MsgBox "Bitmap needs to be 16 color or 256 color (ie- 4-bit or 8-bit).", vbInformation, "Whoopsie!"
        Close #1
        Exit Sub
'16 or 256 colors.... treat the same (for now)
Colors16:
Colors256:
        For I = 0 To 15
            Get #1, , MyBitMapPalette
            ColorLabel1(I).BackColor = RGB(MyBitMapPalette.Red, MyBitMapPalette.Green, MyBitMapPalette.Blue)
        Next I
        GoTo ClosingPaletteFile
End If

Open PalettePath For Binary As #1
If PaletteExtention = ".TPL" Then Get #1, 1, PaletteHeader
For I = 0 To 15
    Get #1, , pRR
    Get #1, , pGG
    Get #1, , pBB
    ColorLabel1(I).BackColor = RGB(pRR, pGG, pBB)
    If MSPalette = True Then Get #1, , pRR 'just a blank spot for a marker
Next I

ClosingPaletteFile:
Close #1
ColorLabel1_Click 0
End Sub




Private Sub PalettePreview1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 1 Then Exit Sub
'keep it inside the control
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X \ 3 > 31 Then X = 93
If Y \ 3 > 31 Then Y = 93
'select this point
PalettePreview1_MouseDown Button, Shift, X, Y
End Sub

Private Sub PalettePreview1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
RGBScroll1(1).Value = X \ 3
RGBScroll1(2).Value = Y \ 3
ColorLabel1(RGBScroll1(0).Tag).BackColor = RGB(RGBScroll1(0).Value * 8, RGBScroll1(1).Value * 8, RGBScroll1(2).Value * 8)
PalettePreviewTarget1.Left = X - 8
PalettePreviewTarget1.Top = Y - 8
ColorPreviewLabel1.BackColor = ColorLabel1(RGBScroll1(0).Tag).BackColor

End Sub

Public Sub RGBScroll1_Change(Index As Integer)
ColorLabel1_Replace
Dim MyRed As Byte
Dim MyGreen As Byte
Dim MyBlue As Byte
Dim XX As Byte
Dim YY As Byte

'ColorLabel1(RGBScroll1(0).Tag).BackColor = RGB(rgbScroll1(0).Value * 8, rgbScroll1(1).Value * 8, rgbScroll1(2).Value * 8)
'Label3.BackColor = ColorLabel1(RGBScroll1(0).Tag).BackColor
'If Index > 0 Then Exit Sub
MyRed = RGBScroll1(0).Value

For MyGreen = 0 To 31
    For MyBlue = 0 To 31
        XX = MyGreen * 3
        YY = MyBlue * 3
        PalettePreview1.Line (XX, YY)-(XX + 2, YY + 2), RGB(MyRed * 8, MyGreen * 8, MyBlue * 8), BF
    Next MyBlue
Next MyGreen
PalettePreviewTarget1.Left = (RGBScroll1(1).Value * 3) - 8
PalettePreviewTarget1.Top = (RGBScroll1(2).Value * 3) - 8
ColorLabel1(Val(RGBScroll1(0).Tag)).BackColor = RGB(RGBScroll1(0).Value * 8, RGBScroll1(1).Value * 8, RGBScroll1(2).Value * 8)
ColorPreviewLabel1.BackColor = ColorLabel1(Val(RGBScroll1(0).Tag)).BackColor
Label1(Index).Caption = Right$("00" & Hex$(RGBScroll1(Index).Value), 2)
End Sub

Private Sub RGBScroll1_Scroll(Index As Integer)
RGBScroll1_Change Index
End Sub

Private Sub SavePalette1_Click()
'saves colors from boxes
Dim MyColor1 As Integer
Open needslash For Binary As #1
For I = 0 To 15
    MyColor1 = Val("&H" & BytesFromPalette(ColorLabel1(I).BackColor) & "&")
    Put #1, pPaletteOffset + ROM_HEADER + (I * 2) + 1, MyColor1
Next I
Close #1
Unload Me
End Sub

Private Sub SaveTPL1_Click()
Dim LastSlash As Integer
Dim PalettePath As String
Dim PaletteHeader As String
Dim OneColor As String * 3
Dim PaletteExtention As String

If Smile.mnuPaletteType(0).Checked = True Then
    PaletteHeader = "TPL" & Chr$(0)
    PaletteExtention = ".tpl"
End If

If Smile.mnuPaletteType(1).Checked = True Then
    PaletteHeader = ""
    PaletteExtention = ".pal"
End If

If Smile.mnuPaletteType(2).Checked = True Then
    PaletteHeader = Chr$(6) & "FTP1" & Chr$(46) & Chr$(48)
    PaletteExtention = ".fpl"
End If

LastSlash = InStrRev(needslash, "\")
If LastSlash = 0 Then MsgBox "SMILE's path must have a " & Chr$(34) & "\" & Chr$(34) & " in it." & vbCrLf & "Are you on a Mac?": Exit Sub
PalettePath = Left$(needslash, LastSlash) & SpeciesForm.EnemySpecies.Text & PaletteExtention

'saves colors from boxes
Dim MyColor1 As Long
Open PalettePath For Binary As #1
    If Len(PaletteHeader) > 0 Then Put #1, 1, PaletteHeader
For I = 0 To 15
    MyColor1 = ColorLabel1(I).BackColor
    BytesFromPalette (ColorLabel1(I).BackColor)
    pRR = pRR * 8: pGG = pGG * 8: pBB = pBB * 8
    Put #1, , pRR
    Put #1, , pGG
    Put #1, , pBB
Next I
'fill rest of 256 colors with blackness for yy-char
BB = 0
For I = 16 To 255
    Put #1, , BB
    Put #1, , BB
    Put #1, , BB
Next I

Close #1
MsgBox "Palette saved to " & Chr$(34) & PalettePath & Chr$(34)
End Sub
