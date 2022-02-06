VERSION 5.00
Begin VB.Form EnemyVulnerabilities1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Vulnerabilities"
   ClientHeight    =   4020
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6630
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4020
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   255
      Left            =   5040
      TabIndex        =   45
      Top             =   3720
      Width           =   1455
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   21
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   22
      Text            =   "00"
      Top             =   2850
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   20
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   21
      Text            =   "00"
      Top             =   2565
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   19
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   20
      Text            =   "00"
      Top             =   2280
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   18
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   19
      Text            =   "00"
      Top             =   1995
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   17
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   18
      Text            =   "00"
      Top             =   1710
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   16
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   17
      Text            =   "00"
      Top             =   1425
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   15
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   16
      Text            =   "00"
      Top             =   1140
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   14
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   15
      Text            =   "00"
      Top             =   855
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   13
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   14
      Text            =   "00"
      Top             =   570
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   12
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   13
      Text            =   "00"
      Top             =   285
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   11
      Left            =   3360
      MaxLength       =   2
      TabIndex        =   12
      Text            =   "00"
      Top             =   0
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   10
      Left            =   0
      MaxLength       =   2
      TabIndex        =   11
      Text            =   "00"
      Top             =   2850
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   9
      Left            =   0
      MaxLength       =   2
      TabIndex        =   10
      Text            =   "00"
      Top             =   2565
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   8
      Left            =   0
      MaxLength       =   2
      TabIndex        =   9
      Text            =   "00"
      Top             =   2280
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   7
      Left            =   0
      MaxLength       =   2
      TabIndex        =   8
      Text            =   "00"
      Top             =   1995
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   6
      Left            =   0
      MaxLength       =   2
      TabIndex        =   7
      Text            =   "00"
      Top             =   1710
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   5
      Left            =   0
      MaxLength       =   2
      TabIndex        =   6
      Text            =   "00"
      Top             =   1425
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   4
      Left            =   0
      MaxLength       =   2
      TabIndex        =   5
      Text            =   "00"
      Top             =   1140
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   3
      Left            =   0
      MaxLength       =   2
      TabIndex        =   4
      Text            =   "00"
      Top             =   855
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   2
      Left            =   0
      MaxLength       =   2
      TabIndex        =   3
      Text            =   "00"
      Top             =   570
      Width           =   375
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   1
      Left            =   0
      MaxLength       =   2
      TabIndex        =   2
      Text            =   "00"
      Top             =   285
      Width           =   375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save Changes"
      Height          =   375
      Left            =   5040
      TabIndex        =   1
      Top             =   3240
      Width           =   1455
   End
   Begin VB.TextBox VulnText1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   0
      Left            =   0
      MaxLength       =   2
      TabIndex        =   0
      Text            =   "00"
      Top             =   0
      Width           =   375
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "00 = immune"
      Height          =   735
      Left            =   0
      TabIndex        =   46
      Top             =   3240
      Width           =   4455
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Unused?"
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
      Height          =   285
      Index           =   21
      Left            =   3720
      TabIndex        =   44
      Top             =   2850
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Pseudo-Screw Attack"
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
      Height          =   285
      Index           =   20
      Left            =   3720
      TabIndex        =   43
      Top             =   2565
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Charge/Hyper/Special"
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
      Height          =   285
      Index           =   19
      Left            =   3720
      TabIndex        =   42
      Top             =   2280
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Screw Attack"
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
      Height          =   285
      Index           =   18
      Left            =   3720
      TabIndex        =   41
      Top             =   1995
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Speed Jump"
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
      Height          =   285
      Index           =   17
      Left            =   3720
      TabIndex        =   40
      Top             =   1710
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Speed Running"
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
      Height          =   285
      Index           =   16
      Left            =   3720
      TabIndex        =   39
      Top             =   1425
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Power Bombs"
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
      Height          =   285
      Index           =   15
      Left            =   3720
      TabIndex        =   38
      Top             =   1140
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Bombs/Space-Time"
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
      Height          =   285
      Index           =   14
      Left            =   3720
      TabIndex        =   37
      Top             =   855
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Super Missiles"
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
      Height          =   285
      Index           =   13
      Left            =   3720
      TabIndex        =   36
      Top             =   570
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Missiles"
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
      Height          =   285
      Index           =   12
      Left            =   3720
      TabIndex        =   35
      Top             =   285
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wave/Ice/Plasma"
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
      Height          =   285
      Index           =   11
      Left            =   3720
      TabIndex        =   34
      Top             =   0
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ice/Plasma"
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
      Height          =   285
      Index           =   10
      Left            =   360
      TabIndex        =   33
      Top             =   2850
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wave/Plasma"
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
      Height          =   285
      Index           =   9
      Left            =   360
      TabIndex        =   32
      Top             =   2565
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Plasma"
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
      Height          =   285
      Index           =   8
      Left            =   360
      TabIndex        =   31
      Top             =   2280
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wave/Ice/Spazer"
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
      Height          =   285
      Index           =   7
      Left            =   360
      TabIndex        =   30
      Top             =   1995
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ice/Spazer"
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
      Height          =   285
      Index           =   6
      Left            =   360
      TabIndex        =   29
      Top             =   1710
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wave/Spazer"
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
      Height          =   285
      Index           =   5
      Left            =   360
      TabIndex        =   28
      Top             =   1425
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Spazer"
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
      Height          =   285
      Index           =   4
      Left            =   360
      TabIndex        =   27
      Top             =   1140
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wave/Ice"
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
      Height          =   285
      Index           =   3
      Left            =   360
      TabIndex        =   26
      Top             =   855
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ice"
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
      Height          =   285
      Index           =   2
      Left            =   360
      TabIndex        =   25
      Top             =   570
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wave"
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
      Height          =   285
      Index           =   1
      Left            =   360
      TabIndex        =   24
      Top             =   285
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080C0FF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Normal"
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
      Height          =   285
      Index           =   0
      Left            =   360
      TabIndex        =   23
      Top             =   0
      Width           =   2895
   End
End
Attribute VB_Name = "EnemyVulnerabilities1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim TempVuln(0 To 21) As Byte

'get from boxes
For I = 0 To 21
    TempVuln(I) = Val("&H" & VulnText1(I))
Next I
'save to game
Open needslash For Binary As #1
Put #1, pEnemyEditing + ROM_HEADER + 1, TempVuln()
Close #1
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
TypeHex KeyAscii
End Sub

Private Sub Form_Load()
Dim VulnerableMeanings As String
Dim TempVuln(0 To 21) As Byte

Me.Icon = Smile.Icon
'get from game
Open needslash For Binary As #1
Get #1, pEnemyEditing + ROM_HEADER + 1, TempVuln()
Close #1
'load to boxes
For I = 0 To 21
    VulnText1(I).Text = Right$("00" & Hex$(TempVuln(I)), 2)
Next I

VulnerableMeanings = "0# = damage (02 = normal)" & vbCrLf & "8# = damage, but don't freeze" & vbCrLf & "FF = freeze, but don't kill"
Label2.Caption = VulnerableMeanings
'Pointer to enemy's resistances,
'often used by multiple enemies (bank B4)
'Each resistance has 22 bytes, starting with the normal beam,
'and ending with an unused spot
'might as well past the order, just in case
'a.  Normal beam : 10
'b.  Wave beam : 25
'c.  Ice beam : 15
'd.  Ice/Wave beam : 30
'e.  Spazer beam : 20
'f.  Wave/Spazer beam : 35
'g.  Ice/Spazer beam : 30
'h.  Wave/Ice/Spazer beam : 50
'i.  Plasma beam : 75
'j.  Wave/Plasma beam / Speed Echoes : 125 / 2,048
'k. Ice/Plasma beam : 100
'l. Wave/Ice/Plasma beam : 150
'm. Missiles : 50
'n. Super Missiles : 150
'o. Bombs / Space/Time Beam : 30 / 45 per 1/3 of second
'p. Power Bombs : 100, can hit twice
'q. Speed Running : 250 a frame
'r. Super Jump : 75 a frame
's. Screw Attack : 1,000 a frame
't. ALL Charge beams / Hyper Beam / Special Beams :
't. ALL Charge beams / Hyper Beam / Special Beams : 3x beam combo / 500 / 150
'u. Psuedo Screw Attack : 100
'A normal enemy takes 2x damage to everything (2x is normal)
'1x is a way of taking 1/2 of the normal damage
'Anyways, 00 means the enemy is invulnerable
'Lemme look at metroids real fast to remember how the ice and frozen attacks work
'v.Unknown
'FF on ice weapons means the weapon will freeze, but not kill
'81+ on ice weapons means the weapon will kill, but not freeze
'00 means it will do neither
'81 does 1x damage, 82 2x, and so on
End Sub

