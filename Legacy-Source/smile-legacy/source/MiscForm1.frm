VERSION 5.00
Begin VB.Form MiscForm1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "MiscForm1"
   ClientHeight    =   8010
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7260
   ClipControls    =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8010
   ScaleWidth      =   7260
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame MiscFrame1 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      Height          =   375
      Index           =   4
      Left            =   0
      TabIndex        =   61
      Top             =   0
      Visible         =   0   'False
      Width           =   495
      Begin VB.TextBox BTSText1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000040&
         Height          =   375
         Left            =   0
         MaxLength       =   2
         TabIndex        =   62
         Top             =   0
         Width           =   495
      End
   End
   Begin VB.Frame MiscFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Layer 2 Scrolling"
      Height          =   2655
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   4575
      Begin VB.CommandButton MiscCancelCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Cancel"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   8
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   2280
         Width           =   4335
      End
      Begin VB.ComboBox Layer2ScrollCombo1 
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
         ItemData        =   "MiscForm1.frx":0000
         Left            =   3840
         List            =   "MiscForm1.frx":0034
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   1200
         Width           =   615
      End
      Begin VB.ComboBox Layer2ScrollCombo1 
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
         ItemData        =   "MiscForm1.frx":0068
         Left            =   3840
         List            =   "MiscForm1.frx":009C
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   720
         Width           =   615
      End
      Begin VB.ComboBox Layer2TypeCombo1 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         ItemData        =   "MiscForm1.frx":00D0
         Left            =   120
         List            =   "MiscForm1.frx":00DA
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   240
         Width           =   4335
      End
      Begin VB.CommandButton MiscSaveCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Keep Changes"
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   2
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   1800
         Width           =   4335
      End
      Begin VB.TextBox MiscText1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
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
         Index           =   0
         Left            =   240
         MaxLength       =   4
         TabIndex        =   1
         Text            =   "1234"
         ToolTipText     =   "1234 to prevent it from not changing under normal conditions when the form opens."
         Top             =   1320
         Visible         =   0   'False
         Width           =   600
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Y-axis Scrolling"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   1
         Left            =   1650
         TabIndex        =   5
         Top             =   1200
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "X-axis Scrolling"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   0
         Left            =   1650
         TabIndex        =   4
         Top             =   720
         Width           =   2175
      End
   End
   Begin VB.Frame MiscFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Tile BTS and Properties"
      Height          =   2655
      Index           =   2
      Left            =   0
      TabIndex        =   53
      Top             =   0
      Visible         =   0   'False
      Width           =   4575
      Begin VB.CommandButton MiscCancelCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Cancel"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   54
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   2280
         Width           =   4335
      End
      Begin VB.CommandButton MiscSaveCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Save Changes"
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   55
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   1920
         Width           =   4335
      End
   End
   Begin VB.Frame MiscFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Test Room Options"
      Height          =   7455
      Index           =   1
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Visible         =   0   'False
      Width           =   6975
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   6120
         MaxLength       =   4
         TabIndex        =   24
         Tag             =   "FFFF"
         Text            =   "0000"
         Top             =   4440
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   1080
         MaxLength       =   4
         TabIndex        =   22
         Tag             =   "FFFF"
         Text            =   "0000"
         Top             =   4440
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.CheckBox BeamCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Charge"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   4
         Left            =   5280
         TabIndex        =   52
         Tag             =   "2000"
         Top             =   5640
         Width           =   1200
      End
      Begin VB.CheckBox BeamCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Plasma"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   3
         Left            =   5280
         TabIndex        =   51
         Tag             =   "2000"
         Top             =   5280
         Width           =   1200
      End
      Begin VB.CheckBox BeamCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Spazer"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   2
         Left            =   5280
         TabIndex        =   50
         Tag             =   "2000"
         Top             =   4920
         Width           =   1200
      End
      Begin VB.CheckBox BeamCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Ice"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   1
         Left            =   5280
         TabIndex        =   49
         Tag             =   "2000"
         Top             =   4560
         Width           =   1200
      End
      Begin VB.CheckBox BeamCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Wave"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   0
         Left            =   5280
         TabIndex        =   48
         Tag             =   "2000"
         Top             =   4200
         Width           =   1200
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Speed Booster"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   8
         Left            =   1920
         TabIndex        =   45
         Tag             =   "2000"
         Top             =   5640
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Space Jump"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   6
         Left            =   1920
         TabIndex        =   43
         Tag             =   "0200"
         Top             =   5280
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Screw Attack"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   3
         Left            =   1920
         TabIndex        =   40
         Tag             =   "0008"
         Top             =   4920
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Grapple"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   9
         Left            =   1920
         TabIndex        =   46
         Tag             =   "4000"
         Top             =   4560
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "X-ray"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   10
         Left            =   1920
         TabIndex        =   47
         Tag             =   "0200"
         Top             =   4200
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Bomb"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   7
         Left            =   240
         TabIndex        =   44
         Tag             =   "1000"
         Top             =   4560
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Hi-Jump"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   5
         Left            =   240
         TabIndex        =   42
         Tag             =   "0100"
         Top             =   5280
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Gravity Suit"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   4
         Left            =   240
         TabIndex        =   41
         Tag             =   "0020"
         Top             =   6000
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Morph"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   2
         Left            =   240
         TabIndex        =   39
         Tag             =   "0004"
         Top             =   4200
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Spring Ball"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   1
         Left            =   240
         TabIndex        =   38
         Tag             =   "0002"
         Top             =   4920
         Width           =   1800
      End
      Begin VB.CheckBox EquipmentCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Varia Suit"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   0
         Left            =   240
         TabIndex        =   37
         Tag             =   "0001"
         Top             =   5640
         Width           =   1800
      End
      Begin VB.CommandButton MiscCancelCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Cancel"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   10
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   7080
         Width           =   5895
      End
      Begin VB.CheckBox TestRoomOptionsCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   " No "
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   2
         Left            =   6000
         Style           =   1  'Graphical
         TabIndex        =   34
         Top             =   3240
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   6000
         MaxLength       =   4
         TabIndex        =   35
         Text            =   "0000"
         Top             =   3240
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.CheckBox TestRoomOptionsCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   " No "
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   1
         Left            =   6000
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   2880
         Width           =   735
      End
      Begin VB.CheckBox TestRoomOptionsCheck1 
         BackColor       =   &H00E0E0E0&
         Caption         =   " No "
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   0
         Left            =   6000
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   6000
         MaxLength       =   4
         TabIndex        =   28
         Text            =   "0000"
         Top             =   2880
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   6000
         MaxLength       =   4
         TabIndex        =   26
         Text            =   "0000"
         Top             =   2520
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   2280
         MaxLength       =   4
         TabIndex        =   16
         Tag             =   "0032"
         Text            =   "0000"
         Top             =   2160
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   2280
         MaxLength       =   4
         TabIndex        =   15
         Tag             =   "0032"
         Text            =   "0000"
         Top             =   1800
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   2280
         MaxLength       =   4
         TabIndex        =   14
         Tag             =   "00E6"
         Text            =   "0000"
         Top             =   1440
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   2280
         MaxLength       =   4
         TabIndex        =   13
         Tag             =   "0190"
         Text            =   "0000"
         Top             =   720
         Width           =   735
      End
      Begin VB.TextBox TestRoomOptionsText1 
         BackColor       =   &H00FFFFFF&
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
         Left            =   2280
         MaxLength       =   4
         TabIndex        =   12
         Tag             =   "05DB"
         Text            =   "0000"
         Top             =   360
         Width           =   735
      End
      Begin VB.CommandButton MiscSaveCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Save Changes"
         Height          =   375
         Index           =   1
         Left            =   480
         TabIndex        =   11
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   6720
         Width           =   5895
      End
      Begin VB.Label TestRoomOptionsLabel1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00D2FFFF&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   300
         Left            =   3000
         TabIndex        =   30
         Top             =   360
         Visible         =   0   'False
         Width           =   90
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Debug Mode"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   11
         Left            =   3960
         TabIndex        =   36
         Top             =   3240
         Width           =   1995
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2100
         Left            =   3360
         TabIndex        =   33
         Top             =   360
         Width           =   3420
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Avoid Damage"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   10
         Left            =   3960
         TabIndex        =   29
         Top             =   2880
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Reveal Maps"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   9
         Left            =   3960
         TabIndex        =   27
         Top             =   2520
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Beams"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   8
         Left            =   4800
         TabIndex        =   25
         Top             =   3840
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Equipment"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   7
         Left            =   720
         TabIndex        =   23
         Top             =   3840
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Power Bombs"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   6
         Left            =   240
         TabIndex        =   21
         Top             =   2160
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Super Missiles"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   5
         Left            =   240
         TabIndex        =   20
         Top             =   1800
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Missiles"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   4
         Left            =   240
         TabIndex        =   19
         Top             =   1440
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Reserve Energy"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   3
         Left            =   240
         TabIndex        =   18
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Energy"
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   360
         Index           =   2
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Width           =   1995
      End
   End
   Begin VB.Frame MiscFrame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "SRM Directory"
      Height          =   5175
      Index           =   3
      Left            =   0
      TabIndex        =   56
      Top             =   0
      Visible         =   0   'False
      Width           =   4575
      Begin VB.DirListBox Dir1 
         BackColor       =   &H00D2FFFF&
         ForeColor       =   &H00400000&
         Height          =   2340
         Left            =   120
         TabIndex        =   59
         Top             =   240
         Width           =   4335
      End
      Begin VB.CommandButton MiscCancelCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Cancel"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   57
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   4800
         Width           =   4335
      End
      Begin VB.CommandButton MiscSaveCommand1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Save Changes"
         Height          =   375
         Index           =   3
         Left            =   120
         TabIndex        =   58
         ToolTipText     =   "Changes are not saved until you save your room."
         Top             =   4440
         Width           =   4335
      End
      Begin VB.Label HotKeyDescriptionLabel1 
         Appearance      =   0  'Flat
         BackColor       =   &H00D2FFFF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   $"MiscForm1.frx":0110
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
         Height          =   1695
         Left            =   120
         TabIndex        =   60
         Top             =   2640
         Width           =   4335
      End
   End
End
Attribute VB_Name = "MiscForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private FormType As Byte    'externally telling the form what type it is to be, so we know what settings to give it

Private Sub BeamCheck1_Click(Index As Integer)
If BeamCheck1(2).Value = 1 And BeamCheck1(3).Value = 1 Then
    BeamCheck1(2).BackColor = RGB(255, 20, 20)
    BeamCheck1(3).BackColor = RGB(255, 20, 20)
Else
    BeamCheck1(2).BackColor = RGB(224, 224, 224)
    BeamCheck1(3).BackColor = RGB(224, 224, 224)
End If
End Sub


Private Sub BTSText1_Change()
If Len(BTSText1.Text) < 2 Then Exit Sub
MiscForm1Type = 255
MiscForm1Byte = Val("&H" & BTSText1.Text)
Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
If MiscForm1Type = 4 And KeyAscii = 27 Then Unload Me 'Esc hit... don't change bts
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Dim TempSRMPath As String

Me.Icon = Smile.Icon
FormType = MiscForm1Type
'0 = Layer2Scroll
'1 = Test Room Options
'2 = Tile Properties
MiscFrame1(FormType).Move 0, 0
If FormType = 4 Then Me.BorderStyle = 0
MiscFrame1(FormType).Visible = True
Me.Caption = MiscFrame1(FormType).Caption
MiscFrame1(FormType).Caption = ""
If FormType = 4 Then
    Me.Width = MiscFrame1(FormType).Width
    Me.Height = MiscFrame1(FormType).Height
Else
    Me.Width = MiscFrame1(FormType).Width + 100
    Me.Height = MiscFrame1(FormType).Height + 400
End If
Select Case FormType
    Case 0: MiscText1(FormType).Text = Smile.Layer2Scroll1.Text
    Case 1: GoTo LoadingRoomTestOptions
    Case 2: MsgBox "BRICK ROAD"
    Case 3: GoTo ChoosingSRMPath
    Case 4: GoTo ChangingBTSValues
End Select
Exit Sub

LoadingRoomTestOptions:
LoadINIForTestRoomOptions
Label2.Caption = "Test Room with these starting conditions." & vbCrLf & vbCrLf & "Samus's location depends on where your cursor is when starting a room test."
Exit Sub

ChoosingSRMPath:
'make extra copy of SRM file to the appropriate SRM folder, if required
If Asc(Left$(SRMPath, 1)) <> 0 Then
'get our emulator's name
    For I = 1 To Len(SRMPath)
        'looks for the first place where we have 3 spaces in a row, so not to get confused with spaces in the path name
        If Asc(Mid$(SRMPath, I, 1)) = 32 And Asc(Mid$(SRMPath, I + 1, 1)) = 32 And Asc(Mid$(SRMPath, I + 2, 1)) = 32 Then Exit For
    Next I
    TempSRMPath = Mid$(SRMPath, 1, I - 1)
    Dir1.Path = TempSRMPath
End If
Exit Sub

ChangingBTSValues:
If MiscForm1Byte < 10 Then BTSText1.Text = MiscForm1Byte
BTSText1.SelStart = 1
Me.Move Smile.Left + ScaleX(Smile.Target(1).Left + TileSize - (Smile.MapHScroll1.Value * TileSize), vbPixels, vbTwips), Smile.Top + ScaleY(Smile.Target(1).Top + GetSystemMetrics(SM_CYMENU) + GetSystemMetrics(SM_CYCAPTION) - (Smile.MapVScroll1.Value * TileSize), vbPixels, vbTwips)
Exit Sub

End Sub




Private Sub MiscCancelCommand1_Click(Index As Integer)
Unload Me
End Sub



Private Sub MiscCancelCommand1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
TestRoomOptionsLabel1.Visible = False
End Sub

Private Sub MiscFrame1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
TestRoomOptionsLabel1.Visible = False
End Sub

Private Sub MiscSaveCommand1_Click(Index As Integer)
Select Case FormType
    Case 0: GoTo Saving_Layer2Scroll
    Case 1: GoTo Saving_TestRoomOptions
    Case 2: GoTo Saving_TileBTSProperties
    Case 3: GoTo Saving_SRMPath
End Select

Saving_Layer2Scroll:
'piece together:  X - Type - Y - Type
MiscText1(FormType).Text = Layer2ScrollCombo1(0).Text & Layer2TypeCombo1.ListIndex & Layer2ScrollCombo1(1).Text & Layer2TypeCombo1.ListIndex
Smile.Layer2Scroll1.Text = MiscText1(FormType).Text
GoTo UnloadingForm


Saving_TestRoomOptions:
'change ini, according to values
Dim EquipmentBytes(0 To 1) As Byte
Dim BeamBytes(0 To 1) As Byte


'EQUIPMENT VALUES
'equipment low byte
EquipmentBytes(0) = EquipmentCheck1(0).Value * &H1
EquipmentBytes(0) = EquipmentBytes(0) + (EquipmentCheck1(1).Value * &H2)
EquipmentBytes(0) = EquipmentBytes(0) + (EquipmentCheck1(2).Value * &H4)
EquipmentBytes(0) = EquipmentBytes(0) + (EquipmentCheck1(3).Value * &H8)
EquipmentBytes(0) = EquipmentBytes(0) + (EquipmentCheck1(4).Value * &H20)
'equipment high byte
EquipmentBytes(1) = EquipmentCheck1(5).Value * &H1
EquipmentBytes(1) = EquipmentBytes(1) + (EquipmentCheck1(6).Value * &H2)
EquipmentBytes(1) = EquipmentBytes(1) + (EquipmentCheck1(7).Value * &H10)
EquipmentBytes(1) = EquipmentBytes(1) + (EquipmentCheck1(8).Value * &H20)
EquipmentBytes(1) = EquipmentBytes(1) + (EquipmentCheck1(9).Value * &H40)
EquipmentBytes(1) = EquipmentBytes(1) + (EquipmentCheck1(10).Value * &H80)
'set equipment box
TestRoomOptionsText1(5).Text = Right$("00" & Hex$(EquipmentBytes(1)), 2) & Right$("00" & Hex$(EquipmentBytes(0)), 2)

'BEAM VALUES
'beam low byte
BeamBytes(0) = BeamCheck1(0).Value * &H1
BeamBytes(0) = BeamBytes(0) + (BeamCheck1(1).Value * &H2)
BeamBytes(0) = BeamBytes(0) + (BeamCheck1(2).Value * &H4)
BeamBytes(0) = BeamBytes(0) + (BeamCheck1(3).Value * &H8)
'beam high byte
BeamBytes(1) = BeamCheck1(4).Value * &H10
'set beam box
TestRoomOptionsText1(6).Text = Right$("00" & Hex$(BeamBytes(1)), 2) & Right$("00" & Hex$(BeamBytes(0)), 2)


'ENERGY TANKS (prevent starting with 0 energy
If Val("&H" & TestRoomOptionsText1(0).Text) = 0 Then TestRoomOptionsText1(0).Text = "0063"

'get values from the text boxes
For I = 0 To TestRoomOptionsText1.UBound
    If I < 7 And Val("&H" & TestRoomOptionsText1(I).Text & "&") > Val("&H" & TestRoomOptionsText1(I).Tag & "&") Then TestRoomOptionsText1(I).Text = TestRoomOptionsText1(I).Tag
    SRMVariables(I) = Val("&H" & TestRoomOptionsText1(I).Text)
Next I
'save values to the ini
Open App.Path & "\SMILE.ini" For Binary As #3
    Put #3, 60, SRMVariables()
Close #3
GoTo UnloadingForm


Saving_TileBTSProperties:
'update BTS of a tile and its tile type (slope?)
GoTo UnloadingForm

Saving_SRMPath:
'save SRM path, if one is needed
SRMPath = Dir1.Path
Open App.Path & "\SMILE.ini" For Binary As #3
    Put #3, 370, SRMPath           'path to SRM Folder (optional)
Close #3

UnloadingForm:
Unload Me
End Sub

Private Sub MiscSaveCommand1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
TestRoomOptionsLabel1.Visible = False
End Sub

Private Sub MiscText1_Change(Index As Integer)
Select Case FormType
    Case 0: GoTo Layer2ScrollSetup
    Case Else: Exit Sub
End Select


Layer2ScrollSetup:
'checks nybble for even or odd... result tells us what type of background we're using
Layer2TypeCombo1.Text = Layer2TypeCombo1.List(Val("&H" & Right$(MiscText1(Index).Text, 1)) Mod 2)
'Layer2TypeCombo1.Text = Layer2TypeCombo1.List(Val("&H" & Right$(MiscText1(Index).Text, 1)))
Layer2ScrollCombo1(0).Text = Mid$(MiscText1(Index).Text, 1, 1)
Layer2ScrollCombo1(1).Text = Mid$(MiscText1(Index).Text, 3, 1)

End Sub


Private Sub LoadINIForTestRoomOptions()

Open App.Path & "\SMILE.ini" For Binary As #3
    Get #3, 60, SRMVariables()
Close #3
For I = 0 To TestRoomOptionsText1.UBound
    TestRoomOptionsText1(I).Text = Right$("0000" & Hex$(SRMVariables(I)), 4)
Next I

End Sub


Private Sub TestRoomOptionsCheck1_Click(Index As Integer)
If Index = 0 Or Index = 1 Or Index = 2 Then
    If TestRoomOptionsCheck1(Index).Caption = "Yes" Then
        TestRoomOptionsCheck1(Index).Caption = "No"
        TestRoomOptionsText1(Index + 7).Text = "0000"
    Else
        TestRoomOptionsCheck1(Index).Caption = "Yes"
        TestRoomOptionsText1(Index + 7).Text = "FFFF"
    End If
End If
End Sub

Private Sub TestRoomOptionsCheck1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
TestRoomOptionsLabel1.Visible = True
Select Case Index
    Case 0: TestRoomOptionsLabel1.Caption = "Map Stations activated."
    Case 1: TestRoomOptionsLabel1.Caption = "Prevent all damage."
    Case 2: TestRoomOptionsLabel1.Caption = "Enable debug mode."
    Case Else: TestRoomOptionsLabel1.Caption = ""
End Select

TestRoomOptionsLabel1.Top = TestRoomOptionsCheck1(Index).Top
TestRoomOptionsLabel1.Left = TestRoomOptionsCheck1(Index).Left - TestRoomOptionsLabel1.Width
End Sub

Private Sub TestRoomOptionsText1_Change(Index As Integer)
Dim TempByte(0 To 1) As Byte
Dim MyTempArray(0 To 7) As Byte
Dim MyTempArray2(0 To 7) As Byte

If Index = 5 Then GoTo EquipmentSetup
If Index = 6 Then GoTo BeamSetup
If Index < 7 Then Exit Sub

StarterHacks:
'only run this on start of the form
'if already filled with default values, don't run again
If TestRoomOptionsCheck1(Index - 7).Caption = "Yes" Then Exit Sub
If TestRoomOptionsCheck1(Index - 7).Caption = "No" Then Exit Sub

If Index > 6 And Index < 10 Then
    If Right$("FFFF" & TestRoomOptionsText1(Index).Text, 4) = "FFFF" Then
        TestRoomOptionsCheck1(Index - 7).Value = 1
    Else
        TestRoomOptionsCheck1(Index - 7).Caption = "No"
    End If
End If
Exit Sub


EquipmentSetup:
TempByte(0) = Val("&H" & Right$(TestRoomOptionsText1(Index).Text, 2))
TempByte(1) = Val("&H" & Left$(TestRoomOptionsText1(Index).Text, 2))
ToBin TempByte(0), MyTempArray(0)
ToBin TempByte(1), MyTempArray2(0)

'low byte
EquipmentCheck1(0).Value = MyTempArray(7)
EquipmentCheck1(1).Value = MyTempArray(6)
EquipmentCheck1(2).Value = MyTempArray(5)
EquipmentCheck1(3).Value = MyTempArray(4)
EquipmentCheck1(4).Value = MyTempArray(2)
'high byte
EquipmentCheck1(5).Value = MyTempArray2(7)
EquipmentCheck1(6).Value = MyTempArray2(6)
EquipmentCheck1(7).Value = MyTempArray2(3)
EquipmentCheck1(8).Value = MyTempArray2(2)
EquipmentCheck1(9).Value = MyTempArray2(1)
EquipmentCheck1(10).Value = MyTempArray2(0)
Exit Sub


BeamSetup:
TempByte(0) = Val("&H" & Right$(TestRoomOptionsText1(Index).Text, 2))
TempByte(1) = Val("&H" & Left$(TestRoomOptionsText1(Index).Text, 2))
ToBin TempByte(0), MyTempArray(0)
ToBin TempByte(1), MyTempArray2(0)

'low byte
BeamCheck1(0).Value = MyTempArray(7)
BeamCheck1(1).Value = MyTempArray(6)
BeamCheck1(2).Value = MyTempArray(5)
BeamCheck1(3).Value = MyTempArray(4)
'high byte
BeamCheck1(4).Value = MyTempArray2(3)
Exit Sub
End Sub

Private Sub TestRoomOptionsText1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
TestRoomOptionsLabel1.Visible = True
Select Case Index
    Case 0: TestRoomOptionsLabel1.Caption = "Maximum of 05DB"
    Case 1: TestRoomOptionsLabel1.Caption = "Maximum of 0190"
    Case 2: TestRoomOptionsLabel1.Caption = "Maximum of 00E6"
    Case 3: TestRoomOptionsLabel1.Caption = "Maximum of 0032"
    Case 4: TestRoomOptionsLabel1.Caption = "Maximum of 0032"
    Case Else: TestRoomOptionsLabel1.Caption = ""
End Select

TestRoomOptionsLabel1.Top = TestRoomOptionsText1(Index).Top
TestRoomOptionsLabel1.Left = TestRoomOptionsText1(Index).Left + TestRoomOptionsText1(Index).Width
TestRoomOptionsLabel1.Height = TestRoomOptionsText1(Index).Height
End Sub

Private Sub TileInfoLabel1_Click()
Unload Me
End Sub
