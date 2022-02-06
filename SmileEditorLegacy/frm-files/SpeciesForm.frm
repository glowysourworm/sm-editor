VERSION 5.00
Begin VB.Form SpeciesForm 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Species"
   ClientHeight    =   8040
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7605
   Icon            =   "SpeciesForm.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8040
   ScaleWidth      =   7605
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame SpeciesDataSeperaterFrame 
      BackColor       =   &H00E0E0E0&
      Height          =   2535
      Index           =   1
      Left            =   0
      TabIndex        =   53
      Top             =   5520
      Width           =   7620
      Begin VB.CommandButton EnemyQuirksCommand1 
         BackColor       =   &H00C0C0FF&
         Caption         =   "Save changes to Species text file"
         Height          =   255
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   55
         Top             =   2160
         Width           =   7335
      End
      Begin VB.TextBox EnemyQuirksText1 
         BackColor       =   &H00D2FFFF&
         Height          =   1935
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   54
         Top             =   240
         Width           =   7370
      End
   End
   Begin VB.Frame SpeciesDataSeperaterFrame 
      BackColor       =   &H00E0E0E0&
      Height          =   5535
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7620
      Begin VB.CommandButton AllowedListCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Palette"
         Height          =   255
         Index           =   1
         Left            =   4440
         TabIndex        =   114
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton AllowedListCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "ID"
         Height          =   255
         Index           =   0
         Left            =   3480
         TabIndex        =   113
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton CopyPasteEnemy 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Copy DNA"
         Height          =   255
         Index           =   0
         Left            =   3480
         TabIndex        =   3
         Top             =   3480
         Width           =   2055
      End
      Begin VB.CommandButton CopyPasteEnemy 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Paste DNA"
         Height          =   255
         Index           =   1
         Left            =   5520
         TabIndex        =   2
         Top             =   3480
         Width           =   2055
      End
      Begin VB.CommandButton PermanentPropertiesCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Save Enemy DNA"
         Height          =   375
         Left            =   3480
         TabIndex        =   6
         Top             =   3120
         Width           =   4095
      End
      Begin VB.CommandButton SpeciesCommand1 
         Caption         =   "CANCEL"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1680
         TabIndex        =   71
         Top             =   720
         Width           =   1695
      End
      Begin VB.CommandButton SpeciesCommand2 
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1680
         TabIndex        =   72
         Top             =   240
         Width           =   1695
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   63
         Top             =   3960
         Width           =   3255
         Begin VB.CommandButton EnemyUnknownCommand1 
            Caption         =   "Special GFX"
            Height          =   255
            Left            =   1680
            TabIndex        =   112
            ToolTipText     =   "Special GFX mode is for Space Pirate and certain bosses."
            Top             =   510
            Width           =   1455
         End
         Begin VB.TextBox EnemyUnknown2 
            BackColor       =   &H00FFFFFF&
            Height          =   285
            Left            =   840
            MaxLength       =   4
            TabIndex        =   68
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox EnemySpeed 
            Height          =   285
            Left            =   840
            MaxLength       =   4
            TabIndex        =   67
            Top             =   240
            Width           =   615
         End
         Begin VB.TextBox EnemyUnknown1 
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   2520
            MaxLength       =   4
            TabIndex        =   65
            ToolTipText     =   "0000 or 0004"
            Top             =   520
            Width           =   615
         End
         Begin VB.TextBox EnemyOrientation 
            Height          =   285
            Left            =   2520
            MaxLength       =   4
            TabIndex        =   64
            Top             =   240
            Width           =   615
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Speed 2"
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   70
            Top             =   480
            Width           =   660
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Speed"
            Height          =   195
            Index           =   0
            Left            =   120
            TabIndex        =   69
            Top             =   240
            Width           =   660
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Orientation"
            Height          =   195
            Index           =   1
            Left            =   1560
            TabIndex        =   66
            Top             =   240
            Width           =   900
         End
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Special"
         Height          =   1335
         Left            =   120
         TabIndex        =   56
         Top             =   2640
         Width           =   3255
         Begin VB.CheckBox Check1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Stop plasma"
            Height          =   255
            Index           =   5
            Left            =   1560
            TabIndex        =   115
            Top             =   960
            Width           =   1455
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Move off screen"
            Height          =   255
            Index           =   4
            Left            =   1560
            TabIndex        =   57
            Top             =   705
            Width           =   1455
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Non-responsive"
            Height          =   255
            Index           =   3
            Left            =   1560
            TabIndex        =   59
            Top             =   465
            Width           =   1455
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Platform"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   62
            Top             =   825
            Width           =   1455
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Respawn"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   61
            Top             =   585
            Width           =   1455
         End
         Begin VB.TextBox EnemySpecial 
            BackColor       =   &H00FFFFFF&
            Height          =   285
            Left            =   120
            MaxLength       =   4
            TabIndex        =   60
            Top             =   225
            Width           =   615
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Invisible"
            Height          =   255
            Index           =   2
            Left            =   1560
            TabIndex        =   58
            Top             =   225
            Width           =   1455
         End
      End
      Begin VB.ListBox SpeciesList 
         Height          =   2010
         Left            =   120
         TabIndex        =   11
         ToolTipText     =   "DoubleClick to add to Allowed Species list."
         Top             =   240
         Width           =   1455
      End
      Begin VB.FileListBox File1 
         Height          =   480
         Left            =   1920
         Pattern         =   "*.gif"
         TabIndex        =   10
         Top             =   1560
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.ComboBox EnemyClearList 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   390
         ItemData        =   "SpeciesForm.frx":030A
         Left            =   120
         List            =   "SpeciesForm.frx":030C
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   4920
         Width           =   855
      End
      Begin VB.TextBox EnemySpecies 
         Height          =   285
         Left            =   120
         MaxLength       =   4
         TabIndex        =   8
         Tag             =   "0"
         Top             =   2280
         Width           =   1455
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         Left            =   3480
         Max             =   3
         TabIndex        =   7
         Top             =   2880
         Width           =   4095
      End
      Begin VB.ListBox AllowedSpecies 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1140
         Left            =   3480
         TabIndex        =   5
         ToolTipText     =   "DoubleClick to remove from the list."
         Top             =   4320
         Width           =   975
      End
      Begin VB.TextBox EnemiesAllowed1 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   390
         Left            =   5280
         MaxLength       =   4
         TabIndex        =   4
         Text            =   "0000"
         ToolTipText     =   "Pointer to allowed species list... Do NOT change this if you are also changing the allowed species."
         Top             =   4440
         Visible         =   0   'False
         Width           =   270
      End
      Begin VB.ListBox AllowedSpeciesCounter 
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1140
         Left            =   4440
         TabIndex        =   1
         ToolTipText     =   "DoubleClick to change the list."
         Top             =   4320
         Width           =   975
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Enemy DNA [1] (General Data)"
         Height          =   2775
         Index           =   0
         Left            =   3480
         TabIndex        =   12
         Top             =   120
         Width           =   4095
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   2
            Left            =   975
            MaxLength       =   4
            TabIndex        =   25
            Text            =   "0000"
            ToolTipText     =   "HP"
            Top             =   1080
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   3
            Left            =   975
            MaxLength       =   4
            TabIndex        =   24
            Text            =   "0000"
            ToolTipText     =   "Damage"
            Top             =   1440
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   4
            Left            =   975
            MaxLength       =   4
            TabIndex        =   23
            Text            =   "0000"
            ToolTipText     =   "Width"
            Top             =   1800
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   5
            Left            =   975
            MaxLength       =   4
            TabIndex        =   22
            Text            =   "0000"
            ToolTipText     =   "Height"
            Top             =   2160
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   7
            Left            =   2775
            MaxLength       =   4
            TabIndex        =   21
            Text            =   "0000"
            ToolTipText     =   "Sound of Impact"
            Top             =   1080
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   66
            Left            =   2775
            MaxLength       =   4
            TabIndex        =   20
            Text            =   "0000"
            ToolTipText     =   "Animation played when enemy dies"
            Top             =   1440
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   68
            Left            =   2775
            MaxLength       =   2
            TabIndex        =   19
            Text            =   "00"
            ToolTipText     =   "Length of flash done by enemy when hit"
            Top             =   1800
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   69
            Left            =   2775
            MaxLength       =   2
            TabIndex        =   18
            Text            =   "00"
            ToolTipText     =   "Layer of Enemy"
            Top             =   2160
            Width           =   615
         End
         Begin VB.CommandButton LayerHelp1 
            Caption         =   "?"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   3360
            TabIndex        =   17
            Top             =   2220
            Width           =   255
         End
         Begin VB.CommandButton DeathAnimationHelp 
            Caption         =   "?"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   3360
            TabIndex        =   16
            Top             =   1500
            Width           =   255
         End
         Begin VB.TextBox EnemyName1 
            BackColor       =   &H00C0FFFF&
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
            Left            =   1560
            MaxLength       =   10
            TabIndex        =   15
            Text            =   "0123456789"
            Top             =   600
            Width           =   1455
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Index           =   44
            Left            =   960
            MaxLength       =   4
            TabIndex        =   14
            Text            =   "0000"
            ToolTipText     =   "How enemy reacts to grapple"
            Top             =   600
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   32
            Left            =   2655
            MaxLength       =   2
            TabIndex        =   13
            Text            =   "00"
            ToolTipText     =   "Palette Bank"
            Top             =   255
            Width           =   375
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "HP"
            Height          =   255
            Index           =   1
            Left            =   240
            TabIndex        =   34
            Top             =   1140
            Width           =   735
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Damage"
            Height          =   255
            Index           =   2
            Left            =   240
            TabIndex        =   33
            Top             =   1500
            Width           =   735
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Width"
            Height          =   255
            Index           =   3
            Left            =   240
            TabIndex        =   32
            Top             =   1860
            Width           =   735
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Height"
            Height          =   255
            Index           =   4
            Left            =   240
            TabIndex        =   31
            Top             =   2220
            Width           =   735
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Sound"
            Height          =   255
            Index           =   5
            Left            =   2040
            TabIndex        =   30
            Top             =   1140
            Width           =   735
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Death Anim"
            Height          =   255
            Index           =   7
            Left            =   1920
            TabIndex        =   29
            Top             =   1500
            Width           =   855
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Hurt Flash"
            Height          =   255
            Index           =   9
            Left            =   1920
            TabIndex        =   28
            Top             =   1860
            Width           =   855
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Layer"
            Height          =   255
            Index           =   10
            Left            =   1920
            TabIndex        =   27
            Top             =   2220
            Width           =   855
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Enemy Bank"
            Height          =   255
            Index           =   33
            Left            =   1320
            TabIndex        =   26
            Top             =   300
            Width           =   1215
         End
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Enemy DNA [2] (General Data and Pointers)"
         Height          =   2775
         Index           =   1
         Left            =   3480
         TabIndex        =   39
         Top             =   120
         Width           =   4095
         Begin VB.CommandButton EditCommand1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Edit"
            Height          =   375
            Index           =   6
            Left            =   2580
            TabIndex        =   41
            Top             =   2280
            Width           =   495
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   101
            Left            =   1965
            MaxLength       =   4
            TabIndex        =   74
            Text            =   "0000"
            ToolTipText     =   "How many bytes of data to rip from ROM for graphics."
            Top             =   1200
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   121
            Left            =   1965
            MaxLength       =   4
            TabIndex        =   73
            Text            =   "0000"
            ToolTipText     =   "# of pieces an enemy has."
            Top             =   1560
            Width           =   615
         End
         Begin VB.CommandButton EditCommand1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Edit"
            Height          =   375
            Index           =   1
            Left            =   2580
            TabIndex        =   46
            Top             =   480
            Width           =   495
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   1
            Left            =   1965
            MaxLength       =   4
            TabIndex        =   45
            Text            =   "0000"
            ToolTipText     =   "Palette"
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   31
            Left            =   1965
            MaxLength       =   4
            TabIndex        =   44
            Text            =   "0000"
            ToolTipText     =   "Vulnerabilities"
            Top             =   1920
            Width           =   615
         End
         Begin VB.CommandButton EditCommand1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Edit"
            Height          =   375
            Index           =   31
            Left            =   2580
            TabIndex        =   43
            Top             =   1920
            Width           =   495
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   6
            Left            =   1965
            MaxLength       =   4
            TabIndex        =   42
            Text            =   "0000"
            ToolTipText     =   "What items are dropped after killing this enemy"
            Top             =   2280
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   8
            Left            =   1965
            MaxLength       =   6
            TabIndex        =   40
            Text            =   "000000"
            ToolTipText     =   "What tiles are used to make the enemy (pointer)"
            Top             =   840
            Width           =   855
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            AutoSize        =   -1  'True
            BackColor       =   &H00E0E0E0&
            Caption         =   "# Bytes for GFX"
            Height          =   195
            Index           =   23
            Left            =   750
            TabIndex        =   76
            Top             =   1200
            Width           =   1125
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            AutoSize        =   -1  'True
            BackColor       =   &H00E0E0E0&
            Caption         =   "Enemy Parts"
            Height          =   195
            Index           =   17
            Left            =   1020
            TabIndex        =   75
            Top             =   1560
            Width           =   885
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Palette Pointer"
            Height          =   255
            Index           =   0
            Left            =   600
            TabIndex        =   50
            Top             =   540
            Width           =   1215
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Vulnerable Pointer"
            Height          =   255
            Index           =   6
            Left            =   480
            TabIndex        =   49
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Item Drop"
            Height          =   255
            Index           =   12
            Left            =   1080
            TabIndex        =   48
            Top             =   2280
            Width           =   855
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "Enemy Tiles"
            Height          =   255
            Index           =   13
            Left            =   960
            TabIndex        =   47
            Top             =   840
            Width           =   855
         End
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Enemy DNA [3] (AI)"
         Height          =   2775
         Index           =   2
         Left            =   3480
         TabIndex        =   35
         Top             =   120
         Width           =   4095
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Shot 2 AI"
            Height          =   360
            Index           =   8
            Left            =   2160
            TabIndex        =   94
            Top             =   1920
            Width           =   1200
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   129
            Left            =   3360
            MaxLength       =   4
            TabIndex        =   93
            Text            =   "0000"
            ToolTipText     =   "Shot or suckled by metroid."
            Top             =   1920
            Width           =   615
         End
         Begin VB.CommandButton EnemyTouchHelp1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "!"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   0
            Left            =   1080
            TabIndex        =   79
            Top             =   1200
            Width           =   255
         End
         Begin VB.CommandButton EnemyTouchHelp1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "!"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   1
            Left            =   1080
            TabIndex        =   80
            Top             =   1560
            Width           =   255
         End
         Begin VB.CommandButton GrappleHelp1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "!"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Left            =   3120
            TabIndex        =   91
            Top             =   1560
            Width           =   255
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Grapple AI"
            Height          =   360
            Index           =   7
            Left            =   2160
            TabIndex        =   92
            Top             =   1560
            Width           =   960
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   67
            Left            =   3360
            MaxLength       =   4
            TabIndex        =   90
            Text            =   "0000"
            ToolTipText     =   "How enemy reacts to grapple"
            Top             =   1560
            Width           =   615
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Frozen AI"
            Height          =   360
            Index           =   6
            Left            =   2160
            TabIndex        =   89
            Top             =   1200
            Width           =   1200
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "X-Ray AI"
            Height          =   360
            Index           =   5
            Left            =   2160
            TabIndex        =   88
            Top             =   840
            Width           =   1200
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "P. Bomb AI"
            Height          =   360
            Index           =   4
            Left            =   2160
            TabIndex        =   87
            Top             =   480
            Width           =   1200
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Shot AI"
            Height          =   360
            Index           =   3
            Left            =   120
            TabIndex        =   86
            Top             =   1560
            Width           =   960
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Touch AI"
            Height          =   360
            Index           =   2
            Left            =   120
            TabIndex        =   85
            Top             =   1200
            Width           =   960
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Running AI"
            Height          =   360
            Index           =   1
            Left            =   120
            TabIndex        =   84
            Top             =   840
            Width           =   1200
         End
         Begin VB.CommandButton EnemyHelpAI1 
            BackColor       =   &H00E0E0E0&
            Caption         =   "Initiation AI"
            Height          =   360
            Index           =   0
            Left            =   120
            TabIndex        =   83
            Top             =   480
            Width           =   1200
         End
         Begin VB.TextBox EnemyStatsText1 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Index           =   0
            Left            =   1320
            MaxLength       =   4
            TabIndex        =   82
            Text            =   "0000"
            ToolTipText     =   "Initiation AI... Sets up the enemy."
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   141
            Left            =   3360
            MaxLength       =   4
            TabIndex        =   81
            Text            =   "0000"
            ToolTipText     =   "Reaction to Power Bombs"
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   10
            Left            =   1320
            MaxLength       =   4
            TabIndex        =   78
            Text            =   "0000"
            ToolTipText     =   "What happens when an enemy touches you."
            Top             =   1200
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   9
            Left            =   1320
            MaxLength       =   4
            TabIndex        =   77
            Text            =   "0000"
            ToolTipText     =   "What happens when an enemy is shot"
            Top             =   1560
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   125
            Left            =   1320
            MaxLength       =   4
            TabIndex        =   38
            Text            =   "0000"
            ToolTipText     =   "Code run constantly as the enemy is redrawn."
            Top             =   840
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   131
            Left            =   3360
            MaxLength       =   4
            TabIndex        =   37
            Text            =   "0000"
            ToolTipText     =   "Code to run when frozen."
            Top             =   1200
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   133
            Left            =   3360
            MaxLength       =   4
            TabIndex        =   36
            Text            =   "0000"
            ToolTipText     =   "Code run when x-ray is used in an enemy's presense."
            Top             =   840
            Width           =   615
         End
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Enemy DNA [4] (Unknowns)"
         Height          =   2775
         Index           =   3
         Left            =   3480
         TabIndex        =   95
         Top             =   120
         Width           =   4095
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   153
            Left            =   825
            MaxLength       =   4
            TabIndex        =   103
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   1320
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   147
            Left            =   825
            MaxLength       =   4
            TabIndex        =   102
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   960
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   145
            Left            =   825
            MaxLength       =   4
            TabIndex        =   101
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   600
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   143
            Left            =   825
            MaxLength       =   4
            TabIndex        =   100
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   1680
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   138
            Left            =   2385
            MaxLength       =   4
            TabIndex        =   99
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   1680
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   136
            Left            =   2385
            MaxLength       =   4
            TabIndex        =   98
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   1320
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   123
            Left            =   2385
            MaxLength       =   4
            TabIndex        =   97
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   960
            Width           =   615
         End
         Begin VB.TextBox EnemyStatsText1 
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
            Height          =   360
            Index           =   117
            Left            =   2385
            MaxLength       =   4
            TabIndex        =   96
            Text            =   "0000"
            ToolTipText     =   "Unknown."
            Top             =   600
            Width           =   615
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "2"
            Height          =   360
            Index           =   16
            Left            =   2010
            TabIndex        =   111
            Top             =   600
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "5"
            Height          =   360
            Index           =   18
            Left            =   2010
            TabIndex        =   110
            Top             =   960
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "N"
            Height          =   360
            Index           =   29
            Left            =   450
            TabIndex        =   109
            Top             =   1320
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "K"
            Height          =   360
            Index           =   28
            Left            =   450
            TabIndex        =   108
            Top             =   960
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "J"
            Height          =   360
            Index           =   27
            Left            =   480
            TabIndex        =   107
            Top             =   600
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "I"
            Height          =   360
            Index           =   26
            Left            =   450
            TabIndex        =   106
            Top             =   1680
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "G"
            Height          =   360
            Index           =   25
            Left            =   2010
            TabIndex        =   105
            Top             =   1680
            Width           =   345
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00E0E0E0&
            Caption         =   "F"
            Height          =   360
            Index           =   24
            Left            =   2010
            TabIndex        =   104
            Top             =   1320
            Width           =   345
         End
      End
      Begin VB.Image AllowedEnemyPreview 
         Height          =   1095
         Left            =   6000
         Top             =   3840
         Width           =   1185
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Enemies to clear room"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   960
         TabIndex        =   52
         Top             =   5040
         Width           =   2175
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Enemies allowed in this room:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3480
         TabIndex        =   51
         Top             =   3840
         Width           =   2655
      End
      Begin VB.Image SpeciesPreview 
         Height          =   1335
         Left            =   1680
         Top             =   1215
         Width           =   1440
      End
   End
End
Attribute VB_Name = "SpeciesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Sub RefreshAllowedEnemyList()
Dim TempText As String
Dim ThisPointer As ThreeByte
Dim tempAllowedEnemy(0 To 99) As TwoIntegers

TempText = Right$("0000" & EnemiesAllowed1.Text, 4)

ThisPointer.Byte1 = Val("&H" & Right$(TempText, 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(TempText, 2) & "&")
ThisPointer.Byte3 = Val("&HB4&")

AllowedSpecies.Clear
AllowedSpeciesCounter.Clear

'0000 means not a pointer
If TempText = "0000" Then Exit Sub

Open needslash For Binary As #1
    Get #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, tempAllowedEnemy()
Close #1

For I = 0 To 9  'should never be more than 4
    If tempAllowedEnemy(I).EnemyID = &HFFFF Then Exit For
    AllowedSpecies.AddItem Right$("0000" & Hex$(tempAllowedEnemy(I).EnemyID), 4)
    AllowedSpeciesCounter.AddItem Right$("0000" & Hex$(tempAllowedEnemy(I).Counter), 4)
Next I
End Sub



Private Sub AllowedListCommand1_Click(Index As Integer)
Select Case Index
    Case 0: MsgBox "Double click the list to remove an Enemy ID from the list." & vbCrLf & "To replace the Enemy ID, double click in the main enemy list or on the Species ID you want to add.", vbInformation, "Double Click"
    Case 1: MsgBox "Double click the list to change an index in the list.", vbInformation, "Double Click"
End Select
End Sub

Private Sub AllowedSpecies_Click()
Dim TestingImagePath As String
Dim ImageExists As Long

'File1.Path = App.Path & "\files\enemies\"
TestingImagePath = File1.Path & "\" & AllowedSpecies.List(AllowedSpecies.ListIndex) & ".gif"
Open TestingImagePath For Binary As #1
ImageExists = LOF(1)
Close #1
'if doesn't exist, use unknown graphic
If ImageExists = 0 Then
    Kill TestingImagePath
    TestingImagePath = App.Path & "\files\enemies\unknown.gif"
End If
AllowedEnemyPreview.Picture = LoadPicture(TestingImagePath)
End Sub

Private Sub AllowedSpecies_DblClick()
'remove from list
AllowedSpecies.RemoveItem (AllowedSpecies.ListIndex)
End Sub



Private Sub AllowedSpeciesCounter_DblClick()
Dim TempSelectedIndex As Integer

TempSelectedIndex = AllowedSpeciesCounter.ListIndex
DD = InputBox("New palette counter value?", "New palette counter value?", AllowedSpeciesCounter.List(AllowedSpeciesCounter.ListIndex))
DD = Right$("0000" & Hex$(Val("&H" & DD & "&")), 4)

AllowedSpeciesCounter.RemoveItem AllowedSpeciesCounter.ListIndex
AllowedSpeciesCounter.AddItem DD, TempSelectedIndex
End Sub

Private Sub Check1_Click(Index As Integer)
Dim TempByteA As Byte
Dim TempByteB As Byte

TempByteA = (Check1(0).Value * 4) + (Check1(1).Value * 8) + (Check1(5).Value) + 2
TempByteB = (Check1(2).Value) + (Check1(3).Value * 4) + (Check1(4).Value * 8)
EnemySpecial.Text = Hex$(TempByteA) & Hex$(TempByteB) & Right$("00" & EnemySpecial.Text, 2)
End Sub

Private Sub Command1_Click()

End Sub

Private Sub CopyPasteEnemy_Click(Index As Integer)
'if 0, then copy current data
'if 1, then paste copied to current (doesn't auto-save)
If Index = 0 Then
    CopiedEnemyStatistics = CurrentEnemyStatistics
    CopyPasteEnemy(1).Caption = "Paste " & EnemySpecies.Text & " DNA"
    CopiedEnemyStatisticsSpeciesID = EnemySpecies.Text
Else
    CurrentEnemyStatistics = CopiedEnemyStatistics
    EnemySpecies.Tag = 1
    EnemySpecies_Change
    EnemySpecies.Tag = 0
End If
End Sub

Private Sub DeathAnimationHelp_Click()
MsgBox "0000 - small, round explosion" & vbCrLf _
    & "0001 - screw attack explosion" & vbCrLf _
    & "0002 - large, round explosion" & vbCrLf _
    & "0003 - series of small explosions" & vbCrLf _
    & "0004 - series of large explosions" & vbCrLf
End Sub

Private Sub EditCommand1_Click(Index As Integer)
Dim ThisPointer As ThreeByte
Dim TempText As String  'store 2 byte pointer as text

TempText = Right$("0000" & EnemyStatsText1(Index).Text, 4)
ThisPointer.Byte1 = Val("&H" & Right$(TempText, 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(TempText, 2) & "&")
'need to change for non-palette
Select Case Index
    Case 1: ThisPointer.Byte3 = CurrentEnemyStatistics.PaletteBank
    Case 6: ThisPointer.Byte3 = Val("&HB4&")
    Case 31: ThisPointer.Byte3 = Val("&HB4&")
    Case Else: MsgBox "???"
End Select


'if the palette, we don't change pEnemyEditing
If Index = 1 Then GoTo EditPalette
'offset to be used in editing data at pointer
pEnemyEditing = ThreePoint2Offset(ThisPointer)
If Index = 6 Then GoTo EditItemDrop
If Index = 31 Then GoTo EditVulnerabilities
Exit Sub


EditPalette:
pPaletteOffset = ThreePoint2Offset(ThisPointer)
Palette1.Show 1, SpeciesForm
Exit Sub

EditVulnerabilities:
EnemyVulnerabilities1.Show 1, SpeciesForm
Exit Sub

EditItemDrop:
EnemyMiscellaneousEdit1.Show 1, SpeciesForm
'<Kejardon> Bytes 59-60: Pointer to enemy's item drop chances, often used by multiple enemies (bank 1A)
'<Kejardon>              Bytes: 1 = Energy, 2 = Big Energy, 3 = Missiles, 4 = nothing, 5 = super missiles, 6 = power bombs 14 0A 55 82 05 05

Exit Sub

End Sub

Private Sub EnemiesAllowed1_Change()
RefreshAllowedEnemyList
End Sub


Private Sub EnemyHelpAI1_Click(Index As Integer)
Select Case Index
    Case 0: MsgBox "ASM ran once to load an enemy." & vbCrLf & "Loads the initial animations to use for the sprites.", vbInformation, "Initiation AI"
    Case 1: MsgBox "ASM ran every frame an enemy exists (unless the code redirected us elsewhere).", vbInformation, "Running AI"
    Case 2: MsgBox "ASM ran when Samus touches an enemy.", vbInformation, "Touch AI"
    Case 3: MsgBox "ASM ran when Samus shoots an enemy.", vbInformation, "Shot AI"
    Case 4: MsgBox "ASM ran when a power bomb blasts an enemy.", vbInformation, "Power Bomb AI"
    Case 5: MsgBox "ASM ran when x-ray has been used near an enemy." & vbCrLf & "This is run after x-ray is turned off and cannot detect whether x-ray was actually pointed at an enemy.", vbInformation, "X-Ray AI"
    Case 6: MsgBox "ASM ran while an enemy is frozen." & vbCrLf & "8041 is the most common value, simply reducing the frozen timer and doing nothing else.", vbInformation, "X-Ray AI"
    Case 7: MsgBox "ASM ran when Samus grapples an enemy", vbInformation, "Grapple AI"
    Case 8: MsgBox "2nd ASM for being shot?  Used while Metroid suckles you?", vbInformation, "Shot 2 AI?"
End Select


End Sub

Private Sub EnemyQuirksCommand1_Click()
Dim TextPath
Dim TextExists As Integer
Dim TempTextString As String

TextPath = File1.Path & "\" & SpeciesList.List(SpeciesList.ListIndex) & ".txt"

Open TextPath For Binary As #1
    TextExists = LOF(1)
Close #1

'if doesn't exist, use blank text
If TextExists > 0 Then
    DD = MsgBox("This will overwrite the existing text file for this item.", vbOKCancel, "Overwrite entry?")
    If DD = vbCancel Then Exit Sub
End If

TempTextString = EnemyQuirksText1.Text  'textbox into textstring
Open TextPath For Output As #1
    Print #1, TempTextString
Close #1
End Sub

Private Sub EnemySpecial_Change()
Dim TempByteA As Byte       '"temp byte" actually represents a nybble
Dim TempByteB As Byte
Dim TempText As String * 4


TempText = Right$("0000" & EnemySpecial.Text, 4)
TempByteA = Val("&H" & Mid$(TempText, 1, 1))
TempByteB = Val("&H" & Mid$(TempText, 2, 1))


Check1(0).Value = (TempByteA \ 4) Mod 2     'respawning
Check1(1).Value = TempByteA \ 8             'solid
Check1(2).Value = TempByteB Mod 2           'invisible
Check1(3).Value = (TempByteB \ 4) Mod 2     'non-responsive
Check1(4).Value = TempByteB \ 8             'move while off screen
Check1(5).Value = TempByteA Mod 2          'stop plasma
End Sub

Private Sub EnemySpecies_DblClick()

'if already in list, leave sub
For I = 0 To (AllowedSpecies.ListCount - 1)
    If AllowedSpecies.List(I) = EnemySpecies.Text Then Exit Sub
Next I
'add to list
AllowedSpecies.AddItem (EnemySpecies.Text)


End Sub


Private Sub EnemyTouchHelp1_Click(Index As Integer)
Dim TempHelpString As String

If Index = 0 Then
    TempHelpString = "ASM that runs when Samus touches an enemy." & vbCrLf & "Common values are:" & vbCrLf
Else
    TempHelpString = "ASM that runs when Samus shots an enemy." & vbCrLf & "Common values are:" & vbCrLf
End If
MsgBox TempHelpString & "8023 - normal harm to Samus" & vbCrLf _
    & "804C - no effect" & vbCrLf _
    & "A953 - moctroid harm to Samus" & vbCrLf _
    & "EDEB - metroid harm to Samus" & vbCrLf _
    & "802D - normal hit to enemy (only for shots)" & vbCrLf _
    & "DC1C - shot reflected (only for shots)"
End Sub


Private Sub EnemyUnknown1_Change()
Select Case EnemyUnknown1.Text
    Case "0000": EnemyUnknownCommand1.Caption = "Normal GFX"
    Case "0004": EnemyUnknownCommand1.Caption = "Special GFX"
    Case Else: SpeciesForm.Caption = "Unrecognized gfx mode!!!"  'shouldn't happen
End Select

End Sub

Private Sub EnemyUnknownCommand1_Click()
If EnemyUnknownCommand1.Caption = "Normal GFX" Then
    EnemyUnknown1.Text = "0004"
    EnemyUnknownCommand1.Caption = "Special GFX"
Else
    EnemyUnknown1.Text = "0000"
    EnemyUnknownCommand1.Caption = "Normal GFX"
End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
If SpeciesForm.ActiveControl.Name = "EnemyName1" Then Exit Sub
If SpeciesForm.ActiveControl.Name = "EnemyQuirksText1" Then Exit Sub
TypeHex KeyAscii
End Sub

Private Sub GrappleHelp1_Click()
MsgBox "ASM that runs when Samus grapples an enemy" & vbCrLf & vbCrLf & "8005 - grapple latches, enemy stops until released" & vbCrLf _
    & "8006 - grapple ignores, enemy stops" & vbCrLf _
    & "8007 - grapple curves, enemy unaffected" & vbCrLf _
    & "800A - grapple latches, enemy killed" & vbCrLf _
    & "800F - grapple stopped, enemy unaffected" & vbCrLf _
    & "8014 - grapple latches, enemy unaffected" & vbCrLf _
    & "8019 - grapple latches, enemy delay die" & vbCrLf _
    & "801E - grapple latches, Samus hurt and knocked off" & vbCrLf _
    & "8023 - die Samus die" & vbCrLf _
    & "8037 - enemy killed" & vbCrLf _
    & "803C - enemy becomes untouchable"
End Sub

Private Sub HScroll1_Change()
Frame1(HScroll1.Value).ZOrder 0
End Sub

Private Sub HScroll1_Scroll()
Frame1(HScroll1.Value).ZOrder 0
End Sub

Private Sub Label2_Click(Index As Integer)
If Index > 0 Then Exit Sub

'if already in list, leave sub
For I = 0 To (AllowedSpecies.ListCount - 1)
    If AllowedSpecies.List(I) = SpeciesList.Text Then Exit Sub
Next I

'add to list
AllowedSpecies.AddItem Right$("0000" & EnemySpecies.Text, 4)

End Sub

Private Sub LayerHelp1_Click()
'Layer control (02 = In front of Samus, 05 = behind Samus, in front of background, 0B = behind background)
MsgBox "00 = very front" & vbCrLf _
    & "02 = in front of Samus" & vbCrLf _
    & "05 = between Samus and background" & vbCrLf _
    & "0B = behind all"
End Sub

Private Sub PaletteCommand1_Click()
Dim ThisPointer As ThreeByte
Dim TempText As String

TempText = Right$("0000" & EnemyStatsText1(1).Text, 4)
ThisPointer.Byte1 = Val("&H" & Right$(TempText, 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(TempText, 2) & "&")
ThisPointer.Byte3 = CurrentEnemyStatistics.PaletteBank   'roughly A3


pPaletteOffset = ThreePoint2Offset(ThisPointer)
Palette1.Show 1, SpeciesForm
End Sub

Private Sub PermanentPropertiesCommand1_Click()
Dim ThisPointer As ThreeByte
Dim TempText As String
Dim EnemyName As String * 10


'permanent enemy statistics offset
TempText = Right$("0000" & EnemySpecies.Text, 4)
ThisPointer.Byte1 = Val("&H" & Right$(TempText, 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(TempText, 2) & "&")
ThisPointer.Byte3 = Val("&HA0&")

'permanent enemy statistics from text boxes

CurrentEnemyStatistics.Palette = Val("&H" & EnemyStatsText1(1).Text)
CurrentEnemyStatistics.HP = Val("&H" & EnemyStatsText1(2).Text)
CurrentEnemyStatistics.Damage = Val("&H" & EnemyStatsText1(3).Text)
CurrentEnemyStatistics.Width = Val("&H" & EnemyStatsText1(4).Text)
CurrentEnemyStatistics.Height = Val("&H" & EnemyStatsText1(5).Text)
CurrentEnemyStatistics.ItemDrop = Val("&H" & EnemyStatsText1(6).Text)
CurrentEnemyStatistics.SoundOfImpact = Val("&H" & EnemyStatsText1(7).Text)
CurrentEnemyStatistics.Vulnerabilities = Val("&H" & EnemyStatsText1(31).Text)
CurrentEnemyStatistics.PaletteBank = Val("&H" & EnemyStatsText1(32).Text)
'unknowns
CurrentEnemyStatistics.DeathAnimation = Val("&H" & EnemyStatsText1(66).Text)
CurrentEnemyStatistics.GrappleReaction = Val("&H" & EnemyStatsText1(67).Text)
CurrentEnemyStatistics.HurtFlash = Val("&H" & EnemyStatsText1(68).Text)
CurrentEnemyStatistics.LayerControl = Val("&H" & EnemyStatsText1(69).Text)
CurrentEnemyStatistics.EnemyAI = Val("&H" & EnemyStatsText1(0).Text)
'CurrentEnemyStatistics.EnemyTiles = Val("&H" & EnemyStatsText1(8).Text)
CurrentEnemyStatistics.EnemyTiles.Byte1 = Val("&H" & Right$(EnemyStatsText1(8).Text, 2))
CurrentEnemyStatistics.EnemyTiles.Byte2 = Val("&H" & Mid$(EnemyStatsText1(8).Text, 3, 2))
CurrentEnemyStatistics.EnemyTiles.Byte3 = Val("&H" & Left$(EnemyStatsText1(8).Text, 2))


CurrentEnemyStatistics.EnemyName = Val("&H" & EnemyStatsText1(44).Text)
CurrentEnemyStatistics.EnemyTouch = Val("&H" & EnemyStatsText1(10).Text)
CurrentEnemyStatistics.EnemyShot = Val("&H" & EnemyStatsText1(9).Text)
CurrentEnemyStatistics.PowerbombInvulnerability = Val("&H" & EnemyStatsText1(141).Text)

'UNKNOWNS
CurrentEnemyStatistics.UNKNOWNAnimate = Val("&H" & EnemyStatsText1(101).Text)
CurrentEnemyStatistics.Unknown2 = Val("&H" & EnemyStatsText1(117).Text)
CurrentEnemyStatistics.EnemyParts = Val("&H" & EnemyStatsText1(121).Text)
CurrentEnemyStatistics.Unknown5 = Val("&H" & EnemyStatsText1(123).Text)
CurrentEnemyStatistics.UnknownGraphicPointer = Val("&H" & EnemyStatsText1(125).Text)
CurrentEnemyStatistics.EnemyShot2 = Val("&H" & EnemyStatsText1(129).Text)
CurrentEnemyStatistics.UnknownC = Val("&H" & EnemyStatsText1(131).Text)
CurrentEnemyStatistics.UnknownD = Val("&H" & EnemyStatsText1(133).Text)
CurrentEnemyStatistics.UnknownF = Val("&H" & EnemyStatsText1(136).Text)
CurrentEnemyStatistics.UnknownG = Val("&H" & EnemyStatsText1(138).Text)
CurrentEnemyStatistics.UnknownI = Val("&H" & EnemyStatsText1(143).Text)
CurrentEnemyStatistics.UnknownJ = Val("&H" & EnemyStatsText1(145).Text)
CurrentEnemyStatistics.UnknownK = Val("&H" & EnemyStatsText1(147).Text)
CurrentEnemyStatistics.UnknownN = Val("&H" & EnemyStatsText1(153).Text)


'place permanent enemy statistics for enemy
Open needslash For Binary As #1
    Put #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, CurrentEnemyStatistics
Close #1

'save name
EnemyName = EnemyName1.Text
ThisPointer.Byte1 = Val("&H" & Right$("00" & Hex$(CurrentEnemyStatistics.EnemyName), 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(Right$("00" & Hex$(CurrentEnemyStatistics.EnemyName), 4), 2) & "&")
ThisPointer.Byte3 = Val("&HB4&")
If ThisPointer.Byte1 = 0 And ThisPointer.Byte2 = 0 Then Exit Sub
Open needslash For Binary As #1
    Put #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, EnemyName
Close #1
End Sub

Private Sub EnemySpecies_Change()
Dim ThisPointer As ThreeByte
Dim TempText As String
Dim EnemyStatistics As EnemyStats
Dim EnemyName As String * 10

If EnemySpecies.Tag = 0 Then
'find data on this enemy
    TempText = Right$("0000" & EnemySpecies.Text, 4)
    ThisPointer.Byte1 = Val("&H" & Right$(TempText, 2) & "&")
    ThisPointer.Byte2 = Val("&H" & Left$(TempText, 2) & "&")
    ThisPointer.Byte3 = Val("&HA0&")
    Open needslash For Binary As #1
        Get #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, CurrentEnemyStatistics
    Close #1
Else
'use existing current data, without getting it from the rom
End If

EnemyStatsText1(1).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Palette), 4)
EnemyStatsText1(2).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.HP), 4)
EnemyStatsText1(3).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Damage), 4)
EnemyStatsText1(4).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Width), 4)
EnemyStatsText1(5).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Height), 4)
EnemyStatsText1(6).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.ItemDrop), 4)
EnemyStatsText1(7).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.SoundOfImpact), 4)
EnemyStatsText1(31).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Vulnerabilities), 4)
EnemyStatsText1(32).Text = Right$("00" & Hex$(CurrentEnemyStatistics.PaletteBank), 2)
'unknowns
EnemyStatsText1(66).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.DeathAnimation), 4)
EnemyStatsText1(67).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.GrappleReaction), 4)
EnemyStatsText1(68).Text = Right$("00" & Hex$(CurrentEnemyStatistics.HurtFlash), 2)
EnemyStatsText1(69).Text = Right$("00" & Hex$(CurrentEnemyStatistics.LayerControl), 2)
EnemyStatsText1(0).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.EnemyAI), 4)
'EnemyStatsText1(8).Text = Right$("000000" & Hex$(CurrentEnemyStatistics.EnemyTiles), 6)
EnemyStatsText1(8).Text = Right$("00" & Hex$(CurrentEnemyStatistics.EnemyTiles.Byte3), 2) & Right$("00" & Hex$(CurrentEnemyStatistics.EnemyTiles.Byte2), 2) & Right$("00" & Hex$(CurrentEnemyStatistics.EnemyTiles.Byte1), 2)
EnemyStatsText1(44).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.EnemyName), 4)
EnemyStatsText1(10).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.EnemyTouch), 4)
EnemyStatsText1(9).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.EnemyShot), 4)
EnemyStatsText1(141).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.PowerbombInvulnerability), 4)

'UNKNOWNS
EnemyStatsText1(101).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UNKNOWNAnimate), 4)
EnemyStatsText1(117).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Unknown2), 4)
EnemyStatsText1(121).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.EnemyParts), 4)
EnemyStatsText1(123).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.Unknown5), 4)
EnemyStatsText1(125).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownGraphicPointer), 4)
EnemyStatsText1(129).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.EnemyShot2), 4)
EnemyStatsText1(131).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownC), 4)
EnemyStatsText1(133).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownD), 4)
EnemyStatsText1(136).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownF), 4)
EnemyStatsText1(138).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownG), 4)
EnemyStatsText1(143).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownI), 4)
EnemyStatsText1(145).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownJ), 4)
EnemyStatsText1(147).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownK), 4)
EnemyStatsText1(153).Text = Right$("0000" & Hex$(CurrentEnemyStatistics.UnknownN), 4)


'get enemy name
ThisPointer.Byte1 = Val("&H" & Right$("00" & Hex$(CurrentEnemyStatistics.EnemyName), 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(Right$("00" & Hex$(CurrentEnemyStatistics.EnemyName), 4), 2) & "&")
ThisPointer.Byte3 = Val("&HB4&")
Open needslash For Binary As #1
    Get #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1, EnemyName
Close #1
EnemyName1.Text = EnemyName
End Sub

Public Sub SpeciesCommand1_Click()
Unload SpeciesForm
End Sub

Private Sub Form_Load()
Dim FakeIndex As Byte
Dim EnemyClear As Byte

For I = 0 To 255
    EnemyClearList.AddItem Right$("00" & Hex$(I), 2)
Next I
EnemyClearList.Text = Right$("00" & Hex$(EnemyClear_Value), 2)

File1.Path = App.Path & "\files\enemies\"
For I = 0 To File1.ListCount - 1
TempItem = UCase$(File1.List(I))
TempItem = Replace(TempItem, ".GIF", "")
SpeciesList.AddItem TempItem
Next I

For I = 0 To SpeciesList.ListCount
'If UBound(EnemySet) = 0 Then Exit Sub
'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
If SpeciesList.List(I) = UCase$(Right$("0000" & Hex$(EnemySet(Smile.EnemyBox(0).Tag).Species), 4)) Then SpeciesList.Text = SpeciesList.List(I)
Next I

FakeIndex = Smile.EnemyBox(0).Tag

'in case not list, it can be placed
EnemySpecies.Text = Right$("0000" & Hex$(EnemySet(FakeIndex).Species), 4)
EnemyOrientation.Text = Right$("0000" & Hex$(EnemySet(FakeIndex).Orientation), 4)
EnemySpecial.Text = Right$("0000" & Hex$(EnemySet(FakeIndex).Special), 4)
EnemySpeed.Text = Right$("0000" & Hex$(EnemySet(FakeIndex).Speed), 4)
EnemyUnknown1.Text = Right$("0000" & Hex$(EnemySet(FakeIndex).Unknown3), 4)
EnemyUnknown2.Text = Right$("0000" & Hex$(EnemySet(FakeIndex).Unknown4), 4)

'enemies allowed in room [B4]
EnemiesAllowed1.Text = Right$("0000" & Hex$(MyState.EnemySet), 4)
RefreshAllowedEnemyList
'we need to make sure copiedenemystatistics is not empty

'if width is $HFFFF, copiedenemystatistics is otherwise empty
If CopiedEnemyStatisticsSpeciesID = "FFFF" Then CopiedEnemyStatistics = CurrentEnemyStatistics: CopiedEnemyStatisticsSpeciesID = EnemySpecies.Text
'put ID of selected in for all to see
CopyPasteEnemy(1).Caption = "Paste " & CopiedEnemyStatisticsSpeciesID & " DNA"
'place index of enemy into the caption of the form
SpeciesForm.Caption = "Species Editor - (Enemy " & Right$("00" & Hex$(FakeIndex), 2) & ")"
End Sub

Private Sub SpeciesCommand2_Click()
Dim VBNeg As Boolean
Dim TempLOF As Long

'set enemy graphic
'File1.Path = App.Path & "\files\enemies\"
Open File1.Path & "\" & SpeciesList.List(SpeciesList.ListIndex) & ".gif" For Binary As #1
TempLOF = LOF(1)
Close #1
If TempLOF = 0 Then Kill File1.Path & "\" & SpeciesList.List(SpeciesList.ListIndex) & ".gif": GoTo UnknownEnemy
SpeciesPreview.Picture = LoadPicture(File1.Path & "\" & SpeciesList.List(SpeciesList.ListIndex) & ".gif")
'set enemy properties
UnknownEnemy:   'to prevent error when setting graphic
EnemySet(Smile.EnemyBox(0).Tag).Species = Val("&H" & EnemySpecies.Text)
EnemySet(Smile.EnemyBox(0).Tag).Orientation = Val("&H" & EnemyOrientation.Text)
EnemySet(Smile.EnemyBox(0).Tag).Special = Val("&H" & EnemySpecial.Text)
EnemySet(Smile.EnemyBox(0).Tag).Speed = Val("&H" & EnemySpeed.Text)
EnemySet(Smile.EnemyBox(0).Tag).Unknown3 = Val("&H" & EnemyUnknown1.Text)
EnemySet(Smile.EnemyBox(0).Tag).Unknown4 = Val("&H" & EnemyUnknown2.Text)
EnemyClear_Value = Val("&H" & EnemyClearList.Text)

'save pointer for allowed enemies globally (so it can be saved in SaveRoom2)
AllowedEnemyPointer = Val("&H" & EnemiesAllowed1.Text)

'save allowed enemies (add to the list)
'NOTICE: cannot change pointer and allowed at the same time... will save allowed at new pointer place
Dim TempAllowedEnemyInteger As Integer
Dim TempAllowedEnemyCounter As Integer
Dim ThisPointer As ThreeByte

ThisPointer.Byte1 = Val("&H" & Right$(Right$("0000" & Hex$(AllowedEnemyPointer), 4), 2) & "&")
ThisPointer.Byte2 = Val("&H" & Left$(Right$("0000" & Hex$(AllowedEnemyPointer), 4), 2) & "&")
ThisPointer.Byte3 = Val("&HB4&")
If ThisPointer.Byte1 = 0 And ThisPointer.Byte2 = 0 Then GoTo KillSpeciesForm

Open needslash For Binary As #1
For I = 0 To (AllowedSpecies.ListCount - 1)
    If AllowedSpecies.ListCount = 0 Then Exit For
    TempAllowedEnemyInteger = Val("&H" & AllowedSpecies.List(I))
    TempAllowedEnemyCounter = I
    TempAllowedEnemyCounter = Val("&H" & AllowedSpeciesCounter.List(I))
    Put #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1 + (I * 4), TempAllowedEnemyInteger
    Put #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1 + (I * 4) + 2, TempAllowedEnemyCounter
Next I

'set new end to enemy set (XXXXXXXXXXXXXXwill this bug on no enemy rooms???)
    TempAllowedEnemyInteger = &HFFFF
    Put #1, ThreePoint2Offset(ThisPointer) + ROM_HEADER + 1 + (I * 4), TempAllowedEnemyInteger
Close #1

'population pointer saved in SaveRoom2

'kill form
EqualizeAllowedAndCounter:
If AllowedSpecies.ListCount > AllowedSpeciesCounter.ListCount Then
    AllowedSpeciesCounter.AddItem (AllowedSpeciesCounter.ListCount)
    GoTo EqualizeAllowedAndCounter
End If

KillSpeciesForm:
Unload SpeciesForm
End Sub


Public Sub SpeciesList_Click()
'File1.Path = App.Path & "\files\enemies\"
SpeciesPreview.Picture = LoadPicture(File1.Path & "\" & SpeciesList.List(SpeciesList.ListIndex) & ".gif")
EnemySpecies.Text = SpeciesList.List(SpeciesList.ListIndex)
EnemyQuirksTextRefresh
End Sub

Private Sub SpeciesList_DblClick()
If SpeciesList.Text = "UNKNOWN" Then Exit Sub
'if already in list, leave sub
For I = 0 To (AllowedSpecies.ListCount - 1)
    If AllowedSpecies.List(I) = SpeciesList.Text Then Exit Sub
Next I
'add to list
AllowedSpecies.AddItem (SpeciesList.List(SpeciesList.ListIndex))
End Sub

Private Sub EnemyQuirksTextRefresh()
Dim TestingTextPath
Dim TextExists As Integer
Dim TempTextString As String

TestingTextPath = File1.Path & "\" & SpeciesList.List(SpeciesList.ListIndex) & ".txt"
Open TestingTextPath For Binary As #1
TextExists = LOF(1)
Close #1

'if doesn't exist, use blank text
If TextExists = 0 Then
    Kill TestingTextPath
    EnemyQuirksText1.Text = "[NO TEXT FILE FOUND]"
Else
Open TestingTextPath For Input As #1
    TempTextString = Input(LOF(1), 1)
Close #1
    EnemyQuirksText1.Text = TempTextString
    Close #1
End If
End Sub

