VERSION 5.00
Begin VB.Form GameBehavior1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Game Behavior"
   ClientHeight    =   6510
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4455
   ClipControls    =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6510
   ScaleWidth      =   4455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Game Start and Timers"
      Height          =   5655
      Index           =   0
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   4455
      Begin VB.CheckBox PreventDemos1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Hide Title Screen Demos"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   120
         TabIndex        =   63
         ToolTipText     =   "Demos of computer playing as Samus... Played if you don't press any buttons on the title screen."
         Top             =   720
         Width           =   4215
      End
      Begin VB.TextBox FakeRidley1 
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
         Left            =   120
         MaxLength       =   4
         TabIndex        =   51
         Text            =   "0000"
         ToolTipText     =   "Default is 0064"
         Top             =   3480
         Width           =   735
      End
      Begin VB.TextBox CeresTimer1 
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
         Left            =   120
         MaxLength       =   4
         TabIndex        =   27
         Text            =   "0000"
         ToolTipText     =   "Default is 0100"
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox ZebesTimer1 
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
         Left            =   120
         MaxLength       =   4
         TabIndex        =   26
         Text            =   "0000"
         ToolTipText     =   "Default is 0300"
         Top             =   2910
         Width           =   735
      End
      Begin VB.TextBox StartEnergy1 
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
         Left            =   120
         MaxLength       =   4
         TabIndex        =   22
         Text            =   "0000"
         ToolTipText     =   "Default is 0100"
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox StartSuperMissile1 
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
         Left            =   120
         MaxLength       =   4
         TabIndex        =   21
         Text            =   "0000"
         ToolTipText     =   "Default is 0000"
         Top             =   1590
         Width           =   735
      End
      Begin VB.TextBox StartPowerBomb1 
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
         Left            =   120
         MaxLength       =   4
         TabIndex        =   20
         Text            =   "0000"
         ToolTipText     =   "Default is 0000"
         Top             =   1980
         Width           =   735
      End
      Begin VB.CheckBox HideIntro1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Hide Intro"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   120
         TabIndex        =   3
         Top             =   465
         Width           =   4215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Fake Ridley Hits"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   19
         Left            =   840
         TabIndex        =   52
         Top             =   3480
         Width           =   2760
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Ceres Timer"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   855
         TabIndex        =   29
         Top             =   2595
         Width           =   1815
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Zebes Timer"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   855
         TabIndex        =   28
         Top             =   2985
         Width           =   1680
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Energy"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   855
         TabIndex        =   25
         Top             =   1275
         Width           =   1815
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Super Missile"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   11
         Left            =   855
         TabIndex        =   24
         Top             =   1665
         Width           =   2160
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Power Bomb"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   855
         TabIndex        =   23
         Top             =   2040
         Width           =   2400
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cancel"
      Height          =   255
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   6240
      Width           =   4455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SAVE"
      Height          =   375
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   5880
      Width           =   4455
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   0
      Max             =   0
      TabIndex        =   4
      Top             =   5640
      Width           =   4455
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "General 1"
      Height          =   5655
      Index           =   1
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   4455
      Begin VB.ComboBox BlueDoorPowerBomb1 
         Height          =   315
         ItemData        =   "GameBehavior1.frx":0000
         Left            =   120
         List            =   "GameBehavior1.frx":000A
         Style           =   2  'Dropdown List
         TabIndex        =   49
         Top             =   1320
         Width           =   1665
      End
      Begin VB.ComboBox DisabledStart1 
         Height          =   315
         ItemData        =   "GameBehavior1.frx":002F
         Left            =   120
         List            =   "GameBehavior1.frx":004E
         Style           =   2  'Dropdown List
         TabIndex        =   30
         Top             =   720
         Width           =   1665
      End
      Begin VB.TextBox GravityText1 
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
         Index           =   0
         Left            =   120
         MaxLength       =   4
         TabIndex        =   12
         Text            =   "0000"
         ToolTipText     =   "Default is 1C00"
         Top             =   1920
         Width           =   735
      End
      Begin VB.TextBox GravityText1 
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
         Index           =   1
         Left            =   120
         MaxLength       =   4
         TabIndex        =   11
         Text            =   "0000"
         ToolTipText     =   "Default is 0800"
         Top             =   2310
         Width           =   735
      End
      Begin VB.TextBox GravityText1 
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
         Index           =   2
         Left            =   120
         MaxLength       =   4
         TabIndex        =   10
         Text            =   "0000"
         ToolTipText     =   "Default is 0900"
         Top             =   2700
         Width           =   735
      End
      Begin VB.ComboBox BombCount1 
         Height          =   315
         ItemData        =   "GameBehavior1.frx":00A3
         Left            =   120
         List            =   "GameBehavior1.frx":00B6
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Default is 0005"
         Top             =   3435
         Width           =   1305
      End
      Begin VB.TextBox BombTimer1 
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
         Left            =   690
         MaxLength       =   4
         TabIndex        =   8
         Text            =   "0000"
         ToolTipText     =   "Default is 003C"
         Top             =   3750
         Width           =   735
      End
      Begin VB.ComboBox BeamCount1 
         Height          =   315
         ItemData        =   "GameBehavior1.frx":00D8
         Left            =   120
         List            =   "GameBehavior1.frx":00EB
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "Default is 0005"
         Top             =   4140
         Width           =   1305
      End
      Begin VB.ComboBox MissileCount1 
         Height          =   315
         ItemData        =   "GameBehavior1.frx":010D
         Left            =   120
         List            =   "GameBehavior1.frx":0120
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "Default is 0005"
         Top             =   4455
         Width           =   1305
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Blue Door Power Bombing"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   120
         TabIndex        =   50
         Top             =   1080
         Width           =   4080
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Disabled Start Button"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   31
         Top             =   480
         Width           =   4080
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Gravity Air"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   855
         TabIndex        =   19
         Top             =   1995
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Gravity Water"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   855
         TabIndex        =   18
         Top             =   2355
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Gravity Lava"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   855
         TabIndex        =   17
         Top             =   2715
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Max bombs"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   1440
         TabIndex        =   16
         Top             =   3465
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bomb Timer"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   1440
         TabIndex        =   15
         Top             =   3825
         Width           =   1695
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Max beams"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   1440
         TabIndex        =   14
         Top             =   4170
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Max missiles"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   1440
         TabIndex        =   13
         Top             =   4485
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Pick-Ups"
      Height          =   5655
      Index           =   2
      Left            =   0
      TabIndex        =   32
      Top             =   0
      Width           =   4455
      Begin VB.TextBox PickUpSound1 
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
         Index           =   4
         Left            =   3120
         MaxLength       =   2
         TabIndex        =   47
         Text            =   "00"
         ToolTipText     =   "Default is 1C00"
         Top             =   2400
         Width           =   495
      End
      Begin VB.TextBox PickUpSound1 
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
         Index           =   3
         Left            =   3120
         MaxLength       =   2
         TabIndex        =   46
         Text            =   "00"
         ToolTipText     =   "Default is 1C00"
         Top             =   2010
         Width           =   495
      End
      Begin VB.TextBox PickUpSound1 
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
         Index           =   2
         Left            =   3120
         MaxLength       =   2
         TabIndex        =   45
         Text            =   "00"
         ToolTipText     =   "Default is 1C00"
         Top             =   1620
         Width           =   495
      End
      Begin VB.TextBox PickUpSound1 
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
         Index           =   1
         Left            =   3120
         MaxLength       =   2
         TabIndex        =   44
         Text            =   "00"
         ToolTipText     =   "Default is 1C00"
         Top             =   1230
         Width           =   495
      End
      Begin VB.TextBox PickUpSound1 
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
         Index           =   0
         Left            =   3120
         MaxLength       =   2
         TabIndex        =   43
         Text            =   "00"
         ToolTipText     =   "Default is 1C00"
         Top             =   840
         Width           =   495
      End
      Begin VB.TextBox PickUpText1 
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
         Index           =   4
         Left            =   120
         MaxLength       =   4
         TabIndex        =   42
         Text            =   "0000"
         ToolTipText     =   "Default is 1C00"
         Top             =   2430
         Width           =   735
      End
      Begin VB.TextBox PickUpText1 
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
         Index           =   2
         Left            =   120
         MaxLength       =   4
         TabIndex        =   41
         Text            =   "0000"
         ToolTipText     =   "Default is 1C00"
         Top             =   1650
         Width           =   735
      End
      Begin VB.TextBox PickUpText1 
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
         Index           =   1
         Left            =   120
         MaxLength       =   4
         TabIndex        =   40
         Text            =   "0000"
         ToolTipText     =   "Default is 1C00"
         Top             =   1260
         Width           =   735
      End
      Begin VB.TextBox PickUpText1 
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
         Index           =   0
         Left            =   120
         MaxLength       =   4
         TabIndex        =   39
         Text            =   "0000"
         ToolTipText     =   "Default is 1C00"
         Top             =   870
         Width           =   735
      End
      Begin VB.TextBox PickUpText1 
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
         Index           =   3
         Left            =   120
         MaxLength       =   4
         TabIndex        =   33
         Text            =   "0000"
         ToolTipText     =   "Default is 1C00"
         Top             =   2040
         Width           =   735
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "Sounds:"
         Height          =   195
         Left            =   3000
         TabIndex        =   48
         Top             =   600
         Width           =   585
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Super Missile"
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
         Index           =   17
         Left            =   855
         TabIndex        =   38
         Top             =   2505
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Power Bomb"
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
         Index           =   16
         Left            =   855
         TabIndex        =   37
         Top             =   1725
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Big Energy"
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
         Index           =   15
         Left            =   855
         TabIndex        =   36
         Top             =   1335
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Energy"
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
         Index           =   14
         Left            =   855
         TabIndex        =   35
         Top             =   945
         Width           =   2400
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Missile"
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
         Index           =   13
         Left            =   855
         TabIndex        =   34
         Top             =   2115
         Width           =   2400
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Non-Beam Damages"
      Height          =   5655
      Index           =   4
      Left            =   0
      TabIndex        =   67
      Top             =   0
      Width           =   4455
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   11
         Left            =   120
         TabIndex        =   89
         Text            =   "0000"
         Top             =   4440
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   10
         Left            =   120
         TabIndex        =   88
         Text            =   "0000"
         Top             =   4080
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   9
         Left            =   120
         TabIndex        =   87
         Text            =   "0000"
         Top             =   3720
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   8
         Left            =   120
         TabIndex        =   85
         Text            =   "0000"
         Top             =   3240
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   7
         Left            =   120
         TabIndex        =   83
         Text            =   "0000"
         Top             =   2880
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   6
         Left            =   120
         TabIndex        =   81
         Text            =   "0000"
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   5
         Left            =   120
         TabIndex        =   79
         Text            =   "0000"
         Top             =   2160
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   4
         Left            =   120
         TabIndex        =   77
         Text            =   "0000"
         Top             =   1800
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   3
         Left            =   120
         TabIndex        =   72
         Text            =   "0000"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   2
         Left            =   120
         TabIndex        =   71
         Text            =   "0000"
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   1
         Left            =   120
         TabIndex        =   70
         Text            =   "0000"
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox NonBeamText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   0
         Left            =   120
         TabIndex        =   69
         Text            =   "0000"
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Wave SBA"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   32
         Left            =   855
         TabIndex        =   92
         Top             =   4440
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Plasma SBA"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   31
         Left            =   855
         TabIndex        =   91
         Top             =   4080
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Spazer SBA"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   30
         Left            =   855
         TabIndex        =   90
         Top             =   3720
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Pseudo Screw Attack"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   29
         Left            =   855
         TabIndex        =   86
         Top             =   3240
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Screw Attack"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   28
         Left            =   855
         TabIndex        =   84
         Top             =   2880
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Shinespark"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   27
         Left            =   855
         TabIndex        =   82
         Top             =   2520
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Speed Booster"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   26
         Left            =   855
         TabIndex        =   80
         Top             =   2160
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Speed Echoes"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   25
         Left            =   855
         TabIndex        =   78
         Top             =   1800
         Width           =   3000
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bombs"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   23
         Left            =   840
         TabIndex        =   76
         Top             =   960
         Width           =   1680
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Power Bombs"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   22
         Left            =   855
         TabIndex        =   75
         Top             =   1320
         Width           =   1680
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Super Missiles"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   21
         Left            =   855
         TabIndex        =   74
         Top             =   600
         Width           =   2640
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Missiles"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   20
         Left            =   855
         TabIndex        =   73
         Top             =   240
         Width           =   1680
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Projectile Damage"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   600
         Left            =   120
         TabIndex        =   68
         Top             =   4920
         Width           =   4230
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Projectile Editor"
      Height          =   5655
      Index           =   3
      Left            =   0
      TabIndex        =   53
      Top             =   0
      Width           =   4455
      Begin VB.TextBox ProjectileText1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   59
         Text            =   "0000"
         Top             =   2745
         Width           =   735
      End
      Begin VB.HScrollBar ProjectileHScroll1 
         Height          =   255
         Index           =   1
         LargeChange     =   16
         Left            =   495
         Max             =   255
         TabIndex        =   58
         Top             =   1080
         Width           =   3855
      End
      Begin VB.HScrollBar ProjectileHScroll1 
         Height          =   255
         Index           =   0
         LargeChange     =   16
         Left            =   495
         Max             =   255
         TabIndex        =   56
         Top             =   840
         Width           =   3855
      End
      Begin VB.CheckBox ProjectileCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Charged"
         Height          =   255
         Left            =   120
         TabIndex        =   55
         Top             =   480
         Width           =   975
      End
      Begin VB.ComboBox ProjectileTypeCombo1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         ItemData        =   "GameBehavior1.frx":0142
         Left            =   1215
         List            =   "GameBehavior1.frx":016A
         Style           =   2  'Dropdown List
         TabIndex        =   54
         Top             =   360
         Width           =   3135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Beam From Above"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   24
         Left            =   855
         TabIndex        =   64
         Top             =   2760
         Width           =   3480
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "00"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   62
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "00"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   61
         Top             =   840
         Width           =   375
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Projectile Damage"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2400
         Left            =   120
         TabIndex        =   60
         Top             =   3120
         Width           =   4230
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Delay Between Shots"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   735
         Left            =   120
         TabIndex        =   57
         Top             =   1320
         Width           =   4230
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Special Palette Blends"
      Height          =   5655
      Index           =   5
      Left            =   0
      TabIndex        =   65
      Top             =   0
      Width           =   4455
      Begin VB.HScrollBar rgbScroll1 
         Height          =   255
         Index           =   0
         Left            =   960
         Max             =   31
         TabIndex        =   96
         Tag             =   "0"
         Top             =   4740
         Width           =   3255
      End
      Begin VB.HScrollBar rgbScroll1 
         Height          =   255
         Index           =   1
         Left            =   960
         Max             =   31
         TabIndex        =   95
         Tag             =   "0"
         Top             =   5040
         Width           =   3255
      End
      Begin VB.HScrollBar rgbScroll1 
         Height          =   255
         Index           =   2
         Left            =   960
         Max             =   31
         TabIndex        =   94
         Tag             =   "0"
         Top             =   5280
         Width           =   3255
      End
      Begin VB.PictureBox PalettePreview1 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H000080FF&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1440
         Left            =   2760
         ScaleHeight     =   96
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   96
         TabIndex        =   93
         Top             =   3120
         Width           =   1440
         Begin VB.Image PalettePreviewTarget1 
            Enabled         =   0   'False
            Height          =   255
            Left            =   840
            Picture         =   "GameBehavior1.frx":01EF
            Top             =   720
            Width           =   255
         End
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Eye Beam"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   103
         Top             =   1320
         Width           =   2055
      End
      Begin VB.Label ColorLabel1 
         BackColor       =   &H00FFFFFF&
         Height          =   240
         Index           =   32
         Left            =   120
         TabIndex        =   102
         Top             =   1600
         Width           =   240
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Power Bomb Flash"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   101
         Top             =   360
         Width           =   2055
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   35
         Left            =   840
         TabIndex        =   100
         Top             =   4695
         Width           =   3495
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H0000FF00&
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   34
         Left            =   840
         TabIndex        =   99
         Top             =   5055
         Width           =   3495
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   33
         Left            =   840
         TabIndex        =   98
         Top             =   5295
         Width           =   3495
      End
      Begin VB.Label ColorPreviewLabel1 
         BorderStyle     =   1  'Fixed Single
         Height          =   1680
         Left            =   2655
         TabIndex        =   97
         Top             =   3000
         Width           =   1680
      End
      Begin VB.Label ColorLabel1 
         BackColor       =   &H00FFFFFF&
         Height          =   240
         Index           =   0
         Left            =   120
         TabIndex        =   66
         Top             =   600
         Width           =   240
      End
   End
End
Attribute VB_Name = "GameBehavior1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type ProjectileData
    CoolDown1 As Byte
    CoolDown2 As Byte
    Damage As Integer
End Type

Private Type PowerBombBlend
    Red As Byte
    Green As Byte
    Blue As Byte
End Type

Private Type EyeBeamBlend
    Red As Byte
    Green As Byte
    Blue As Byte
    Null As Byte
End Type

Private MyProjectiles(0 To 23) As ProjectileData
Private MyNonBeams(0 To 11) As Integer
Private Const PBombFlashOffset = &H40D85        '3 colors, seperated by channel
Private PBombFlash(0 To &H1F) As PowerBombBlend
'Private Const PBombPreFlashOffset = &H41079
'Private PBombPreFlash(0 To &H1F) As PowerBombBlend
Private Const EyeBeamOffset = &H46A8B
Private EyeBeam(0 To &HF) As EyeBeamBlend
Private EyeBeamAsPowerBomb As PowerBombBlend
Private TempBlend As PowerBombBlend
Private SelectedBlend As Byte               'which blend is currently chosen




Private Sub Check1_Click()
RefreshProjectileData
End Sub


Private Sub ColorLabel1_Click(Index As Integer)
RGBScroll1(0).Tag = Index
For I = 0 To ColorLabel1.UBound
    ColorLabel1(I).BorderStyle = 0
Next I
ColorLabel1(Index).BorderStyle = 1
ColorLabel1_Retrieve (Index)
GameBehavior1.Caption = Hex$(Index)
End Sub

Private Sub Command1_Click(Index As Integer)
Dim HideIntro As Byte    'what the user chooses, then changed to new value
Dim PreventDemos As Byte
Dim CeresTimer As Integer
Dim ZebesTimer As Integer
Dim GravityNormal As Integer
Dim GravityWater As Integer
Dim GravityLava As Integer
Dim StartDisabledArea As Byte
Dim BombMax As Integer
Dim BeamMax As Integer
Dim MissileMax As Integer
Dim BombTimer As Integer
Dim PickUp(0 To 4) As Integer
Dim PickUpSound(0 To 4) As Byte
Dim BlueDoorPowerBomb As Byte
Dim StartEnergy As Integer
Dim StartSuperMissile As Integer
Dim StartPowerBomb As Integer
Dim FakeRidley As Integer


'if cancelled, don't save
If Index = 1 Then GoTo CloseForm

'handling INTRO (7 as default value)...(don't know if other values do)
If HideIntro1.Value = 1 Then HideIntro = 5 Else HideIntro = 7
If PreventDemos1.Value = 1 Then PreventDemos = &HA9& Else PreventDemos = &HCE&
CeresTimer = Val("&H" & CeresTimer1.Text)
ZebesTimer = Val("&H" & ZebesTimer1.Text)
GravityNormal = Val("&H" & GravityText1(0).Text)
GravityWater = Val("&H" & GravityText1(1).Text)
GravityLava = Val("&H" & GravityText1(2).Text)
StartDisabledArea = DisabledStart1.ListIndex
BombMax = Val("&H" & BombCount1.Text)
BeamMax = Val("&H" & BeamCount1.Text)
MissileMax = Val("&H" & MissileCount1.Text)
BombTimer = Val("&H" & BombTimer1.Text)
For I = 0 To 4
    PickUp(I) = Val("&H" & PickUpText1(I).Text)
    PickUpSound(I) = Val("&H" & PickUpSound1(I).Text)
Next I
Select Case BlueDoorPowerBomb1.ListIndex
    Case 0: BlueDoorPowerBomb = &HD0
    Case 1: BlueDoorPowerBomb = &H80
End Select
StartEnergy = Val("&H" & StartEnergy1.Text)
StartSuperMissile = Val("&H" & StartSuperMissile1.Text)
StartPowerBomb = Val("&H" & StartPowerBomb1.Text)
FakeRidley = Val("&H" & FakeRidley1.Text)

'open once
Open needslash For Binary As #1
    Put #1, &H16EBB + ROM_HEADER + 1, HideIntro
    Put #1, &H59F29 + ROM_HEADER + 1, PreventDemos
    Put #1, &H1E0E + ROM_HEADER + 1, CeresTimer
    Put #1, &H1E21 + ROM_HEADER + 1, ZebesTimer
    Put #1, &HB2CE& + ROM_HEADER + 1, StartEnergy
    Put #1, &HB2E0& + ROM_HEADER + 1, StartSuperMissile
    Put #1, &HB2E9& + ROM_HEADER + 1, StartPowerBomb
    Put #1, &H81EA1 + ROM_HEADER + 1, GravityNormal
    Put #1, &H81EA3 + ROM_HEADER + 1, GravityWater
    Put #1, &H81EA5 + ROM_HEADER + 1, GravityLava
    Put #1, &H86A5B + ROM_HEADER + 1, StartDisabledArea
    Put #1, &H840F4 + ROM_HEADER + 1, BombMax
    Put #1, &H82C3D + ROM_HEADER + 1, BeamMax
    Put #1, &H82C66 + ROM_HEADER + 1, MissileMax
    Put #1, &H83F9B + ROM_HEADER + 1, BombTimer
    '81F08 and 81F0D are acceleration
    For I = 0 To 4
        Put #1, &H370BC + (I * 15) + ROM_HEADER + 1, PickUp(I)
        Put #1, &H370C3 + (I * 15) + ROM_HEADER + 1, PickUpSound(I)
    Next I
    Put #1, &H247C7 + ROM_HEADER + 1, BlueDoorPowerBomb
    Put #1, &H1326ED + ROM_HEADER + 1, FakeRidley
    
    'Saving Projectiles
    For ProjectileI = 0 To 11
        Put #1, &H84254 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI).CoolDown1
        Put #1, &H84264 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI + 12).CoolDown1
        Put #1, &H84283 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI).CoolDown2
        Put #1, &H84293 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI + 12).CoolDown2
    Next ProjectileI
    Put #1, &H98431 + ROM_HEADER + 1, MyProjectiles(0).Damage
    Put #1, &H984B5 + ROM_HEADER + 1, MyProjectiles(1).Damage
    Put #1, &H9849F + ROM_HEADER + 1, MyProjectiles(2).Damage
    Put #1, &H984E1 + ROM_HEADER + 1, MyProjectiles(3).Damage
    Put #1, &H98447 + ROM_HEADER + 1, MyProjectiles(4).Damage
    Put #1, &H984F7 + ROM_HEADER + 1, MyProjectiles(5).Damage
    Put #1, &H9845D + ROM_HEADER + 1, MyProjectiles(6).Damage
    Put #1, &H98473 + ROM_HEADER + 1, MyProjectiles(7).Damage
    Put #1, &H984CB + ROM_HEADER + 1, MyProjectiles(8).Damage
    Put #1, &H9850D + ROM_HEADER + 1, MyProjectiles(9).Damage
    Put #1, &H98523 + ROM_HEADER + 1, MyProjectiles(10).Damage
    Put #1, &H98489 + ROM_HEADER + 1, MyProjectiles(11).Damage
    Put #1, &H98539 + ROM_HEADER + 1, MyProjectiles(12).Damage
    Put #1, &H985D3 + ROM_HEADER + 1, MyProjectiles(13).Damage
    Put #1, &H985A7 + ROM_HEADER + 1, MyProjectiles(14).Damage
    Put #1, &H985E9 + ROM_HEADER + 1, MyProjectiles(15).Damage
    Put #1, &H9854F + ROM_HEADER + 1, MyProjectiles(16).Damage
    Put #1, &H985FF + ROM_HEADER + 1, MyProjectiles(17).Damage
    Put #1, &H98565 + ROM_HEADER + 1, MyProjectiles(18).Damage
    Put #1, &H9857B + ROM_HEADER + 1, MyProjectiles(19).Damage
    Put #1, &H985BD + ROM_HEADER + 1, MyProjectiles(20).Damage
    Put #1, &H9862B + ROM_HEADER + 1, MyProjectiles(21).Damage
    Put #1, &H98615 + ROM_HEADER + 1, MyProjectiles(22).Damage
    Put #1, &H98591 + ROM_HEADER + 1, MyProjectiles(23).Damage
    'non-beam damages
    Put #1, &H98641 + ROM_HEADER + 1, MyNonBeams(0)     'missiles
    Put #1, &H98657 + ROM_HEADER + 1, MyNonBeams(1)     'supers
    Put #1, &H98675 + ROM_HEADER + 1, MyNonBeams(2)     'bombs
    Put #1, &H1025E7 + ROM_HEADER + 1, MyNonBeams(3)    'power bombs
    Put #1, &H986C1 + ROM_HEADER + 1, MyNonBeams(4)     'speed echoes
    Put #1, &H1024B0 + ROM_HEADER + 1, MyNonBeams(5)    'speed booster
    Put #1, &H1024BB + ROM_HEADER + 1, MyNonBeams(6)    'shinespark
    Put #1, &H1024C3 + ROM_HEADER + 1, MyNonBeams(7)    'screw attack
    Put #1, &H1024CD + ROM_HEADER + 1, MyNonBeams(8)    'pseudo screw attack
    'SBA's (except ice SBA, which is charged ice)
    Put #1, &H986AB + ROM_HEADER + 1, MyNonBeams(9)    'pseudo screw attack
    Put #1, &H98685 + ROM_HEADER + 1, MyNonBeams(10)    'pseudo screw attack
    Put #1, &H98689 + ROM_HEADER + 1, MyNonBeams(11)    'pseudo screw attack
    'powerbomb flash
    Put #1, PBombFlashOffset + ROM_HEADER + 1, PBombFlash       'powerbomb flash
    'Put #1, PBombPreFlashOffset + ROM_HEADER + 1, PBombPreFlash 'powerbomb pre-flash
    'eye beam
    For I = 0 To UBound(EyeBeam)
        EyeBeam(I).Red = EyeBeam(I).Red + &H20
        EyeBeam(I).Green = EyeBeam(I).Green + &H40
        EyeBeam(I).Blue = EyeBeam(I).Blue + &H80
    Next I
    Put #1, EyeBeamOffset + ROM_HEADER + 1, EyeBeam     'eye beam
Close #1

CloseForm:
Unload Me
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Dim HideIntro As Byte    'what the user chooses, then changed to new value
Dim PreventDemos As Byte
Dim CeresTimer As Integer
Dim ZebesTimer As Integer
Dim GravityNormal As Integer
Dim GravityWater As Integer
Dim GravityLava As Integer
Dim StartDisabledArea As Byte
Dim BombMax As Integer
Dim BeamMax As Integer
Dim MissileMax As Integer
Dim BombTimer As Integer
Dim PickUp(0 To 4) As Integer
Dim PickUpSound(0 To 4) As Byte
Dim BlueDoorPowerBomb As Byte
Dim StartEnergy As Integer
Dim StartSuperMissile As Integer
Dim StartPowerBomb As Integer
Dim FakeRidley As Integer

Me.Icon = Smile.Icon
HScroll1.Max = Frame1.UBound

'open once
Open needslash For Binary As #1
    Get #1, &H16EBB + ROM_HEADER + 1, HideIntro
    Get #1, &H59F29 + ROM_HEADER + 1, PreventDemos
    Get #1, &H1E0E + ROM_HEADER + 1, CeresTimer
    Get #1, &H1E21 + ROM_HEADER + 1, ZebesTimer
    Get #1, &HB2CE& + ROM_HEADER + 1, StartEnergy
    Get #1, &HB2E0& + ROM_HEADER + 1, StartSuperMissile
    Get #1, &HB2E9& + ROM_HEADER + 1, StartPowerBomb
    Get #1, &H81EA1 + ROM_HEADER + 1, GravityNormal
    Get #1, &H81EA3 + ROM_HEADER + 1, GravityWater
    Get #1, &H81EA5 + ROM_HEADER + 1, GravityLava
    Get #1, &H86A5B + ROM_HEADER + 1, StartDisabledArea
    Get #1, &H840F4 + ROM_HEADER + 1, BombMax
    Get #1, &H82C3D + ROM_HEADER + 1, BeamMax
    Get #1, &H82C66 + ROM_HEADER + 1, MissileMax
    Get #1, &H83F9B + ROM_HEADER + 1, BombTimer
    For I = 0 To 4
        Get #1, &H370BC + (I * 15) + ROM_HEADER + 1, PickUp(I)
        Get #1, &H370C3 + (I * 15) + ROM_HEADER + 1, PickUpSound(I)
    Next I
    '81F08 and 81F0D are acceleration
    Get #1, &H247C7 + ROM_HEADER + 1, BlueDoorPowerBomb
    Get #1, &H1326ED + ROM_HEADER + 1, FakeRidley
    'Loading Projectiles
    For ProjectileI = 0 To 11
        Get #1, &H84254 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI).CoolDown1
        Get #1, &H84264 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI + 12).CoolDown1
        Get #1, &H84283 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI).CoolDown2
        Get #1, &H84293 + ProjectileI + ROM_HEADER + 1, MyProjectiles(ProjectileI + 12).CoolDown2
    Next ProjectileI
    Get #1, &H98431 + ROM_HEADER + 1, MyProjectiles(0).Damage
    Get #1, &H984B5 + ROM_HEADER + 1, MyProjectiles(1).Damage
    Get #1, &H9849F + ROM_HEADER + 1, MyProjectiles(2).Damage
    Get #1, &H984E1 + ROM_HEADER + 1, MyProjectiles(3).Damage
    Get #1, &H98447 + ROM_HEADER + 1, MyProjectiles(4).Damage
    Get #1, &H984F7 + ROM_HEADER + 1, MyProjectiles(5).Damage
    Get #1, &H9845D + ROM_HEADER + 1, MyProjectiles(6).Damage
    Get #1, &H98473 + ROM_HEADER + 1, MyProjectiles(7).Damage
    Get #1, &H984CB + ROM_HEADER + 1, MyProjectiles(8).Damage
    Get #1, &H9850D + ROM_HEADER + 1, MyProjectiles(9).Damage
    Get #1, &H98523 + ROM_HEADER + 1, MyProjectiles(10).Damage
    Get #1, &H98489 + ROM_HEADER + 1, MyProjectiles(11).Damage
    Get #1, &H98539 + ROM_HEADER + 1, MyProjectiles(12).Damage
    Get #1, &H985D3 + ROM_HEADER + 1, MyProjectiles(13).Damage
    Get #1, &H985A7 + ROM_HEADER + 1, MyProjectiles(14).Damage
    Get #1, &H985E9 + ROM_HEADER + 1, MyProjectiles(15).Damage
    Get #1, &H9854F + ROM_HEADER + 1, MyProjectiles(16).Damage
    Get #1, &H985FF + ROM_HEADER + 1, MyProjectiles(17).Damage
    Get #1, &H98565 + ROM_HEADER + 1, MyProjectiles(18).Damage
    Get #1, &H9857B + ROM_HEADER + 1, MyProjectiles(19).Damage
    Get #1, &H985BD + ROM_HEADER + 1, MyProjectiles(20).Damage
    Get #1, &H9862B + ROM_HEADER + 1, MyProjectiles(21).Damage
    Get #1, &H98615 + ROM_HEADER + 1, MyProjectiles(22).Damage
    Get #1, &H98591 + ROM_HEADER + 1, MyProjectiles(23).Damage
    'non-beam damages
    Get #1, &H98641 + ROM_HEADER + 1, MyNonBeams(0)     'missiles
    Get #1, &H98657 + ROM_HEADER + 1, MyNonBeams(1)     'supers
    Get #1, &H98675 + ROM_HEADER + 1, MyNonBeams(2)     'bombs
    Get #1, &H1025E7 + ROM_HEADER + 1, MyNonBeams(3)     'power bombs
    Get #1, &H986C1 + ROM_HEADER + 1, MyNonBeams(4)     'speed echoes
    Get #1, &H1024B0 + ROM_HEADER + 1, MyNonBeams(5)    'speed booster
    Get #1, &H1024BB + ROM_HEADER + 1, MyNonBeams(6)    'shinespark
    Get #1, &H1024C3 + ROM_HEADER + 1, MyNonBeams(7)    'screw attack
    Get #1, &H1024CD + ROM_HEADER + 1, MyNonBeams(8)    'pseudo screw attack
    'SBA's (except ice SBA, which is charged ice)
    Get #1, &H986AB + ROM_HEADER + 1, MyNonBeams(9)     'Spazer SBA
    Get #1, &H98685 + ROM_HEADER + 1, MyNonBeams(10)    'PlasmaSBA
    Get #1, &H98689 + ROM_HEADER + 1, MyNonBeams(11)    'Wave SBA
    'powerbomb flash
    Get #1, PBombFlashOffset + ROM_HEADER + 1, PBombFlash       'powerbomb flash
    'Get #1, PBombPreFlashOffset + ROM_HEADER + 1, PBombPreFlash 'powerbomb pre-flash
    'eye beam
    Get #1, EyeBeamOffset + ROM_HEADER + 1, EyeBeam     'eye beam
Close #1

'handling INTRO (7 as default value)...(don't know if other values do... 5 is my chosen)
If HideIntro = 5 Then HideIntro1.Value = 1
'demos (CE is default, A9 is preventer)
If PreventDemos = &HA9& Then PreventDemos1.Value = 1
CeresTimer1.Text = Right$("0000" & Hex$(CeresTimer), 4)
ZebesTimer1.Text = Right$("0000" & Hex$(ZebesTimer), 4)
GravityText1(0).Text = Right$("0000" & Hex$(GravityNormal), 4)
GravityText1(1).Text = Right$("0000" & Hex$(GravityWater), 4)
GravityText1(2).Text = Right$("0000" & Hex$(GravityLava), 4)
If StartDisabledArea > 7 Then StartDisabledArea = 7
DisabledStart1.Text = DisabledStart1.List(StartDisabledArea)
If BombMax > 0 Then
    BombCount1.Text = Right$("0000" & Hex$(BombMax), 4)
Else
    'in case ASM has been added
    BombCount1.AddItem Right$("0000" & Hex$(BombMax), 4)
    BombCount1.Text = Right$("0000" & Hex$(BombMax), 4)
End If
BeamCount1.Text = Right$("0000" & Hex$(BeamMax), 4)
MissileCount1.Text = Right$("0000" & Hex$(MissileMax), 4)
BombTimer1.Text = Right$("0000" & Hex$(BombTimer), 4)
BombTimer1.ToolTipText = "00 = 5 bombs / 09 = fastest with bounce / 3C = default"
For I = 0 To 4
    PickUpText1(I).Text = Right$("0000" & Hex$(PickUp(I)), 4)
    PickUpSound1(I).Text = Right$("00" & Hex$(PickUpSound(I)), 2)
Next I
Select Case BlueDoorPowerBomb
    Case &HD0: BlueDoorPowerBomb1.Text = BlueDoorPowerBomb1.List(0)
    Case &H80: BlueDoorPowerBomb1.Text = BlueDoorPowerBomb1.List(1)
End Select
StartEnergy1.Text = Right$("0000" & Hex$(StartEnergy), 4)
StartSuperMissile1.Text = Right$("0000" & Hex$(StartSuperMissile), 4)
StartPowerBomb1.Text = Right$("0000" & Hex$(StartPowerBomb), 4)
FakeRidley1.Text = Right$("0000" & Hex$(FakeRidley), 4)

ProjectileTypeCombo1.Text = "Normal"

For II = 0 To NonBeamText1.UBound
    NonBeamText1(II).Text = Right$("0000" & Hex$(MyNonBeams(II)), 4)
Next II

Label3.Caption = "Delay between shots. First is for tapping the fire button. Second is for holding fire button."
Label4.Caption = "Strength. 0800 is as high as you'd usually ever want."
Label6.Caption = "Strength. 0800 is as high as you'd usually ever want."

'powerbomb flash
For I = 1 To UBound(PBombFlash)
    Load ColorLabel1(I)
    ColorLabel1(I).Left = ColorLabel1(I - 1).Left + ColorLabel1(I - 1).Width
    ColorLabel1(I).Top = ColorLabel1(I - 1).Top
    If ColorLabel1(I).Left > (((ColorLabel1(0).Width * 16) - 1) + ColorLabel1(0).Left) Then
        ColorLabel1(I).Left = ColorLabel1(0).Left
        ColorLabel1(I).Top = ColorLabel1(I).Top + ColorLabel1(I).Height
    End If
    ColorLabel1(I).Visible = True
Next I
ColorLabel1(0).BorderStyle = 1
'eye beam
For I = 1 To UBound(EyeBeam)
    Load ColorLabel1(I + &H20)
    ColorLabel1(I + &H20).Move ColorLabel1(I).Left, ColorLabel1(I).Top + 1000
    ColorLabel1(I + &H20).Visible = True
Next I
ColorLabel1(0).BorderStyle = 1


For I = 0 To UBound(PBombFlash)
    'powerbomb flash
    ColorLabel1(I).BackColor = RGB(PBombFlash(I).Red * 8, PBombFlash(I).Green * 8, PBombFlash(I).Blue * 8)
Next I

For I = 0 To UBound(EyeBeam)
    'eye beam
    EyeBeam(I).Red = EyeBeam(I).Red - &H20
    EyeBeam(I).Green = EyeBeam(I).Green - &H40
    EyeBeam(I).Blue = EyeBeam(I).Blue - &H80
    ColorLabel1(I + &H20).BackColor = RGB(EyeBeam(I).Red * 8, EyeBeam(I).Green * 8, EyeBeam(I).Blue * 8)
Next I









Label4.Caption = Label4.Caption & vbCrLf & vbCrLf & "Hyper uses the same value as charged plasma" & vbCrLf & vbCrLf & "Ice SBA uses value of charged ice"
End Sub


Private Sub HScroll1_Change()
Frame1(HScroll1.Value).ZOrder 0
End Sub




Private Sub NonBeamText1_Change(Index As Integer)
MyNonBeams(Index) = Val("&H" & NonBeamText1(Index).Text)
End Sub


Private Sub PalettePreview1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
RGBScroll1(1).Value = X \ 3
RGBScroll1(2).Value = Y \ 3
ColorLabel1(RGBScroll1(0).Tag).BackColor = RGB(RGBScroll1(0).Value * 8, RGBScroll1(1).Value * 8, RGBScroll1(2).Value * 8)
PalettePreviewTarget1.Left = X - 8
PalettePreviewTarget1.Top = Y - 8
ColorPreviewLabel1.BackColor = ColorLabel1(RGBScroll1(0).Tag).BackColor

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

Private Sub ProjectileCheck1_Click()
RefreshProjectileData
End Sub

Private Sub ProjectileHScroll1_Change(Index As Integer)
Dim ProjectileIndex As Byte

ProjectileIndex = ProjectileTypeCombo1.ListIndex
If ProjectileCheck1.Value = Checked Then
    ProjectileIndex = ProjectileIndex + 12
End If

If Index = 0 Then
    MyProjectiles(ProjectileIndex).CoolDown1 = ProjectileHScroll1(0).Value
    Label5(0).Caption = Right$("00" & Hex$(MyProjectiles(ProjectileIndex).CoolDown1), 2)
Else
    MyProjectiles(ProjectileIndex).CoolDown2 = ProjectileHScroll1(1).Value
    Label5(1).Caption = Right$("00" & Hex$(MyProjectiles(ProjectileIndex).CoolDown2), 2)
End If
End Sub

Private Sub ProjectileText1_Change()
Dim ProjectileIndex As Byte

ProjectileIndex = ProjectileTypeCombo1.ListIndex
If ProjectileCheck1.Value = Checked Then
    ProjectileIndex = ProjectileIndex + 12
End If

MyProjectiles(ProjectileIndex).Damage = Val("&H" & ProjectileText1.Text)
End Sub

Private Sub ProjectileTypeCombo1_Click()
RefreshProjectileData
End Sub


Public Sub RefreshProjectileData()
Dim ProjectileIndex As Byte

ProjectileIndex = ProjectileTypeCombo1.ListIndex
If ProjectileCheck1.Value = Checked Then
    ProjectileIndex = ProjectileIndex + 12
End If
ProjectileHScroll1(0).Value = MyProjectiles(ProjectileIndex).CoolDown1
ProjectileHScroll1(1).Value = MyProjectiles(ProjectileIndex).CoolDown2
ProjectileText1.Text = Right$("0000" & Hex$(MyProjectiles(ProjectileIndex).Damage), 4)
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
End Sub

Private Sub RGBScroll1_Scroll(Index As Integer)
RGBScroll1_Change Index

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

'set Powerbomb Flash colors
If Val(RGBScroll1(0).Tag) < &H20 Then
    PBombFlash(RGBScroll1(0).Tag).Red = RGBScroll1(0)
    PBombFlash(RGBScroll1(0).Tag).Green = RGBScroll1(1)
    PBombFlash(RGBScroll1(0).Tag).Blue = RGBScroll1(2)
    Exit Sub
End If
'set eyebeam colors
If Val(RGBScroll1(0).Tag) < &H40 Then
    EyeBeam(RGBScroll1(0).Tag - &H20).Red = RGBScroll1(0)
    EyeBeam(RGBScroll1(0).Tag - &H20).Green = RGBScroll1(1)
    EyeBeam(RGBScroll1(0).Tag - &H20).Blue = RGBScroll1(2)
    Exit Sub
End If


End Sub
