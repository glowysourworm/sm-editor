VERSION 5.00
Begin VB.Form GraphicEditor 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Level Palette and Tile Table Editor"
   ClientHeight    =   9300
   ClientLeft      =   150
   ClientTop       =   390
   ClientWidth     =   12120
   FillColor       =   &H00E0E0E0&
   ForeColor       =   &H00000000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   620
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   808
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   3840
      Left            =   0
      TabIndex        =   85
      Top             =   4560
      Width           =   7935
      Begin VB.VScrollBar VScroll1 
         Height          =   3855
         LargeChange     =   8
         Left            =   7680
         Max             =   16
         TabIndex        =   87
         Top             =   0
         Width           =   255
      End
      Begin VB.PictureBox GraphicsMenuPreview 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   7710
         Left            =   0
         ScaleHeight     =   514
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   514
         TabIndex        =   86
         Top             =   120
         Width           =   7715
         Begin VB.Image Target 
            BorderStyle     =   1  'Fixed Single
            Enabled         =   0   'False
            Height          =   240
            Index           =   1
            Left            =   1440
            Top             =   480
            Width           =   240
         End
      End
   End
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Palette Editor"
      ForeColor       =   &H00000000&
      Height          =   4575
      Index           =   1
      Left            =   0
      TabIndex        =   36
      Top             =   0
      Width           =   3375
      Begin VB.PictureBox Palette2 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         DragMode        =   1  'Automatic
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   240
         ScaleHeight     =   14
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   190
         TabIndex        =   68
         ToolTipText     =   "Drag-and-drop palette holder"
         Top             =   4080
         Width           =   2880
      End
      Begin VB.PictureBox PalettePreview1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1440
         Left            =   1680
         ScaleHeight     =   96
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   96
         TabIndex        =   66
         Top             =   2280
         Width           =   1440
         Begin VB.Image PalettePreviewTarget1 
            Enabled         =   0   'False
            Height          =   255
            Left            =   840
            Picture         =   "SamusForm2.frx":0000
            Top             =   720
            Width           =   255
         End
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "7"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   7
         Left            =   3000
         TabIndex        =   37
         Top             =   1920
         Width           =   255
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "6"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   6
         Left            =   3000
         TabIndex        =   38
         Top             =   1680
         Width           =   255
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "5"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   5
         Left            =   3000
         TabIndex        =   39
         Top             =   1440
         Width           =   255
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "4"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   4
         Left            =   3000
         TabIndex        =   40
         Top             =   1200
         Width           =   255
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "3"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   3
         Left            =   3000
         TabIndex        =   41
         Top             =   960
         Width           =   255
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "2"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   2
         Left            =   3000
         TabIndex        =   42
         Top             =   720
         Width           =   255
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "1"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   1
         Left            =   3000
         TabIndex        =   43
         Top             =   480
         Width           =   255
      End
      Begin VB.PictureBox Palette1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FF8080&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1920
         Left            =   120
         ScaleHeight     =   128
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   192
         TabIndex        =   49
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
      Begin VB.HScrollBar RGBScroll1 
         Height          =   255
         Index           =   1
         Left            =   450
         Max             =   31
         TabIndex        =   47
         Top             =   2550
         Width           =   1100
      End
      Begin VB.HScrollBar RGBScroll1 
         Height          =   255
         Index           =   2
         Left            =   450
         Max             =   31
         TabIndex        =   46
         Top             =   2235
         Width           =   1100
      End
      Begin VB.CommandButton TileTablePalette2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "0"
         DragMode        =   1  'Automatic
         Height          =   255
         Index           =   0
         Left            =   3000
         TabIndex        =   44
         Top             =   240
         Width           =   255
      End
      Begin VB.CheckBox RealTimePalette1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Constantly Save and Update Map"
         Height          =   615
         Left            =   40
         TabIndex        =   45
         Top             =   3120
         Width           =   1500
      End
      Begin VB.HScrollBar RGBScroll1 
         Height          =   255
         Index           =   0
         Left            =   450
         Max             =   31
         TabIndex        =   48
         Top             =   2805
         Width           =   1100
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "00"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C000&
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   52
         Top             =   2175
         Width           =   1425
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H0000FF00&
         Caption         =   "00"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   51
         Top             =   2550
         Width           =   1425
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         Caption         =   "00"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C0C0&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   50
         Top             =   2805
         Width           =   1425
      End
      Begin VB.Label ColorPreviewLabel1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         ForeColor       =   &H80000008&
         Height          =   1665
         Left            =   1560
         TabIndex        =   67
         Top             =   2175
         Width           =   1680
      End
   End
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Special GFX"
      ForeColor       =   &H00000000&
      Height          =   855
      Index           =   3
      Left            =   0
      TabIndex        =   59
      Top             =   8400
      Width           =   12135
      Begin VB.CommandButton SpecialGFXRipSave1 
         Caption         =   "SAVE"
         Height          =   420
         Index           =   1
         Left            =   11040
         TabIndex        =   63
         Top             =   240
         Width           =   855
      End
      Begin VB.CommandButton SpecialGFXRipSave1 
         Caption         =   "RIP"
         Height          =   420
         Index           =   0
         Left            =   10200
         TabIndex        =   62
         Top             =   240
         Width           =   855
      End
      Begin VB.ComboBox SpecialGFXCombo1 
         BackColor       =   &H00E0E0E0&
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
         ItemData        =   "SamusForm2.frx":005E
         Left            =   4800
         List            =   "SamusForm2.frx":0060
         Locked          =   -1  'True
         Style           =   1  'Simple Combo
         TabIndex        =   61
         Text            =   "SpecialGFXCombo1"
         ToolTipText     =   "Palette Number"
         Top             =   240
         Width           =   3615
      End
      Begin VB.ComboBox SpecialGFXCombo1 
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
         ItemData        =   "SamusForm2.frx":0062
         Left            =   120
         List            =   "SamusForm2.frx":0099
         Style           =   2  'Dropdown List
         TabIndex        =   60
         ToolTipText     =   "Palette Number"
         Top             =   240
         Width           =   4695
      End
   End
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Tile Table Editor"
      ForeColor       =   &H00000000&
      Height          =   8415
      Index           =   0
      Left            =   3360
      TabIndex        =   0
      Top             =   0
      Width           =   8775
      Begin VB.VScrollBar Menu8x8VScroll1 
         Height          =   7815
         LargeChange     =   16
         Left            =   8520
         Max             =   31
         TabIndex        =   35
         Top             =   600
         Width           =   255
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   50
         Left            =   120
         Top             =   3960
      End
      Begin VB.CommandButton FastScrollCommand1 
         Height          =   300
         Index           =   3
         Left            =   720
         Picture         =   "SamusForm2.frx":0146
         Style           =   1  'Graphical
         TabIndex        =   84
         Top             =   1800
         Width           =   600
      End
      Begin VB.CommandButton FastScrollCommand1 
         Height          =   300
         Index           =   2
         Left            =   720
         Picture         =   "SamusForm2.frx":01B3
         Style           =   1  'Graphical
         TabIndex        =   83
         Top             =   1200
         Width           =   600
      End
      Begin VB.CommandButton FastScrollCommand1 
         Height          =   300
         Index           =   1
         Left            =   1020
         Picture         =   "SamusForm2.frx":021F
         Style           =   1  'Graphical
         TabIndex        =   82
         Top             =   1500
         Width           =   300
      End
      Begin VB.CommandButton FastScrollCommand1 
         Height          =   300
         Index           =   0
         Left            =   720
         Picture         =   "SamusForm2.frx":0285
         Style           =   1  'Graphical
         TabIndex        =   81
         Top             =   1500
         Width           =   300
      End
      Begin VB.OptionButton Option1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   0
         Left            =   4680
         Style           =   1  'Graphical
         TabIndex        =   78
         Top             =   120
         Width           =   485
      End
      Begin VB.CommandButton TileTableSave1 
         Caption         =   "Save 16x16 Tile to ROM"
         Height          =   375
         Left            =   720
         TabIndex        =   8
         Top             =   3120
         Width           =   2775
      End
      Begin VB.CommandButton TileTableCopy 
         Caption         =   "Paste 16x16"
         Enabled         =   0   'False
         Height          =   255
         Index           =   1
         Left            =   2100
         TabIndex        =   6
         Top             =   2760
         Width           =   1380
      End
      Begin VB.CommandButton TileTableCopy 
         Caption         =   "Copy 16x16"
         Height          =   255
         Index           =   0
         Left            =   720
         TabIndex        =   7
         Top             =   2760
         Width           =   1380
      End
      Begin VB.CommandButton Command2 
         Caption         =   "MULTI-CRE"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1560
         TabIndex        =   65
         Top             =   3840
         Width           =   1215
      End
      Begin VB.TextBox Text1 
         Enabled         =   0   'False
         Height          =   375
         Left            =   1200
         TabIndex        =   64
         Text            =   "81"
         Top             =   3840
         Width           =   375
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H80000008&
         Height          =   7920
         Left            =   4680
         ScaleHeight     =   528
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   256
         TabIndex        =   34
         Top             =   480
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
            TabIndex        =   58
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
      Begin VB.CommandButton TileTablePaletteCommand1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "0"
         Height          =   300
         Index           =   3
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   33
         Top             =   2325
         Width           =   300
      End
      Begin VB.CommandButton TileTablePaletteCommand1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "0"
         Height          =   300
         Index           =   2
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   2325
         Width           =   300
      End
      Begin VB.CommandButton TileTablePaletteCommand1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "0"
         Height          =   300
         Index           =   1
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   600
         Width           =   300
      End
      Begin VB.CommandButton TileTablePaletteCommand1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "0"
         Height          =   300
         Index           =   0
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   600
         Width           =   300
      End
      Begin VB.CheckBox TileTableVFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":02EB
         ForeColor       =   &H00000000&
         Height          =   720
         Index           =   2
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   29
         ToolTipText     =   "Vertical Flip"
         Top             =   1605
         Width           =   300
      End
      Begin VB.CheckBox TileTableVFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":0344
         ForeColor       =   &H80000008&
         Height          =   720
         Index           =   3
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   28
         ToolTipText     =   "Vertical Flip"
         Top             =   1605
         Width           =   300
      End
      Begin VB.CheckBox TileTableVFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":039D
         ForeColor       =   &H00000000&
         Height          =   720
         Index           =   1
         Left            =   3150
         Style           =   1  'Graphical
         TabIndex        =   27
         ToolTipText     =   "Vertical Flip"
         Top             =   900
         Width           =   300
      End
      Begin VB.CheckBox TileTableHFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":03F6
         ForeColor       =   &H00000000&
         Height          =   300
         Index           =   1
         Left            =   2430
         Style           =   1  'Graphical
         TabIndex        =   26
         ToolTipText     =   "Horizontal Flip"
         Top             =   600
         Width           =   720
      End
      Begin VB.CheckBox TileTableHFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":044B
         ForeColor       =   &H00000000&
         Height          =   300
         Index           =   0
         Left            =   1725
         Style           =   1  'Graphical
         TabIndex        =   25
         ToolTipText     =   "Horizontal Flip"
         Top             =   600
         Width           =   720
      End
      Begin VB.CheckBox TileTableVFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":04A0
         ForeColor       =   &H00000000&
         Height          =   720
         Index           =   0
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   24
         ToolTipText     =   "Vertical Flip"
         Top             =   900
         Width           =   300
      End
      Begin VB.CheckBox TileTableHFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":04F9
         ForeColor       =   &H00000000&
         Height          =   300
         Index           =   2
         Left            =   1725
         Style           =   1  'Graphical
         TabIndex        =   23
         ToolTipText     =   "Horizontal Flip"
         Top             =   2325
         Width           =   720
      End
      Begin VB.CheckBox TileTableHFlip 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DownPicture     =   "SamusForm2.frx":054E
         ForeColor       =   &H00000000&
         Height          =   300
         Index           =   3
         Left            =   2430
         Style           =   1  'Graphical
         TabIndex        =   22
         ToolTipText     =   "Horizontal Flip"
         Top             =   2325
         Width           =   720
      End
      Begin VB.CommandButton Command1 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         Enabled         =   0   'False
         Height          =   300
         Left            =   2295
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   1440
         Width           =   300
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "SamusForm2.frx":05A3
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   3
         Left            =   3120
         Picture         =   "SamusForm2.frx":0607
         Style           =   1  'Graphical
         TabIndex        =   14
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
         ItemData        =   "SamusForm2.frx":0668
         Left            =   600
         List            =   "SamusForm2.frx":0684
         Style           =   2  'Dropdown List
         TabIndex        =   16
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
         ItemData        =   "SamusForm2.frx":06A0
         Left            =   3120
         List            =   "SamusForm2.frx":06BC
         Style           =   2  'Dropdown List
         TabIndex        =   15
         ToolTipText     =   "Palette Number"
         Top             =   3960
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "SamusForm2.frx":06D8
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   2
         Left            =   3120
         Picture         =   "SamusForm2.frx":073C
         Style           =   1  'Graphical
         TabIndex        =   13
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
         Left            =   3720
         TabIndex        =   12
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
         Index           =   0
         Left            =   3120
         TabIndex        =   10
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
         ItemData        =   "SamusForm2.frx":079D
         Left            =   3000
         List            =   "SamusForm2.frx":07B9
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Palette Number"
         Top             =   3960
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.CheckBox TileTablePriority 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         DownPicture     =   "SamusForm2.frx":07D5
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   0
         Left            =   3120
         Picture         =   "SamusForm2.frx":0839
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
         DownPicture     =   "SamusForm2.frx":089A
         ForeColor       =   &H80000008&
         Height          =   300
         Index           =   1
         Left            =   3000
         Picture         =   "SamusForm2.frx":08FE
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
         ItemData        =   "SamusForm2.frx":095F
         Left            =   2880
         List            =   "SamusForm2.frx":097B
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
      Begin VB.PictureBox TileTablePicture3 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   720
         Index           =   2
         Left            =   1725
         ScaleHeight     =   46
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   46
         TabIndex        =   19
         Top             =   1605
         Width           =   720
      End
      Begin VB.PictureBox TileTablePicture3 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   720
         Index           =   0
         Left            =   1725
         ScaleHeight     =   46
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   46
         TabIndex        =   20
         Top             =   900
         Width           =   720
      End
      Begin VB.PictureBox TileTablePicture3 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   720
         Index           =   1
         Left            =   2430
         ScaleHeight     =   46
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   46
         TabIndex        =   21
         Top             =   900
         Width           =   720
      End
      Begin VB.PictureBox TileTablePicture3 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   720
         Index           =   3
         Left            =   2430
         ScaleHeight     =   46
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   46
         TabIndex        =   18
         Top             =   1605
         Width           =   720
      End
      Begin VB.Label TileTableLabel1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "000"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   825
         TabIndex        =   11
         Top             =   960
         Visible         =   0   'False
         Width           =   495
      End
   End
   Begin VB.Frame TileTableFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Tile Editing (Export)"
      ForeColor       =   &H00000000&
      Height          =   855
      Index           =   2
      Left            =   1440
      TabIndex        =   53
      Top             =   8400
      Visible         =   0   'False
      Width           =   2415
      Begin VB.CommandButton PointerPopUpCommand1 
         Caption         =   "Show CRE Pointers"
         Height          =   375
         Index           =   0
         Left            =   480
         TabIndex        =   73
         Top             =   240
         Width           =   2655
      End
      Begin VB.VScrollBar TileTableScroll1 
         Height          =   1900
         LargeChange     =   32
         Left            =   0
         Max             =   1023
         TabIndex        =   80
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
         ItemData        =   "SamusForm2.frx":0997
         Left            =   840
         List            =   "SamusForm2.frx":09B3
         Style           =   2  'Dropdown List
         TabIndex        =   79
         ToolTipText     =   "Palette Number"
         Top             =   480
         Visible         =   0   'False
         Width           =   4095
      End
      Begin VB.CommandButton TileTableSaveArray1 
         Caption         =   "Save To Temp Array"
         Height          =   255
         Left            =   1320
         TabIndex        =   77
         Top             =   360
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Export Tile Table"
         Height          =   495
         Left            =   1920
         TabIndex        =   76
         Top             =   240
         Width           =   2175
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Import CRE TileTable"
         Height          =   255
         Index           =   0
         Left            =   2280
         TabIndex        =   75
         Top             =   1200
         Width           =   2775
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Import SCENERY TileTable"
         Height          =   255
         Index           =   1
         Left            =   1440
         TabIndex        =   74
         Top             =   480
         Width           =   2775
      End
      Begin VB.CommandButton PointerPopUpCommand1 
         Caption         =   "Show Scenery Pointers"
         Height          =   375
         Index           =   1
         Left            =   1080
         TabIndex        =   72
         Top             =   360
         Width           =   2655
      End
      Begin VB.CommandButton SavePaletteFile1 
         Caption         =   "Export Palette"
         Height          =   375
         Left            =   720
         TabIndex        =   71
         Top             =   480
         Width           =   1455
      End
      Begin VB.CommandButton LoadPaletteFile1 
         Caption         =   "Import Palette"
         Height          =   375
         Left            =   720
         TabIndex        =   70
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton PaletteCommand1 
         Caption         =   "Save ROM"
         Height          =   495
         Left            =   840
         TabIndex        =   69
         Top             =   360
         Width           =   3120
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Save Scenery GFX File to ROM"
         Height          =   375
         Index           =   4
         Left            =   1200
         TabIndex        =   57
         Top             =   480
         Width           =   2655
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Save CRE GFX File to ROM"
         Height          =   375
         Index           =   3
         Left            =   1080
         TabIndex        =   56
         Top             =   480
         Width           =   2655
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Make Scenery GFX File"
         Height          =   375
         Index           =   1
         Left            =   2160
         TabIndex        =   55
         Top             =   960
         Width           =   2655
      End
      Begin VB.CommandButton RipSaveCommand1 
         Caption         =   "Make CRE GFX File"
         Height          =   375
         Index           =   0
         Left            =   840
         TabIndex        =   54
         Top             =   480
         Width           =   2655
      End
   End
   Begin VB.Menu mnuGFXGFX 
      Caption         =   "GFX"
      Begin VB.Menu mnuGFXCRE 
         Caption         =   "CRE"
         Begin VB.Menu mnuGFXCREExport 
            Caption         =   "Export"
         End
         Begin VB.Menu mnuGFXCREImport 
            Caption         =   "Import"
         End
      End
      Begin VB.Menu mnuGFXSCENERY 
         Caption         =   "SCENERY"
         Begin VB.Menu mnuGFXSceneryExport 
            Caption         =   "Export"
         End
         Begin VB.Menu mnuGFXSceneryImport 
            Caption         =   "Import"
         End
      End
   End
   Begin VB.Menu mnuGFXPalette 
      Caption         =   "Palette"
      Begin VB.Menu mnuGFXExportPalette 
         Caption         =   "Export"
      End
      Begin VB.Menu mnuGFXImportPalette 
         Caption         =   "Import"
      End
      Begin VB.Menu mnuGFXSpacer1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGFXSave 
         Caption         =   "Save"
      End
   End
   Begin VB.Menu mnuGFXTileTable 
      Caption         =   "Tile Table"
      Begin VB.Menu mnuGFXExportTileTables 
         Caption         =   "Export TileTables"
      End
      Begin VB.Menu mnuGFXSpacer2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGFXImportTileTables 
         Caption         =   "Import CRE Tile Table (auto-saves)"
         Index           =   0
      End
      Begin VB.Menu mnuGFXImportTileTables 
         Caption         =   "Import SCENERY Tile Table (auto-saves)"
         Index           =   1
      End
   End
   Begin VB.Menu mnuGFXPointers 
      Caption         =   "Pointers"
      Begin VB.Menu mnuGFXShowPointers 
         Caption         =   "Show CRE Pointers"
         Index           =   0
      End
      Begin VB.Menu mnuGFXShowPointers 
         Caption         =   "Show SCENERY Pointers"
         Index           =   1
      End
   End
End
Attribute VB_Name = "GraphicEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private ColorRow(0 To 15) As Long




Private Sub FastScrollCommand1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempScrollValue As Integer


FastScrollCommand1(0).Tag = Index
Timer1.Interval = 500
Timer1.Enabled = True


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


Private Sub FastScrollCommand1_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = False
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

Private Sub Option1_Click(Index As Integer)
For I = 0 To 7
    Option1(I).FontBold = False
Next I
Option1(Index).FontBold = True

TileTableMenuPalette.Text = Option1(Index).Caption
End Sub

Private Sub Check1_Click(Index As Integer)

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

Public Sub Command4_Click(Index As Integer)
Dim TempPaletteBackup(0 To 127)
Dim OriginalScrollValue As Integer
Dim CMD1 As New OpenSave
CMD1.Filter = "Tile Tables|*.TTB"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then GoTo NoTileTable2
TileTablePath = DD
OriginalScrollValue = TileTableScroll1.Value
If Index = 0 Then GoTo OpenCRETileTable2
GoTo OpenSCENERYTileTable2

NoTileTable2:
MsgBox "No tile table chosen!"
Exit Sub

OpenCRETileTable2:
Open TileTablePath For Binary As #1
    If LOF(1) <> 2048 Then GoTo FailedCRE
    Get #1, 1, CRETileTableBytes()
Close #1

TileTableScroll1.Value = OriginalScrollValue
GoTo RefreshAndClose

OpenSCENERYTileTable2:
Open TileTablePath For Binary As #1
    If LOF(1) = 2048 Then GoTo FailedSCENERY
    Get #1, 1, URETileTableBytes()
Close #1

RefreshAndClose:
If TileTableScroll1.Value = 0 Then
    TileTableScroll1.Value = 1
Else
    TileTableScroll1.Value = 0
End If
TileTableSave1_Click
TileTableScroll1.Value = OriginalScrollValue
TileTableSave1_Click

For I = 0 To 127
    TempPaletteBackup(I) = PcPalette(I)
Next I
RefreshGraphicMenuMask = True
Smile.StateGraphicSetCombo1_Click
For I = 0 To 127
    PcPalette(I) = TempPaletteBackup(I)
Next I
Exit Sub

FailedCRE:
Close #1
MsgBox "Not a valid CRE Tile Table file.", vbInformation, "Whoopsie."
Exit Sub

FailedSCENERY:
Close #1
MsgBox "Not a valid SCENERY Tile Table file.", vbInformation, "Whoopsie."
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub


Public Sub LoadPaletteFile1_Click()
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
If DD = "" Then GoTo NoPalette2
PalettePath = DD
PaletteExtention = UCase$(Right$(PalettePath, 4))
GoTo OpenPalette2

NoPalette2:
MsgBox "No palette chosen!"
Exit Sub

OpenPalette2:
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
GoTo ColorsGet
Colors256:
K = 127
ColorsGet:
        For I = 0 To K
            Get #1, , MyBitMapPalette
            PcPalette(I) = RGB(MyBitMapPalette.Blue, MyBitMapPalette.Green, MyBitMapPalette.Red)
        Next I
        GoTo ClosingPaletteFile
End If




'loads colors to boxes
Open PalettePath For Binary As #1
    If PaletteExtention = ".TPL" Then Get #1, 1, PaletteHeader
For I = 0 To 127
    Get #1, , BB
    Get #1, , GG
    Get #1, , RR
    PcPalette(I) = RGB(RR, GG, BB)
Next I
ClosingPaletteFile:
Close #1
Palette1_MouseDown 1, 0, 4, 6
End Sub


Private Sub mnuGFXCREExport_Click()
RipSaveCommand1_Click 0
End Sub

Private Sub mnuGFXCREImport_Click()
RipSaveCommand1_Click 3
End Sub


Private Sub mnuGFXExportPalette_Click()
SavePaletteFile1_Click
End Sub

Private Sub mnuGFXExportTileTables_Click()
Command3_Click
End Sub

Private Sub mnuGFXImportPalette_Click()
LoadPaletteFile1_Click
End Sub

Private Sub mnuGFXImportTileTables_Click(Index As Integer)
Command4_Click Index
GraphicsMenuPreview.Picture = Smile.MenuPicture1.Image
End Sub

Private Sub mnuGFXSave_Click()
PaletteCommand1_Click
GraphicsMenuPreview.Picture = Smile.MenuPicture1.Image
End Sub

Private Sub mnuGFXSceneryExport_Click()
RipSaveCommand1_Click 1
End Sub

Private Sub mnuGFXSceneryImport_Click()
RipSaveCommand1_Click 4
End Sub

Private Sub mnuGFXShowPointers_Click(Index As Integer)
PointerPopUpCommand1_Click Index
End Sub

Private Sub Palette1_DragDrop(Source As Control, X As Single, Y As Single)
'only allow dropping from the clipboard palette
If DraggedDropped.Index <> 255 Then Exit Sub
TileTablePalette2_DragDrop (Y \ 16), Palette1, 0, 0
End Sub

Public Sub PaletteCommand1_Click()
'saving palette changes
Dim I As Long
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

For I = 0 To 127
    SnesPalette(I) = PcPaletteToSnesPalette(PcPalette(I))
    SnesByteArray(I * 2) = Val("&H" & Right$("0000" & Hex$(SnesPalette(I)), 2))
    SnesByteArray((I * 2) + 1) = Val("&H" & Left$(Right$("0000" & Hex$(SnesPalette(I)), 4), 2))
Next I
'recompress data
RecompressedPaletteSize = RecompressPalette(SnesByteArray(), CompressedSnesPalette())
'resize output array
ReDim Preserve CompressedSnesPalette(0 To RecompressedPaletteSize - 1)
'find place to put data, then save it to the ROM

'ReadGraphicsSetPointers GraphicsSetPointers
GraphicsSet = Val(Smile.StateGraphicSetCombo1.ListIndex) + 1
CurrentOffset = GetPaletteOffset(GraphicsSet)
NextHighest = 0
For I = 1 To 29
    If GetPaletteOffset(I) > CurrentOffset Then
        If NextHighest = 0 Then NextHighest = I
        If GetPaletteOffset(I) < GetPaletteOffset(NextHighest) Then NextHighest = I
    End If
Next I

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
Picture1.Move 0, 0, 128, 1024
Picture2.DragIcon = Smile.BTS_Image1.DragIcon
Palette2.DragIcon = Smile.BTS_Image1.DragIcon

'create palette option boxes for main graphical preview of 8x8's
For I = 1 To 7
    Load Option1(I)
    Option1(I).Left = Option1(I - 1).Left + Option1(I).Width
    Option1(I).Caption = I
    Option1(I).Visible = True
Next I

'palette data
UpdatePalettePreview
Palette1_MouseDown 1, 0, 4, 6
'8x8 Data
Option1(0).Value = True
'TileTableMenuPalette.Text = 0
If RoomHeader1.RegionCombo1.Text = "CERES" And Val("&H" & RoomHeader1.Unknown4Text1) <> 6 Then TileTableScroll1.Max = TileTableScroll1.Max - 256
TileTableScroll1.Value = 0
Open App.Path & "\files\special_gfx.txt" For Binary As #1
    For I = 0 To 16
        Get #1, (I * 7) + 1, TempString
        SpecialGFXCombo1(1).AddItem TempString
    Next I
Close #1
SpecialGFXCombo1(0).Text = SpecialGFXCombo1(0).List(0)
GraphicsMenuPreview.Picture = Smile.MenuPicture1.Image
GridGraphicMenuPreview
End Sub

Public Sub Palette1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempPaletteIndex As Byte
Shape1.Move X - 4, Y - 4
TempPaletteIndex = ((Y \ 16) * 16) + (X \ 12)
GraphicEditor.Caption = TempPaletteIndex
FlipRGB PcPalette(TempPaletteIndex)

'9 for temp hold on actions
RGBScroll1(0).Tag = 9
    RGBScroll1(0).Value = RR \ 8
    RGBScroll1(1).Value = GG \ 8
    RGBScroll1(2).Value = BB \ 8
RGBScroll1(0).Tag = 0
RGBScroll1_Change 0
End Sub






Private Sub PalettePreview1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
RGBScroll1(1).Value = X \ 3
RGBScroll1(0).Value = Y \ 3
GraphicEditor.BackColor = RGB(RGBScroll1(2).Value * 8, RGBScroll1(1).Value * 8, RGBScroll1(0).Value * 8)
PalettePreviewTarget1.Left = X - 8
PalettePreviewTarget1.Top = Y - 8
ColorPreviewLabel1.BackColor = GraphicEditor.BackColor

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




Public Sub Palette2_DragDrop(Source As Control, X As Single, Y As Single)
'only accept drops from palette dropper
If DraggedDropped.Trait <> 1 Then Exit Sub
'get the data for ColorRow (ie- do the copy)
For I = (DraggedDropped.Index * &H10) To (DraggedDropped.Index * &H10) + 15
    ColorRow(I - (DraggedDropped.Index * &H10)) = PcPalette(I)
Next I
'paint the clipboard palette preview
UpdatePaletteClipboardPreview
End Sub

Private Sub Palette2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
DraggedDropped.Trait = 255
DraggedDropped.Index = 255
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

Public Sub RGBScroll1_Change(Index As Integer)
Dim MyRed As Long
Dim MyGreen As Long
Dim MyBlue As Long
Dim XX As Integer
Dim YY As Integer

'9 for temp hold on actions
If RGBScroll1(0).Tag = 9 Then Exit Sub
RR = RGBScroll1(2).Value * 8
GG = RGBScroll1(1).Value * 8
BB = RGBScroll1(0).Value * 8

GraphicEditor.BackColor = RGB(RR, GG, BB)

'changing palette entry
PcPalette(Val(GraphicEditor.Caption)) = FlipRGB(GraphicEditor.BackColor)

UpdatePalettePreview
If RealTimePalette1.Value = 1 Then
    PaletteCommand1_Click
End If

'refresh gradient
RefreshGradient:
'If Index <> 2 Then GoTo MoveGradientTarget
MyRed = RGBScroll1(2).Value
For MyGreen = 0 To 31
    For MyBlue = 0 To 31
        XX = MyGreen * 3
        YY = MyBlue * 3
        PalettePreview1.Line (XX, YY)-(XX + 2, YY + 2), RGB(MyRed * 8, MyGreen * 8, MyBlue * 8), BF
    Next MyBlue
Next MyGreen
'move target
MoveGradientTarget:
PalettePreviewTarget1.Left = (RGBScroll1(1).Value * 3) - 8
PalettePreviewTarget1.Top = (RGBScroll1(0).Value * 3) - 8
ColorPreviewLabel1.BackColor = GraphicEditor.BackColor

Label1(0).Caption = Right$("00" & Hex$(RGBScroll1(0).Value), 2)
Label1(1).Caption = Right$("00" & Hex$(RGBScroll1(1).Value), 2)
Label1(2).Caption = Right$("00" & Hex$(RGBScroll1(2).Value), 2)
End Sub




Private Sub RGBScroll1_Scroll(Index As Integer)
RGBScroll1_Change Index
End Sub


Public Sub UpdatePalettePreview()
'128 colors for scenery
'2nd 128, not sure
For I = 0 To 127
    YY = (I \ 16) * 16
    XX = (I Mod 16) * 12
    Palette1.Line (XX, YY)-(XX + 12, YY + 16), FlipRGB(PcPalette(I)), BF   'PcPalette(i), BF
Next I
Palette1.Refresh
End Sub


Public Sub UpdatePaletteClipboardPreview()
'16 colors for scenery
For I = 0 To 15
    YY = 0
    XX = I * 12
    Palette2.Line (XX, YY)-(XX + 12, YY + 16), FlipRGB(ColorRow(I)), BF
Next I
Palette2.Refresh
End Sub


Public Sub RipSaveCommand1_Click(Index As Integer)
Dim OutputArray() As Byte
Dim RipTiles() As Byte
Dim IsCRE As Boolean
Dim DataAddress As Long
Dim TempOffset(1) As ThreeByte
Dim TempASMByte As Byte

If Index = 0 Then IsCRE = True: GoTo MakeGFXFile
If Index = 1 Then IsCRE = False: GoTo MakeGFXFile

'locating GFX file
Dim GFXPath As String
Dim CMD1 As New OpenSave
CMD1.Filter = "GFX|*.GFX"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then GoTo NoGFXFile
GFXPath = DD
'CRE or not?
If Index = 3 Then GoTo SaveCREToROM
If Index = 4 Then GoTo SaveSheetToROM

NoGFXFile:
MsgBox "No GFX file chosen!", vbOKOnly, "Nothing will be done."
Exit Sub

MakeGFXFile:
DecompressTilesForRip Smile.StateGraphicSetCombo1.Text, RipTiles, IsCRE
Exit Sub


SaveCREToROM:
'0000-000F chosen
If MyState.U1 >= 0 And MyState.U1 < 10 Then
    TempCREIndex = MyState.U1
End If
'this is a pointer
If MyState.U1 < 0 Then
    TempCREIndex = MyRoomVar.MultiVar1 And Val("&H000F")
End If

Open needslash For Binary As #1
    'get the offset for tiles (assuming no ASM)
    Get #1, &H16415 + ROM_HEADER + 1, TempOffset(0).Byte3
    Get #1, &H16419 + ROM_HEADER + 1, TempOffset(0).Byte1
    Get #1, , TempOffset(0).Byte2
    'ASM fix for tiles in here
    Get #1, &H16413 + ROM_HEADER + 1, TempASMByte
    If &H20 = TempASMByte Then
        Get #1, &H17FA0 + TempCREIndex * 3 + ROM_HEADER + 1, TempOffset(0).Byte1
        Get #1, , TempOffset(0).Byte2
        Get #1, , TempOffset(0).Byte3
    End If
    
    
Close #1
CRETilesOffset = ThreePoint2Offset(TempOffset(0))
'fix for kejardon
If Kejardon00 = True Then CRETilesOffset = Val(&H1C8000)


ReDim CRETiles(0 To &H2FFF&) As Byte
ReDim NewData(0 To &HFFFF&) As Byte

Open GFXPath For Binary As #1
If LOF(1) <> &H3000& Then MsgBox "What did you do?!!" & vbCrLf & "Are you sure this is the CRE?", vbQuestion, "Not going to save.": Close #1: Exit Sub
    Get #1, , CRETiles
Close #1
DD = RecompressData(CRETiles(), NewData())
ReDim Preserve NewData(0 To DD - 1) As Byte
MsgBox "Recompressed size = $" & Hex$(DD)
'CRE OFFSET
DataAddress = CRETilesOffset

Open needslash For Binary As #1
   Put #1, DataAddress + ROM_HEADER + 1, NewData()
Close #1
TileTableMenuPalette_Click
Exit Sub

SaveSheetToROM:
ReDim VarTiles(0 To &HFFFF&) As Byte
ReDim NewData(0 To &HFFFF&) As Byte
Dim GraphicsSetPointers() As Long
Dim ArrayIndex

'find location of sheet's tiles
LunarOpenFile needslash, LC_READWRITE
ReadGraphicsSetPointers GraphicsSetPointers
ArrayIndex = (Smile.StateGraphicSetCombo1.Text * 3) - 1
DataAddress = GraphicsSetPointers(ArrayIndex)
LunarCloseFile
'open decompressed sheet
Open GFXPath For Binary As #1
    If LOF(1) = 0 Then MsgBox "No file, so nothing will be done.", vbOKOnly, "Not going to do it.": Close #1: Exit Sub
    Get #1, , VarTiles
    ReDim Preserve VarTiles(0 To LOF(1) - 1) As Byte
Close #1

DD = RecompressData(VarTiles(), NewData())
ReDim Preserve NewData(0 To DD - 1) As Byte
MsgBox "Recompressed size = $" & Hex$(DD)
'''''''''''''''''''''''''''
Open needslash For Binary As #1
    Put #1, DataAddress + ROM_HEADER + 1, NewData()
Close #1
TileTableMenuPalette_Click
Exit Sub

End Sub

Public Sub SavePaletteFile1_Click()
Dim MyColor1 As Long
Dim PalettePath As String
Dim PaletteHeader As String
Dim LastSlash As Long


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
PalettePath = Left$(needslash, Len(needslash) - 4) & "_" & Right$("000" & Smile.StateGraphicSetCombo1.Text, 3) & PaletteExtention
Open PalettePath For Binary As #1
If Len(PaletteHeader) > 0 Then Put #1, 1, PaletteHeader

For I = 0 To 127
    FlipRGB PcPalette(I)
    Put #1, , BB
    Put #1, , GG
    Put #1, , RR
Next I
'fill rest of 256 colors with blackness for yy-char
BB = 0
For I = 128 To 255
    Put #1, , BB
    Put #1, , BB
    Put #1, , BB
Next I

Close #1
MsgBox "Palette saved to " & Chr$(34) & PalettePath & Chr$(34)
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
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
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
'copy and paste the data of a 16x16 tile
If Index = 0 Then GoTo CopyingTable
If Index = 1 Then GoTo PastingTable

CopyingTable:
For iiii = 0 To 3
    TileTable8x8(iiii).Tag = TileTable8x8(iiii).Text
    TileTablePalette(iiii).Tag = TileTablePalette(iiii).Text
    TileTablePriority(iiii).Tag = TileTablePriority(iiii).Value
    TileTableVFlip(iiii).Tag = TileTableVFlip(iiii).Value
    TileTableHFlip(iiii).Tag = TileTableHFlip(iiii).Value
Next iiii
TileTableCopy(1).Enabled = True
Exit Sub

PastingTable:
For iiii = 0 To 3
    TileTable8x8(iiii).Text = TileTable8x8(iiii).Tag
    TileTablePalette(iiii).Text = TileTablePalette(iiii).Tag
    TileTablePriority(iiii).Value = TileTablePriority(iiii).Tag
    TileTableVFlip(iiii).Value = TileTableVFlip(iiii).Tag
    TileTableHFlip(iiii).Value = TileTableHFlip(iiii).Tag
Next iiii
TileTableSaveArray1_Click
Exit Sub
End Sub






Private Sub TileTableFrame1_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
Palette2_DragDrop TileTableFrame1(5), 0, 0
End Sub

Private Sub TileTableFrame1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
DraggedDropped.Trait = 255
DraggedDropped.Index = 255
End Sub

Private Sub TileTableHFlip_Click(Index As Integer)
UpdateLarge8x8 Index
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
    Test.RenderToDC Picture1.hdc, TempI, 0, TempX, TempY
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
    Test.RenderToDC Picture1.hdc, TempI, 0, TempX, TempY
    TempX = TempX + 8
    If TempX = 128 Then TempX = 0: TempY = TempY + 8
Next TempI


'make "table" for CRE 8x8's (unless Kraid's room)
If GraphicsSet = 27 Then GoTo Render8x8TileSheetPreview         'if Kraid's room, don't draw CRE (it would cover up some of the graphics)
TempY = 320
Test.CreateMetaTable App.Path & "\files\temp\cre.gfx", 0, 384
For TempI = 0 To 383
    Test.RenderToDC Picture1.hdc, TempI, 0, TempX, TempY
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






Public Sub TileTablePalette2_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
'only accept drops from the copied color row dragger
If DraggedDropped.Trait <> 255 Then Exit Sub
'swap color row into pcpalette data
For I = 0 To 15
    PcPalette((Index * &H10) + I) = ColorRow(I)
Next I
'refresh palette
RGBScroll1_Change 0

End Sub



Private Sub TileTablePalette2_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
DraggedDropped.Trait = 1
DraggedDropped.Index = Index
DraggedDropped.Shift = Shift
End Sub

Private Sub TileTablePaletteCommand1_Click(Index As Integer)
Dim TempScrollValue As Byte

TempScrollValue = Val(TileTablePalette(Index).Text)
TempScrollValue = TempScrollValue + 1
If TempScrollValue > 7 Then TempScrollValue = 0
TileTablePalette(Index).Text = TempScrollValue
End Sub

Private Sub TileTablePicture3_Click(Index As Integer)

TileTablePriority(Index).Value = Abs(TileTablePriority(Index).Value - 1)
'TileTablePicture3(Index).ZOrder Abs(TileTablePriority(Index).Value - 1)

End Sub

Public Sub TileTablePicture3_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
Dim TempIndex As Integer

Select Case DraggedDropped.Trait
    Case 0: TileTable8x8(Index).Text = Hex$(DraggedDropped.Index)
    Case 1: TileTablePalette(Index).Text = DraggedDropped.Index
    Case 2: TileTable8x8(Index).Text = TileTable8x8(DraggedDropped.Index).Text
    Case 255: Exit Sub
    Case Else: MsgBox "Oops on drag drop!"
End Select
'shift wasn't held
If DraggedDropped.Shift = 0 Then GoTo ExitTileTablePicture3
'not an 8x8 tile (palette instead)
If DraggedDropped.Trait = 1 Then GoTo PaletteDragged
'not the upper left tile
If Index <> 0 Then GoTo ExitTileTablePicture3
'shift was held when we started dragging so do all 4 8x8's
DraggedDropped.Shift = 0        'make sure we don't go into an infinite loop
If DraggedDropped.Index Mod 16 = 15 Then GoTo ExitTileTablePicture3 'to close to the edge to do all 4
If DraggedDropped.Trait = 2 Then GoTo ExitTileTablePicture3 'dragged from large to large... don't try to copy all
'place the next 3 tiles
DraggedDropped.Index = DraggedDropped.Index + 1
TileTablePicture3_DragDrop Index + 1, Source, X, Y
DraggedDropped.Index = DraggedDropped.Index + 15
TileTablePicture3_DragDrop Index + 2, Source, X, Y
DraggedDropped.Index = DraggedDropped.Index + 1
TileTablePicture3_DragDrop Index + 3, Source, X, Y

ExitTileTablePicture3:
For TempIndex = 0 To 3
    UpdateLarge8x8 TempIndex
Next TempIndex
Exit Sub

PaletteDragged:
DraggedDropped.Shift = 0
TileTablePicture3_DragDrop 0, Source, X, Y
TileTablePicture3_DragDrop 1, Source, X, Y
TileTablePicture3_DragDrop 2, Source, X, Y
TileTablePicture3_DragDrop 3, Source, X, Y
End Sub





Private Sub TileTablePicture3_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Shift > 1 Then Shift = 1
TileTablePicture3(Index).DragMode = Shift
If Shift = 1 Then
    DraggedDropped.Index = Index
    DraggedDropped.Trait = 2
End If

End Sub

Private Sub TileTablePriority_Click(Index As Integer)
TileTablePicture3(Index).ZOrder Abs(TileTablePriority(Index).Value - 1)
End Sub

Public Sub TileTableSave1_Click()
Dim OutputArray() As Byte
Dim RecompressTTable As Long
Dim ToSaveArray() As Byte   'array for saving
Dim TempPaletteBackup(0 To 127) As Long 'preserve the palette, in case changes to it haven't been saved

'save most recent changed tiles (on screen changes)
TileTableSaveArray1_Click
'CRE TILE TABLE
ReDim OutputArray(0 To 8192) As Byte  'larger than needed, to prevent crash, then shrink
RecompressTTable = RecompressData(CRETileTableBytes(), OutputArray())
TrimArray OutputArray(), RecompressTTable, ToSaveArray()  'fit the data
'ready to save CRE
Open needslash For Binary As #1
    Put #1, CRETTableOffset + ROM_HEADER + 1, ToSaveArray
Close #1

'URE TILE TABLE
ReDim OutputArray(0 To 8192) As Byte  'larger than needed, to prevent crash, then shrink
RecompressTTable = RecompressData(URETileTableBytes(), OutputArray())
TrimArray OutputArray(), RecompressTTable, ToSaveArray()  'fit the data
'ready to save URE
Open needslash For Binary As #1
    Put #1, URETTableOffset + ROM_HEADER + 1, ToSaveArray
Close #1


For I = 0 To 127
    TempPaletteBackup(I) = PcPalette(I)
Next I
RefreshGraphicMenuMask = True
Smile.StateGraphicSetCombo1_Click
GraphicsMenuPreview.Picture = Smile.MenuPicture1.Image
For I = 0 To 127
    PcPalette(I) = TempPaletteBackup(I)
Next I
GridGraphicMenuPreview
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

'move fake target
Target(1).Move Smile.Target(0).Left, Smile.Target(0).Top
'adjust scrollbar as needed
TempScrollValue = VScroll1.Value
If Target(1).Top < VScroll1.Value * 16 Then TempScrollValue = Target(1).Top \ 16
If Target(1).Top > (VScroll1.Value * 16) + 240 Then
    TempScrollValue = TempScrollValue + 1
End If

If TempScrollValue < 0 Then TempScrollValue = 0
If TempScrollValue > VScroll1.Max Then TempScrollValue = VScroll1.Max
VScroll1.Value = TempScrollValue
GridGraphicMenuPreview
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
StretchBlt Picture2.hdc, 0, -(Menu8x8VScroll1.Value * 16), 256, 2048, Picture1.hdc, 0, 0, 128, 1024, SRCCOPY
Picture2.Refresh
End Sub

Private Sub Menu8x8VScroll1_Scroll()
Menu8x8VScroll1_Change
End Sub

Private Sub TileTableVFlip_Click(Index As Integer)
UpdateLarge8x8 Index
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
    Test.RenderToDC TileTablePicture3(Index).hdc, TempI, 0, 0, 0
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
    
    StretchBlt TileTablePicture3(Index).hdc, LeftEdge, TopEdge, RightEdge, BottomEdge, TileTablePicture3(Index).hdc, 0, 0, 8, 8, SRCCOPY
    TileTablePicture3(Index).Refresh
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



Private Sub GridGraphicMenuPreview()
For ZZ = 0 To 512 Step 16
    GraphicsMenuPreview.Line (ZZ, 0)-(ZZ, 512), RGB(100, 100, 100)
    GraphicsMenuPreview.Line (0, ZZ)-(512, ZZ), RGB(100, 100, 100)
Next ZZ
GraphicsMenuPreview.Refresh
End Sub
