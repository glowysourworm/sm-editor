VERSION 5.00
Begin VB.Form SamusForm 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Beauty Salon (SABS)"
   ClientHeight    =   7485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8235
   Icon            =   "SamusForm.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   499
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   549
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton SaveTPL1 
      Caption         =   "Export Palette"
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   6600
      Width           =   3135
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Save To ROM"
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   7080
      Width           =   8235
   End
   Begin VB.HScrollBar ColorScroll 
      Height          =   255
      Index           =   2
      Left            =   2025
      Max             =   31
      TabIndex        =   33
      Tag             =   "0"
      Top             =   5190
      Width           =   1100
   End
   Begin VB.HScrollBar ColorScroll 
      Height          =   255
      Index           =   0
      Left            =   2025
      Max             =   31
      TabIndex        =   32
      Tag             =   "0"
      Top             =   4695
      Width           =   1100
   End
   Begin VB.HScrollBar ColorScroll 
      Height          =   255
      Index           =   1
      Left            =   2025
      Max             =   31
      TabIndex        =   31
      Tag             =   "0"
      Top             =   4935
      Width           =   1100
   End
   Begin VB.PictureBox PalettePreview1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1440
      Left            =   120
      ScaleHeight     =   96
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   96
      TabIndex        =   30
      Top             =   4800
      Width           =   1440
      Begin VB.Image PalettePreviewTarget1 
         Enabled         =   0   'False
         Height          =   255
         Left            =   840
         Picture         =   "SamusForm.frx":030A
         Top             =   720
         Width           =   255
      End
   End
   Begin VB.CommandButton LoadTPL1 
      Caption         =   "Import Palette"
      Height          =   255
      Left            =   0
      TabIndex        =   29
      Top             =   6360
      Width           =   3135
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   2880
      Left            =   75
      Picture         =   "SamusForm.frx":0368
      ScaleHeight     =   192
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   192
      TabIndex        =   24
      Top             =   1320
      Visible         =   0   'False
      Width           =   2880
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   375
      Left            =   0
      Max             =   0
      TabIndex        =   23
      Top             =   4320
      Width           =   3120
   End
   Begin VB.HScrollBar RGBFadeScroll1 
      Height          =   255
      Index           =   0
      LargeChange     =   5
      Left            =   7335
      Max             =   -1
      Min             =   -32
      TabIndex        =   8
      Top             =   6735
      Value           =   -8
      Width           =   750
   End
   Begin VB.HScrollBar RGBFadeScroll1 
      Height          =   255
      Index           =   2
      LargeChange     =   5
      Left            =   7335
      Max             =   -1
      Min             =   -32
      TabIndex        =   10
      Top             =   6225
      Value           =   -8
      Width           =   750
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Wash Out Colors"
      Height          =   750
      Index           =   3
      Left            =   6360
      TabIndex        =   6
      Top             =   6240
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Heat Glow"
      Height          =   750
      Index           =   4
      Left            =   5520
      TabIndex        =   14
      Top             =   6240
      Width           =   855
   End
   Begin VB.OptionButton Option1 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00E0E0E0&
      Height          =   300
      Index           =   0
      Left            =   3120
      TabIndex        =   7
      Top             =   0
      Width           =   300
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Paste"
      Height          =   375
      Index           =   1
      Left            =   3360
      TabIndex        =   5
      Top             =   6615
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Copy"
      Height          =   375
      Index           =   0
      Left            =   3360
      TabIndex        =   4
      Top             =   6240
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Rows All The Same"
      Height          =   750
      Index           =   2
      Left            =   4080
      TabIndex        =   3
      Top             =   6240
      Width           =   1335
   End
   Begin VB.HScrollBar RGBFadeScroll1 
      Height          =   255
      Index           =   1
      LargeChange     =   5
      Left            =   7335
      Max             =   -1
      Min             =   -32
      TabIndex        =   9
      Top             =   6480
      Value           =   -8
      Width           =   750
   End
   Begin VB.PictureBox PalettePreview 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   2880
      Left            =   75
      ScaleHeight     =   192
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   192
      TabIndex        =   25
      Top             =   1320
      Width           =   2880
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Samus Palettes"
      Height          =   4335
      Index           =   0
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   3135
      Begin VB.ComboBox Combo2 
         Height          =   315
         ItemData        =   "SamusForm.frx":4BEA
         Left            =   70
         List            =   "SamusForm.frx":4C15
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Top             =   1035
         Width           =   2880
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         ItemData        =   "SamusForm.frx":4CA7
         Left            =   70
         List            =   "SamusForm.frx":4CB4
         Style           =   2  'Dropdown List
         TabIndex        =   19
         Top             =   480
         Width           =   2880
      End
      Begin VB.Label Label2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Suit:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   0
         Left            =   75
         TabIndex        =   22
         Top             =   240
         Width           =   1800
      End
      Begin VB.Label Label2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Condition:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   1
         Left            =   70
         TabIndex        =   21
         Top             =   795
         Width           =   1800
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Special GFX Palettes"
      Height          =   4335
      Index           =   1
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   3135
      Begin VB.CommandButton Command2 
         Caption         =   "What's this?"
         Height          =   420
         Left            =   1920
         TabIndex        =   28
         Top             =   555
         Visible         =   0   'False
         Width           =   1140
      End
      Begin VB.TextBox PalSetAddText1 
         Appearance      =   0  'Flat
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
         Left            =   60
         MaxLength       =   6
         TabIndex        =   27
         Text            =   "000000"
         Top             =   555
         Width           =   1268
      End
      Begin VB.TextBox MaxColText1 
         Appearance      =   0  'Flat
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
         Left            =   1315
         MaxLength       =   2
         TabIndex        =   26
         Text            =   "0F"
         Top             =   555
         Width           =   540
      End
      Begin VB.ComboBox Combo3 
         Height          =   315
         ItemData        =   "SamusForm.frx":4CCF
         Left            =   40
         List            =   "SamusForm.frx":4CF4
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Top             =   240
         Width           =   3030
      End
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF0000&
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   2
      Left            =   1680
      TabIndex        =   37
      Tag             =   "0"
      Top             =   5190
      Width           =   1440
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0000FF00&
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   1
      Left            =   1680
      TabIndex        =   36
      Tag             =   "0"
      Top             =   4935
      Width           =   1440
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H000000FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   270
      Index           =   0
      Left            =   1680
      TabIndex        =   35
      Tag             =   "0"
      Top             =   4680
      Width           =   1440
   End
   Begin VB.Label ColorPreviewLabel1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF0000&
      ForeColor       =   &H80000008&
      Height          =   1665
      Left            =   0
      TabIndex        =   34
      Top             =   4680
      Width           =   1680
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Drag to Copy"
      DragMode        =   1  'Automatic
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Index           =   6
      Left            =   1755
      TabIndex        =   15
      Top             =   5700
      Width           =   1305
   End
   Begin VB.Label Label1 
      BackColor       =   &H0000FF00&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   5
      Left            =   7335
      TabIndex        =   13
      Top             =   6495
      Width           =   900
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FF0000&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   4
      Left            =   7335
      TabIndex        =   12
      Top             =   6750
      Width           =   900
   End
   Begin VB.Label Label1 
      BackColor       =   &H000000FF&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   3
      Left            =   7335
      TabIndex        =   11
      Top             =   6240
      Width           =   900
   End
   Begin VB.Label ColorLabel1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   0
      Left            =   3420
      TabIndex        =   1
      Top             =   0
      Width           =   300
   End
End
Attribute VB_Name = "SamusForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private SPal As SamusPaletteSet 'address of palette set pieces
Private JColor(0 To 15) As Long 'QBColor equivalents
Private ClippedColor(0 To 15) As Long  'clipboard of colors to save between clicks
Private PalSetAdd As Long   'address of current palette set (suit & condition) (one to save to)
Private MaxCol As Integer        'number of colors in set (divisible by 16)
Private PalSpace As Integer    'space in between padded palettes (ie- extra bytes in between palettes in the same set)




Private Sub ColorLabel1_Click(Index As Integer)
Dim MyRed As Byte
Dim MyGreen As Byte
Dim MyBlue As Byte
Dim XX As Byte
Dim YY As Byte

For I = 0 To 255
    ColorLabel1(I).BorderStyle = 0
Next I
ColorLabel1(Index).BorderStyle = 1

ColorLabel1(0).Tag = Index
BytesFromPalette ColorLabel1(Index).BackColor
ColorScroll(0).Tag = 1
ColorScroll(0).Value = pRR
ColorScroll(1).Value = pGG
ColorScroll(2).Value = pBB
ColorScroll(0).Tag = 0
Label1(6).BackColor = RGB(ColorScroll(0).Value * 8, ColorScroll(1).Value * 8, ColorScroll(2).Value * 8)

'update preview
MyRed = ColorScroll(0).Value
For MyGreen = 0 To 31
    For MyBlue = 0 To 31
        XX = MyGreen * 3
        YY = MyBlue * 3
        PalettePreview1.Line (XX, YY)-(XX + 2, YY + 2), RGB(MyRed * 8, MyGreen * 8, MyBlue * 8), BF
    Next MyBlue
Next MyGreen
PalettePreviewTarget1.Left = (ColorScroll(1).Value * 3) - 8
PalettePreviewTarget1.Top = (ColorScroll(2).Value * 3) - 8
ColorPreviewLabel1.BackColor = ColorLabel1(ColorLabel1(0).Tag).BackColor
End Sub

Private Sub ColorLabel1_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
ColorLabel1(Index).BackColor = Label1(6).BackColor
End Sub

Private Sub ColorScroll_Change(Index As Integer)
'If ColorScroll(0).Tag = "1" Then Exit Sub
ColorLabel1(Val(ColorLabel1(0).Tag)).BackColor = RGB(ColorScroll(0).Value * 8, ColorScroll(1).Value * 8, ColorScroll(2).Value * 8)
Label1(6).BackColor = RGB(ColorScroll(0).Value * 8, ColorScroll(1).Value * 8, ColorScroll(2).Value * 8)
Label1(6).ForeColor = RGB(255 - (ColorScroll(0).Value * 8), 255 - (ColorScroll(1).Value * 8), 255 - (ColorScroll(2).Value * 8))

RefreshSamusPreview
Label1(Index).Caption = ColorScroll(Index).Value

'the following line caused transparency color to change along with the intended color
'commented out for now... any side effects?
'ColorLabel1_Replace
Dim MyRed As Byte
Dim MyGreen As Byte
Dim MyBlue As Byte
Dim XX As Byte
Dim YY As Byte

    'ColorLabel1(ColorScroll(0).Tag).BackColor = RGB(ColorScroll(0).Value * 8, ColorScroll(1).Value * 8, ColorScroll(2).Value * 8)
    'Label3.BackColor = ColorLabel1(ColorScroll(0).Tag).BackColor
    'If Index > 0 Then Exit Sub
MyRed = ColorScroll(0).Value

For MyGreen = 0 To 31
    For MyBlue = 0 To 31
        XX = MyGreen * 3
        YY = MyBlue * 3
        PalettePreview1.Line (XX, YY)-(XX + 2, YY + 2), RGB(MyRed * 8, MyGreen * 8, MyBlue * 8), BF
    Next MyBlue
Next MyGreen
PalettePreviewTarget1.Left = (ColorScroll(1).Value * 3) - 8
PalettePreviewTarget1.Top = (ColorScroll(2).Value * 3) - 8
    'ColorLabel1(Val(ColorScroll(0).Tag)).BackColor = RGB(ColorScroll(0).Value * 8, ColorScroll(1).Value * 8, ColorScroll(2).Value * 8)
ColorPreviewLabel1.BackColor = ColorLabel1(Val(ColorScroll(0).Tag)).BackColor
Label1(Index).Caption = Right$("00" & Hex$(ColorScroll(Index).Value), 2)
ColorPreviewLabel1.BackColor = ColorLabel1(ColorLabel1(0).Tag).BackColor

End Sub

Private Sub ColorScroll_Scroll(Index As Integer)
ColorScroll_Change Index
End Sub

Private Sub Combo1_Click()
'LOADING ADDRESSES OF PALETTES
If Combo1.Text = "Samus" Then
    SPal.DefaultAddress = Val("&HD9400&")
    SPal.ChargeAddress = Val("&HD9820&")
    SPal.ChargeReleaseAddress = Val("&H8D7A2&")
    SPal.HeatAddress = Val("&H6E466&")
    SPal.SpeedBoost = Val("&HD9B20&")
    SPal.SpeedSquat = Val("&HD9BA0&")
    SPal.ShineSpark = Val("&HD9C20&")
    SPal.ScrewAttack = Val("&HD9CA0&")
    SPal.LoaderAddress1 = Val("&H6DB6B&")
    SPal.LoaderAddress2 = Val("&H6DBBA&")
    SPal.LoaderAddress3 = Val("&H6DC09&")
    SPal.LoaderAddress4 = Val("&H6DC58&")
    SPal.LoaderAddress5 = Val("&H6DCA4&")
End If

If Combo1.Text = "Varia" Then
    SPal.DefaultAddress = Val("&HD9520&")
    SPal.ChargeAddress = Val("&HD9920&")
    SPal.ChargeReleaseAddress = Val("&H8D7A2&")
    SPal.HeatAddress = Val("&H6E692&")
    SPal.SpeedBoost = Val("&HD9D20&")
    SPal.SpeedSquat = Val("&HD9DA0&")
    SPal.ShineSpark = Val("&HD9E20&")
    SPal.ScrewAttack = Val("&HD9EA0&")
    SPal.LoaderAddress1 = Val("&H6DCD1&")
    SPal.LoaderAddress2 = Val("&H6DD20&")
    SPal.LoaderAddress3 = Val("&H6DD6F&")
    SPal.LoaderAddress4 = Val("&H6DDBE&")
    SPal.LoaderAddress5 = Val("&H6DE0A&")
End If

If Combo1.Text = "Gravity" Then
        SPal.DefaultAddress = Val("&HD9800&")
        SPal.ChargeAddress = Val("&HD9A20&")
        SPal.ChargeReleaseAddress = Val("&H8D7A2&")
    SPal.HeatAddress = Val("&H6E8BE&")
        SPal.SpeedBoost = Val("&HD9F20&")
        SPal.SpeedSquat = Val("&HD9FA0&")
        SPal.ShineSpark = Val("&HDA020&")
        SPal.ScrewAttack = Val("&HDA0A0&")
        SPal.LoaderAddress1 = Val("&H6DE37&")
        SPal.LoaderAddress2 = Val("&H6DE86&")
        SPal.LoaderAddress3 = Val("&H6DED5&")
        SPal.LoaderAddress4 = Val("&H6DF24&")
        SPal.LoaderAddress5 = Val("&H6DF70&")
End If
Combo2_Click
End Sub


Private Sub Combo2_Click()
'LOAD PALETTE DATA
Dim TempByte(1) As Byte
Dim TempLong As Long

'fade = 0 to 7
If Combo1.Text = "" Then Combo1.Text = Combo1.List(0)
Select Case Combo2.Text
    Case "Default": PalSetAdd = SPal.DefaultAddress: MaxCol = 15: PalSpace = 0
    Case "Charge": PalSetAdd = SPal.ChargeAddress: MaxCol = 127: PalSpace = 0
    Case "Charge Release": PalSetAdd = SPal.ChargeReleaseAddress: MaxCol = 0: PalSpace = 0
    Case "Heat": PalSetAdd = SPal.HeatAddress: MaxCol = &HFF: PalSpace = 1
    Case "Speed Boost": PalSetAdd = SPal.SpeedBoost: MaxCol = 63: PalSpace = 0
    Case "Speed Squat": PalSetAdd = SPal.SpeedSquat: MaxCol = 63: PalSpace = 0
    Case "Shine Spark": PalSetAdd = SPal.ShineSpark: MaxCol = 63: PalSpace = 0
    Case "Screw Attack": PalSetAdd = SPal.ScrewAttack: MaxCol = 63: PalSpace = 0
    Case "Loader 1": PalSetAdd = SPal.LoaderAddress1: MaxCol = 15: PalSpace = 0
    Case "Loader 2": PalSetAdd = SPal.LoaderAddress2: MaxCol = 15: PalSpace = 0
    Case "Loader 3": PalSetAdd = SPal.LoaderAddress3: MaxCol = 15: PalSpace = 0
    Case "Loader 4": PalSetAdd = SPal.LoaderAddress4: MaxCol = 15: PalSpace = 0
    Case "Loader 5": PalSetAdd = SPal.LoaderAddress5: MaxCol = 15: PalSpace = 0
    Case Else: MsgBox "Palette Set Unknown!"
End Select
    
Open needslash For Binary As #1
'get colors, depending on suit and condition
For I = 0 To MaxCol
    Get #1, PalSetAdd + ROM_HEADER + (I * 2) + (PalSpace * (I \ 16) * 2) + 0 + 1, TempByte(0)
    Get #1, PalSetAdd + ROM_HEADER + (I * 2) + (PalSpace * (I \ 16) * 2) + 1 + 1, TempByte(1)
    
    TempLong = Val("&H" & Right$("00" & Hex$(TempByte(1)), 2) & Right$("00" & Hex$(TempByte(0)), 2) & "&")
'MsgBox TempLong
    PaletteFromBytes TempLong
    ColorLabel1(I).BackColor = RGB(pRR * 8, pGG * 8, pBB * 8)
Next I
Close #1

'hide non-palette portion of colorlabels
For I = 0 To 255
    If I <= MaxCol Then
        ColorLabel1(I).Visible = True
    Else
        ColorLabel1(I).Visible = False
    End If
Next I
'hid non-palette options
For I = 0 To 15
    Option1(I).Visible = ColorLabel1(I * 16).Visible
Next I
ColorLabel1_Click 0
'always select top one
If Option1(0).Value = True Then Option1_Click 0: Exit Sub   'if already checked, this won't refresh, so we force it
Option1(0).Value = True 'also refreshes samus preview


End Sub


Private Sub Combo3_Click()
'LOAD PALETTE DATA
Dim TempByte(1) As Byte
Dim TempPointer As ThreeByte
Dim TempLong As Long


Select Case Combo3.Text
    Case "Title Stuff": PalSetAdd = &H661E9: MaxCol = &HFF: PalSpace = 0    'lots of palettes for the title
    Case "Intro 1": PalSetAdd = &H664C9: MaxCol = &HF: PalSpace = 0         'ground of intro
    Case "Intro 2": PalSetAdd = &H66419: MaxCol = &HF: PalSpace = 0         'intro ground
    Case "Intro 3": PalSetAdd = &H66569: MaxCol = &H2F: PalSpace = 0        'intro samus, booms, life forms
    Case "Beam Palettes": PalSetAdd = &H843E1: MaxCol = &H4F: PalSpace = 0  'beam palettes
    Case "Spore Spawn: Damage Gradients": PalSetAdd = &H12E359: MaxCol = &HCF: PalSpace = 0
    Case "Spore Spawn: Foreground Gradients": PalSetAdd = &H12E4F9: MaxCol = &H6F: PalSpace = 0
    Case "Spore Spawn: Background Gradients": PalSetAdd = &H12E5D9: MaxCol = &H6F: PalSpace = 0
    Case "Gold Torizo": PalSetAdd = &H150787: MaxCol = &H1F: PalSpace = 0
    Case "Palette Blends": PalSetAdd = &H4AA02: MaxCol = &H7F: PalSpace = 0
    Case "I'm A Genius": PalSetAdd = Val("&H" & PalSetAddText1.Text & "&"): MaxCol = Val("&H" & MaxColText1.Text): PalSpace = 0
End Select


'$12387D [#5F] - Looks like Crocomire maybe? Not sure.
'$133107 [#8F] - Some sort of gradient. Might be related to Ridley's room, not sure.
'$13614F [#8C] - Some of this looks like Metroid colors. The rest I'm not sure about.
'$137871 [#3F] - No fucking clue. X-ray colors? Hell if I know. Apparently, changes the nodule in Ceres' elevator, maybe
'others too.
'$138687 [#1F] - Guessing Kraid. Strangely small.
'$13B3F3 [#8F] - Paydirt. 99% this is Kraid's "damaged" colors. Don't ignore the other options though.
'$13B533 [#7F] - Connected to above set. Could be possible one of these is Botwoon and the other is Kraid.
'$13CA01 [#9F] - No clue, looks cool though. Some sort of special tileset palette maybe?
'$13CB41 [#7F] - Phantooooooooooon Gonzaleeeeeeeez
'$13F225 [#8F] - Looks Kraid-like at first but I don't know what the gradient is for.

If Combo3.Text <> "I'm A Genius" Then
    PalSetAddText1.Text = Right$("000000" & Hex$(PalSetAdd), 6)
    MaxColText1.Text = Right$("00" & Hex$(MaxCol), 2)
    PalSetAddText1.Enabled = False
    MaxColText1.Enabled = False
Else
    PalSetAddText1.Enabled = True
    MaxColText1.Enabled = True
End If


Open needslash For Binary As #1
'get colors, depending on suit and condition
For I = 0 To MaxCol
    Get #1, PalSetAdd + ROM_HEADER + (I * 2) + (PalSpace * (I \ 16) * 2) + 0 + 1, TempByte(0)
    Get #1, PalSetAdd + ROM_HEADER + (I * 2) + (PalSpace * (I \ 16) * 2) + 1 + 1, TempByte(1)

    TempLong = Val("&H" & Right$("00" & Hex$(TempByte(1)), 2) & Right$("00" & Hex$(TempByte(0)), 2) & "&")
    PaletteFromBytes TempLong
    ColorLabel1(I).BackColor = RGB(pRR * 8, pGG * 8, pBB * 8)
Next I
Close #1

'hide non-palette portion of colorlabels
For I = 0 To 255
    If I <= MaxCol Then
        ColorLabel1(I).Visible = True
    Else
        ColorLabel1(I).Visible = False
    End If
Next I
'hid non-palette options
For I = 0 To 15
    Option1(I).Visible = ColorLabel1(I * 16).Visible
Next I
ColorLabel1_Click 0
'always select top one
If Option1(0).Value = True Then Option1_Click 0: Exit Sub   'if already checked, this won't refresh, so we force it
Option1(0).Value = True 'also refreshes samus preview



End Sub

Private Sub Command1_Click(Index As Integer)
Dim TempLong As Long
Dim TempRGB As Integer  'incase result > 255
'special power tools to speed up faders and such
If Index = 0 Then GoTo ClipCopy     'copy to color clipboard
If Index = 1 Then GoTo ClipPaste    'paste from color clipboard
If Index = 2 Then GoTo CopyDown     'clone row
If Index = 3 Then GoTo FadeDown     'attempt a fade
If Index = 4 Then GoTo HeatGlow     'attempt heat glow

ClipCopy:
For I = 0 To 15
    ClippedColor(I) = ColorLabel1(I + (16 * Val(Option1(0).Tag))).BackColor
Next I
GoTo EndPalettePowerTools

ClipPaste:
For I = 0 To 15
    ColorLabel1(I + (16 * Val(Option1(0).Tag))).BackColor = ClippedColor(I)
Next I
GoTo EndPalettePowerTools

CopyDown:
For I = 0 To 255
    ColorLabel1(I).BackColor = ColorLabel1((16 * Val(Option1(0).Tag)) + (I Mod 16)).BackColor
Next I
GoTo EndPalettePowerTools

FadeDown:
For IDepth = 16 To 240 Step 16
If ColorLabel1(IDepth).Visible = False Then Exit For
    For I = 0 To 15
        TempLong = PcPaletteToSnesPalette(ColorLabel1(I).BackColor)
        PaletteFromBytes TempLong
        TempRGB = pRR + (((32 - pRR) / Abs(RGBFadeScroll1(0).Value)) * (IDepth \ 16))
        If TempRGB > 255 Then TempRGB = 255
        pRR = TempRGB
        TempRGB = pGG + (((32 - pGG) / Abs(RGBFadeScroll1(1).Value)) * (IDepth \ 16))
        If TempRGB > 255 Then TempRGB = 255
        pGG = TempRGB
        TempRGB = pBB + (((32 - pBB) / Abs(RGBFadeScroll1(2).Value)) * (IDepth \ 16))
        If TempRGB > 255 Then TempRGB = 255
        pBB = TempRGB
        ColorLabel1(IDepth + I).BackColor = RGB(pBB * 8, pGG * 8, pRR * 8)
    Next I
Next IDepth
GoTo EndPalettePowerTools


HeatGlow:
For IDepth = 16 To 120 Step 16
If ColorLabel1(IDepth).Visible = False Then Exit For
    For I = 0 To 15
        TempLong = PcPaletteToSnesPalette(ColorLabel1(I).BackColor)
        PaletteFromBytes TempLong
            TempRGB = pRR + (((32 - pRR) / Abs(RGBFadeScroll1(0).Value)) * (IDepth \ 16))
            If TempRGB > 255 Then TempRGB = 255
            pRR = TempRGB
            TempRGB = pGG + (((32 - pGG) / Abs(RGBFadeScroll1(1).Value)) * (IDepth \ 16))
            If TempRGB > 255 Then TempRGB = 255
            pGG = TempRGB
            TempRGB = pBB + (((32 - pBB) / Abs(RGBFadeScroll1(2).Value)) * (IDepth \ 16))
            If TempRGB > 255 Then TempRGB = 255
            pBB = TempRGB
        ColorLabel1(IDepth + I).BackColor = RGB(pBB * 8, pGG * 8, pRR * 8)
        ColorLabel1(240 - IDepth + I).BackColor = ColorLabel1(IDepth + I).BackColor
    Next I
Next IDepth
For I = 0 To 15
    ColorLabel1(240 + I).BackColor = ColorLabel1(I).BackColor
Next I

GoTo EndPalettePowerTools

EndPalettePowerTools:
RefreshSamusPreview
End Sub

Private Sub Command2_Click()
MsgBox "Text box on the left is the offset of the palette (no header)." & vbCrLf & "Text on the right is how many colors (-1) are in the palette (in hex).", vbInformation, "And you said you were a genius!"
End Sub

Private Sub Command3_Click() 'SAVING
Dim TempByte(1) As Byte
Dim FailByte(1) As Byte
Dim TempLong As String      '(posing as Long)

Open needslash For Binary As #1
'normal colors
For I = 0 To MaxCol
TempLong = BytesFromPalette(ColorLabel1(I).BackColor)
TempByte(1) = Val("&H" & Left$(TempLong, 2))
TempByte(0) = Val("&H" & Right$(TempLong, 2))
    Put #1, PalSetAdd + ROM_HEADER + (I * 2) + (PalSpace * (I \ 16) * 2) + 0 + 1, TempByte(0)
    Put #1, PalSetAdd + ROM_HEADER + (I * 2) + (PalSpace * (I \ 16) * 2) + 1 + 1, TempByte(1)
Next I
Close #1
End Sub





Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub



Private Sub HScroll1_Change()
Frame1(HScroll1.Value).ZOrder 0
'samus palettes preview shown in front of frame instead
'of in frame, due to scaling issues inside frame
If HScroll1.Value = 0 Then
    PalettePreview.ZOrder 0
    Picture1.ZOrder 0
End If

Select Case HScroll1.Value
    Case 0: Combo2_Click
    Case 1: Combo3_Click
End Select
End Sub

Private Sub HScroll1_Scroll()
HScroll1_Change
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
K = 15
GoTo ColorsGrab
Colors256:
K = 255
ColorsGrab:
        For I = 0 To K
            Get #1, , MyBitMapPalette
            ColorLabel1(I).BackColor = RGB(MyBitMapPalette.Red, MyBitMapPalette.Green, MyBitMapPalette.Blue)
        Next I
        GoTo ClosingPaletteFile
End If



'loads colors to boxes
Open PalettePath For Binary As #1
    If PaletteExtention = ".TPL" Then Get #1, 1, PaletteHeader
For I = 0 To 255
    Get #1, , pRR
    Get #1, , pGG
    Get #1, , pBB
    ColorLabel1(I).BackColor = RGB(pRR, pGG, pBB)
Next I

ClosingPaletteFile:
Close #1
ColorLabel1_Click 0
End Sub

Private Sub MaxColText1_Change()
    Combo3_Click
End Sub

Private Sub Option1_Click(Index As Integer)
    Option1(0).Tag = Index
    RefreshSamusPreview
End Sub

Private Sub PalettePreview_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempClickedColor As Long
'if only one color, don't choose from the whole row
If ColorLabel1(1).Visible = False Then Exit Sub
'update colors and scrolls
TempClickedColor = PalettePreview.Point(X, Y)

For I = 0 To 15
    If TempClickedColor = ColorLabel1(I + (16 * Val(Option1(0).Tag))).BackColor Then ColorLabel1_Click Val(I + (16 * Val(Option1(0).Tag))): Exit Sub
Next I
End Sub



Public Sub PalettePreview1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 1 Then Exit Sub
'keep it inside the control
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X \ 3 > 31 Then X = 93
If Y \ 3 > 31 Then Y = 93
'select this point
PalettePreview1_MouseDown Button, Shift, X, Y
End Sub


Public Sub PalettePreview1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
ColorScroll(1).Value = X \ 3
ColorScroll(2).Value = Y \ 3
'ColorLabel1(ColorScroll(0).Tag).BackColor = RGB(ColorScroll(0).Value * 8, ColorScroll(1).Value * 8, ColorScroll(2).Value * 8)
PalettePreviewTarget1.Left = X - 8
PalettePreviewTarget1.Top = Y - 8
ColorPreviewLabel1.BackColor = ColorLabel1(ColorScroll(0).Tag).BackColor

End Sub


Private Sub PalSetAddText1_Change()
MaxColText1_Change
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
PalettePath = Left$(needslash, LastSlash) & Combo1.Text & PaletteExtention

'saves colors from boxes
Dim MyColor1 As Long
Open PalettePath For Binary As #1
    If Len(PaletteHeader) > 0 Then Put #1, 1, PaletteHeader
For I = 0 To 15
    MyColor1 = ColorLabel1(I + (16 * Val(Option1(0).Tag))).BackColor
    BytesFromPalette (ColorLabel1(I + (16 * Val(Option1(0).Tag))).BackColor)
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


Private Sub Form_Load()
'will be QBColor equivalents, for this monitor
HScroll1.Max = Frame1.UBound
For I = 0 To 15
    JColor(I) = Picture1.Point(I, 0)
Next I

For I = 1 To 15
    Load Option1(I)
    Option1(I).Top = Option1(I - 1).Top + Option1(0).Height
    Option1(I).Visible = True
Next I

For I = 1 To &HFF
    Load ColorLabel1(I)
    ColorLabel1(I).Left = ColorLabel1(I - 1).Left + ColorLabel1(I).Width
    ColorLabel1(I).Top = ColorLabel1(I - 1).Top
    ColorLabel1(I).Visible = True
    If ColorLabel1(I).Left > ColorLabel1(0).Left + (ColorLabel1(0).Width * 15) Then
        ColorLabel1(I).Top = ColorLabel1(I).Top + ColorLabel1(I).Height
        ColorLabel1(I).Left = ColorLabel1(0).Left
    End If
Next I
ColorLabel1(0).BorderStyle = 1

Combo3.Text = Combo3.List(0)
Combo2.Text = Combo2.List(0)
Combo1.Text = Combo1.List(0)
ColorLabel1_Click 0
End Sub



Private Sub RefreshSamusPreview()
If HScroll1.Value > 0 Then Exit Sub
Dim TempColorArray(0 To 15) As Long 'slight speed increase over accessing .backcolor

'if only one color, make sure whole palette is that color
If MaxCol = 0 Then
    For I = 0 To 15
        ColorLabel1(I).BackColor = ColorLabel1(0).BackColor
    Next I
End If
'only doing the first 15, as I am not concerned about the preview of all faders
'loading color values to be used to paint samus picture
For TempI = 0 To 15
    TempColorArray(TempI) = ColorLabel1(TempI + (16 * Val(Option1(0).Tag))).BackColor
Next TempI

'copy background color over entire visible preview
'StretchBlt PalettePreview.hdc, 0, 0, 120, 188, Picture1.hdc, 2, 2, 1, 1, SRCCOPY
'draw QB/JColor version of Samus (15 pixels to side due to increased size of box
StretchBlt PalettePreview.hdc, 0, 0, 192, 192, Picture1.hdc, 0, 0, 192, 192, SRCCOPY
'paint over the "test pixels" (used for color accuracy between computers)
StretchBlt PalettePreview.hdc, 0, 0, 16, 2, Picture1.hdc, 2, 2, 1, 1, SRCCOPY

For TempY = 0 To PalettePreview.Height Step 4
For TempX = 0 To PalettePreview.Width Step 4
    TempColor = PalettePreview.Point(TempX, TempY)
    For TempI = 0 To 15
        If TempColor = JColor(TempI) Then
            TempColor = TempColorArray(TempI)
            Exit For
        End If
    Next TempI
PalettePreview.Line (TempX, TempY)-(TempX + 3, TempY + 3), TempColor, BF
Next TempX
Next TempY
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
ColorScroll(1).Tag = 1
'set scroll values
ColorScroll(0).Value = pRR
ColorScroll(1).Value = pGG
ColorScroll(2).Value = pBB
'allow replace color
ColorScroll(1).Tag = 0
ColorScroll(0).Tag = Index
End Sub


Public Sub ColorLabel1_Replace()
'If ColorScroll(1).Tag = 1 Then Exit Sub
'ColorLabel1(Val(ColorScroll(0).Tag)).BackColor = RGB(ColorScroll(0) * 8, ColorScroll(1) * 8, ColorScroll(2) * 8)
End Sub




