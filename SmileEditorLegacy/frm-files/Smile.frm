VERSION 5.00
Begin VB.Form Smile 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   ClientHeight    =   7140
   ClientLeft      =   120
   ClientTop       =   555
   ClientWidth     =   11910
   ControlBox      =   0   'False
   Icon            =   "Smile.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   476
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   794
   Tag             =   "0"
   Begin VB.Timer LoadTimer1 
      Interval        =   10
      Left            =   75
      Top             =   7320
   End
   Begin VB.CommandButton FavoritesHearts1 
      Appearance      =   0  'Flat
      Caption         =   "Favorites Hearts"
      DisabledPicture =   "Smile.frx":08CA
      DownPicture     =   "Smile.frx":0C5B
      Height          =   885
      Left            =   525
      Picture         =   "Smile.frx":130E
      Style           =   1  'Graphical
      TabIndex        =   62
      Top             =   6585
      Visible         =   0   'False
      Width           =   1785
   End
   Begin VB.PictureBox BrowserBar1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF0000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   0
      Picture         =   "Smile.frx":16B2
      ScaleHeight     =   480
      ScaleWidth      =   11970
      TabIndex        =   60
      Top             =   0
      Width           =   11970
      Begin VB.CommandButton TaskCommand1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         DownPicture     =   "Smile.frx":304F4
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   11145
         Picture         =   "Smile.frx":3093A
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   225
         Width           =   780
      End
      Begin VB.CommandButton TaskCommand1 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         DownPicture     =   "Smile.frx":30D61
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   11415
         Picture         =   "Smile.frx":30EF8
         Style           =   1  'Graphical
         TabIndex        =   67
         Top             =   0
         Width           =   270
      End
      Begin VB.CommandButton TaskCommand1 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         DownPicture     =   "Smile.frx":31092
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   11685
         Picture         =   "Smile.frx":31310
         Style           =   1  'Graphical
         TabIndex        =   66
         Top             =   0
         Width           =   270
      End
      Begin VB.CommandButton TaskCommand1 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         DownPicture     =   "Smile.frx":31598
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   0
         Left            =   11145
         Picture         =   "Smile.frx":31681
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   0
         Width           =   270
      End
      Begin VB.ComboBox mdbCombo 
         Appearance      =   0  'Flat
         BackColor       =   &H0000FF00&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         ItemData        =   "Smile.frx":31772
         Left            =   1305
         List            =   "Smile.frx":31774
         Style           =   2  'Dropdown List
         TabIndex        =   70
         Top             =   195
         Width           =   1095
      End
      Begin VB.TextBox newmdbText1 
         Appearance      =   0  'Flat
         BackColor       =   &H0000FFFF&
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   10665
         MaxLength       =   5
         TabIndex        =   68
         Text            =   "CLICK"
         Top             =   225
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.ComboBox TestCodeList1 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   315
         Left            =   2415
         Style           =   2  'Dropdown List
         TabIndex        =   69
         Tag             =   "0"
         ToolTipText     =   "Alternate Rooms"
         Top             =   195
         Width           =   2805
      End
      Begin VB.Shape BrowserTarget 
         Height          =   480
         Left            =   4305
         Top             =   0
         Width           =   720
      End
      Begin VB.Label MenuLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "&Tools   "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Index           =   1
         Left            =   8445
         TabIndex        =   72
         Top             =   210
         Width           =   660
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   4
         Left            =   0
         Picture         =   "Smile.frx":31776
         Stretch         =   -1  'True
         Tag             =   "ROM Menu"
         ToolTipText     =   "ROM Menu"
         Top             =   0
         Width           =   720
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   6
         Left            =   795
         Picture         =   "Smile.frx":31E53
         Stretch         =   -1  'True
         Tag             =   "Save Room"
         ToolTipText     =   "Save Room"
         Top             =   0
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   5
         Left            =   5370
         Picture         =   "Smile.frx":32418
         Stretch         =   -1  'True
         Tag             =   "Save Screenshot"
         ToolTipText     =   "Save Screenshot"
         Top             =   0
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   3
         Left            =   7230
         Picture         =   "Smile.frx":32A98
         Stretch         =   -1  'True
         Tag             =   "Preferences"
         ToolTipText     =   "Preferences"
         Top             =   0
         Width           =   480
      End
      Begin VB.Label MenuLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "&Edit   "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Index           =   0
         Left            =   7815
         TabIndex        =   65
         Top             =   210
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   1
         Left            =   6015
         Picture         =   "Smile.frx":32FA7
         Stretch         =   -1  'True
         Tag             =   "Favorites"
         ToolTipText     =   "Favorites"
         Top             =   0
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Enabled         =   0   'False
         Height          =   480
         Index           =   2
         Left            =   6645
         Picture         =   "Smile.frx":3334B
         Stretch         =   -1  'True
         Tag             =   "Swap"
         ToolTipText     =   "Swap"
         Top             =   0
         Width           =   480
      End
      Begin VB.Image BrowserButtons1 
         Height          =   480
         Index           =   0
         Left            =   10620
         Picture         =   "Smile.frx":33A3C
         Stretch         =   -1  'True
         Top             =   15
         Visible         =   0   'False
         Width           =   480
      End
      Begin VB.Label SMILECaption 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "SMILE"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   1335
         TabIndex        =   63
         Top             =   0
         Width           =   3915
      End
   End
   Begin VB.Timer VisibleTimer1 
      Interval        =   10
      Left            =   10320
      Top             =   6600
   End
   Begin VB.Frame TestFrame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   3570
      TabIndex        =   48
      Top             =   1275
      Visible         =   0   'False
      Width           =   5175
      Begin VB.Label TestLabel1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Testing Mode"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   600
         Left            =   960
         TabIndex        =   49
         Top             =   2040
         Width           =   3495
      End
   End
   Begin VB.Timer SystemTimer1 
      Interval        =   500
      Left            =   9840
      Top             =   6600
   End
   Begin VB.TextBox Testing 
      BackColor       =   &H00FFC0FF&
      Height          =   285
      Left            =   8880
      MaxLength       =   4
      TabIndex        =   36
      Top             =   6600
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Timer ScrollTimer1 
      Interval        =   10
      Left            =   8520
      Top             =   6600
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   255
      Left            =   7965
      TabIndex        =   35
      Top             =   7050
      Visible         =   0   'False
      Width           =   3735
   End
   Begin VB.PictureBox FakeFrame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   6015
      Left            =   7920
      ScaleHeight     =   6015
      ScaleWidth      =   3990
      TabIndex        =   13
      Top             =   480
      Width           =   3990
      Begin VB.OptionButton Option1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "ClipBoard"
         Enabled         =   0   'False
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   0
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   30
         Width           =   1335
      End
      Begin VB.OptionButton Option1 
         Caption         =   "BTS"
         Enabled         =   0   'False
         Height          =   255
         Index           =   1
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   30
         Width           =   1335
      End
      Begin VB.VScrollBar VScroll1 
         Enabled         =   0   'False
         Height          =   720
         Left            =   120
         Max             =   15
         TabIndex        =   17
         Top             =   4860
         Width           =   255
      End
      Begin VB.TextBox PatternText 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   720
         Left            =   1080
         MultiLine       =   -1  'True
         TabIndex        =   16
         Text            =   "Smile.frx":3402C
         Top             =   4860
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Other"
         Enabled         =   0   'False
         Height          =   255
         Index           =   2
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   30
         Width           =   1335
      End
      Begin VB.ComboBox StateGraphicSetCombo1 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Smile.frx":3403C
         Left            =   3210
         List            =   "Smile.frx":34097
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Tag             =   "0"
         Top             =   5220
         Width           =   750
      End
      Begin VB.CheckBox PatternPreviewCheck 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Show Type on Map"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   59
         Top             =   5640
         Width           =   2055
      End
      Begin VB.PictureBox Frame1 
         BackColor       =   &H00E0E0E0&
         Enabled         =   0   'False
         Height          =   4455
         Index           =   0
         Left            =   0
         ScaleHeight     =   293
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   260
         TabIndex        =   20
         Top             =   285
         Width           =   3960
         Begin VB.CommandButton ClipCommand1 
            Caption         =   "Save Clipboard"
            Height          =   255
            Index           =   1
            Left            =   2400
            TabIndex        =   21
            Top             =   4080
            Visible         =   0   'False
            Width           =   1215
         End
         Begin VB.CommandButton ClipCommand1 
            Caption         =   "Load Clipboard"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   22
            Top             =   4080
            Visible         =   0   'False
            Width           =   1215
         End
         Begin VB.PictureBox PreviewClipBuffer 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H000000FF&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   105
            ScaleHeight     =   16
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   16
            TabIndex        =   26
            Tag             =   "0"
            Top             =   360
            Visible         =   0   'False
            Width           =   240
         End
         Begin VB.PictureBox PreviewClip 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H00404040&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   45
            ScaleHeight     =   16
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   16
            TabIndex        =   25
            Tag             =   "0"
            Top             =   315
            Width           =   240
         End
         Begin VB.CheckBox VFlip 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Vertical Flip"
            Height          =   255
            Left            =   1440
            TabIndex        =   24
            Top             =   0
            Width           =   1215
         End
         Begin VB.CheckBox HFlip 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Horizontal Flip"
            Height          =   255
            Left            =   0
            TabIndex        =   23
            Top             =   0
            Width           =   1335
         End
      End
      Begin VB.PictureBox Frame1 
         BackColor       =   &H00E0E0E0&
         Enabled         =   0   'False
         Height          =   4455
         Index           =   1
         Left            =   0
         ScaleHeight     =   293
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   260
         TabIndex        =   27
         Top             =   300
         Width           =   3960
         Begin VB.CheckBox YellowSlopes1 
            BackColor       =   &H00C0FFFF&
            Caption         =   "Yellow Shown"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   53
            Top             =   1200
            Width           =   1920
         End
         Begin VB.Frame BTS_Drag1 
            Appearance      =   0  'Flat
            BackColor       =   &H00404040&
            Caption         =   "BTS"
            ForeColor       =   &H00FFFFFF&
            Height          =   975
            Left            =   120
            TabIndex        =   51
            Top             =   120
            Width           =   3375
            Begin VB.ComboBox BTS_List1 
               BeginProperty Font 
                  Name            =   "Courier New"
                  Size            =   11.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               ItemData        =   "Smile.frx":34106
               Left            =   840
               List            =   "Smile.frx":3440A
               Style           =   2  'Dropdown List
               TabIndex        =   52
               Top             =   360
               Width           =   2415
            End
            Begin VB.Image BTS_Image1 
               BorderStyle     =   1  'Fixed Single
               DragIcon        =   "Smile.frx":3488B
               DragMode        =   1  'Automatic
               Height          =   570
               Left            =   120
               Picture         =   "Smile.frx":35ED5
               ToolTipText     =   "Drag over tile to change"
               Top             =   240
               Width           =   570
            End
         End
         Begin VB.PictureBox Slopes1 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H00404040&
            BorderStyle     =   0  'None
            DragMode        =   1  'Automatic
            FillColor       =   &H00FFFFFF&
            ForeColor       =   &H00FFFFFF&
            Height          =   1920
            Left            =   120
            ScaleHeight     =   128
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   128
            TabIndex        =   33
            Top             =   1560
            Width           =   1920
            Begin VB.Image Target 
               BorderStyle     =   1  'Fixed Single
               Enabled         =   0   'False
               Height          =   240
               Index           =   2
               Left            =   0
               Top             =   0
               Width           =   240
            End
         End
         Begin VB.CheckBox BTSMenuFlip 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Vertical Flip"
            Height          =   255
            Index           =   1
            Left            =   2160
            TabIndex        =   32
            Top             =   1800
            Width           =   1695
         End
         Begin VB.CheckBox BTSMenuFlip 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Horizontal Flip"
            Height          =   255
            Index           =   0
            Left            =   2160
            TabIndex        =   31
            Top             =   1560
            Width           =   1695
         End
         Begin VB.PictureBox Special1 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            AutoSize        =   -1  'True
            BackColor       =   &H00404040&
            DragMode        =   1  'Automatic
            ForeColor       =   &H80000008&
            Height          =   495
            Left            =   120
            ScaleHeight     =   31
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   143
            TabIndex        =   30
            Top             =   3600
            Width           =   2175
         End
         Begin VB.CheckBox ReSpawning1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "ReSpawning"
            Height          =   255
            Left            =   2400
            TabIndex        =   29
            Top             =   3600
            Value           =   1  'Checked
            Width           =   1335
         End
         Begin VB.CheckBox SetSlope1 
            Caption         =   "Set as Slope?"
            Height          =   255
            Left            =   240
            TabIndex        =   28
            Top             =   2040
            Value           =   1  'Checked
            Visible         =   0   'False
            Width           =   1575
         End
      End
      Begin VB.PictureBox Frame1 
         BackColor       =   &H00E0E0E0&
         Enabled         =   0   'False
         Height          =   4455
         Index           =   2
         Left            =   0
         ScaleHeight     =   293
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   260
         TabIndex        =   45
         Top             =   300
         Width           =   3960
         Begin VB.ComboBox MusicTrack1 
            BackColor       =   &H00404040&
            Enabled         =   0   'False
            ForeColor       =   &H0000FFFF&
            Height          =   315
            ItemData        =   "Smile.frx":361FA
            Left            =   870
            List            =   "Smile.frx":361FC
            Style           =   2  'Dropdown List
            TabIndex        =   55
            ToolTipText     =   "Song"
            Top             =   435
            Width           =   3015
         End
         Begin VB.ComboBox MusicControl1 
            BackColor       =   &H00404040&
            Enabled         =   0   'False
            ForeColor       =   &H0000FFFF&
            Height          =   315
            ItemData        =   "Smile.frx":361FE
            Left            =   870
            List            =   "Smile.frx":36200
            Style           =   2  'Dropdown List
            TabIndex        =   54
            ToolTipText     =   "Special before/during?"
            Top             =   720
            Width           =   3015
         End
         Begin VB.TextBox Layer2Scroll1 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   600
            MaxLength       =   4
            TabIndex        =   46
            Text            =   "0000"
            Top             =   3840
            Visible         =   0   'False
            Width           =   600
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Play: "
            Height          =   195
            Index           =   3
            Left            =   510
            TabIndex        =   58
            Top             =   720
            Width           =   390
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Collection: "
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   57
            Top             =   480
            Width           =   780
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Music"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   1
            Left            =   120
            TabIndex        =   56
            Top             =   240
            Width           =   615
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H0080C0FF&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Layer 2 Scroll"
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   315
            Index           =   4
            Left            =   1200
            TabIndex        =   47
            Top             =   3840
            Visible         =   0   'False
            Width           =   2175
         End
      End
      Begin VB.Image PatternPreview 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   720
         Left            =   360
         Stretch         =   -1  'True
         Tag             =   "0"
         ToolTipText     =   "DoubleClick to see these tiles in your room"
         Top             =   4860
         Width           =   720
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Graphic Set"
         Height          =   195
         Index           =   0
         Left            =   2280
         TabIndex        =   34
         Top             =   5340
         Width           =   840
      End
   End
   Begin VB.FileListBox IPSFile1 
      Height          =   1065
      Left            =   8400
      Pattern         =   "*.IPS"
      TabIndex        =   2
      Top             =   7080
      Visible         =   0   'False
      Width           =   3255
   End
   Begin VB.CommandButton Command5 
      BackColor       =   &H00E0E0E0&
      Caption         =   "clear"
      Height          =   255
      Left            =   7920
      TabIndex        =   1
      Top             =   6600
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox FakeFrame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   0
      ScaleHeight     =   273
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   529
      TabIndex        =   0
      Top             =   480
      Visible         =   0   'False
      Width           =   7935
      Begin VB.HScrollBar MapHScroll1 
         Enabled         =   0   'False
         Height          =   255
         LargeChange     =   16
         Left            =   0
         Max             =   0
         TabIndex        =   9
         Top             =   3840
         Width           =   7680
      End
      Begin VB.CommandButton MapClicker 
         Caption         =   "%"
         Height          =   255
         Left            =   7680
         TabIndex        =   61
         Top             =   3840
         Width           =   255
      End
      Begin VB.VScrollBar MapVScroll1 
         Enabled         =   0   'False
         Height          =   3840
         LargeChange     =   16
         Left            =   7680
         Max             =   0
         TabIndex        =   5
         Top             =   0
         Width           =   255
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   3840
         Left            =   0
         Picture         =   "Smile.frx":36202
         ScaleHeight     =   256
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   512
         TabIndex        =   11
         Top             =   0
         Width           =   7680
         Begin VB.PictureBox Layer3Picture1 
            Appearance      =   0  'Flat
            BackColor       =   &H000040C0&
            BorderStyle     =   0  'None
            FillColor       =   &H000040C0&
            ForeColor       =   &H000040C0&
            Height          =   1335
            Left            =   705
            ScaleHeight     =   1335
            ScaleWidth      =   2415
            TabIndex        =   50
            ToolTipText     =   "Click and drag to place FX1 height."
            Top             =   2040
            Width           =   2415
         End
         Begin VB.Image MetroidImage1 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            Height          =   525
            Index           =   0
            Left            =   720
            Picture         =   "Smile.frx":36231
            Top             =   360
            Width           =   570
         End
         Begin VB.Image MetroidImage1 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            Height          =   525
            Index           =   1
            Left            =   960
            Picture         =   "Smile.frx":3648D
            Top             =   600
            Width           =   570
         End
         Begin VB.Image MetroidImage1 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            Height          =   525
            Index           =   2
            Left            =   1080
            Picture         =   "Smile.frx":366DB
            Top             =   480
            Width           =   570
         End
         Begin VB.Image WheelScrollerImage1 
            Enabled         =   0   'False
            Height          =   960
            Left            =   960
            Picture         =   "Smile.frx":36938
            Top             =   960
            Visible         =   0   'False
            Width           =   960
         End
         Begin VB.Image PLMBox 
            Enabled         =   0   'False
            Height          =   240
            Index           =   0
            Left            =   105
            ToolTipText     =   "0"
            Top             =   465
            Width           =   240
         End
         Begin VB.Image EnemyBox 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            Height          =   240
            Index           =   0
            Left            =   360
            ToolTipText     =   "0"
            Top             =   210
            Width           =   240
         End
         Begin VB.Image Target 
            BorderStyle     =   1  'Fixed Single
            Enabled         =   0   'False
            Height          =   240
            Index           =   1
            Left            =   0
            Top             =   0
            Width           =   240
         End
      End
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1920
      Left            =   0
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   529
      TabIndex        =   6
      Top             =   4560
      Width           =   7935
      Begin VB.VScrollBar PictureScroll1 
         Height          =   1935
         LargeChange     =   8
         Left            =   7680
         Max             =   0
         TabIndex        =   10
         Top             =   0
         Width           =   255
      End
      Begin VB.PictureBox MenuPicture1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         ForeColor       =   &H80000008&
         Height          =   7680
         Left            =   0
         ScaleHeight     =   512
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   512
         TabIndex        =   7
         Top             =   0
         Width           =   7680
         Begin VB.Image Target 
            BorderStyle     =   1  'Fixed Single
            Enabled         =   0   'False
            Height          =   240
            Index           =   0
            Left            =   240
            Top             =   120
            Width           =   240
         End
      End
      Begin VB.PictureBox MenuPictureMask1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H0000FFFF&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   7680
         Left            =   1935
         ScaleHeight     =   512
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   512
         TabIndex        =   8
         Top             =   570
         Width           =   7680
      End
   End
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1920
      Left            =   0
      ScaleHeight     =   128
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   529
      TabIndex        =   38
      Top             =   4560
      Width           =   7935
      Begin VB.CommandButton SaveScrollCommand1 
         Caption         =   "Save Normal Scroll"
         Height          =   570
         Index           =   0
         Left            =   6360
         TabIndex        =   44
         Top             =   120
         Width           =   1455
      End
      Begin VB.CommandButton SaveScrollCommand1 
         Caption         =   "Save Scroll PLM"
         Height          =   570
         Index           =   1
         Left            =   6360
         TabIndex        =   43
         Top             =   690
         Width           =   1455
      End
      Begin VB.OptionButton ScrollEditorOption1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Door Scrolls"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   570
         Index           =   2
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   42
         Top             =   1260
         Width           =   735
      End
      Begin VB.OptionButton ScrollEditorOption1 
         BackColor       =   &H00C0FFFF&
         Caption         =   "PLM Scrolls"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   570
         Index           =   1
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   41
         Top             =   690
         Width           =   735
      End
      Begin VB.OptionButton ScrollEditorOption1 
         BackColor       =   &H0000FFFF&
         Caption         =   "Normal Scrolls"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   570
         Index           =   0
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   40
         Top             =   120
         Width           =   735
      End
      Begin VB.TextBox ScrollEditorText1 
         BackColor       =   &H00D2FFFF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   1695
         Left            =   840
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   39
         Top             =   120
         Width           =   5295
      End
   End
   Begin VB.Label DoorLabel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   4320
      MouseIcon       =   "Smile.frx":36AA9
      MousePointer    =   6  'Size NE SW
      TabIndex        =   37
      ToolTipText     =   "Door_Out Offset"
      Top             =   6960
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label RoomIDLabel 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5880
      TabIndex        =   4
      ToolTipText     =   "RoomID"
      Top             =   6960
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label EnemyLabel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   6720
      TabIndex        =   3
      ToolTipText     =   "Enemy Offset"
      Top             =   6960
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label PLMLabel 
      Appearance      =   0  'Flat
      BackColor       =   &H0080FFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5280
      TabIndex        =   12
      ToolTipText     =   "PLM Offset"
      Top             =   6960
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Menu mnuROM 
      Caption         =   "&ROM"
      Visible         =   0   'False
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open New ROM"
      End
      Begin VB.Menu mnuROMHeader 
         Caption         =   "&Header"
         Begin VB.Menu mnuAddRemoveHeader 
            Caption         =   "&Add Header"
            Index           =   0
         End
         Begin VB.Menu mnuAddRemoveHeader 
            Caption         =   "&Remove Header"
            Index           =   1
         End
      End
      Begin VB.Menu mnuExpandRom 
         Caption         =   "&Expand Rom"
      End
      Begin VB.Menu mnuIPS 
         Caption         =   "&IPS"
         Begin VB.Menu mnuIPSPatcher 
            Caption         =   "Create SIPS patch"
            Enabled         =   0   'False
            Index           =   0
         End
         Begin VB.Menu mnuIPSPatcher 
            Caption         =   "Create a patch"
            Index           =   2
         End
         Begin VB.Menu mnuIPSPatcher 
            Caption         =   "Apply a patch"
            Index           =   3
         End
         Begin VB.Menu mnuIPSPatcher 
            Caption         =   "Apply entire folder"
            Index           =   4
         End
      End
      Begin VB.Menu mnuFileCompare 
         Caption         =   "&File Compare"
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Visible         =   0   'False
      Begin VB.Menu mnuSaveRoom 
         Caption         =   "&Save Room"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuSpecial 
         Caption         =   "&Special"
         Visible         =   0   'False
         Begin VB.Menu mnuLevelToBitmap 
            Caption         =   "&Level to Bitmap"
            Index           =   0
         End
         Begin VB.Menu mnuLevelToBitmap 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu mnuLevelToBitmap 
            Caption         =   "Entire Area to Bitmap (slow and glitchy)"
            Index           =   2
         End
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Visible         =   0   'False
      Begin VB.Menu mnuRoomProperties 
         Caption         =   "&Room Properties"
      End
      Begin VB.Menu mnuStateProperties 
         Caption         =   "&State Properties"
      End
      Begin VB.Menu mnuRoomVarData 
         Caption         =   "&RoomVar Data (State)"
      End
      Begin VB.Menu mnuFX1 
         Caption         =   "&FX1"
      End
      Begin VB.Menu mnuPointerMenu 
         Caption         =   "&Pointers"
      End
      Begin VB.Menu mnuLoadPoints 
         Caption         =   "&Area Load Stations"
      End
      Begin VB.Menu mnuSamusPoses 
         Caption         =   "&Samus Poses"
      End
      Begin VB.Menu mnuSpacer5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditSpecial 
         Caption         =   "&Special"
         Begin VB.Menu mnuFillArea 
            Caption         =   "&Fill Area"
         End
         Begin VB.Menu mnuGameBehavior 
            Caption         =   "&Game Behavior"
         End
         Begin VB.Menu mnuAddSubtractEP 
            Caption         =   "&Enemy/PLM (+/-)"
         End
         Begin VB.Menu mnuOffscreenEnemies 
            Caption         =   "Offscreen Enemies to Screen"
            Enabled         =   0   'False
         End
         Begin VB.Menu mnuOffscreenPLM 
            Caption         =   "Offscreen PLM's to Screen"
            Enabled         =   0   'False
         End
      End
   End
   Begin VB.Menu mnuPreferences 
      Caption         =   "&Preferences"
      Visible         =   0   'False
      Begin VB.Menu mnuPreferencesView 
         Caption         =   "&View"
         Begin VB.Menu mnuEditorSize 
            Caption         =   "&Window"
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&Standard (2x1)"
               Index           =   0
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&Large (2x2 auto-hide menu)"
               Index           =   1
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&Large (2x2)"
               Index           =   2
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "-"
               Index           =   3
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&X-Large (3x2)"
               Index           =   4
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&X-Large (3x2 auto-hide menu)"
               Index           =   5
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&Custom AutoHide"
               Index           =   6
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&Custom"
               Index           =   7
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&XXL (4x3)"
               Index           =   8
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&XXL (4x3 auto-hide menu)"
               Index           =   9
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&XXXL (5x4)"
               Index           =   10
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&XXXL (5x4 auto-hide menu)"
               Index           =   11
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&XXXXL (6x5)"
               Index           =   12
            End
            Begin VB.Menu mnuEditorSizes 
               Caption         =   "&XXXXL (6x5 auto-hide menu)"
               Index           =   13
            End
         End
         Begin VB.Menu mnuTileSize 
            Caption         =   "&Tile Size"
            Begin VB.Menu mnuTileSizes 
               Caption         =   "8x8"
               Index           =   8
            End
            Begin VB.Menu mnuTileSizes 
               Caption         =   "16x16"
               Index           =   16
            End
            Begin VB.Menu mnuTileSizes 
               Caption         =   "24x24"
               Index           =   24
            End
            Begin VB.Menu mnuTileSizes 
               Caption         =   "32x32"
               Index           =   32
            End
         End
         Begin VB.Menu mnuSpacer1 
            Caption         =   "-"
         End
         Begin VB.Menu mnuViewOptions 
            Caption         =   "&Options"
            Begin VB.Menu mnuBrightness 
               Caption         =   "&Brightness"
               Begin VB.Menu mnuLightBulb 
                  Caption         =   "&Normal"
                  Index           =   0
               End
               Begin VB.Menu mnuLightBulb 
                  Caption         =   "&Bright"
                  Index           =   1
               End
               Begin VB.Menu mnuLightBulb 
                  Caption         =   "&Blazing"
                  Index           =   2
               End
            End
            Begin VB.Menu mnuTransparentBTS 
               Caption         =   "&Transparent BTS"
            End
            Begin VB.Menu mnuShowScrollAreas 
               Caption         =   "&Show Scroll Areas"
            End
            Begin VB.Menu mnuDrawPLMBox 
               Caption         =   "&Draw Box Around PLM"
            End
         End
         Begin VB.Menu mnuSpacer3 
            Caption         =   "-"
         End
         Begin VB.Menu mnuLayer1 
            Caption         =   "Layer 1"
            Checked         =   -1  'True
            Shortcut        =   {F1}
         End
         Begin VB.Menu mnuLayer2 
            Caption         =   "Layer 2"
            Checked         =   -1  'True
            Shortcut        =   {F2}
         End
         Begin VB.Menu mnuGrid 
            Caption         =   "BTS"
            Checked         =   -1  'True
            Shortcut        =   {F3}
         End
         Begin VB.Menu mnuViewPLM 
            Caption         =   "PLM"
            Checked         =   -1  'True
            Shortcut        =   {F4}
         End
         Begin VB.Menu mnuEnemies 
            Caption         =   "Enemies"
            Checked         =   -1  'True
            Shortcut        =   {F5}
         End
         Begin VB.Menu mnuSpacer17 
            Caption         =   "-"
         End
         Begin VB.Menu mnuShowAll 
            Caption         =   "Show All"
            Shortcut        =   {F6}
         End
      End
      Begin VB.Menu mnuSpacer134 
         Caption         =   "-"
      End
      Begin VB.Menu mnuLanguages 
         Caption         =   "&Language"
         Begin VB.Menu mnuLanguage 
            Caption         =   "English"
            Index           =   0
         End
         Begin VB.Menu mnuLanguage 
            Caption         =   "Suomi"
            Index           =   1
         End
         Begin VB.Menu mnuLanguage 
            Caption         =   "Français"
            Index           =   2
         End
         Begin VB.Menu mnuLanguage 
            Caption         =   "Latin"
            Index           =   3
         End
         Begin VB.Menu mnuLanguage 
            Caption         =   "-"
            Index           =   4
         End
      End
      Begin VB.Menu mnuPreferencesPalettes 
         Caption         =   "&Palette Format"
         Begin VB.Menu mnuPaletteType 
            Caption         =   "&TPL"
            Index           =   0
         End
         Begin VB.Menu mnuPaletteType 
            Caption         =   "&YY-Char"
            Index           =   1
         End
         Begin VB.Menu mnuPaletteType 
            Caption         =   "&FaTILEty"
            Index           =   2
         End
      End
      Begin VB.Menu mnuDoSnap 
         Caption         =   "&Snap Enemies to Grid"
      End
      Begin VB.Menu mnuExternalPrograms 
         Caption         =   "&Run Settings"
         Begin VB.Menu mnuTestRoomProperties 
            Caption         =   "&Test Room Options"
         End
         Begin VB.Menu mnuSpacer22 
            Caption         =   "-"
         End
         Begin VB.Menu mnuEmulator 
            Caption         =   "Emulator"
         End
         Begin VB.Menu mnuSRMFolder 
            Caption         =   "SRM Folder"
         End
      End
   End
   Begin VB.Menu mnuTools 
      Caption         =   "&Tools"
      Visible         =   0   'False
      Begin VB.Menu mnuLevelEditor 
         Caption         =   "&Level Editor"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuScrollEditor 
         Caption         =   "&Scroll Editor (refreshes room)"
      End
      Begin VB.Menu mnuExceptionEditor 
         Caption         =   "&Special Level Format Editor"
      End
      Begin VB.Menu mnuSpacer15 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMapEditorRefresh 
         Caption         =   "(Refresh Map)"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuMapEditor 
         Caption         =   "&Map Editor"
      End
      Begin VB.Menu mnuGraphicsEditor 
         Caption         =   "&Graphics Editor"
      End
      Begin VB.Menu mnuSpecial_Layer2 
         Caption         =   "&Background Editor"
         Begin VB.Menu mnuBackgroundEditor 
            Caption         =   "&EDIT BG (non-Layer 2)"
         End
         Begin VB.Menu mnuSpacer23 
            Caption         =   "-"
         End
         Begin VB.Menu mnuLayer2Scroll 
            Caption         =   "&BG/Layer 2 SCROLLING"
         End
         Begin VB.Menu mnuSpacer20 
            Caption         =   "-"
         End
         Begin VB.Menu mnuAddLayer2 
            Caption         =   "&ADD Layer 2 Background"
            Index           =   0
         End
         Begin VB.Menu mnuAddLayer2 
            Caption         =   "&REMOVE Layer 2 Background"
            Index           =   1
         End
      End
      Begin VB.Menu mnuSpacer13 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBeautySalon 
         Caption         =   "&Beauty Salon"
      End
      Begin VB.Menu mnuTextEditor 
         Caption         =   "&Text Editor"
      End
      Begin VB.Menu mnuSpacer28 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPlugins 
         Caption         =   "PLUG-INS"
      End
      Begin VB.Menu mnuSpacer12 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSuperTools 
         Caption         =   "&Super Tools"
         Visible         =   0   'False
         Begin VB.Menu mnuEraseROM 
            Caption         =   "FFFF up everything"
         End
         Begin VB.Menu mnuAddNewRoom 
            Caption         =   "Add New Room"
         End
         Begin VB.Menu mnuRemakeRoomSizeList 
            Caption         =   "Remake RoomSize List"
         End
      End
   End
   Begin VB.Menu mnuRun 
      Caption         =   "&Run"
      Visible         =   0   'False
      Begin VB.Menu mnuRunEmulator 
         Caption         =   "Test Room"
      End
   End
   Begin VB.Menu mnuFavorites 
      Caption         =   "Favorites"
      Visible         =   0   'False
      Begin VB.Menu mnuToggleFavorite 
         Caption         =   "Add Favorite                            "
         Index           =   0
      End
      Begin VB.Menu mnuToggleFavorite 
         Caption         =   "Remove Favorite                         "
         Index           =   1
      End
      Begin VB.Menu mnuSpacerFavorite 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFavoriteList 
         Caption         =   ""
         Index           =   0
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Visible         =   0   'False
      Begin VB.Menu mnuAbout 
         Caption         =   "&About"
      End
      Begin VB.Menu mnuContact 
         Caption         =   "&Contact"
      End
      Begin VB.Menu mnuSpacerHelp 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHotkeys 
         Caption         =   "&Hotkeys"
      End
   End
   Begin VB.Menu mnuEnemy 
      Caption         =   "&EnemyPop"
      Visible         =   0   'False
      Begin VB.Menu mnuEnemyMenu 
         Caption         =   "Species"
      End
      Begin VB.Menu mnuSpacer1A 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSplitShip 
         Caption         =   "Split Ship When Moved"
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnuPLM 
      Caption         =   "&PLMPop"
      Visible         =   0   'False
      Begin VB.Menu mnuPLMType 
         Caption         =   "&Type"
      End
   End
   Begin VB.Menu mnuDoor 
      Caption         =   "&DoorPop"
      Visible         =   0   'False
      Begin VB.Menu mnuDoorPopOptions 
         Caption         =   "Clone Door"
         Index           =   0
      End
      Begin VB.Menu mnuDoorPopOptions 
         Caption         =   "Enter Room"
         Index           =   1
         Begin VB.Menu mnuJumpToRoomOptions 
            Caption         =   "&Save First"
            Index           =   0
         End
         Begin VB.Menu mnuJumpToRoomOptions 
            Caption         =   "&Don't Save"
            Index           =   1
         End
      End
      Begin VB.Menu mnuDoorPopOptions 
         Caption         =   "Door Editor"
         Index           =   2
      End
   End
   Begin VB.Menu mnuPercentKey 
      Caption         =   "&% Key"
      Visible         =   0   'False
      Begin VB.Menu mnuOpenMostRecentRoom 
         Caption         =   "Open Most Recent Room"
      End
   End
End
Attribute VB_Name = "Smile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private MenuTileNumber As Byte   'which value is attributed to tile clicked on in menu
Private FlipNumber As Byte  'flip/palette value of currently selected tile
Private MiniMapTileNumber As Integer   'which value is attributed to tile clicked on on map
Private MapTiles As Integer
Private MapStart As Long    'start of current map
Private MapStationStart As Long 'location of mapping station for an area
Private MenuX As Integer    'where we are on the iddy bitty menu we last clicked
Private MenuY As Integer    '"
Private MenuShowStation As Byte '0 or 1, whether or not the map station will reveal a tile
Public SMILEMOVEX As Single
Public SMILEMOVEY As Single
Private mdbBack As String
Private mdbForward As String






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

Private Sub BrowserBar1_DblClick()
TaskCommand1_Click 1

End Sub

Public Sub BrowserBar1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'If Button <> 1 Then Exit Sub

SMILEMOVEX = X
SMILEMOVEY = Y
End Sub

Public Sub BrowserBar1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim DifX As Single
Dim DifY As Single

ClearMenuHighlights

'difference between last time and this time, but only if button down
'If Button <> 1 Then Exit Sub
If Button = 0 Then Exit Sub
If Smile.WindowState <> vbNormal Then Exit Sub

DifX = X - SMILEMOVEX
DifY = Y - SMILEMOVEY
Smile.Move Smile.Left + DifX, Smile.Top + DifY



End Sub

Public Sub BrowserButtons1_Click(Index As Integer)
MenuX = ScaleX(BrowserButtons1(Index).Left, vbTwips, vbPixels)
MenuY = ScaleY(BrowserButtons1(Index).Top + BrowserButtons1(Index).Height, vbTwips, vbPixels)

Select Case Index
    Case 0: GoTo ReloadLastRoom
    Case 1: GoTo FavoriteButton
    Case 2: GoTo BackForward
    Case 3: GoTo SettingsAndOptions
    Case 4: GoTo RomMenu
    Case 5: GoTo ScreenshotMenu
    Case 6: GoTo SaveRoomClick
    Case Else: MsgBox "not implemented"
End Select
Exit Sub

ReloadLastRoom:
If Val("&H" & LastRoomOpened) = 0 Then
    MsgBox "No rooms have been opened on this ini file."
    Exit Sub
End If
mdbCombo.Text = LastRoomOpened
Exit Sub

FavoriteButton:
PopupMenu mnuFavorites, , ScaleX(BrowserBar1.Left + BrowserButtons1(1).Left, vbTwips, vbPixels), ScaleY(BrowserBar1.Top + BrowserButtons1(1).Height, vbTwips, vbPixels)
Exit Sub

BackForward:
'swap this room for the last
mdbCombo.Text = mdbBack
Exit Sub

SettingsAndOptions:
PopupMenu mnuPreferences, , MenuX, MenuY
Exit Sub

RomMenu:
PopupMenu mnuROM, , MenuX, MenuY
Exit Sub

ScreenshotMenu:
PopupMenu mnuSpecial, , MenuX, MenuY
Exit Sub


SaveRoomClick:
mnuSaveRoom_Click
End Sub

Private Sub BrowserButtons1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
    BrowserButtons1(Index).BorderStyle = 1
End If

'HOME right clicked
If Index = 3 And Button = 2 Then
    BrowserButtons1(Index).BorderStyle = 0
    PopupMenu mnuHome, , ScaleX(BrowserBar1.Left + BrowserButtons1(3).Left, vbTwips, vbPixels), ScaleY(BrowserBar1.Top + BrowserButtons1(3).Height, vbTwips, vbPixels)
    Exit Sub
End If
End Sub

Private Sub BrowserButtons1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
ClearMenuHighlights

BrowserTarget.Width = BrowserButtons1(Index).Width
BrowserTarget.Left = BrowserButtons1(Index).Left

If Button <> 1 Then Exit Sub
If X >= 0 And X <= BrowserButtons1(Index).Width Then
    If Y >= 0 And Y <= BrowserButtons1(Index).Height Then
        If BrowserButtons1(Index).BorderStyle <> 1 Then BrowserButtons1(Index).BorderStyle = 1
    Else
        If BrowserButtons1(Index).BorderStyle <> 0 Then BrowserButtons1(Index).BorderStyle = 0
    End If
Else
    If BrowserButtons1(Index).BorderStyle <> 0 Then BrowserButtons1(Index).BorderStyle = 0
End If

End Sub

Private Sub BrowserButtons1_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
BrowserButtons1(Index).BorderStyle = 0
End Sub

Public Sub BTSMenuFlip_Click(Index As Integer)
Dim TempHorizontal As Byte
Dim TempVertical As Byte
Dim TempFlipValue As Byte

TempHorizontal = BTSMenuFlip(0).Value * &H40&
TempVertical = BTSMenuFlip(1).Value * &H80&
TempFlipValue = TempHorizontal + TempVertical
Slopes1.Tag = TempFlipValue
DrawBTSMenu TempFlipValue
End Sub



Private Sub ClipCommand1_Click(Index As Integer)
Dim TilesWide As Byte
Dim TilesHight As Byte
Dim UsingStamp(1 To 256) As Boolean
Dim ClipPath As String
Dim CMD1 As New OpenSave
Dim DD As String
ClipPath = App.Path & "\files\clip\"
CMD1.Filter = "Clipboards|*.CLP"
CMD1.InitDir = ClipPath

If Index = 0 Then GoTo OpenClipboard

SaveClipboard:
CMD1.ShowSave
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then Exit Sub
ClipPath = DD
Open ClipPath For Binary As #1
    Put #1, , ClipBoardTile()
    Put #1, , ClipBoardClip()
    Put #1, , StampX
    Put #1, , StampY
Close #1
Exit Sub


OpenClipboard:
CMD1.ShowOpen
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then Exit Sub
ClipPath = DD
Open ClipPath For Binary As #1
    Get #1, , ClipBoardTile()
    Get #1, , ClipBoardClip()
    Get #1, , StampX
    Get #1, , StampY
Close #1

PreviewClip.Width = StampX
PreviewClip.Height = StampY
TilesWide = StampX / 16
TilesHigh = StampY / 16

For XAxis = 1 To TilesWide
For YAxis = 1 To TilesHigh
    TempButton = ((YAxis - 1) * 16) + XAxis
    UsingStamp(TempButton) = True
Next YAxis
Next XAxis

StretchBlt PreviewClip.hdc, 0, 0, StampX, StampY, MenuPicture1.hdc, Target(0).Left, Target(0).Top, StampX, StampY, SRCCOPY
UpdatePreviewBuffer
For I = 1 To 256
    FakeClip(I).Visible = UsingStamp(I)
Next I
'PreviewClip.Tag = 0
PreviewGridLines

End Sub






' TODO
Private Sub Command2_Click()
Dim ASMCode As String
Dim Coding() As Byte    'the actual *.bin
Dim CMD1 As New OpenSave

ASMCode = ""

CMD1.Filter = "Bin|*.bin"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
ASMCode = Mid$(DD, 1, I - 1)
If DD = "" Then MsgBox "Cancelled": Exit Sub

'MsgBox needslash & vbCrLf & ASMCode
Open ASMCode For Binary As #1
    ReDim Coding(0 To LOF(1) - 1) As Byte
    Get #1, 1, Coding()
Close #1

' TODO:  OFFSET FOR the Coding() array needs to be understood
Open needslash For Binary As #1
    Put #1, &H1174A0 + ROM_HEADER + 1, Coding()
Close #1
End Sub





Private Sub FakeFrame1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'FakeFrame1.ZOrder 0
End Sub


Public Sub FakeFrame2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
ClearMenuHighlights
If Shift = 1 Then Exit Sub  'if pressing shift, don't show menus
If UseAutoHide = False Then Exit Sub
'hide gfx menu, if needed
Picture1.ZOrder 1
'bring main menu form to the front
'FakeFrame2.ZOrder 0

End Sub





Private Sub Form_KeyPress(KeyAscii As Integer)
'Do NOT use TypeHex KeyAscii
'Doing so would deactivate "DoHotKeys" in this form
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = 44 Then
    DoHotKeys 44, Shift
End If

If KeyCode >= 112 And KeyCode <= 117 Then DoHotKeys KeyCode, Shift
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
ClearMenuHighlights
'FakeFrame1.ZOrder 0
'move form with mouse
'If Button = 1 Then FormDrag (Smile.hWnd)
End Sub





Private Sub Frame1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
ClearMenuHighlights
'FakeFrame2.ZOrder 0

End Sub




Private Sub Label3_Click()

End Sub



Private Sub Layer2Scroll1_KeyPress(KeyAscii As Integer)
KeyAscii = TypeHex(KeyAscii)
End Sub




Private Sub Layer3Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 1 Then Exit Sub
'OldY = Y


'Layer3Picture1.Top = Layer3Picture1.Top + ScaleY(Y, vbTwips, vbPixels)
'TempFX1.Surface_Start = Y * (16 \ TileSize)


End Sub

Private Sub Layer3Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 1 Then Exit Sub

Layer3Picture1.Top = Layer3Picture1.Top + ScaleY(Y, vbTwips, vbPixels)
TempFX1.Surface_Start = Layer3Picture1.Top * (16 \ TileSize)
End Sub

Private Sub LoadTimer1_Timer()
'ran once until form is visible visible

If Me.Visible = False Then Exit Sub

'MsgBox "PUT IN PROTECTION AGAINST AUTO-OPEN FAILURES"
'try opening last room opened
If Val("&H" & LastRoomOpened) > 0 Then mdbCombo.Text = LastRoomOpened: GoTo KillTimer
'try opening first room in the mdb list
mdbCombo.Text = mdbCombo.List(0): GoTo KillTimer
'if all room open attempts failed

KillTimer:
LoadTimer1.Enabled = False
End Sub

Private Sub MapClicker_Click()
BrowserButtons1_Click 0
End Sub

Private Sub MapHScroll1_Scroll()
MapHScroll1_Change
End Sub





Private Sub MapVScroll1_Scroll()
MapVScroll1_Change

End Sub

Public Sub mdbCombo_Click()
Dim FoundFavorite As Boolean

newmdbText1.Visible = False
If mdbCombo.Text = "" Then Exit Sub
'forward/back capability
If mdbCombo.Text <> mdbForward Then
    mdbBack = mdbForward
    mdbForward = mdbCombo.Text
    If mdbBack <> "" Then BrowserButtons1(2).Enabled = True: BrowserButtons1(2).Picture = FavoritesHearts1.DownPicture
End If

newmdbText1.Enabled = True
FreeControls
TestCodeList1.Tag = 1
StateGraphicSetCombo1.Tag = 0
Dim Offset As Long
Offset = Val("&H" & mdbCombo.Text & "&")
'If FastRead = False Then OpenRoom Offset
'If FastRead = True Then ReadRoom Offset
OpenRoom Offset
TestCodeList1.Locked = False
TestCodeList1.Tag = 0
Offset = Val("&H" & mdbCombo.Text & "&")
If FastRead = False Then ReadDoors Offset
If FastRead = False Then ReadEnemies
If FastRead = False Then ReadPLM
mnuLevelEditor_Click
newmdbText1.Text = mdbCombo.Text
LastRoomOpened = mdbCombo.Text

'place to look for favorites
If mnuFavoriteList(0).Visible = True Then
    For I = 0 To UBound(FavoriteRooms)
        If Left$(FavoriteRooms(I), 5) = mdbCombo.Text Then FoundFavorite = True
    Next I
End If

If FoundFavorite = True Then
    mnuToggleFavorite(1).Visible = True
    BrowserButtons1(1).Picture = FavoritesHearts1.Picture
    mnuToggleFavorite(0).Visible = False
    mnuToggleFavorite(1).Visible = True
Else
    mnuToggleFavorite(1).Visible = False
    BrowserButtons1(1).Picture = FavoritesHearts1.DisabledPicture
    mnuToggleFavorite(0).Visible = True
    mnuToggleFavorite(1).Visible = False
End If
mnuToggleFavorite(0).Visible = Not mnuToggleFavorite(1).Visible
mnuMapEditorRefresh_Click
Mapper1.Visible = mnuMapEditor.Checked
End Sub




Private Sub EnemyBox_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
X = ScaleX(X, vbTwips, vbPixels)
Y = ScaleY(Y, vbTwips, vbPixels)
If Button = 1 Then
    If mnuDoSnap.Checked = True Then EnemyClickX = X - (EnemyBox(Index).Width / 2): EnemyClickY = Y - (EnemyBox(Index).Height / 2)
    If mnuDoSnap.Checked = False Then EnemyClickX = X: EnemyClickY = Y
    Exit Sub
End If
'store index for property editing
EnemyBox(0).Tag = Index

If EnemySet(Index).Species = &HD07F Or EnemySet(Index).Species = &HD0BF Then
    mnuSplitShip.Visible = True
Else
    mnuSplitShip.Visible = False
End If
mnuSpacer1A.Visible = mnuSplitShip.Visible
PopupMenu mnuEnemy
End Sub

Private Sub EnemyBox_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim YAvailable As Byte  'how many tiles up/down visible in current settings
Dim XAvailable As Byte  'as a variable, in case I later add support for wider screens (or adjust for 32x32)

'XAvailable = 31
XAvailable = (MapHScroll1.Width \ 16) - 1
If Button <> 1 Then Exit Sub

X = ScaleX(X, vbTwips, vbPixels)
Y = ScaleY(Y, vbTwips, vbPixels)

Target(1).Move EnemyBox(Index).Left + X - EnemyClickX, EnemyBox(Index).Top + Y - EnemyClickY, EnemyBox(Index).Width, EnemyBox(Index).Height
If SnapToGrid = True Then
    Target(1).Left = Target(1).Left - (Target(1).Left Mod 8)
    Target(1).Top = Target(1).Top - (Target(1).Top Mod 8)
End If

'''''''''''''''''''''''''''''''''''''
'scroll map on enemy move off screen'
'''''''''''''''''''''''''''''''''''''
'SMILE.SMILECaption.Caption = Target(1).Top / TileSize & "     " & MapVScroll1.Value
If Smile.mnuEditorSizes(0).Checked Then YAvailable = 15 Else YAvailable = 31
    
'slow down scroll with timer
If ScrollTimer1.Enabled = True Then GoTo WaitForScroll
'scroll enemy up
If Target(1).Top \ TileSize < MapVScroll1.Value Then
    If Target(1).Top >= 0 Then MapVScroll1.Value = MapVScroll1.Value - 1
End If
'scroll enemy down
If Target(1).Top \ TileSize > MapVScroll1.Value + YAvailable And Target(1).Top Then
    If Target(1).Top \ TileSize <= MapVScroll1.Max + YAvailable Then MapVScroll1.Value = MapVScroll1.Value + 1
End If
'scroll enemy left
If Target(1).Left \ TileSize < MapHScroll1.Value Then
    If Target(1).Left >= 0 Then MapHScroll1.Value = MapHScroll1.Value - 1
End If
'scroll enemy right
If Target(1).Left \ TileSize > MapHScroll1.Value + XAvailable And Target(1).Left Then
    If Target(1).Left \ TileSize <= MapHScroll1.Max + XAvailable Then MapHScroll1.Value = MapHScroll1.Value + 1
End If

'lower limit
'MapVScroll1.Value
'upper limit
'MapVScroll1.Value + YAvailable

WaitForScroll:
ScrollTimer1.Enabled = True
End Sub

Private Sub EnemyBox_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then Exit Sub
If MetroidBehavior = MetroidMouse Or MetroidBehavior = MetroidFeeding Then
    MetroidBehavior = MetroidFeeding
    MetroidFeedingIndex = Index
    MetroidFeedingTime = MetroidFeedingTimeMax
End If


X = ScaleX(X, vbTwips, vbPixels)
Y = ScaleY(Y, vbTwips, vbPixels)

EnemyBox(Index).Move EnemyBox(Index).Left + X - EnemyClickX, EnemyBox(Index).Top + Y - EnemyClickY
If SnapToGrid = True Then
    EnemyBox(Index).Left = EnemyBox(Index).Left - (EnemyBox(Index).Left Mod 8)
    EnemyBox(Index).Top = EnemyBox(Index).Top - (EnemyBox(Index).Top Mod 8)
End If
EnemySet(Index).X = (EnemyBox(Index).Left + (EnemyBox(Index).Width / 2)) / (TileSize / 16)
EnemySet(Index).Y = (EnemyBox(Index).Top + (EnemyBox(Index).Height / 2)) / (TileSize / 16)

If mnuSplitShip.Checked = True Then Exit Sub
Select Case Hex$(EnemySet(Index).Species)
    Case "D07F": GoTo ShipPart
    Case "D0BF": GoTo ShipPart
    Case Else: Exit Sub
End Select

ShipPart:
For TempIndex = 0 To UBound(EnemySet)
    If TempIndex = Index Then GoTo ShipPartMoved
    If Hex$(EnemySet(TempIndex).Species) = "D07F" Or Hex$(EnemySet(TempIndex).Species) = "D0BF" Then
        EnemyBox(TempIndex).Move EnemyBox(Index).Left, EnemyBox(Index).Top  'move other boxes to the spot we just dragged one to
        EnemySet(TempIndex).X = EnemySet(Index).X
        EnemySet(TempIndex).Y = EnemySet(Index).Y
    End If
ShipPartMoved:
Next TempIndex
End Sub


Private Sub MenuLabel_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
MenuX = ScaleX(MenuLabel(Index).Left, vbTwips, vbPixels)
MenuY = ScaleY(MenuLabel(Index).Top + MenuLabel(Index).Height, vbTwips, vbPixels)
MenuLabel_MouseMove Index, Button, Shift, X, Y

Select Case Index
    Case 0: PopupMenu mnuEdit, , MenuX, MenuY
    Case 1: PopupMenu mnuTools, , MenuX, MenuY
    
    Case Else: MsgBox MenuLabel(Index).Caption
End Select
End Sub



Public Sub MenuLabel_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
For I = 0 To 1
    If I = Index Then GoTo NextMenuI
    If MenuLabel(I).FontBold <> False Then MenuLabel(I).FontBold = False
    If MenuLabel(I).BorderStyle <> 0 Then MenuLabel(I).BorderStyle = 0
    If MenuLabel(I).BackStyle <> 0 Then MenuLabel(I).BackStyle = 0
NextMenuI:
Next I

If Index < 5 Then
    If MenuLabel(Index).FontBold <> True Then MenuLabel(Index).FontBold = True
    If MenuLabel(Index).BorderStyle <> 1 Then MenuLabel(Index).BorderStyle = 1
    If MenuLabel(Index).BackStyle <> 1 Then MenuLabel(Index).BackStyle = 1
End If
End Sub




Private Sub MenuPicture1_DblClick()
'ONLY USE IN DEVELOPMENT
'Exit Sub
'identify graphic set
GSet = Val(Smile.StateGraphicSetCombo1.List(Smile.StateGraphicSetCombo1.ListIndex))

'MsgBox NewClick
'get current values unless speed setting
'resultloaded tells whether current values taken from last set value
If ResultLoaded = True Then
    Open App.Path & "\files\menus\" & GSet & ".val" For Binary As #1
        Get #1, NewClick + 1, ResultPattern
        Get #1, NewClick + 1024 + 1, ResultBTS
    Close #1
End If


MakeDefaults.Show 1

'place new values
Open App.Path & "\files\menus\" & GSet & ".val" For Binary As #1
    Put #1, NewClick + 1, ResultPattern
    Put #1, NewClick + 1024 + 1, ResultBTS
Close #1
End Sub

Private Sub mnuAbout_Click()

End Sub



Private Sub mnuAddLayer2_Click(Index As Integer)
'0 = have layer 2
'1 = no layer 2
If Index = 0 Then
    ReDim Preserve RoomTile2(0 To UBound(RoomTile))
Else
    tempDD = MsgBox("Warning! Existing Layer 2 data will be forgotten!", vbOKCancel)
    If tempDD = vbOK Then ReDim RoomTile2(0 To 0)
End If

If tempDD <> vbCancel Then DrawScreenDLL (0)
End Sub

Private Sub mnuAddNewRoom_Click()
MsgBox "THIS OPENS A FORM THAT ALLOWS YOU TO ADD A ROOM BASED ON PRESETS OR TO INPUT YOUR OWN VALUES."
End Sub

Private Sub mnuAddRemoveHeader_Click(Index As Integer)
Dim mbResult As Integer 'what button did they click on?
Dim SMILEARRAY() As Byte    'temp storage of entire game

If Index = 0 Then GoTo AddingHeader
If Index = 1 Then GoTo RemovingHeader

AddingHeader:
mbResult = MsgBox("Don't mess with what you don't understand." & vbCrLf & "Are you sure you want to add a header?", vbYesNo, "n00b notice")
If mbResult = vbNo Then Exit Sub
If ROM_HEADER = 512 Then
    mbResult = MsgBox("SMILE thinks this ROM already has a header." & vbCrLf & "Do you want to add one anyway?", vbYesNo, "n00b notice")
Else
    GoTo StartHeaderAdd 'no header, so we go straight to adding the header
End If
If mbResult = vbNo Then Exit Sub
'copy the rom to an array, then place it 512 bytes later in the rom
StartHeaderAdd:
Open needslash For Binary As #1
ReDim SMILEARRAY(1 To LOF(1)) As Byte
Get #1, 1, SMILEARRAY()
Put #1, 513, SMILEARRAY()
Close #1
ROM_HEADER = 512
MsgBox "Done!", vbInformation, "Done!"
Exit Sub

RemovingHeader:
mbResult = MsgBox("Don't mess with what you don't understand." & vbCrLf & "Are you sure you want to remove the header?", vbYesNo, "n00b notice")
If mbResult = vbNo Then Exit Sub
If ROM_HEADER = 0 Then
    mbResult = MsgBox("SMILE thinks this ROM doesn't have a header." & vbCrLf & "Do you want to remove it anyway?", vbYesNo, "n00b notice")
Else
    GoTo StartHeaderRemove  'headered, so we go straight to removing the header
End If
If mbResult = vbNo Then Exit Sub
'header = 0, so ask follow-up questions
mbResult = MsgBox("Holy shit.  Really? You could erase stuff you don't want to be messing with.", vbYesNo, "n00b notice")
If mbResult = vbNo Then Exit Sub
MsgBox "Okay, if you say so." & vbCrLf & "Cross your fingers.", vbExclamation, "n00b notice"
'copy rom (minus header) to an array
StartHeaderRemove:
Open needslash For Binary As #1
ReDim SMILEARRAY(1 To LOF(1) - 512) As Byte
Get #1, 513, SMILEARRAY()
Close #1
'get rid of the original file
Kill needslash
'save the headerless copy to the same location
Open needslash For Binary As #1
Put #1, 1, SMILEARRAY()
Close #1
ROM_HEADER = 0
MsgBox "Done!", vbInformation, "Done!"
Exit Sub
End Sub

Private Sub mnuAddSubtractEP_Click()
AddSubtractEnemiesPLMs
End Sub


Private Sub mnuBackgroundEditor_Click()
BG_Editor.Show 1
End Sub



Private Sub mnuBeautySalon_Click()
SamusForm.Show 1
End Sub



Private Sub mnuContact_Click()

End Sub

Private Sub mnuDoSnap_Click()
mnuDoSnap.Checked = mnuDoSnap.Checked + 1
SnapToGrid = mnuDoSnap.Checked
End Sub

Public Sub mnuDoorPopOptions_Click(Index As Integer)
If Index = 0 Then DoorPrep
If Index = 2 Then DoorForm1.Show 1
End Sub

Public Sub mnuDrawPLMBox_Click()
'change the check
mnuDrawPLMBox.Checked = mnuDrawPLMBox.Checked + 1
For I = 0 To PLMBox.UBound
    If mnuDrawPLMBox.Checked = True Then
        PLMBox(I).BorderStyle = 1
    Else
        PLMBox(I).BorderStyle = 0
    End If
Next I
End Sub

Public Sub mnuEditorSizes_Click(Index As Integer)
Dim TempUseAutoHide
mnuEditorSizes(0).Tag = Index

For Each Choice In mnuEditorSizes
Choice.Checked = False
Next Choice
Smile.mnuEditorSizes(Index).Checked = True

'get dimensions of screen, accounting for bars and such
UserScreenHeight = GetSystemMetrics(SM_CYFULLSCREEN)
    UserScreenHeight = ScaleY(UserScreenHeight, vbPixels, vbTwips)
UserScreenWidth = GetSystemMetrics(SM_CXFULLSCREEN)
    UserScreenWidth = ScaleX(UserScreenWidth, vbPixels, vbTwips)
If Smile.Visible = False Then Exit Sub  'prevent bad resize on loadup (custom modes)


MoveControls Index

TempUseAutoHide = UseAutoHide
MenuPicture1_MouseMove 0, 0, 0, 0
UseAutoHide = TempUseAutoHide
End Sub

Private Sub mnuEmulator_Click()
Dim TempEmulator As String
Dim EmulatorLength As Integer

For I = 1 To Len(Emulator) - 2
    'looks for the first place where we have 3 spaces in a row, so not to get confused with spaces in the path name
    If Asc(Mid$(Emulator, I, 1)) = 32 And Asc(Mid$(Emulator, I + 1, 1)) = 32 And Asc(Mid$(Emulator, I + 2, 1)) = 32 Then Exit For
Next I
If I = 255 Then
    If MsgBox("SMILE currently has no default emulator to test rooms in." & vbCrLf & vbCrLf & "Choose one now?", vbYesNo, "Choose an emulator.") = vbYes Then GoTo ChooseEmulator
    Exit Sub
End If

TempEmulator = Mid$(Emulator, 1, I - 1)
If TempEmulator > "" Then
    If MsgBox("SMILE's default emulator is:" & vbCrLf & TempEmulator & vbCrLf & vbCrLf & "Change now?", vbYesNo, "Choose an emulator.") = vbNo Then Exit Sub
Else
    If MsgBox("SMILE currently has no default emulator to test rooms in." & vbCrLf & vbCrLf & "Choose one now?", vbYesNo, "Choose an emulator.") = vbNo Then Exit Sub
End If


ChooseEmulator:
Dim CMD1 As New OpenSave
CMD1.DialogTitle = "Choose your emulator."
CMD1.Filter = "EXE|*.exe"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then Exit Sub
Emulator = DD
End Sub

Public Sub mnuEnemies_Click()
'change the check
mnuEnemies.Checked = mnuEnemies.Checked + 1
For I = 0 To EnemyBox.UBound
    If EnemyBox(I).Enabled = True Then
        EnemyBox(I).Visible = mnuEnemies.Checked
    Else
        EnemyBox(I).Visible = False
    End If
Next I
End Sub


Private Sub mnuEnemyMenu_Click()
EditSpecies:
SpeciesForm.Show 1, Smile
RefreshEnemy Val(EnemyBox(0).Tag)
End Sub





Private Sub mnuEraseROM_Click()
DD = MsgBox("This will erase all rooms except for one." & vbCrLf & "This includes all room specific data such as level data, enemies, plms, etc..." & vbCrLf & vbCrLf & "This makes you START FROM SCRATCH!" & vbCrLf & "Are you sure you want to do this?", vbYesNo, "FFFF up everything?")
If DD = vbNo Then Exit Sub
MsgBox "HERE IS WHERE WE FFFF UP THE ROM."
FFFFThisROM
End Sub

Private Sub mnuExceptionEditor_Click()
ExceptionRooms1.Show 1
End Sub

Private Sub mnuExit_Click()
Unload Me
End Sub


Private Sub mnuExpandRom_Click()
DD = MsgBox("Add a bank to the end of this ROM?", vbYesNo, "Expand ROM?")
If DD <> vbYes Then Exit Sub
NewBank
End Sub



Private Sub mnuFavoriteList_Click(Index As Integer)
mdbCombo.Text = Left$(FavoriteRooms(Index), 5)
End Sub


Private Sub mnuFileCompare_Click()
Dim CompareFile As String
Dim CMD1 As New OpenSave

Dim AString As String * 128
Dim BString As String * 128

Dim ChangeString As String
Dim AROMCopy() As Byte
Dim BROMCopy() As Byte

CompareFile = ""

CMD1.Filter = "SNES #2|*.smc"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
CompareFile = Mid$(DD, 1, I - 1)
If DD = "" Then MsgBox "Cancelled": Exit Sub

'MsgBox needslash & vbCrLf & ASMCode
Open needslash For Binary As #1
Open CompareFile For Binary As #2
ReDim AROMCopy(0 To LOF(1) - 1)
ReDim BROMCopy(0 To LOF(1) - 1) 'dimension off the same rom so there is no out of range error in expanded roms
Get #1, 1, AROMCopy
Get #2, 1, BROMCopy
Close #2
Close #1
KillFile needslash & ".txt"

Open needslash & ".txt" For Binary As #3
    ChangeString = "Offset : #1 #2" & vbCrLf
    Put #3, , ChangeString
    For I = 0 To UBound(AROMCopy)
If Right$(Hex$(I), 4) = "0000" Then Smile.SMILECaption.Caption = Hex$(I): DoEvents
            'large chunk checked at once
            
            'If I < LOF(1) - Len(AString) + 1 Then
            '    Get #1, I + 1, AString
            '    Get #2, I + 1, BString
            '    If AString = BString Then
            '        I = I + Len(AString)
            '        If I > LOF(1) Then I = LOF(1) - Len(AString)
            '        GoTo ChunkCompared
            '    End If
            'End If
        '1 byte at a time
        If AROMCopy(I) <> BROMCopy(I) Then
            ChangeString = "$" & Right$("000000" & Hex$(I), 6) & ": " & Right$("00" & Hex$(AROMCopy(I)), 2) & " " & Right$("00" & Hex$(BROMCopy(I)), 2) & vbCrLf
        Put #3, , ChangeString
        End If
ChunkCompared:
    If Right$("000000" & Hex$(I), 3) = "000" Then
        Smile.SMILECaption.Caption = "$" & Right$("000000" & Hex$(I), 6)
    End If
    Next I
Smile.SMILECaption.Caption = "$" & Right$("000000" & Hex$(UBound(AROMCopy) + 1), 6)
Close #3

Smile.SMILECaption.Caption = Smile.SMILECaption.Caption & "... Done!"
End Sub

Private Sub mnuFX1_Click()
If Right$("0000" & Hex$(TempFX1.Select), 4) = "FFFF" Then MsgBox "FFFF in Door Select is not usual FX1 data." & vbCrLf & vbCrLf & "If you recently pointed this room's FX1 to a blank location in the bank, it should be fine to edit." & vbCrLf & "Otherwise, it is other data that should most likely be left alone." & vbCrLf & vbCrLf & "(Some original rooms do use FFFF here, but are not actually pointed at blank data)", vbInformation, "FX1 of FFFF"
FX1_1.Show 1
End Sub



Private Sub mnuGameBehavior_Click()
GameBehavior1.Show 1
End Sub



Private Sub mnuGraphicsEditor_Click()
Dim TempLB As Byte

'since lightbulb must be "1" in graphic editor, we store the current value
TempLB = LightBulb
LightBulb = 1
If TempLB > 1 Then Smile.StateGraphicSetCombo1_Click
GraphicEditor.Show 1
'restore old value when closing graphic editor
LightBulb = TempLB
If TempLB > 1 Then Smile.StateGraphicSetCombo1_Click
End Sub

Private Sub mnuHotkeys_Click()
HotKeysForm1.Show 1
End Sub

Private Sub mnuIPSPatcher_Click(Index As Integer)
Dim CMD1 As New OpenSave
Dim UnchangedFileName As String
Dim IPSFileName As String
Dim SlashSpot As Integer        'location of "\" in file path... to find folder only

Select Case Index
    Case 0: GoTo CleanPath
    Case 2: GoTo CleanPath
    Case 3: GoTo ApplyPatch
    Case 4: GoTo ApplyFolder
End Select

CleanPath:
'get unchanged file
CMD1.DialogTitle = "Choose *unchanged* ROM."
CMD1.Filter = "ROMs|*.SMC;*.BIN;*.BAK"
CMD1.ShowOpen

UnchangedFileName = CMD1.FileName
For I = 1 To Len(UnchangedFileName)
    If Asc(Mid$(UnchangedFileName, I, 1)) = 0 Then Exit For
Next I
UnchangedFileName = Mid$(UnchangedFileName, 1, I - 1)
If UnchangedFileName = "" Then GoTo CancelIPS
If Index = 2 Then GoTo CreatePatch

CreateSIPS:
'name Sips patch
IPSFileName = Left$(needslash, Len(needslash) - 4) & ".IPS"
'create patch
Lunar.LunarIPSCreate 0, IPSFileName, UnchangedFileName, needslash, &H40000000
'notify user
MsgBox "IPS saved as " & IPSFileName, vbInformation, "IPS saved!"
GoTo CancelIPS


CreatePatch:
'name ips patch
IPSFileName = Left$(needslash, Len(needslash) - 4) & ".IPS"
'create patch
Lunar.LunarIPSCreate 0, IPSFileName, UnchangedFileName, needslash, &H40000000
'notify user
MsgBox "IPS saved as " & IPSFileName, vbInformation, "IPS saved!"
GoTo CancelIPS


ApplyPatch:
CMD1.DialogTitle = "Choose IPS patch."
CMD1.Filter = "IPS Patches|*.IPS"
CMD1.ShowOpen
IPSFileName = CMD1.FileName
For I = 1 To Len(IPSFileName)
    If Asc(Mid$(IPSFileName, I, 1)) = 0 Then Exit For
Next I
IPSFileName = Mid$(IPSFileName, 1, I - 1)
If IPSFileName = "" Then GoTo CancelIPS
'apply patch
Lunar.LunarIPSApply 0, IPSFileName, needslash, &H40000000
'notify user
MsgBox "ROM patched!" & vbCrLf & "To see changes, open a new room.", vbInformation, "ROM Patched!"
GoTo CancelIPS


ApplyFolder:
CMD1.DialogTitle = "Choose any patch from the folder of patches you wish to apply.  All will be applied."
CMD1.Filter = "IPS Patches|*.IPS"
CMD1.ShowOpen
IPSFileName = CMD1.FileName
For I = 1 To Len(IPSFileName)
    If Asc(Mid$(IPSFileName, I, 1)) = 0 Then Exit For
Next I
IPSFileName = Mid$(IPSFileName, 1, I - 1)
SlashSpot = InStrRev(IPSFileName, "\")
IPSFileName = Left$(IPSFileName, SlashSpot)
If IPSFileName = "" Then GoTo CancelIPS
'set file list box to the chosen folder
IPSFile1.Path = IPSFileName
'apply patches
For I = 0 To IPSFile1.ListCount - 1
    IPSFileName = IPSFile1.List(I)
    Lunar.LunarIPSApply 0, IPSFile1.Path & "\" & IPSFileName, needslash, &H40000000
Next I
'notify user
MsgBox "ROM patched with " & I & " IPS patches!" & vbCrLf & "To see changes, open a new room.", vbInformation, "ROM patched!"
GoTo CancelIPS

CancelIPS:  'if all done
End Sub

Public Sub mnuJumpToRoomOptions_Click(Index As Integer)
'open room from clicking "E" on a door
Dim WhichDoor As Byte
Dim NewMDBText As String
Dim DD As Boolean

'which door in list
WhichDoor = RoomClip(MapTileNumber)
DD = 1 - Index

If DD = True Then mnuSaveRoom_Click
'if RoomID = 0, then go away
'will need support for typos, sadly
NewMDBText = "7" & Hex$(Doorset(WhichDoor).RoomID)
'get x/y of door's entry point so we can set scrollbars in new room
DoorScrollX = Doorset(WhichDoor).X
DoorScrollY = Doorset(WhichDoor).Y

'search for matching room in list
For I = 0 To mdbCombo.ListCount
    If NewMDBText = mdbCombo.List(I) Then GoTo FoundDoor
Next I
'if door not found in list
MsgBox "Door points to an unrecognized RoomID.", vbCritical
Exit Sub

FoundDoor:
Smile.mdbCombo.Text = NewMDBText
End Sub

Public Sub mnuLanguage_Click(Index As Integer)
For I = 0 To mnuLanguage.UBound
    mnuLanguage(I).Checked = False
Next I
mnuLanguage(Index).Checked = True
LanguageChange mnuLanguage(Index).Caption, Index
End Sub


Public Sub mnuLayer1_Click()
'change the check
mnuLayer1.Checked = mnuLayer1.Checked + 1
Do1 = mnuLayer1.Checked

DrawScreenDLL 0
End Sub

Public Sub mnuLayer2_Click()
'change the check
mnuLayer2.Checked = mnuLayer2.Checked + 1
Do2 = mnuLayer2.Checked

DrawScreenDLL 0
End Sub

Private Sub mnuLayer2Scroll_Click()
LoadMiscForm1 0
End Sub

Public Sub mnuLevelEditor_Click()
'OBSOLETE FOR USER, BUT USED BEHIND THE SCENES
'make level editing controls invisible
'PictureScroll1.Enabled = False
'
mnuSaveRoom.Enabled = True
'
If Smile.mnuScrollEditor.Checked = True Then
    FakeFrame1.Visible = True
    'FakeFrame1.ZOrder 0
    Picture3.Visible = True
    'Picture3.ZOrder 0
Else
    FakeFrame1.Visible = True
    'FakeFrame1.ZOrder 0
    Picture1.Visible = True
    'Picture1.ZOrder 0
End If
End Sub



Public Sub TakeSnapshot(Optional MapShot As Boolean = False, Optional RoomX As Integer = 0, Optional RoomY As Integer = 0)
Dim PictureType As String * 4

    PictureType = ".bmp"


If MapShot = True Then GoTo MakingMapShot

If Picture2.Visible = True Then
'do this for room snapshots
    SavePicture Picture2.Image, Left$(needslash, Len(needslash) - 4) & "_" & mdbCombo.Text & ".bmp"
    'FileCopy Left$(needslash, Len(needslash) - 4) & "_" & mdbCombo.Text & ".bmp", App.Path & "\temp.bmp"
    'Shell Chr$(34) & App.Path & "\bmp2png.exe" & Chr$(34) & " temp.bmp"
    'Do
    '    DoEvents
    'Loop Until FileExists(App.Path & "\temp.png") = True
    'FileCopy App.Path & "\temp.png", Left$(needslash, Len(needslash) - 4) & "_" & mdbCombo.Text & ".png"
    'Do
    '    DoEvents
    'Loop Until FileExists(Left$(needslash, Len(needslash) - 4) & "_" & mdbCombo.Text & ".png") = True
    'Kill App.Path & "\temp.bmp"
    'Kill App.Path & "\temp.png"
    MsgBox "Created:" & vbCrLf & Left$(needslash, Len(needslash) - 4) & "_" & mdbCombo.Text & PictureType   ' & vbCrLf & Left$(needslash, Len(needslash) - 4) & "_" & mdbCombo.Text & ".png"
Else
'do this for map screen snapshots
    FakeFrame1.Picture = MapPicture2.Image
    MapPicture2.CurrentX = 0
    MapPicture2.CurrentY = 0
    MapPicture2.Print RoomHeader1.RegionCombo1.Text
    SavePicture MapPicture2.Image, Left$(needslash, Len(needslash) - 4) & "_" & RoomHeader1.RegionCombo1.Text & ".bmp"
    MapPicture2.Picture = FakeFrame1.Picture
    FakeFrame1.Picture = Smile.Picture
    MsgBox Left$(needslash, Len(needslash) - 4) & "_" & RoomHeader1.RegionCombo1.Text & PictureType
End If
Exit Sub

MakingMapShot:
    'refresh paint position???
    SetStretchBltMode MapshotForm1.Mapshot1.hdc, 0  'HALFTONE
    SetStretchBltMode MapshotForm1.Mapshot1.hdc, COLORONCOLOR
    'regardless of tilesize, always results in the same size map
    Select Case TileSize
        Case 8: StretchBlt MapshotForm1.Mapshot1.hdc, RoomX, RoomY, Picture2.Width \ 2, Picture2.Height \ 2, Picture2.hdc, 0, 0, Picture2.Width, Picture2.Height, SRCPAINT
        Case 16: StretchBlt MapshotForm1.Mapshot1.hdc, RoomX, RoomY, Picture2.Width \ 4, Picture2.Height \ 4, Picture2.hdc, 0, 0, Picture2.Width, Picture2.Height, SRCPAINT
        Case 32: StretchBlt MapshotForm1.Mapshot1.hdc, RoomX, RoomY, Picture2.Width \ 8, Picture2.Height \ 8, Picture2.hdc, 0, 0, Picture2.Width, Picture2.Height, SRCPAINT
    End Select
End Sub

Private Sub mnuLevelToBitmap_Click(Index As Integer)
Dim RoomLoop As Integer
Dim OriginalRoom As Integer     'mdb_combo listindex of room we started in
Dim SnapX As Integer
Dim SnapY As Integer
Dim SnapRegion As String
Dim MapshotPath As String

'PICTURE OF A SINGLE ROOM
If Index = 0 Then
    TakeSnapshot
    Exit Sub
End If

'MAPSHOT
OriginalRoom = mdbCombo.ListIndex
SnapRegion = RoomHeader1.RegionCombo1.Text  'remember original area
MapshotPath = Left$(needslash, Len(needslash) - 4) & "_" & SnapRegion & ".bmp"
Load MapshotForm1

For RoomLoop = 0 To mdbCombo.ListCount - 1
    mdbCombo.Text = mdbCombo.List(RoomLoop)
    If RoomHeader1.RegionCombo1.Text = SnapRegion Then
        SnapX = Val("&H" & RoomHeader1.XText1) * 16 * 4
        SnapY = Val("&H" & RoomHeader1.YText1) * 16 * 4
        
        TakeSnapshot True, SnapX, SnapY
    End If
Next RoomLoop
mdbCombo.Text = mdbCombo.List(OriginalRoom)

SavePicture MapshotForm1.Mapshot1.Image, MapshotPath    'save after all rooms checked
Unload MapshotForm1                                     'close form to save resources and cls picturebox
MsgBox MapshotPath, vbInformation, "Region map saved."  'alret user of name
End Sub

Public Sub mnuLightBulb_Click(Index As Integer)
If Val(StateGraphicSetCombo1.ListIndex) < 0 Then
    StateGraphicSetCombo1.ListIndex = StateGraphicSetCombo1.Text
End If

For I = 0 To 2
    mnuLightBulb(I).Checked = False
Next I
mnuLightBulb(Index).Checked = True
LightBulb = Index + 1

'Show New Graphics
LunarOpenFile needslash, LC_READWRITE
DrawTiles Val(StateGraphicSetCombo1.ListIndex) + 1
RenderItNow Val(StateGraphicSetCombo1.ListIndex) + 1
LunarCloseFile
'refresh graphic sheet
MenuPicture1.Refresh
'draw to map
DrawScreenDLL 0

End Sub

Private Sub mnuLoadPoints_Click()
LoadPoints1.Show 1
End Sub



Public Sub mnuMapEditor_Click()
'bring map editor to the top

mnuMapEditor.Checked = Not mnuMapEditor.Checked
Mapper1.Visible = mnuMapEditor.Checked
If Mapper1.MapTypeCombo1.ListIndex = -1 Then Mapper1.MapTypeCombo1.Text = 3
RefreshMapHighlight
Mapper1.LoadMap_Click
End Sub

Public Sub mnuMapEditorRefresh_Click()

If Mapper1.MapTypeCombo1.ListIndex = -1 Then Mapper1.MapTypeCombo1.Text = 3
RefreshMapHighlight
Mapper1.LoadMap_Click

End Sub


Private Sub mnuOffscreenEnemies_Click()
'if haven't opened a room yet, get out of here
If mnuPreferences.Enabled = False Then Exit Sub

Dim OffscreenI As Byte
Dim MoveToZero As Boolean

MoveToZero = False
For OffscreenI = 0 To 50
    If EnemyBox(OffscreenI).Visible = True Then
        If EnemyBox(OffscreenI).Left >= Picture2.Width - 4 Then MoveToZero = True
        If EnemyBox(OffscreenI).Left < 0 Then: MoveToZero = True
        If EnemyBox(OffscreenI).Top >= Picture2.Height - 4 Then MoveToZero = True
        If EnemyBox(OffscreenI).Top < 0 Then MoveToZero = True
        'MoveToZero = True
        'If EnemyBox(OffscreenI).Left >= FakeFrame1.Width - 4 Then MoveToZero = True
        'If EnemyBox(OffscreenI).Left < EnemyBox(OffscreenI).Width + 4 Then MoveToZero = True
        'If EnemyBox(OffscreenI).Top >= FakeFrame1.Height - 4 Then MoveToZero = True
        'If EnemyBox(OffscreenI).Top < EnemyBox(OffscreenI).Height + 4 Then MoveToZero = True
    Else
        Exit For
    End If
    'If MoveToZero = True Then EnemyBox(OffscreenI).Move 0, 0
    If MoveToZero = True Then EnemyBox(OffscreenI).Move ((Abs(Picture2.Left) \ 8) * 8) + TileSize, ((Abs(Picture2.Top) \ 8) * 8) + TileSize
    MoveToZero = False
Next OffscreenI
End Sub

Private Sub mnuOffscreenPLM_Click()
'if haven't opened a room yet, get out of here
If mnuPreferences.Enabled = False Then Exit Sub

Dim OffscreenI As Byte
Dim MoveToZero As Boolean

MoveToZero = False
For OffscreenI = 0 To 50
    If PLMBox(OffscreenI).Visible = True Then
        If PLMBox(OffscreenI).Left >= Picture2.Width - 4 Then MoveToZero = True
        If PLMBox(OffscreenI).Left < 0 Then MoveToZero = True
        If PLMBox(OffscreenI).Top >= Picture2.Height - 4 Then MoveToZero = True
        If PLMBox(OffscreenI).Top < 0 Then MoveToZero = True
    Else
        Exit For
    End If
    'If MoveToZero = True Then PLMBox(OffscreenI).Move 0, 0
    If MoveToZero = True Then PLMBox(OffscreenI).Move ((Abs(Picture2.Left) \ 8) * 8) + TileSize, ((Abs(Picture2.Top) \ 8) * 8) + TileSize
    MoveToZero = False
Next OffscreenI
End Sub

Public Sub mnuOpen_Click()
Dim TestByte As Byte    'check for RoomVar and other special coding
Dim TempByte As Byte    'check to make sure it's not a PAL ROM
Dim TempROM_HEADER As Integer

KillFile needslash & ".bin"

Dim CMD1 As New OpenSave
CMD1.Filter = "SNES|*.smc;*.fig;*.swc"

CMD1.ShowOpen

Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then GoTo ClosingSub
If FileExists(DD) = False Then
    MsgBox "This file does not exist." & vbCrLf & "I'm pretty sure you don't exist either." & vbCrLf & "How do we know any of this is real?" & vbCrLf & "What... am... I?", vbCritical + vbMsgBoxRtlReading, "SMILE is aware..."
    needslash = ""
    GoTo ClosingSub
End If

'make sure this isn't a PAL ROM
Open DD For Binary As #1
If (LOF(1) / 32768) - (LOF(1) \ 32768) = 0 Then
    TempROM_HEADER = 0
Else
    TempROM_HEADER = 512
End If
    Get #1, &H7FD9& + TempROM_HEADER + 1, TempByte
Close #1
'PAL is 02-FF... we need 00 or 01
If TempByte >= 2 Then
    Select Case needslash
        Case "": MsgBox "This ROM is PAL and will not work properly with SMILE.", vbCritical, "PAL ROM": End
        Case Else: MsgBox "The newly selected ROM is PAL and will not work properly with SMILE." & vbCrLf & vbCrLf & "The previously open ROM will remain open.", vbInformation, "PAL ROM"
    End Select
    Exit Sub
End If

'not a PAL ROM, so change needslash and ROM_HEADER
needslash = DD
ROM_HEADER = TempROM_HEADER
Open needslash For Binary As #1
    Get #1, &H16B20 + ROM_HEADER + 1, TestByte
    Get #1, &H204AC + ROM_HEADER + 1, PLMBank
    Get #1, &H20B60 + ROM_HEADER + 1, ScrollPLMBank
Close #1

'show/hide RoomVarData menus
If TestByte = &H20 Then mnuRoomVarData.Enabled = True Else mnuRoomVarData.Enabled = False

ClosingSub:
If needslash = "" Then MsgBox "Must select ROM", vbInformation, "n00b!": End

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


Private Sub mnuPaletteType_Click(Index As Integer)
mnuPaletteType(0).Checked = False
mnuPaletteType(1).Checked = False
mnuPaletteType(2).Checked = False
mnuPaletteType(Index).Checked = True
End Sub




Private Sub mnuPLMType_Click()
PLMForm.Show 1, Smile
RefreshPLM Val(PLMBox(0).Tag)
End Sub


Private Sub mnuPlugins_Click()
Plugins.Show 1
End Sub

Private Sub mnuPointerMenu_Click()
PointerForm1.Visible = True
'PointerForm1.Show 1
End Sub




Private Sub mnuRemakeRoomSizeList_Click()
MsgBox "THIS WILL REMAKE A LIST OF HOW MUCH SPACE IS AVAILABLE FOR A ROOM'S LEVEL DATA, BASED ON ITS SIZE BEFORE DECOMPRESSION."
End Sub

Private Sub mnuRoomProperties_Click()
RoomHeader1.Show 1
End Sub

Private Sub mnuRoomVarData_Click()
RoomVar1.Show 1
End Sub

Private Sub mnuRunEmulator_Click()
MsgBox "Use this with the [Enter] hotkey with your mouse over the tile you want Samus to start from."
TestRoom
End Sub

Private Sub mnuSamusPoses_Click()
Poses1.Show 1
End Sub

Public Sub mnuSaveRoom_Click()
Dim Offset As Long

'Offset = Val("&H" & mdbCombo.Text & "&")
Offset = Val("&H" & newmdbText1.Text & "&")
SaveRoom2 Offset

'the stuff below is skipped if we're saving pointers but not moving data
'pointer editor would refresh the room afterwards in that case
If PointerSavingOnly = False Then
    SaveEnemies
    SavePLM
'refigure offset because it is changed in SaveRoom2
    Offset = Val("&H" & newmdbText1.Text & "&")
    SaveDoors Offset
End If
End Sub

Public Sub mnuGrid_Click()
'change the check
mnuGrid.Checked = mnuGrid.Checked + 1
DrawScreenDLL 0
End Sub




Public Sub mnuShowAll_Click()
mnuLayer1.Checked = True
mnuLayer2.Checked = True
mnuGrid.Checked = True
mnuViewPLM.Checked = True
mnuEnemies.Checked = True

Do1 = True
Do2 = True

For I = 0 To PLMBox.UBound
    If PLMBox(I).Enabled = True Then
        PLMBox(I).Visible = mnuViewPLM.Checked
    Else
        PLMBox(I).Visible = False
    End If
Next I
For I = 0 To EnemyBox.UBound
    If EnemyBox(I).Enabled = True Then
        EnemyBox(I).Visible = mnuEnemies.Checked
    Else
        EnemyBox(I).Visible = False
    End If
Next I

DrawScreenDLL 0

End Sub



Private Sub mnuSplitShip_Click()
'change the check
mnuSplitShip.Checked = mnuSplitShip.Checked + 1
End Sub

Private Sub mnuSRMFolder_Click()
LoadMiscForm1 3
End Sub

Private Sub mnuTestRoomProperties_Click()
LoadMiscForm1 1
End Sub



Private Sub mnuToggleFavorite_Click(Index As Integer)
If Index = 0 Then
    'get name of what we're adding... no name, no favorite
    DD = InputBox("Name this favorite.", "New Favorite", mdbCombo.Text)
    If DD = "" Then Exit Sub
    'change icon
    BrowserButtons1(1).Picture = FavoritesHearts1.Picture
    If mnuFavoriteList(0).Visible = False Then
        ReDim FavoriteRooms(0 To 0) As String * 45
        FavoriteRooms(0) = mdbCombo.Text & DD
        mnuFavoriteList(0).Visible = True
        mnuFavoriteList(0).Caption = DD
    Else
        ReDim Preserve FavoriteRooms(0 To UBound(FavoriteRooms) + 1) As String * 45
        FavoriteRooms(UBound(FavoriteRooms)) = mdbCombo.Text & DD
        Load mnuFavoriteList(mnuFavoriteList.UBound + 1)
        mnuFavoriteList(mnuFavoriteList.UBound).Visible = True
        mnuFavoriteList(mnuFavoriteList.UBound).Caption = DD
    End If
End If

If Index = 1 Then
    BrowserButtons1(1).Picture = FavoritesHearts1.DisabledPicture
    'hide menu and clear the value so it doesn't come up as a glowing heart
    For III = 0 To UBound(FavoriteRooms)
        If Left$(FavoriteRooms(III), 5) = mdbCombo.Text Then
            mnuFavoriteList(III).Visible = False
            FavoriteRooms(III) = ""
        End If
    Next III
End If

'toggle view of menu
mnuToggleFavorite(Index).Visible = False
mnuToggleFavorite(Abs(1 - Index)).Visible = True
End Sub

Private Sub PatternPreviewCheck_Click()
PatternPreview.Tag = Abs(PatternPreview.Tag - 1)
DrawScreenDLL 0
End Sub



Public Sub PLMBox_DblClick(Index As Integer)
'store index for property editing
PLMBox(0).Tag = Index
PLMForm.Show 0, Smile
End Sub

Private Sub SaveScrollCommand1_Click(Index As Integer)
If Index = 0 Then GoTo NormalScrollSaving

'PLM SCROLL SAVING
If ScrollArray(0) = 255 Then Exit Sub
ReDim ScrollPLMBytes(0 To 0) As Byte
For I = 0 To UBound(ScrollArray)
    If ScrollArray(I) <> ScrollArrayCopy(I) Then GoTo AddScrollEntry
ContinueScrollLoop:
Next I
GoTo SaveScrollEntry

AddScrollEntry:
ReDim Preserve ScrollPLMBytes(0 To Val(UBound(ScrollPLMBytes) + 2)) As Byte
ScrollPLMBytes(UBound(ScrollPLMBytes) - 2) = I              'screen #
ScrollPLMBytes(UBound(ScrollPLMBytes) - 1) = ScrollArray(I) 'new value
GoTo ContinueScrollLoop

SaveScrollEntry:
ScrollPLMBytes(UBound(ScrollPLMBytes)) = &H80&              'terminate scroll plm
If UBound(ScrollPLMBytes) = 0 Then MsgBox "No scroll changes have been made.": Exit Sub
SaveScrollPLM1.Show 1
Exit Sub

'NORMAL SCROLL SAVING
NormalScrollSaving:
Smile.mnuSaveRoom_Click
End Sub


Private Sub mnuScrollEditor_Click()
Dim NewTileSize As Integer
Dim IndexI As Object

If Smile.mnuScrollEditor.Checked = True Then
    If mnuTileSizes(8).Checked = True Then NewTileSize = 8
    If mnuTileSizes(16).Checked = True Then NewTileSize = 16
    If mnuTileSizes(24).Checked = True Then NewTileSize = 24
    If mnuTileSizes(32).Checked = True Then NewTileSize = 32
    mnuScrollEditor.Checked = False
Else
    NewTileSize = 8
    mnuScrollEditor.Checked = True
End If

AreaWidth = AreaWidth \ TileSize
AreaHeight = AreaHeight \ TileSize
MapDimensions NewTileSize, AreaWidth, AreaHeight
Picture3.Visible = True
TestCodeList1_Click

End Sub


Private Sub mnuShowScrollAreas_Click()
mnuShowScrollAreas.Checked = mnuShowScrollAreas.Checked + 1
DrawScreenDLL (0)
End Sub


Private Sub mnuStateProperties_Click()
States1.States1_Load_Again
States1.Show 1
End Sub



Private Sub mnuTextEditor_Click()
TextForm.Show 1
End Sub

Private Sub mnuTransparentBTS_Click()
mnuTransparentBTS.Checked = mnuTransparentBTS.Checked + 1
DrawScreenDLL (0)
End Sub

Public Sub mnuViewPLM_Click()
'change the check
mnuViewPLM.Checked = mnuViewPLM.Checked + 1
For I = 0 To PLMBox.UBound
    If PLMBox(I).Enabled = True Then
        PLMBox(I).Visible = mnuViewPLM.Checked
    Else
        PLMBox(I).Visible = False
    End If
Next I
End Sub


Private Sub Option1_Click(Index As Integer)
For I = 0 To Option1.UBound
    Option1(I).BackColor = RGB(220, 220, 220)
    Option1(I).FontBold = False
Next I
Option1(Index).BackColor = RGB(255, 255, 200)
Option1(Index).FontBold = True
Frame1(Index).ZOrder 0
End Sub


Private Sub Picture2_DragDrop(Source As Control, X As Single, Y As Single)

MapTileNumber = (X \ TileSize) + ((Y \ TileSize) * AreaWidth)

Select Case Source.Name
    Case "Slopes1": GoTo DoingSlopes
    Case "BTS_Image1": GoTo DoingSlopes
    Case "Special1": GoTo DoingSpecialBlocks
    Case Else: MsgBox "Dragged " & Source.Name: Exit Sub
End Select

DoingSlopes:
'if from bts drop down list, take that value
If Source.Name = "BTS_Image1" Then
    BTSMenuValue = Val("&H" & Left$(Smile.BTS_List1.Text, 2) & "&")
    RoomClip(MapTileNumber) = BTSMenuValue '+ Val(Slopes1.Tag)
Else
    RoomClip(MapTileNumber) = BTSMenuValue + Val(Slopes1.Tag)
End If
Dim OrientationPart As Byte
OrientationPart = Val("&H" & Right$(Hex$(RoomTile(MapTileNumber).PatternByte), 1) & "&")
'if doing slopes, set a slope
If Source.Name = "Slopes1" Then RoomTile(MapTileNumber).PatternByte = Val("&H" & (Hex$(1) & Hex$(OrientationPart)) & "&")
'if not a slope, don't set slope
'If Source.name = "BTS_Drag1" Then RoomTile(MapTileNumber).PatternByte = Val("&H" & (Hex$(PropertyPart) & Hex$(OrientationPart)) & "&")
DrawScreenDLL (MapTileNumber)
Exit Sub

DoingSpecialBlocks:
SpecialBlocks
DrawScreenDLL (MapTileNumber)
Exit Sub
End Sub






Private Sub PictureScroll1_Scroll()
PictureScroll1_Change
End Sub


Private Sub PLMBox_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then PLMBox_DblClick Index: Exit Sub
X = ScaleX(X, vbTwips, vbPixels)
Y = ScaleY(Y, vbTwips, vbPixels)
MouseMyX = X
MouseMyY = Y
If Button = 1 Then
    PLMClickX = X - (PLMBox(Index).Width / 2)
    PLMClickY = Y - (PLMBox(Index).Height / 2)
    Exit Sub
End If

End Sub

Private Sub PLMBox_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempLeft As Single
Dim TempTop As Single

Dim YAvailable As Byte  'how many tiles up/down visible in current settings
Dim XAvailable As Byte  'as a variable, in case I later add support for wider screens (or adjust for 32x32)

'XAvailable = 31
XAvailable = (MapHScroll1.Width \ 16) - 1
If Button <> 1 Then Exit Sub

X = ScaleX(X, vbTwips, vbPixels)
Y = ScaleY(Y, vbTwips, vbPixels)

TempLeft = PLMBox(Index).Left + X - MouseMyX + (TileSize / 2)
TempLeft = TempLeft - (TempLeft Mod TileSize)
TempTop = PLMBox(Index).Top + Y - MouseMyY + (TileSize / 2)
TempTop = TempTop - (TempTop Mod TileSize)
PLMBox(Index).Move TempLeft - (TempLeft Mod TileSize), TempTop
Target(1).Move PLMBox(Index).Left, PLMBox(Index).Top, PLMBox(Index).Width, PLMBox(Index).Height

'''''''''''''''''''''''''''''''''''''
'scroll map on enemy move off screen'
'''''''''''''''''''''''''''''''''''''
'SMILE.SMILECaption.Caption = Target(1).Top / TileSize & "     " & MapVScroll1.Value
If Smile.mnuEditorSizes(0).Checked Then YAvailable = 15 Else YAvailable = 31
    
'slow down scroll with timer
If ScrollTimer1.Enabled = True Then GoTo WaitForScroll
'scroll enemy up
If Target(1).Top \ TileSize < MapVScroll1.Value Then
    If Target(1).Top >= 0 Then MapVScroll1.Value = MapVScroll1.Value - 1
End If
'scroll enemy down
If Target(1).Top \ TileSize > MapVScroll1.Value + YAvailable And Target(1).Top Then
    If Target(1).Top \ TileSize <= MapVScroll1.Max + YAvailable Then MapVScroll1.Value = MapVScroll1.Value + 1
End If
'scroll enemy left
If Target(1).Left \ TileSize < MapHScroll1.Value Then
    If Target(1).Left >= 0 Then MapHScroll1.Value = MapHScroll1.Value - 1
End If
'scroll enemy right
If Target(1).Left \ TileSize > MapHScroll1.Value + XAvailable And Target(1).Left Then
    If Target(1).Left \ TileSize <= MapHScroll1.Max + XAvailable Then MapHScroll1.Value = MapHScroll1.Value + 1
End If


WaitForScroll:
ScrollTimer1.Enabled = True
End Sub

Private Sub PLMBox_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Shift = 1 Then Exit Sub
Dim TempNegXY As Integer
Dim TempLeft As Single
Dim TempTop As Single

X = ScaleX(X, vbTwips, vbPixels)
Y = ScaleY(Y, vbTwips, vbPixels)

TempLeft = PLMBox(Index).Left + X - MouseMyX + (TileSize / 2)
TempLeft = TempLeft - (TempLeft Mod TileSize)
TempTop = PLMBox(Index).Top + Y - MouseMyY + (TileSize / 2)
TempTop = TempTop - (TempTop Mod TileSize)

PLMBox(Index).Move TempLeft - (TempLeft Mod TileSize), TempTop - (TempTop Mod TileSize)

'placing PLM's by middles
TempNegXY = (PLMBox(Index).Left + (PLMBox(Index).Width \ 2)) \ TileSize 'PLMBox(Index).Width
If TempNegXY < 0 Then TempNegXY = 0
PLMSet(Index).X = Val(TempNegXY)

TempNegXY = (PLMBox(Index).Top + (PLMBox(Index).Height \ 2)) \ TileSize 'plmbox(index).height
If TempNegXY < 0 Then TempNegXY = 0
PLMSet(Index).Y = TempNegXY




End Sub

Private Sub PreviewClip_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempPreviewClip As Integer

'PreviewClip.Tag = 1

X = X \ 16
Y = Y \ 16
TempPreviewClip = ((Y * 16) + X) + 1
FakeClip(TempPreviewClip).Visible = FakeClip(TempPreviewClip).Visible + 1
Smile.EnDisClip
PreviewGridLines
End Sub






Private Sub ScrollEditorOption1_Click(Index As Integer)
Select Case Index
    Case 0: ScrollEditorText1 = "To change Normal Scrolls of a room, click on the map. Different colors have different values. If you cannot see the colors and cannot change them, that means the room doesn't have its own unique scroll data." & vbCrLf & vbCrLf & "RED    = no scrolling" & vbCrLf & "BLUE   = some scrolling" & vbCrLf & "GREEN  = full scrolling" & vbCrLf & "If you see no scroll box around an area, it'll act GREEN, but is not actual scroll data. Do not change." & vbCrLf & vbCrLf & "A scroll pointer of 0000 will make all screens act BLUE. 0001 will make all screens act GREEN.": SaveScrollCommand1(0).Visible = True: SaveScrollCommand1(1).Visible = False
    Case 1: ScrollEditorText1 = "Scroll PLM's change the scroll values of a room when touched. Change the values as you'd want the PLM to do, then save the changes." & vbCrLf & vbCrLf & "" & "For technical details of how PLM Scrolls work in hex, look at them in the plm editor.": SaveScrollCommand1(0).Visible = False: SaveScrollCommand1(1).Visible = True
    Case 2: ScrollEditorText1 = "Door scrolls are not editable in SMILE.  They are actually pointers to ASM code that changes scrolls of a room.": SaveScrollCommand1(0).Visible = False: SaveScrollCommand1(1).Visible = False
End Select

For I = 0 To 2
    If I = Index Then
        ScrollEditorOption1(I).BackColor = RGB(255, 255, 0)
    Else
        ScrollEditorOption1(I).BackColor = RGB(255, 255, 210)
    End If
Next I
End Sub

Private Sub ScrollTimer1_Timer()
'paces autoscrolling
ScrollTimer1.Enabled = False
If WheelScroller = True Then
    ScrollTimer1.Interval = 17
    GoTo ScrollScreen
Else
    ScrollTimer1.Interval = 10
    Exit Sub
End If


ScrollScreen:       'for wheel scrolling
Dim X As Single
Dim Y As Single
Dim TempScrollX As Long
Dim TempScrollY As Long

X = (Val(MapHScroll1.Tag) + Picture2.Left) - (FakeFrame1.Width \ 2)
Y = (Val(MapVScroll1.Tag) + Picture2.Top) - (FakeFrame1.Height \ 2)

'if not all that much positive or negative, leave the scrollers alone
If Abs(X) < 50 Then X = 0
If Abs(Y) < 50 Then Y = 0
'+1 or -1, according to our needs
If X <> 0 Then X = X \ Abs(X)
If Y <> 0 Then Y = Y \ Abs(Y)
'figure new values for the scrollbars and make sure they're valid
TempScrollX = MapHScroll1.Value + X
TempScrollY = MapVScroll1.Value + Y
If TempScrollX < 0 Then TempScrollX = 0
If TempScrollY < 0 Then TempScrollY = 0
If TempScrollX > MapHScroll1.Max Then TempScrollX = MapHScroll1.Max
If TempScrollY > MapVScroll1.Max Then TempScrollY = MapVScroll1.Max
'set our scrollbars to the new values
MapHScroll1.Value = TempScrollX
MapVScroll1.Value = TempScrollY
Select Case Picture2.Width
    Case Is < FakeFrame1.Width: WheelScrollerImage1.Left = Abs(Picture2.Left) + (Picture2.Width \ 2) - 32
    Case Else: WheelScrollerImage1.Left = Abs(Picture2.Left) + (FakeFrame1.Width \ 2) - 32
End Select
Select Case Picture2.Height
    Case Is < FakeFrame1.Height: WheelScrollerImage1.Top = Abs(Picture2.Top) + (Picture2.Height \ 2) - 32
    Case Else: WheelScrollerImage1.Top = Abs(Picture2.Top) + (FakeFrame1.Height \ 2) - 32
End Select
End Sub



Private Sub Slopes1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
X = X \ 16
Y = Y \ 16
If Target(2).Left <> X * 16 Or Target(2).Top <> Y * 16 Then Target(2).Move X * 16, Y * 16

BTSMenuValue = (Y * 8) + X
If Smile.SMILECaption.Caption <> Hex$(BTSMenuValue + (BTSMenuFlip(0).Value * 64) + (BTSMenuFlip(1).Value * 128)) Then Smile.SMILECaption.Caption = Hex$(BTSMenuValue + (BTSMenuFlip(0).Value * 64) + (BTSMenuFlip(1).Value * 128))
End Sub




Private Sub SMILECaption_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
BrowserBar1_MouseDown Button, Shift, X, Y
End Sub

Private Sub SMILECaption_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
BrowserBar1_MouseMove Button, Shift, X, Y
End Sub

Private Sub Special1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
X = X \ 16
Y = Y \ 16

BTSMenuValue = (Y * 9) + X
End Sub

Public Sub StateGraphicSetCombo1_Click()
Dim TempOffset(1) As ThreeByte
Dim TempASMByte As Byte
Dim TempCREIndex As Byte    'which CRE from table in ASM

'figure what the CRE Index will be, assuming (for later) that multiCRE code is used
'0000-000F chosen
If MyState.U1 >= 0 And MyState.U1 < 10 Then
    TempCREIndex = MyState.U1
End If
'this is a pointer
If MyState.U1 < 0 Then
    TempCREIndex = MyRoomVar.MultiVar1 And Val("&H000F")
End If

'Figure out what to use for CRE Tiles
Open needslash For Binary As #1
    'get the offset for tiles
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

    'get the offset for tile tables
    Get #1, &H1683D + ROM_HEADER + 1, TempOffset(1).Byte3
    Get #1, &H16841 + ROM_HEADER + 1, TempOffset(1).Byte1
    Get #1, , TempOffset(1).Byte2
    'ASM fix for tile tables in here
    Get #1, &H1683B + ROM_HEADER + 1, TempASMByte
    If &H20 = TempASMByte Then
        Get #1, &H17FD0 + TempCREIndex * 3 + ROM_HEADER + 1, TempOffset(1).Byte1
        Get #1, , TempOffset(1).Byte2
        Get #1, , TempOffset(1).Byte3
    End If

Close #1




CRETilesOffset = ThreePoint2Offset(TempOffset(0))
'fix for kejardon
If Kejardon00 = True Then CRETilesOffset = Val(&H1C8000)
CRETTableOffset = ThreePoint2Offset(TempOffset(1))
'CRETilesOffset = &H1C8000       'default offset of CRE tiles
'CRETTableOffset = &H1CA09D      'default offset of CRE ttables

If StateGraphicSetCombo1.Tag = 0 Then Exit Sub
'Show New Graphics
LunarOpenFile needslash, LC_READWRITE


If RefreshGraphicMenuMask = True Then
    Mask = True
    DrawTiles Val(MyState.GraphicSet) + 1
    RenderItNow Val(MyState.GraphicSet) + 1
    BitBlt Smile.MenuPictureMask1.hdc, 0, 0, Smile.MenuPictureMask1.Width, Smile.MenuPictureMask1.Height, Smile.MenuPictureMask1.hdc, 0, 0, DSTINVERT
    RefreshGraphicMenuMask = False
End If


Mask = False
DrawTiles Val(Smile.StateGraphicSetCombo1.List(Smile.StateGraphicSetCombo1.ListIndex))
RenderItNow Val(Smile.StateGraphicSetCombo1.List(Smile.StateGraphicSetCombo1.ListIndex))

LunarCloseFile
'refresh graphic sheet
MenuPicture1.Refresh
'draw to map
DrawScreenDLL 0
End Sub



Private Sub SystemTimer1_Timer()
'if no longer used to blink, we run our metroid
If SystemTimer1.Interval = 10 Then MetroidTimer: Exit Sub

If Smile.mdbCombo.Text = "" Then
    newmdbText1.BackColor = newmdbText1.BackColor Xor vbGreen
Else
    newmdbText1.BackColor = RGB(0, 255, 0)
    SystemTimer1.Interval = 10
End If
End Sub

Public Sub TaskCommand1_Click(Index As Integer)
'minimize window
If Index = 0 Then
    Me.WindowState = vbMinimized
End If

'maximized or not
If Index = 1 Then
    Me.WindowState = vbMaximized
End If

'close
If Index = 2 Then Unload Me 'close program

'help
If Index = 3 Then PopupMenu mnuHelp
End Sub

Public Sub TestCodeList1_Click()
If TestCodeList1.Tag = 1 Then Exit Sub
TestCodeList1.Tag = 1
Smile.StateGraphicSetCombo1.Tag = 0
Dim Offset As Long
Offset = Val("&H" & mdbCombo.Text & "&")
'Offset = Val("&H" & newmdbText1.Text & "&")

OpenRoom Offset, Left$(TestCodeList1.Text, 4), Right$(TestCodeList1.Text, 1)
TestCodeList1.Tag = 0
Offset = Val("&H" & mdbCombo.Text & "&")
'Offset = Val("&H" & newmdbText1.Text & "&")
ReadDoors Offset
ReadEnemies
ReadPLM
mnuLevelEditor_Click
End Sub








Public Sub TestFrame1_Click()
TestFrame1.Visible = False
End Sub





Private Sub TestLabel1_Click()
TestFrame1_Click
Smile.mnuFile.Enabled = True
Smile.mnuEdit.Enabled = True
Smile.mnuPreferencesView.Enabled = True
Smile.mnuPreferencesView.Enabled = True
Smile.mnuTools.Enabled = True
Smile.mnuHelp.Enabled = True
End Sub


Private Sub VFlip_Click()
'flips the graphics and order of tiles, but not the properties
Dim TempStamper As Tile
Dim TempClip As Byte
Dim StampWidth As Byte
Dim StampHeight As Byte
Dim HOR As Integer
Dim VER As Integer
Dim HORSTART As Integer
Dim VERSTART As Integer

'USED'IN'HFLIP'AND'VFLIP''''''''''''''
HOR = -HFlip.Value
VER = -VFlip.Value
HORSTART = -(HOR * PreviewClip.Width)
VERSTART = -(VER * PreviewClip.Height)
If HORSTART > 0 Then HORSTART = HORSTART - 1
If VERSTART > 0 Then VERSTART = VERSTART - 1
If HOR = 0 Then HOR = 1
If VER = 0 Then VER = 1
StretchBlt PreviewClip.hdc, HORSTART, VERSTART, PreviewClip.Width * HOR, PreviewClip.Height * VER, PreviewClipBuffer.hdc, 0, 0, PreviewClip.Width, PreviewClip.Height, SRCCOPY
''''''''''''''''''''''''''''''''''''''
'StretchBlt PreviewClip.hdc, 0, PreviewClip.Height - 1, PreviewClip.Width, -PreviewClip.Height, PreviewClipBuffer.hdc, 0, -1, PreviewClip.Width, PreviewClip.Height, SRCCOPY
PreviewGridLines
PreviewClip.Refresh

For I = 1 To StampSize
    If FakeClip(I).Visible = True Then StampWidth = I
Next I

For I = 1 To 256 Step StampSize
    If FakeClip(I).Visible = True Then StampHeight = (I \ StampSize) + 1
Next I


For HOR = 1 To StampWidth
For VER = 0 To StampHeight - 1
    If StampHeight Mod 2 = 0 And VER * 2 > (StampHeight - 1) Then Exit For
    If StampHeight Mod 2 <> 0 And VER * 2 > (StampHeight - 1) + 1 Then Exit For

    TempStamper = ClipBoardTile((VER * StampSize) + HOR)
    ClipBoardTile((VER * StampSize) + HOR) = ClipBoardTile(((StampHeight - VER - 1) * StampSize) + HOR)
    ClipBoardTile(((StampHeight - VER - 1) * StampSize) + HOR) = TempStamper

    TempClip = ClipBoardClip((VER * StampSize) + HOR)
    ClipBoardClip((VER * StampSize) + HOR) = ClipBoardClip(((StampHeight - VER - 1) * StampSize) + HOR)
    ClipBoardClip(((StampHeight - VER - 1) * StampSize) + HOR) = TempClip
Next VER
Next HOR


End Sub









Private Sub Command5_Click()
For I = 0 To 511
Listing(I) = 0
Next I
End Sub

Private Sub Command6_Click()
'SaveArea2 AreaWidth * AreaHeight
Dim Offset As Long

Offset = Val("&H" & mdbCombo.Text & "&")
'Offset = Val("&H" & newmdbText1.Text & "&")
'SaveRoom Offset
End Sub


Public Sub HFlip_Click()
'flips the graphics and order of tiles, but not the properties
Dim TempStamper As Tile
Dim TempClip As Byte
Dim StampWidth As Byte
Dim StampHeight As Byte
Dim HOR As Integer
Dim VER As Integer
Dim HORSTART As Integer
Dim VERSTART As Integer
Dim GROUP As Integer

'USED'IN'HFLIP'AND'VFLIP''''''''''''''
HOR = -HFlip.Value
VER = -VFlip.Value
HORSTART = -(HOR * PreviewClip.Width)
VERSTART = -(VER * PreviewClip.Height)
If HORSTART > 0 Then HORSTART = HORSTART - 1
If VERSTART > 0 Then VERSTART = VERSTART - 1
If HOR = 0 Then HOR = 1
If VER = 0 Then VER = 1
StretchBlt PreviewClip.hdc, HORSTART, VERSTART, PreviewClip.Width * HOR, PreviewClip.Height * VER, PreviewClipBuffer.hdc, 0, 0, PreviewClip.Width, PreviewClip.Height, SRCCOPY
''''''''''''''''''''''''''''''''''''''
'StretchBlt PreviewClip.hdc, PreviewClip.Width - 1, 0, -PreviewClip.Width, PreviewClip.Height, PreviewClip.hdc, -1, 0, PreviewClip.Width, PreviewClip.Height, SRCCOPY

PreviewGridLines
PreviewClip.Refresh
'find width of clipboard
For I = 1 To StampSize
    If FakeClip(I).Visible = True Then StampWidth = I
Next I
'find height of clipboard
For I = 1 To 256 Step StampSize
    If FakeClip(I).Visible = True Then StampHeight = (I \ StampSize) + 1
Next I

'actual flipping of tiles and data in clipboard
For VER = 0 To StampHeight - 1
For HOR = 1 To StampWidth + 1
'if beyond the width of the clipboard, go to the next y value
    If StampWidth Mod 2 = 0 And HOR * 2 > StampWidth Then Exit For
    If StampWidth Mod 2 <> 0 And HOR * 2 > StampWidth + 1 Then Exit For

    TempStamper = ClipBoardTile(HOR + (VER * StampSize))
    ClipBoardTile(HOR + (VER * StampSize)) = ClipBoardTile(((VER * StampSize)) + (StampWidth - HOR + 1))
    ClipBoardTile(((VER * StampSize)) + (StampWidth - HOR + 1)) = TempStamper

    TempClip = ClipBoardClip(HOR + (VER * StampSize))
    ClipBoardClip(HOR + (VER * StampSize)) = ClipBoardClip(((VER * StampSize)) + (StampWidth - HOR + 1))
    ClipBoardClip(((VER * StampSize)) + (StampWidth - HOR + 1)) = TempClip
Next HOR
Next VER

End Sub


Private Sub Form_Load()
'MsgBox "Combine View and Preferences menus." & vbCrLf & "Goal is to have one set of controls for handling SMILE, another set for handling the ROM."
Dim teststring As String * 7

FindLanguageFiles

Open App.Path & "\files\mdb.txt" For Binary As #1
    Do
        Get #1, , teststring
        mdbCombo.AddItem Left$(teststring, 5)
    Loop Until EOF(1)
Close #1

MakeSongList

Special1.Picture = LoadPicture(App.Path & "\files\bts_special.gif")

DrawBTSMenu 0
'linux fix
'Slopes1.DragIcon = BTS_Image1.DragIcon
Special1.DragIcon = BTS_Image1.DragIcon
Picture2.MouseIcon = Smile.Icon
FakeFrame1.Height = 256 + MapHScroll1.Height
'prevent error on start up
ReDim RoomTile2(0 To 0) As Tile
'list regions
RoomHeader1.RegionCombo1.AddItem "CRATERIA"
RoomHeader1.RegionCombo1.AddItem "BRINSTAR"
RoomHeader1.RegionCombo1.AddItem "NORFAIR"
RoomHeader1.RegionCombo1.AddItem "WRECKED SHIP"
RoomHeader1.RegionCombo1.AddItem "MARIDIA"
RoomHeader1.RegionCombo1.AddItem "TOURIAN"
RoomHeader1.RegionCombo1.AddItem "CERES"
RoomHeader1.RegionCombo1.AddItem "DEBUG"
RoomHeader1.RegionCombo1.Text = RoomHeader1.RegionCombo1.List(0)

'load INI
LoadINI
'check to see if needslash stored in the INI is valid
If FileExists(needslash) = True Then
    AutoOpenROM
Else
    mnuOpen_Click
End If

'Set size of Rom_Header, whether 0h or 200h
'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
'Smile.Move 0, 0
BTS_List1.Text = BTS_List1.List(0)
'BTS_Image1.DragIcon = Slopes1.DragIcon

For I = 1 To 50
Load EnemyBox(I)
EnemyBox(I).ToolTipText = Right$("00" & Hex$(I), 2)
Load PLMBox(I)
PLMBox(I).ToolTipText = Right$("00" & Hex$(I), 2)
Next I

'LoadINI

'set some variable
SnapToGrid = mnuDoSnap.Checked

'raise map screen to top
Smile.Move 0, 0
ScrollEditorOption1(0).Value = True
Option1(0).Value = True
RecognizePlugIns

LoadIcons:
BrowserButtons1(4).Picture = Icons1.ROM.Picture
BrowserButtons1(6).Picture = Icons1.Save.Picture
BrowserButtons1(5).Picture = Icons1.SCREENSHOT.Picture
FavoritesHearts1.Picture = Icons1.FAVORITES.Picture
FavoritesHearts1.DisabledPicture = Icons1.FAVORITES.DisabledPicture
BrowserButtons1(3).Picture = Icons1.PREFERENCES.Picture
BrowserButtons1(2).Picture = Icons1.SWAP.DisabledPicture
FavoritesHearts1.DownPicture = Icons1.SWAP.Picture
End Sub

Private Sub Form_Resize()
'MsgBox "!"
Smile.SMILECaption.Caption = "X = " & Smile.Width & "   Y = " & Smile.Height

'Smile.FakeFrame2.Height = ScaleY(Picture1.Top + Picture1.Height, vbPixels, vbTwips)
Smile.FakeFrame2.Height = Picture1.Top + Picture1.Height
ddd = ScaleY(Smile.Height, vbTwips, vbPixels) - Picture1.Top

'If ddd > 66 Then
    'Picture1.Height = ddd - 48
    Picture1.Height = 128
    'MsgBox Picture1.Height
    Smile.PictureScroll1.Height = Picture1.Height
'End If
'If TestFrame1.Visible = True Then TestFrame1.Visible = False
If TestFrame1.Visible = True Then TestFrame1.ZOrder 0

End Sub

Private Sub Form_Unload(Cancel As Integer)
SaveINI
KillFile needslash & ".bin"
End
End Sub





Private Sub MapHScroll1_Change()
Picture2.Left = -(MapHScroll1.Value * TileSize)
'keep FX1 control on extreme edge of screen at all times
Smile.Layer3Picture1.Move 0 - Picture2.Left, (TempFX1.Surface_Start) * (TileSize / 16), 4, Smile.Picture2.Height

End Sub

Public Sub MapVScroll1_Change()
Picture2.Top = -(MapVScroll1.Value * TileSize)

End Sub




Private Sub mnuFillArea_Click()
Dim L1 As Byte
If Smile.mnuLayer1.Checked = True Then L1 = 1
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = True Then L1 = 2
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = False Then L1 = 0


If L1 = 1 Then
    For III = 0 To (AreaWidth * AreaHeight) - 1
        RoomTile(III) = ClipBoardTile(1)
        RoomClip(III) = ClipBoardClip(1)
    Next III
End If
If L1 = 2 Then
    For III = 0 To (AreaWidth * AreaHeight) - 1
        RoomTile2(III) = ClipBoardTile(1)
    Next III
End If
DrawScreenDLL (0)
End Sub

Public Sub mnuTileSizes_Click(Index As Integer)
Dim NewTileSize As Integer

mnuScrollEditor.Checked = False
NewTileSize = Index

AreaWidth = AreaWidth \ TileSize
AreaHeight = AreaHeight \ TileSize
MapDimensions NewTileSize, AreaWidth, AreaHeight

Target(0).Left = PreviewClip.Width
Target(1).Top = PreviewClip.Height
For Each Choice In mnuTileSizes
    Choice.Checked = False
Next Choice
mnuTileSizes(Index).Checked = True
TestCodeList1_Click
End Sub




Private Sub Picture2_KeyDown(KeyCode As Integer, Shift As Integer)
If DisplayFX1 = True Then
    Select Case Shift
        'Case 2: Layer3Picture1.Visible = True
        'Case Else: Layer3Picture1.Visible = False
    End Select
End If
'If TileSize = 8 Then Exit Sub
If KeyCode < 112 Or KeyCode > 117 Then DoHotKeys KeyCode, Shift
'DrawScreenDLL MapTileNumber
End Sub

Public Sub Picture2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MetroidTarget X, Y

Dim TempTileNumber As Long
Dim L1 As Boolean   'layer 1 (if not, layer 2)
Dim TempTypeValue As Byte
'If Button > 2 Then Exit Sub 'no mouse wheel button
If Button = 4 Then GoTo EnableScroller
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = True Then L1 = False Else L1 = True
If L1 = False And UBound(RoomTile2) = 0 Then Exit Sub

If Smile.mnuScrollEditor.Checked = True Then GoTo EditingScrollValues
'choose new tile location, then check to see whether to to force redraw of bts's
If Button = 2 Then NewClick = ((Y \ TileSize) * AreaWidth) + (X \ TileSize)
'move FX1 Layer 3 if holding Control down
If Button = 1 And Shift = 2 Then GoTo MoveFX1Layer3

X = Target(1).Left
Y = Target(1).Top
If Button = 2 Then
    Target(1).Move X, Y, TileSize, TileSize
    GoTo CopyTile
Else
    GoTo SetTile    'right click same as Q+shift
End If

ShowMenu:
'This code is also in DoHotKeys under D and E
TempTileNumber = (X \ TileSize) + ((Y \ TileSize) * AreaWidth)
SelectedTile = TempTileNumber

'are you clicking on the edge of a screen?
My_EdgeX = (Smile.Target(1).Left / 16) Mod 16
My_EdgeY = (Smile.Target(1).Top / 16) Mod 16
If My_EdgeX = 0 Or My_EdgeX = 15 Or My_EdgeY = 0 Or My_EdgeY = 15 Then
    mnuDoorPopOptions(0).Enabled = True
Else
    mnuDoorPopOptions(0).Enabled = False
End If

'are you clicking on a door tile?
If RoomTile(SelectedTile).PatternByte \ 16 = 9 Then
    mnuDoorPopOptions(1).Enabled = True
Else
    mnuDoorPopOptions(1).Enabled = False
End If

PopupMenu mnuDoor
Exit Sub

CopyTile:
Dim TempBlockID As Byte
Dim TempSheet As Byte
Dim TempOrientation As Byte
Dim TempProperties As Byte
Dim FlipAxis(1) As Byte '0 or 32 . . . (0) for x, (1) for y . . . to find starting point of graphic
Dim Flipped(1) As Integer '-1 or +1 . . . to flip graphic

TempTileNumber = (X \ TileSize) + ((Y \ TileSize) * AreaWidth)
SelectedTile = TempTileNumber
If SelectedTile > UBound(RoomClip) Then MsgBox "You've clicked on a location that doesn't exist because the level data isn't decompressing correctly. This is either because it was pointed to incorrectly, the room header has been overwritten, or some of the data itself has been overwritten.", vbInformation, "This should never happen.": Exit Sub
If Button = 2 Then Smile.SMILECaption.Caption = Right$("00" & Hex$(RoomClip(SelectedTile)), 2)

If L1 = True Then
    TempBlockID = RoomTile(TempTileNumber).BlockID
    TempSheet = RoomTile(TempTileNumber).PatternByte Mod 4
Else
    TempBlockID = RoomTile2(TempTileNumber).BlockID
    TempSheet = RoomTile2(TempTileNumber).PatternByte Mod 4
End If

NoPropertyChanging = True

If L1 = True Then
    TempProperties = Val("&H" & Left$(Right$("00" & Hex$(RoomTile(TempTileNumber).PatternByte), 2), 1) & "&")
End If

    temptilevalue = VScroll1.Value
    VScroll1.Value = Abs(VScroll1.Value - 8)    'to ensure that value changes
    VScroll1.Value = TempProperties
    If temptilevalue <> VScroll1.Value And PatternPreview.Tag = 1 Then
    'XXXXXX look up
        'PatternPreview.Tag = 0
        DrawScreenDLL 0
    End If
    'XXXXXXXXXXXXXXXXXXXXXX

NoPropertyChanging = False

'draws to "permanent" box
SelectedTileSheet = TempSheet
SelectedTileBlockID = TempBlockID
SelectedTileX = (X \ TileSize) * TileSize
SelectedTileY = (Y \ TileSize) * TileSize

'copy to clip
TempPictureNumber = ((Y \ 16) * 32) + (X \ 16)
If L1 = True Then
    ClipBoardTile(Button) = RoomTile(MapTileNumber)
Else
ClipBoardTile(Button) = RoomTile2(MapTileNumber)
End If
ClipBoardClip(Button) = RoomClip(MapTileNumber)
X = ClipBoardTile(Button).BlockID * 16
Y = 0

Do
If X >= 512 Then X = X - 512: Y = Y + 16
Loop Until X < 512
Exit Sub


SetTile:
Dim StampX As Integer
Dim StampY As Integer
Dim StampOffset As Integer
Dim TempMapTileNumber
'draw tile graphic to map and changes tile properties

TempMapTileNumber = MapTileNumber

'For Button = 1 To 256
'reversed the order of this loop in order to not write over large blocks placed in by
'xthrough when pasting... places the clipboard on from bottom to top
For Button = 256 To 1 Step -1
'If FakeClip(Button).Visible = False Then GoTo SkipButton
StampX = (Button - 1) Mod StampSize
StampY = (Button - 1) \ StampSize
StampOffset = (StampY * AreaWidth) + StampX
MapTileNumber = TempMapTileNumber + StampOffset
If MapTileNumber > UBound(RoomTile) Then GoTo NoStamp 'Exit Sub
If X + (StampX * TileSize) >= Picture2.Width Then GoTo NoStamp
If FakeClip(Button).Visible = False Then GoTo NoStamp
If L1 = True Then
    RoomTile(MapTileNumber) = ClipBoardTile(Button)
    RoomClip(MapTileNumber) = ClipBoardClip(Button)
Else
'don't copy non-orientation part of pattern byte
'if it has an effect, must be removed
    RoomTile2(MapTileNumber) = ClipBoardTile(Button)
End If

'stamping
If HFlip.Value = 1 Then DoHotKeys 37, 0, False
If VFlip.Value = 1 Then DoHotKeys 38, 0, False
DrawScreenDLL MapTileNumber
NoStamp:    'don't stamp beyond the edge of picture2 (ie- dropping to next line)

SkipButton:
Next Button

'refreshing entire map for one tile?

Picture2.Refresh
MapTileNumber = TempMapTileNumber
Exit Sub

EditingScrollValues:
'display screen # clicked on
Smile.SMILECaption.Caption = Right$("00" & Hex$(NumberOfScroll(Val(X), Val(Y))), 2)
'edit the value, if left click
If Button = 1 Then
    RaiseScroll X, Y
End If
Exit Sub


MoveFX1Layer3:
If DisplayFX1 = False Then MsgBox "DisplayFX1 = False, yet we're still able to edit its values?"
Layer3Picture1.Top = Y
TempFX1.Surface_Start = Y * (16 \ TileSize)
Exit Sub

EnableScroller:
Picture2.MousePointer = 15
WheelScroller = True

Select Case Picture2.Width
    Case Is < FakeFrame1.Width: WheelScrollerImage1.Left = Abs(Picture2.Left) + (Picture2.Width \ 2) - 32
    Case Else: WheelScrollerImage1.Left = Abs(Picture2.Left) + (FakeFrame1.Width \ 2) - 32
End Select
Select Case Picture2.Height
    Case Is < FakeFrame1.Height: WheelScrollerImage1.Top = Abs(Picture2.Top) + (Picture2.Height \ 2) - 32
    Case Else: WheelScrollerImage1.Top = Abs(Picture2.Top) + (FakeFrame1.Height \ 2) - 32
End Select

WheelScrollerImage1.Visible = True
End Sub

Public Sub Picture2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
ClearMenuHighlights
MetroidTarget X, Y
If WheelScroller = True Then GoTo ScrollScreen
If DisplayFX1 = True Then
    Select Case Shift
        'Case 2: Layer3Picture1.Visible = True
        'Case Else: Layer3Picture1.Visible = False
    End Select
End If

If WheelScroller = True Then GoTo ScrollScreen
Dim OldY As Single

'FakeFrame1.ZOrder 0
OldY = Y
If X >= Picture2.Width Then X = Picture2.Width - 1
If Y >= Picture2.Height Then Y = Picture2.Height - 1

Dim L1 As Boolean   'layer 1 (if not, layer 2)
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = True Then L1 = False Else L1 = True
If L1 = False And UBound(RoomTile2) = 0 Then Exit Sub

'If TileSize = 8 Then Exit Sub
Dim RealX
Dim RealY

RealX = (X \ TileSize) * TileSize
RealY = (Y \ TileSize) * TileSize

If X < 0 Or Y < 0 Then Exit Sub
If Y > Picture2.Height - 1 Then Exit Sub
'sets focus to map, so HotKeys work
Picture2.SetFocus
MapTileNumber = (X \ TileSize) + ((Y \ TileSize) * AreaWidth)
If Button <> 0 And MapTileNumber > UBound(RoomTile) Then MsgBox "You've clicked on a location that doesn't exist because the level data isn't decompressing correctly. This is either because it was pointed to incorrectly, the room header has been overwritten, or some of the data itself has been overwritten.", vbInformation, "This should never happen.": Exit Sub


If Button = 1 Then Smile.SMILECaption.Caption = Right$("00" & Hex$(RoomTile(MapTileNumber).PatternByte), 2)
If Shift = 1 And Button <> 1 Then Smile.SMILECaption.Caption = "Map Tile Number = $" & Hex$(MapTileNumber)
If Shift = 2 And Button = 1 Then Smile.SMILECaption.Caption = "Liquid Surface = $" & Hex$(Y * (16 \ TileSize))

If Button < 2 Then
    FakeTargets(1).Left = RealX
    FakeTargets(1).Top = RealY
    If Target(1).Left = (X \ TileSize) * TileSize And Target(1).Top = (Y \ TileSize) * TileSize Then
        'force a refresh if moving layer3 position
        If Button = 1 And Shift = 1 Then Picture2_MouseDown Button, Shift, X, OldY
    Exit Sub
    End If
'XXXXXX commented out to prevent target size from changing back when changing tile sizes
    Target(1).Move (X \ TileSize) * TileSize, (Y \ TileSize) * TileSize, StampX * (TileSize / 16), StampY * (TileSize / 16)
End If

If Target(1).Width < 8 Then Target(1).Width = TileSize - 1: Target(1).Height = TileSize - 1

If Button = 1 Then Picture2_MouseDown Button, Shift, X, OldY
If Button <> 2 Then Exit Sub




''XXXXXXXXXXXXXXXXXXXXXXXX
'up to left (or left)
If RealX <= FakeTargets(1).Left And RealY <= FakeTargets(1).Top Then
    Smile.Target(1).Move RealX, RealY
End If
'down to left
If RealX <= FakeTargets(1).Left And RealY >= FakeTargets(1).Top Then
    Smile.Target(1).Left = RealX
End If
'up to right (or right)
If RealX >= FakeTargets(1).Left And RealY <= FakeTargets(1).Top Then
    Smile.Target(1).Top = RealY
End If

'adjust size of target
    Target(1).Width = Abs(FakeTargets(1).Left - RealX) + TileSize
    Target(1).Height = Abs(FakeTargets(1).Top - RealY) + TileSize
Exit Sub
''''''''''''''''''''''

ScrollScreen:
'have this here to prevent moving target box during wheel scrolling
MapHScroll1.Tag = X
MapVScroll1.Tag = Y
ScrollTimer1.Enabled = True
End Sub




Private Sub Picture2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim MenuTileNumber As Integer

MetroidTarget X, Y

If WheelScroller = True Then GoTo ScrollScreen
If Button > 2 Then Exit Sub
If X > Picture2.Width Then X = Picture2.Width - 1 ': MsgBox ""
If Y >= Picture2.Height Then Y = Picture2.Height - 1
Dim L1 As Boolean   'layer 1 (if not, layer 2)
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = True Then L1 = False Else L1 = True
If L1 = False And UBound(RoomTile2) = 0 Then Exit Sub

If Smile.mnuScrollEditor.Checked = True Then Exit Sub
If Button <> 2 Then Exit Sub
HFlip.Value = 0
VFlip.Value = 0
Dim XAxis As Byte
Dim YAxis As Byte
Dim TilesWide As Byte
Dim TilesHigh As Byte
Dim TempButton As Integer
Dim UsingStamp(256) As Boolean

'click and drag support
OldClick = NewClick
NewClick = ((Y \ TileSize) * AreaWidth) + (X \ TileSize)

'flip so that directions other than down-right work
'basically sets it so smaller y is on top
'If NewClick < OldClick Then Exit Sub

If NewClick < OldClick Then
    ddd = OldClick
    OldClick = NewClick
    NewClick = ddd
End If

If OldClick < 0 Then Exit Sub

'only one tile selected... highlight it in the tile menu
If OldClick = NewClick Then
    'grab the menu tile number for the single block selected
    MenuTileNumber = RoomTile(OldClick).BlockID + ((RoomTile(OldClick).PatternByte Mod 4) * 256)
    SMILECaption.Caption = MenuTileNumber
    'move target appropriately
    Target(0).Move (MenuTileNumber Mod 32) * 16, (MenuTileNumber \ 32) * 16
    'adjust scroll accordingly
    PictureScroll1.Value = ((MenuTileNumber \ 32) \ 8) * 8
End If

'original commented out, just in case
'TilesWide = ((NewClick - OldClick) Mod AreaWidth) + 1
'TilesHigh = ((NewClick - OldClick) \ AreaWidth) + 1
TilesWide = Target(1).Width \ TileSize
TilesHigh = Target(1).Height \ TileSize

If TilesWide > StampSize Then TilesWide = StampSize
If TilesHigh > StampSize Then TilesHigh = StampSize

For YAxis = 1 To TilesHigh
For XAxis = 1 To TilesWide
    TempButton = ((YAxis - 1) * StampSize) + XAxis
    Picture2_Touch TempButton, 0, ((XAxis - 1 + (OldClick Mod AreaWidth)) * TileSize), ((YAxis - 1 + (OldClick \ AreaWidth)) * TileSize)
    UsingStamp(TempButton) = True
Next XAxis
Next YAxis

'16 instead of tilesize, because we do not want the
'tiles to increase in size in the preview
StampY = TilesHigh * 16
StampX = TilesWide * 16
PreviewClip.Width = StampX
PreviewClip.Height = StampY

For I = 1 To 256
    FakeClip(I).Visible = UsingStamp(I)
Next I
StretchBlt PreviewClip.hdc, 0, 0, StampX, StampY, Picture2.hdc, Target(1).Left, Target(1).Top, TilesWide * TileSize, TilesHigh * TileSize, SRCCOPY
PreviewClip.Refresh

UpdatePreviewBuffer
'PreviewClip.Tag = 0
PreviewGridLines
Exit Sub

ScrollScreen:
EnableScroller:
Picture2.MousePointer = 0
WheelScroller = False
WheelScrollerImage1.Visible = False
End Sub

Private Sub VisibleTimer1_Timer()
If Smile.Visible = False Then Exit Sub
VisibleTimer1.Enabled = False
MoveControls Val(mnuEditorSizes(0).Tag)


End Sub

Public Sub VScroll1_Change()
Dim TV As Byte
Dim TVtext

TV = VScroll1.Value

If TV = 0 Then TVtext = "Air. X-RAY."
If TV = 1 Then TVtext = "Slope."
If TV = 2 Then TVtext = "Air. Fool X-RAY."
If TV = 3 Then TVtext = "Treadmill."
If TV = 4 Then TVtext = "Shootable Air."
If TV = 5 Then TVtext = "Horizontal."
If TV = 6 Then TVtext = "Air???"
If TV = 7 Then TVtext = "Bombable Air."
If TV = 8 Then TVtext = "Solid block."
If TV = 9 Then TVtext = "Door."
If TV = 10 Then TVtext = "Spike Block."
If TV = 11 Then TVtext = "Crumble Block."
If TV = 12 Then TVtext = "Shot Block."
If TV = 13 Then TVtext = "Vertical."
If TV = 14 Then TVtext = "Grapple Block."
If TV = 15 Then TVtext = "Bomb Block."
'2 - Used in glass in Wrecked Ship
'6 - Unknown


PatternText.Text = TVtext
PatternPreview.Picture = LoadPicture(App.Path & "\files\patterns\" & TV & ".gif")
ChangeProperties False
Smile.Picture2.Refresh
End Sub

Private Sub VScroll1_Scroll()
VScroll1_Change
End Sub


Public Sub Picture2_Touch(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim L1 As Boolean   'layer 1 (if not, layer 2)
If Smile.mnuLayer1.Checked = False And Smile.mnuLayer2.Checked = True Then L1 = False Else L1 = True
If L1 = False And UBound(RoomTile2) = 0 Then Exit Sub

Dim TempPictureNumber As Integer   '# of tile in map
TempPictureNumber = ((Y \ TileSize) * AreaWidth) + (X \ TileSize)

If L1 = True Then
    ClipBoardTile(Button) = RoomTile(OldClick + ((Button - 1) Mod StampSize) + (((Button - 1) \ StampSize) * AreaWidth))
Else
    ClipBoardTile(Button) = RoomTile2(OldClick + ((Button - 1) Mod StampSize) + (((Button - 1) \ StampSize) * AreaWidth))
End If

ClipBoardClip(Button) = RoomClip(OldClick + ((Button - 1) Mod StampSize) + (((Button - 1) \ StampSize) * AreaWidth))
End Sub




Public Sub MenuPicture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempPictureNumber As Integer   '# of tile in tile sheet

'If Button <> 1 Then Exit Sub

Smile.HFlip.Value = 0
Smile.VFlip.Value = 0

TempPictureNumber = ((Y \ 16) * 32) + (X \ 16)
NewClick = TempPictureNumber


'show default values of patternbyte and bts
Dim Byte1 As Byte
Dim Byte2 As Byte
GSet = Val(Smile.StateGraphicSetCombo1.List(Smile.StateGraphicSetCombo1.ListIndex))
    Open App.Path & "\files\menus\" & GSet & ".val" For Binary As #1
    Get #1, TempPictureNumber + 1, Byte1
        Get #1, 1024 + TempPictureNumber + 1, Byte2
    Close #1
    
Smile.SMILECaption.Caption = Hex$(Byte1) & "   " & Hex$(Byte2)
End Sub


Public Sub MenuPicture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
ClearMenuHighlights
FakeFrame2.ZOrder 1       'include this to hide fakeframe2, if needed
'Picture1.ZOrder 0
'FakeFrame1.ZOrder 0

If X < 0 Then X = 0
If Y < 0 Then Y = 0

If X > MenuPicture1.Width Then X = MenuPicture1.Width - 1
If Y > MenuPicture1.Height Then Y = MenuPicture1.Height - 1

Dim RealX
Dim RealY

RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16



'up to left (or left)
If RealX <= FakeTargets(0).Left And RealY <= FakeTargets(0).Top Then
    Smile.Target(0).Move RealX, RealY
End If
'down to left
If RealX <= FakeTargets(0).Left And RealY > FakeTargets(0).Top Then
    Smile.Target(0).Left = RealX
End If

'up to right (or right)
If RealX >= FakeTargets(0).Left And RealY <= FakeTargets(0).Top Then
    Smile.Target(0).Top = RealY
End If
'down to right doesn't need any moving


'placing new location of target box, if a single box
'how place when goint up and left?
If Button = 0 Then
    'move 16x16 target
    Smile.Target(0).Move RealX, RealY, 16, 16
    FakeTargets(0).Left = RealX
    FakeTargets(0).Top = RealY
Else
    'resize target
    Smile.Target(0).Width = Abs(FakeTargets(0).Left - RealX) + 16
    Smile.Target(0).Height = Abs(FakeTargets(0).Top - RealY) + 16
End If
End Sub


Private Sub MenuPicture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If X > MenuPicture1.Width Then X = MenuPicture1.Width - 1
If Y > MenuPicture1.Height Then Y = MenuPicture1.Height - 1
'If Button <> 1 Then Exit Sub

Dim XAxis As Byte
Dim YAxis As Byte
Dim TilesWide As Byte
Dim TilesHigh As Byte
Dim TempButton As Integer
Dim UsingStamp(256) As Boolean
Dim OldX As Integer
Dim OldY As Integer
Dim NewX As Integer
Dim NewY As Integer

'click and drag support
OldClick = NewClick
NewClick = ((Y \ 16) * 32) + (X \ 16)

'flip so that directions other than down-right work
'basically sets it so smaller y is on top
If NewClick < OldClick Then
    ddd = OldClick
    OldClick = NewClick
    NewClick = ddd
End If

'x/y boundaries
NewX = (NewClick Mod 32) * 16
NewY = (NewClick \ 32) * 16
OldX = (OldClick Mod 32) * 16
OldY = (OldClick \ 32) * 16

'use right-most tile's X
If OldX > NewX Then
    NewClick = NewClick + 1
    OldClick = OldClick - 1
End If

TilesWide = ((NewClick - OldClick) Mod 32) + 1
TilesHigh = ((NewClick - OldClick) \ 32) + 1
If TilesWide > StampSize Then TilesWide = StampSize
If TilesHigh > StampSize Then TilesHigh = StampSize

For XAxis = 1 To TilesWide
For YAxis = 1 To TilesHigh
TempButton = ((YAxis - 1) * StampSize) + XAxis
MenuPicture1_Touch TempButton, 0, ((XAxis - 1 + (OldClick Mod 32)) * 16), ((YAxis - 1 + (OldClick \ 32)) * 16)
UsingStamp(TempButton) = True
Next YAxis
Next XAxis

'16 instead of tilesize, because we do not want to increase
'image in preview
StampY = TilesHigh * 16
StampX = TilesWide * 16
PreviewClip.Width = StampX
PreviewClip.Height = StampY

StretchBlt PreviewClip.hdc, 0, 0, StampX, StampY, MenuPicture1.hdc, Target(0).Left, Target(0).Top, StampX, StampY, SRCCOPY
UpdatePreviewBuffer
For I = 1 To 256
    FakeClip(I).Visible = UsingStamp(I)
Next I
'PreviewClip.Tag = 0
PreviewGridLines

End Sub


Public Sub PictureScroll1_Change()
MenuPicture1.Top = -(PictureScroll1.Value * 16)
End Sub


Public Sub MenuPicture1_Touch(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim TempPictureNumber As Integer   '# of tile in tile sheet
Dim AddOnByte As Byte

'prevents overflow error when raising button if mouse off menu
If X < 0 Then X = 0
If Y < 0 Then Y = 0

TempPictureNumber = (((Y \ 16) * 32) + (X \ 16)) Mod 256

'Y \ 128 identifies what sheet
'still needed, now that we have files\menus?
If Y \ 128 = 0 Then ClipBoardTile(Button).PatternByte = Sheet0(TempPictureNumber)
If Y \ 128 = 1 Then ClipBoardTile(Button).PatternByte = Sheet1(TempPictureNumber)
If Y \ 128 = 2 Then ClipBoardTile(Button).PatternByte = Sheet2(TempPictureNumber)
If Y \ 128 = 3 Then ClipBoardTile(Button).PatternByte = Sheet3(TempPictureNumber)

'MsgBox TempPictureNumber '+ (256 * (y \ 128))
'MsgBox TempPictureNumber + (256 * (y \ 128)) + 1
YYYY = (256 * (Y \ 128))
GSet = Val(Smile.StateGraphicSetCombo1.List(Smile.StateGraphicSetCombo1.ListIndex))
Open App.Path & "\files\menus\" & GSet & ".val" For Binary As #1
    Get #1, TempPictureNumber + YYYY + 1, ClipBoardTile(Button).PatternByte
    Get #1, 1024 + TempPictureNumber + YYYY + 1, ClipBoardClip(Button)
Close #1

'property value * 16 gives property as we know it
' + (Y \ 128) takes the layer sheet in mind

ClipBoardTile(Button).PatternByte = (ClipBoardTile(Button).PatternByte * 16) + (Y \ 128)
ClipBoardTile(Button).BlockID = TempPictureNumber

End Sub





Public Sub EnDisClip()
'enable/disable pieces of the clipboard
Dim TempStamper As Tile
Dim TempClip As Byte
Dim StampWidth As Byte
Dim StampHeight As Byte
Dim HOR As Integer
Dim VER As Integer
Dim HORSTART As Integer
Dim VERSTART As Integer
Dim GROUP As Integer

'USED'IN'HFLIP'AND'VFLIP''''''''''''''
HOR = -HFlip.Value
VER = -VFlip.Value
HORSTART = -(HOR * PreviewClip.Width)
VERSTART = -(VER * PreviewClip.Height)
If HORSTART > 0 Then HORSTART = HORSTART - 1
If VERSTART > 0 Then VERSTART = VERSTART - 1
If HOR = 0 Then HOR = 1
If VER = 0 Then VER = 1
StretchBlt PreviewClip.hdc, HORSTART, VERSTART, PreviewClip.Width * HOR, PreviewClip.Height * VER, PreviewClipBuffer.hdc, 0, 0, PreviewClip.Width, PreviewClip.Height, SRCCOPY
End Sub





Public Sub TestRoom()
Dim EmulatorLength As Integer           'length of path to emulator
Dim TempEmulator As String              'to shrink emulator down to just data
Dim TempSRMPath As String               'to shrink SRM folder down to just its path
Dim DefaultNeedslash As String          'hold needslash until we're done with it
Dim TempQuickMetBin() As Byte           'grabbing the whole file at once
Dim TempByte(0 To 3) As Byte
Dim TempChecksum As Integer
Dim TempChecksumXor As Integer
Dim TempRoomID As Integer               'Room ID to load
Dim TempScreenXY(0 To 1) As Byte        'X is 0, Y is 1
Dim TempSamusXY(0 To 1) As Integer      'X is 0, Y is 1
Dim TempMusicControl1Text As String

'don't allow Test Room when in the map editor
If Picture2.Visible = False Then Exit Sub

TempMusicControl1Text = MusicControl1.Text
If MusicControl1.ListIndex = 0 Then MusicControl1.Text = MusicControl1.List(5)

If Asc(Left$(Emulator, 1)) = 0 Then GoTo AskForDefaultEmulator
If Asc(Left$(Emulator, 1)) = 32 Then GoTo AskForDefaultEmulator

RunDefaultEmulator:
'get our emulator's name
For I = 1 To Len(Emulator)
    'looks for the first place where we have 3 spaces in a row, so not to get confused with spaces in the path name
    If Asc(Mid$(Emulator, I, 1)) = 32 And Asc(Mid$(Emulator, I + 1, 1)) = 32 And Asc(Mid$(Emulator, I + 2, 1)) = 32 Then Exit For
Next I
TempEmulator = Mid$(Emulator, 1, I - 1)

'copy the rom into temp folder
DefaultNeedslash = needslash
needslash = App.Path & "\files\temp\quickmet.smc"
FileCopy DefaultNeedslash, needslash
'save current room to the copy
mnuSaveRoom_Click
'restore original needslash
needslash = DefaultNeedslash

'copy srm file to temp folder
FileCopy App.Path & "\files\TestRoom\quickmet.srm", App.Path & "\files\temp\quickmet.srm"
'edit SRM and SMC as needed
AdjustQuickTemp

'make extra copy of SRM file to the appropriate SRM folder, if required
If Asc(Left$(SRMPath, 1)) <> 0 Then
'get our emulator's name
    For I = 1 To Len(SRMPath)
        'looks for the first place where we have 3 spaces in a row, so not to get confused with spaces in the path name
        If Asc(Mid$(SRMPath, I, 1)) = 32 And Asc(Mid$(SRMPath, I + 1, 1)) = 32 And Asc(Mid$(SRMPath, I + 2, 1)) = 32 Then Exit For
    Next I
    TempSRMPath = Mid$(SRMPath, 1, I - 1)
    'XXXXXXXXXXX causes file not found error if failed to create srmpath
    FileCopy App.Path & "\files\temp\quickmet.srm", TempSRMPath & "\quickmet.srm"
End If

'set up some variables
TempByte(0) = &H80
TempByte(1) = &H1E
TempByte(2) = &H6B
TempByte(3) = &HEA
TempRoomID = Val("&H" & Right$("0000" & Smile.mdbCombo.Text, 4))
TempSamusXY(0) = MapTileNumber Mod (Val("&H" & RoomHeader1.WidthText1.Text) * 16)
TempSamusXY(1) = MapTileNumber \ (Val("&H" & RoomHeader1.WidthText1.Text) * 16)
TempScreenXY(0) = (TempSamusXY(0) - (TempSamusXY(0) Mod 16)) \ 16
TempScreenXY(1) = TempSamusXY(1) \ 16

TempSamusXY(0) = ((TempSamusXY(0) Mod 16) * 16)
TempSamusXY(1) = (((TempSamusXY(1) Mod 16)) * 16) - 8


'apply asm to copied ROM
Open App.Path & "\files\temp\quickmet.smc" For Binary As #1
    Put #1, &H102C3 + ROM_HEADER + 1, TempByte(0)
    Put #1, , TempByte(1)
    Put #1, &H10366 + ROM_HEADER + 1, TempByte(2)
    Put #1, &H9154& + ROM_HEADER + 1, TempByte(3)
    Put #1, , TempByte(3)
        Open App.Path & "\files\TestRoom\quickmet.bin" For Binary As #2
            ReDim TempQuickMetBin(0 To LOF(2) - 1) As Byte
            Get #2, 1, TempQuickMetBin()
        Close #2
    Put #1, &H59A22 + ROM_HEADER + 1, TempQuickMetBin()
    'starting conditions
    Put #1, &H59A85 + ROM_HEADER + 1, TempSamusXY(0)
    Put #1, &H59A8B + ROM_HEADER + 1, TempSamusXY(1)
    Put #1, &H59ACB + ROM_HEADER + 1, TempRoomID
    Put #1, &H59AD1 + ROM_HEADER + 1, TempScreenXY()

    'DOOR SCROLL CODE
    'Dim TempTempInt As Integer
    'TempTempInt = &HE4E0   'load into ceres shaft without crashing
    'Put #1, &H59AD5 + ROM_HEADER + 1, TempTempInt
Close #1

CoverSMILE 0

'run the emulator
Shell TempEmulator & " """ & App.Path & "\files\temp\quickmet.smc" & """", vbMaximizedFocus
MusicControl1.Text = TempMusicControl1Text
Exit Sub


AskForDefaultEmulator:
If MsgBox("SMILE currently has no default emulator to test rooms in." & vbCrLf & vbCrLf & "Choose one now?", vbYesNo, "Choose an emulator.") = vbNo Then Exit Sub
Dim CMD1 As New OpenSave
CMD1.DialogTitle = "Choose your emulator."
CMD1.Filter = "EXE|*.exe"
CMD1.ShowOpen
Dim DD As String
DD = CMD1.FileName
For I = 1 To Len(DD)
    If Asc(Mid$(DD, I, 1)) = 0 Then Exit For
Next I
DD = Mid$(DD, 1, I - 1)
If DD = "" Then Exit Sub
Emulator = DD
GoTo RunDefaultEmulator
End Sub





Public Sub CoverSMILE(Optional CoverFor As Byte = 0)
Select Case CoverFor
    Case 0: TestLabel1.Caption = "SMILE is in Testing Mode." & vbCrLf & "Click anywhere for normal editing."
End Select
'cover SMILE, if in ini to do so, so smile doesn't pop over the emulator
TestFrame1.Move -1, -1, ScaleX(Smile.Width, vbTwips, vbPixels), ScaleY(Smile.Height, vbTwips, vbPixels)
TestLabel1.Move 0, 0, Smile.Width, Smile.Height
TestFrame1.Visible = True
TestFrame1.ZOrder 0
Smile.mnuFile.Enabled = False
Smile.mnuEdit.Enabled = False
Smile.mnuPreferencesView.Enabled = False
Smile.mnuPreferencesView.Enabled = False
Smile.mnuTools.Enabled = False
Smile.mnuHelp.Enabled = False
End Sub

Private Sub YellowSlopes1_Click()
If YellowSlopes1.Value = 0 Then
    YellowSlopes1.BackColor = RGB(255, 255, 200)
    YellowSlopes1.Caption = "Yellow Shown"
    Slopes1.Height = 128
    'force a refresh of the yellow slopes
    BTSMenuFlip_Click 0
Else
    YellowSlopes1.BackColor = RGB(200, 255, 180)
    YellowSlopes1.Caption = "Yellow Hidden"
    Slopes1.Height = 64
End If
End Sub

Private Sub FindLanguageFiles()
Dim CaptionName As String
Dim CustomExists As Long


'check for the existance of a Custom.txt file
Open App.Path & "\files\languages\Custom.txt" For Binary As #1
    CustomExists = LOF(1)
Close #1
'no custom file, so delete the empty file we just made
If CustomExists = 0 Then
    Kill App.Path & "\files\languages\Custom.txt"
    Exit Sub
End If

Open App.Path & "\files\languages\Custom.txt" For Input As #1
    Input #1, CaptionName
Close #1

Load mnuLanguage(mnuLanguage.UBound + 1)
With mnuLanguage(mnuLanguage.UBound)
    .Visible = True
    .Caption = CaptionName
End With
End Sub



Private Sub RecognizePlugIns()
Load Plugins
End Sub


Public Sub ClearMenuHighlights()
MenuLabel_MouseMove 99, 0, 0, 0, 0
If BrowserTarget.Left <> -BrowserTarget.Width Then BrowserTarget.Left = -BrowserTarget.Width
End Sub
