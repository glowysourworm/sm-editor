VERSION 5.00
Begin VB.Form Poses1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Poses"
   ClientHeight    =   6030
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7245
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6030
   ScaleWidth      =   7245
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame PosesFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Poses Properties"
      Height          =   2295
      Index           =   0
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   7215
      Begin VB.ComboBox MovementList1 
         BackColor       =   &H00C0FFC0&
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
         ItemData        =   "Poses1.frx":0000
         Left            =   4080
         List            =   "Poses1.frx":0058
         Style           =   2  'Dropdown List
         TabIndex        =   53
         Top             =   1440
         Width           =   3015
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Save Pose Properties"
         Height          =   255
         Left            =   4080
         TabIndex        =   52
         Top             =   1920
         Width           =   3015
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
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
         Height          =   345
         Index           =   7
         Left            =   6720
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   44
         Tag             =   "0"
         Text            =   "Poses1.frx":035F
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
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
         Height          =   345
         Index           =   6
         Left            =   6360
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   43
         Tag             =   "0"
         Text            =   "Poses1.frx":0364
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
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
         Height          =   345
         Index           =   5
         Left            =   6360
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   42
         Tag             =   "0"
         Text            =   "Poses1.frx":0369
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
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
         Height          =   345
         Index           =   4
         Left            =   6360
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   41
         Tag             =   "0"
         Text            =   "Poses1.frx":036E
         Top             =   360
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
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
         Height          =   345
         Index           =   3
         Left            =   4080
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   40
         Tag             =   "0"
         Text            =   "Poses1.frx":0373
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
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
         Height          =   345
         Index           =   2
         Left            =   4080
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   39
         Tag             =   "0"
         Text            =   "Poses1.frx":0378
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
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
         Height          =   345
         Index           =   1
         Left            =   4080
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   38
         Tag             =   "0"
         Text            =   "Poses1.frx":037D
         Top             =   1440
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.TextBox PosePropertyText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0FFFF&
         Height          =   345
         Index           =   0
         Left            =   4080
         MaxLength       =   2
         MultiLine       =   -1  'True
         TabIndex        =   37
         Tag             =   "0"
         Text            =   "Poses1.frx":0382
         Top             =   360
         Width           =   375
      End
      Begin VB.Image Image1 
         Appearance      =   0  'Flat
         Height          =   1920
         Left            =   120
         Picture         =   "Poses1.frx":0387
         Top             =   240
         Width           =   2625
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "-unused-"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   12
         Left            =   4920
         TabIndex        =   51
         Top             =   1080
         Width           =   1320
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Vertical radius"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   11
         Left            =   4920
         TabIndex        =   50
         Top             =   720
         Width           =   1320
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Vertical offset"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   9
         Left            =   4920
         TabIndex        =   49
         Top             =   360
         Width           =   1320
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Fire to"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   8
         Left            =   2880
         TabIndex        =   48
         Top             =   1080
         Width           =   1200
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Default Pose"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   7
         Left            =   2880
         TabIndex        =   47
         Top             =   720
         Width           =   1200
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Movement"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   6
         Left            =   2880
         TabIndex        =   46
         Top             =   1440
         Width           =   1200
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Facing"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   5
         Left            =   2880
         TabIndex        =   45
         Top             =   360
         Width           =   1200
      End
   End
   Begin VB.ComboBox PosesList1 
      BackColor       =   &H00FFFFFF&
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
      ItemData        =   "Poses1.frx":07DA
      Left            =   0
      List            =   "Poses1.frx":0AD5
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   0
      Width           =   7215
   End
   Begin VB.Frame PosesFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Poses Transitions (Controller Input)"
      Height          =   3255
      Index           =   1
      Left            =   0
      TabIndex        =   2
      Top             =   2760
      Width           =   7215
      Begin VB.TextBox PoseTransitionText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   1
         Left            =   1680
         MaxLength       =   4
         MultiLine       =   -1  'True
         TabIndex        =   55
         Text            =   "Poses1.frx":3DAB
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox PoseTransitionText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   0
         Left            =   1680
         MaxLength       =   4
         MultiLine       =   -1  'True
         TabIndex        =   54
         Text            =   "Poses1.frx":3DB0
         Top             =   840
         Width           =   615
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Down"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   5
         Left            =   3360
         TabIndex        =   4
         Tag             =   "0400"
         Top             =   2070
         Width           =   735
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   23
         Left            =   4920
         TabIndex        =   36
         Tag             =   "0010"
         Top             =   1080
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   22
         Left            =   3000
         TabIndex        =   35
         Tag             =   "0020"
         Top             =   1080
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   21
         Left            =   5760
         TabIndex        =   34
         Tag             =   "0040"
         Top             =   1695
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   20
         Left            =   5760
         TabIndex        =   33
         Tag             =   "0080"
         Top             =   1440
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   19
         Left            =   3480
         TabIndex        =   32
         Tag             =   "0100"
         Top             =   1815
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   18
         Left            =   2640
         TabIndex        =   31
         Tag             =   "0200"
         Top             =   1815
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   17
         Left            =   3120
         TabIndex        =   30
         Tag             =   "0400"
         Top             =   2070
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   16
         Left            =   3120
         TabIndex        =   29
         Tag             =   "0800"
         Top             =   1560
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   15
         Left            =   4560
         TabIndex        =   28
         Tag             =   "1000"
         Top             =   1680
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   14
         Left            =   4560
         TabIndex        =   27
         Tag             =   "2000"
         Top             =   1920
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   13
         Left            =   5760
         TabIndex        =   26
         Tag             =   "4000"
         Top             =   2205
         Width           =   255
      End
      Begin VB.CheckBox SamusControls1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   12
         Left            =   5760
         TabIndex        =   25
         Tag             =   "8000"
         Top             =   1950
         Width           =   255
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Save Controller"
         Height          =   615
         Left            =   120
         TabIndex        =   24
         Top             =   525
         Width           =   975
      End
      Begin VB.ComboBox NewPoseList1 
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
         ItemData        =   "Poses1.frx":3DB5
         Left            =   120
         List            =   "Poses1.frx":40B0
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   2760
         Width           =   6975
      End
      Begin VB.ListBox TransitionsFound1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1260
         Left            =   120
         TabIndex        =   22
         Top             =   1140
         Width           =   975
      End
      Begin VB.TextBox TransitionPointerText1 
         BackColor       =   &H00C0C0FF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         MaxLength       =   4
         TabIndex        =   19
         Text            =   "0000"
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox PoseTransitionText1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   2
         Left            =   1560
         MaxLength       =   4
         MultiLine       =   -1  'True
         TabIndex        =   15
         Text            =   "Poses1.frx":7386
         Top             =   2400
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Jump"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   8
         Left            =   6015
         TabIndex        =   11
         Tag             =   "0080"
         Top             =   1440
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Left"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   6
         Left            =   2880
         TabIndex        =   3
         Tag             =   "0200"
         Top             =   1815
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Diagonal Up"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   11
         Left            =   5160
         TabIndex        =   14
         Tag             =   "0010"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Diagonal Down"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   10
         Left            =   3240
         TabIndex        =   13
         Tag             =   "0020"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Shoot"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   9
         Left            =   6015
         TabIndex        =   12
         Tag             =   "0040"
         Top             =   1695
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Right"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   7
         Left            =   3720
         TabIndex        =   10
         Tag             =   "0100"
         Top             =   1815
         Width           =   735
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Run"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   6015
         TabIndex        =   9
         Tag             =   "8000"
         Top             =   1950
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Cancel"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   6015
         TabIndex        =   8
         Tag             =   "4000"
         Top             =   2205
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Select"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   2
         Left            =   4800
         TabIndex        =   7
         Tag             =   "2000"
         Top             =   1920
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Start"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   3
         Left            =   4800
         TabIndex        =   6
         Tag             =   "1000"
         Top             =   1680
         Width           =   855
      End
      Begin VB.CheckBox SamusControls1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Up"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   4
         Left            =   3360
         TabIndex        =   5
         Tag             =   "0800"
         Top             =   1560
         Width           =   615
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Transitions Found"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   1100
         TabIndex        =   21
         Top             =   1200
         Width           =   1600
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Transition Pointer"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   1100
         TabIndex        =   20
         Top             =   240
         Width           =   1600
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Turns into the Pose"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   18
         Top             =   2520
         Width           =   1560
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0E0FF&
         Caption         =   "New Keys Pressed:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Left            =   3600
         TabIndex        =   16
         Top             =   480
         Width           =   2520
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   " Current Keys Held:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Left            =   3630
         TabIndex        =   17
         Top             =   240
         Width           =   2505
      End
   End
End
Attribute VB_Name = "Poses1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'EVERYTHING RELATED TO SAMUS'S POSES
'pose #'s and descriptions
'properties of each pose (from fire.txt)
'control transitions of each pose (from transitiontable.txt)
'animations???
Private Const PosePropertiesTableOffset = &H8B629
Private Const TransitionTableOffset = &H89EE2



Private Sub Command1_Click()
Dim TransitionPointer As Integer
Dim TempPose As PoseProperties

'get values from textboxes
TempPose.SamDir = Val("&H" & PosePropertyText1(0).Text)
TempPose.MoveType = Val("&H" & PosePropertyText1(1).Text)
TempPose.NewPose = Val("&H" & PosePropertyText1(2).Text)
TempPose.ShotDir = Val("&H" & PosePropertyText1(3).Text)
TempPose.VerDisplace = Val("&H" & PosePropertyText1(4).Text)
TempPose.unused1 = Val("&H" & PosePropertyText1(5).Text)
TempPose.VerRadius = Val("&H" & PosePropertyText1(6).Text)
TempPose.unused2 = Val("&H" & PosePropertyText1(7).Text)

'save pose properties
Open needslash For Binary As #1
    Put #1, PosePropertiesTableOffset + (PosesList1.ListIndex * 8) + ROM_HEADER + 1, TempPose
Close #1

End Sub

Private Sub Command2_Click()
Dim TransitionPointer As Integer
Dim TransitionOffset As Long
Dim TempDepth As Byte
Dim TempTransition As PoseTransitions
'for figuring control values
Dim ControlLoop As Byte
Dim ControlTotal(0 To 1) As Long

FirstSet:
For ControlLoop = 0 To 11
    If SamusControls1(ControlLoop).Value = 1 Then
        ControlTotal(0) = ControlTotal(0) + Val("&H" & SamusControls1(ControlLoop).Tag & "&")
    End If
Next ControlLoop
SecondSet:
For ControlLoop = 12 To 23
    If SamusControls1(ControlLoop).Value = 1 Then
        ControlTotal(1) = ControlTotal(1) + Val("&H" & SamusControls1(ControlLoop).Tag & "&")
    End If
Next ControlLoop

TransitionPointer = Val("&H" & TransitionPointerText1.Text)
'save pointer to correct spot in transition table
Open needslash For Binary As #1
    Put #1, TransitionTableOffset + (PosesList1.ListIndex * 2) + ROM_HEADER + 1, TransitionPointer
Close #1
'this entry transition (bank 91)
TransitionOffset = Val("&H" & "8" & TransitionPointerText1.Text & "&")
TransitionOffset = TransitionOffset + (Val(TransitionsFound1.Text) * 6)
'textbox data -> transition values -> save

TempTransition.NewButtons = Val("&H" & Hex$(ControlTotal(0)))
TempTransition.CurrentButtons = Val("&H" & Hex$(ControlTotal(1)))
TempTransition.NewPosition = Val("&H" & PoseTransitionText1(2).Text)

Open needslash For Binary As #3
    Put #3, TransitionOffset + ROM_HEADER + 1, TempTransition
Close #3
End Sub

Private Sub Form_Load()
Me.Icon = Smile.Icon
PosesList1.Text = PosesList1.List(0)
End Sub



Private Sub MovementList1_Click()
PosePropertyText1(1).Text = Left$(MovementList1.Text, 2)
End Sub

Private Sub NewPoseList1_Click()
PoseTransitionText1(2).Text = Right$("0000" & Hex$(NewPoseList1.ListIndex), 4)
End Sub

Private Sub PosePropertyText1_Change(Index As Integer)
If Index <> 1 Then Exit Sub
'update motion description
MovementList1.Text = MovementList1.List(Val("&H" & PosePropertyText1(Index).Text & "&"))
End Sub


Private Sub PosesList1_Click()
'$8B629 = start of table for properties (8 bytes per each)
'$89EE2 = start of table for transition pointers (2 byte pointers to actual transition data)
Dim TransitionPointer As Integer
Dim TempPose As PoseProperties

'load transition pointer from transition table
Open needslash For Binary As #1
    Get #1, TransitionTableOffset + (PosesList1.ListIndex * 2) + ROM_HEADER + 1, TransitionPointer
Close #1
'place pointer in textbox.... this will indirectly load list of transitions in a seperate sub
TransitionPointerText1.Text = Hex$(TransitionPointer)

'load pose properties
Open needslash For Binary As #1
    Get #1, PosePropertiesTableOffset + (PosesList1.ListIndex * 8) + ROM_HEADER + 1, TempPose
Close #1

'place values in textboxes
PosePropertyText1(0).Text = Right$("00" & Hex$(TempPose.SamDir), 2)
PosePropertyText1(1).Text = Right$("00" & Hex$(TempPose.MoveType), 2)
PosePropertyText1(2).Text = Right$("00" & Hex$(TempPose.NewPose), 2)
PosePropertyText1(3).Text = Right$("00" & Hex$(TempPose.ShotDir), 2)
PosePropertyText1(4).Text = Right$("00" & Hex$(TempPose.VerDisplace), 2)
PosePropertyText1(5).Text = Right$("00" & Hex$(TempPose.unused1), 2)
PosePropertyText1(6).Text = Right$("00" & Hex$(TempPose.VerRadius), 2)
PosePropertyText1(7).Text = Right$("00" & Hex$(TempPose.unused2), 2)

End Sub



Private Sub PoseTransitionLabel1_Click(Index As Integer)

End Sub

Private Sub PoseTransitionText1_Change(Index As Integer)
If Index = 2 Then GoTo NewPoseChanged

'UpdateControllerPreview:
''to prevent 0000 error on overlap in clicking controls
'If PoseTransitionText1(Index).Tag = 0 Then PoseTransitionText1_Click Index
Exit Sub
NewPoseChanged:
If Val("&H" & PoseTransitionText1(Index).Text) > &HFF& Then Exit Sub
If Val("&H" & PoseTransitionText1(Index).Text) < 0 Then Exit Sub    'if textbox has no data
NewPoseList1.Text = NewPoseList1.List(Val("&H" & PoseTransitionText1(Index).Text & "&"))
End Sub

Private Sub PoseTransitionText1_Click(Index As Integer)
Dim TempControl As Control
Dim TempValueArray(0 To 11) As Long 'because of a stupid VB error, this is actually needed
'if a control text, show values in controls...
'if pose text, show value in a new list of poses?
If Index = 0 Then GoTo NewControllerChanging
If Index = 1 Then GoTo CurrentControllerChanging
If Index = 2 Then GoTo NewPoseChanging

NewControllerChanging:
For III = 0 To 11
    SamusControls1(III).Value = 0
    TempValueArray(III) = Val("&H" & PoseTransitionText1(Index).Text) And Val("&H" & SamusControls1(III).Tag)
    If TempValueArray(III) <> 0 Then TempValueArray(III) = 1
    SamusControls1(III).Value = TempValueArray(III)
Next III
Exit Sub

CurrentControllerChanging:
For III = 0 To 11
    SamusControls1(III + 12).Value = 0
    TempValueArray(III) = Val("&H" & PoseTransitionText1(Index).Text & "&") And Val("&H" & SamusControls1(III + 12).Tag & "&")
    If TempValueArray(III) > 1 Then TempValueArray(III) = 1
    SamusControls1(III + 12).Value = TempValueArray(III)
Next III
Exit Sub

NewPoseChanging:
NewPoseList1.Text = NewPoseList1.List(Val("&H" & PoseTransitionText1(Index).Text & "&"))
End Sub


Private Sub SamusControls1_Click(Index As Integer)
Dim TempControl As Control
'Dim TempValueArray(0 To 11) As Long 'because of a stupid VB error, this is actually needed
Dim TempValueArray(0 To 11) As Byte
Dim TempHighValue As Integer

NewControllerChanging:
For III = 0 To 11
    TempValueArray(III) = SamusControls1(III).Value
Next III
TempHighValue = (TempValueArray(8) * &H100) + (TempValueArray(9) * &H200) + (TempValueArray(10) * &H400) + (TempValueArray(11) * &H800)
PoseTransitionText1(0).Text = Right$("0000" & Hex$(Val(FromBin(TempValueArray(0)) + TempHighValue)), 4)
Label1(0).Caption = "New Keys Pressed: " & PoseTransitionText1(0).Text

HeldControllerChanging:
For III = 12 To 23
    TempValueArray(III - 12) = SamusControls1(III).Value
Next III
TempHighValue = (TempValueArray(8) * &H100) + (TempValueArray(9) * &H200) + (TempValueArray(10) * &H400) + (TempValueArray(11) * &H800)
PoseTransitionText1(1).Text = Right$("0000" & Hex$(Val(FromBin(TempValueArray(0)) + TempHighValue)), 4)
Label1(1).Caption = "Current Keys Held: " & PoseTransitionText1(1).Text

End Sub

Private Sub TransitionPointerText1_Change()
'$8B629 = start of table for properties (8 bytes per each)
'$89EE2 = start of table for transition pointers (2 byte pointers to actual transition data)
Dim TransitionOffset As Long
Dim TempDepth As Byte
Dim TempTransition As PoseTransitions

'start of this entry's transitions (bank 91)
TransitionOffset = Val("&H" & "8" & Left$(TransitionPointerText1.Text & "0000", 4) & "&")
'remove old transitions
TransitionsFound1.Clear
'get all new transitions and load them up
Open needslash For Binary As #2
AnotherTransition:
    Get #2, TransitionOffset + TempDepth + ROM_HEADER + 1, TempTransition
    If TempTransition.NewButtons = Val("&HFFFF") Then GoTo NoMoreTransition
    TransitionsFound1.AddItem TempDepth \ 6
    If TempDepth = 252 Then GoTo NoMoreTransition   'in case at a bad area with no end
    TempDepth = TempDepth + 6
    GoTo AnotherTransition
NoMoreTransition:
Close #2
TransitionsFound1.Text = 0
End Sub

Private Sub TransitionsFound1_Click()
Dim TransitionOffset As Long
Dim TempDepth As Byte
Dim TempTransition As PoseTransitions

'get offset to read from (bank 91)
TransitionOffset = Val("&H" & "8" & TransitionPointerText1.Text & "&")
TransitionOffset = TransitionOffset + (Val(TransitionsFound1.Text) * 6)
'get new transition
Open needslash For Binary As #3
    Get #3, TransitionOffset + ROM_HEADER + 1, TempTransition
Close #3
'load transition into boxes
PoseTransitionText1(0).Tag = 1
PoseTransitionText1(1).Tag = 1
PoseTransitionText1(0).Text = Right$("0000" & Hex$(TempTransition.NewButtons), 4)
PoseTransitionText1(1).Text = Right$("0000" & Hex$(TempTransition.CurrentButtons), 4)
PoseTransitionText1(2).Text = Right$("0000" & Hex$(TempTransition.NewPosition), 4)
PoseTransitionText1(0).Tag = 0
PoseTransitionText1(1).Tag = 0
PoseTransitionText1_Click 0
PoseTransitionText1_Click 1
End Sub
