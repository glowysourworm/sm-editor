VERSION 5.00
Begin VB.Form HotKeysForm1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Hot Keys"
   ClientHeight    =   5190
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9375
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   346
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   625
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.VScrollBar HotKeyVScroll1 
      Height          =   5175
      LargeChange     =   200
      Left            =   4935
      Max             =   444
      TabIndex        =   1
      Top             =   0
      Width           =   255
   End
   Begin VB.Frame HotKeyFrame1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   11640
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   4935
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   22
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   50
         Text            =   "A"
         Top             =   2280
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   21
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   48
         Text            =   "0-9 or #"
         Top             =   9240
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   20
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   46
         Text            =   "M"
         Top             =   4920
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   19
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   44
         Text            =   "E or [Enter]"
         Top             =   10830
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   18
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   42
         Text            =   "[Ctrl]"
         Top             =   5685
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   17
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   40
         Text            =   "[F6]"
         Top             =   7995
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   16
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   38
         Text            =   "E or [Enter]"
         Top             =   3765
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   15
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   36
         Text            =   "[Pg Down]"
         Top             =   8760
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   14
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   34
         Text            =   "[Pg Up]"
         Top             =   8400
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   13
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   32
         Text            =   "HotKeys1.frx":0000
         Top             =   400
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   12
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   29
         Text            =   "[F5]"
         Top             =   7620
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   11
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   24
         Text            =   "[F4]"
         Top             =   7245
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   10
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   23
         Text            =   "[F3]"
         Top             =   6870
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   9
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   22
         Text            =   "[F2]"
         Top             =   6495
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   8
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   21
         Text            =   "[F1]"
         Top             =   6120
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   7
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   19
         Text            =   "M"
         Top             =   10320
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   6
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   16
         Text            =   "[Shift]"
         Top             =   5325
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   5
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   14
         Text            =   "L"
         Top             =   4590
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   4
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   12
         Text            =   "="
         Top             =   4200
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   0
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   6
         Text            =   "C"
         Top             =   2640
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   1
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   5
         Text            =   "D"
         Top             =   3015
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   2
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   4
         Text            =   "E or [Enter]"
         Top             =   3390
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
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
         Height          =   375
         Index           =   3
         Left            =   2640
         Locked          =   -1  'True
         TabIndex        =   3
         Text            =   "[Arrow Keys]"
         Top             =   960
         Width           =   2055
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "ASM-worthy tiles"
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
         Height          =   240
         Index           =   22
         Left            =   495
         TabIndex        =   51
         Top             =   2280
         Width           =   2160
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Type BTS Values"
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
         Index           =   21
         Left            =   480
         TabIndex        =   49
         Top             =   9240
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Metroid Pet"
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
         Index           =   20
         Left            =   0
         TabIndex        =   47
         Top             =   4920
         Width           =   2655
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Enter a room"
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
         Height          =   240
         Index           =   19
         Left            =   1035
         TabIndex        =   45
         Top             =   10800
         Width           =   1620
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Liquid Surface"
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
         Index           =   18
         Left            =   480
         TabIndex        =   43
         Top             =   5640
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Show All"
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
         Index           =   17
         Left            =   600
         TabIndex        =   41
         Top             =   8040
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Test Room"
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
         Index           =   16
         Left            =   480
         TabIndex        =   39
         Top             =   3765
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Darken"
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
         Index           =   15
         Left            =   480
         TabIndex        =   37
         Top             =   8760
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Brighten"
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
         Index           =   14
         Left            =   480
         TabIndex        =   35
         Top             =   8400
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Snapshot"
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
         Index           =   13
         Left            =   360
         TabIndex        =   33
         Top             =   480
         Width           =   2175
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "General Keys"
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
         Left            =   0
         TabIndex        =   31
         Top             =   0
         Width           =   4935
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Toggle PLM"
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
         Index           =   12
         Left            =   480
         TabIndex        =   30
         Top             =   7620
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Toggle Layer 2"
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
         Left            =   480
         TabIndex        =   27
         Top             =   6495
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Toggle BTS"
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
         Left            =   240
         TabIndex        =   26
         Top             =   6870
         Width           =   2415
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Toggle Enemies"
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
         Left            =   480
         TabIndex        =   25
         Top             =   7245
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Move Room"
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
         Left            =   480
         TabIndex        =   20
         Top             =   10320
         Width           =   2175
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Map Editor Keys"
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
         Left            =   0
         TabIndex        =   18
         Top             =   9840
         Width           =   4935
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Split Ship/Tile #"
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
         Left            =   0
         TabIndex        =   17
         Top             =   5280
         Width           =   2655
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Load Station Door"
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
         TabIndex        =   15
         Top             =   4560
         Width           =   2415
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Copy Properties"
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
         Left            =   480
         TabIndex        =   13
         Top             =   4200
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Clone a door"
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
         Height          =   240
         Index           =   0
         Left            =   1035
         TabIndex        =   10
         Top             =   2640
         Width           =   1620
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Door editor"
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
         Height          =   240
         Index           =   1
         Left            =   1170
         TabIndex        =   9
         Top             =   3000
         Width           =   1485
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Enter a door/room"
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
         Height          =   240
         Index           =   2
         Left            =   360
         TabIndex        =   8
         Top             =   3360
         Width           =   2295
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Flip a tile"
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
         Left            =   360
         TabIndex        =   7
         Top             =   960
         Width           =   2175
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Level Editor Keys"
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
         Left            =   0
         TabIndex        =   11
         Top             =   1800
         Width           =   4935
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Toggle Layer 1"
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
         Left            =   480
         TabIndex        =   28
         Top             =   6120
         Width           =   2175
      End
   End
   Begin VB.Label HotKeyDescriptionLabel1 
      Appearance      =   0  'Flat
      BackColor       =   &H00D2FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Click on a key setting to see a description of what a function does."
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
      Height          =   5175
      Left            =   5160
      TabIndex        =   0
      Top             =   0
      Width           =   4215
   End
End
Attribute VB_Name = "HotKeysForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub Form_Load()
Me.Icon = Smile.Icon
End Sub

Private Sub HotKeyVScroll1_Change()
HotKeyFrame1.Top = -HotKeyVScroll1.Value
End Sub

Private Sub HotKeyVScroll1_Scroll()
HotKeyVScroll1_Change
End Sub

Private Sub Text1_Click(Index As Integer)
Select Case Index
    Case 0: HotKeyDescriptionLabel1.Caption = """Cloning"" a door will set up properties for an imaginary door that would make Samus enter the room where you are clicking." & vbCrLf & vbCrLf & "These values can then be used on existing doors in the Door Editor." & vbCrLf & vbCrLf & "Mouse must be held on the edge of a game screen."
    Case 1: HotKeyDescriptionLabel1.Caption = "Opens the Door Editor if you're on a door tile." & vbclrf & "Opens a list of options if you're on a different kind of tile."
    Case 2: HotKeyDescriptionLabel1.Caption = "LEVEL EDITOR:" & vbCrLf & "Enters whatever door tile the mouse is over."
    
    Case 3: HotKeyDescriptionLabel1.Caption = "Flips a tile in the specified direction" & vbCrLf & vbCrLf & "Works in all editors that use tiles."
    Case 4: HotKeyDescriptionLabel1.Caption = "Copies the current tile properties into the tile the mouse is over, without changing the graphics of the tile." & vbCrLf & vbCrLf & "Useful for setting lots of tiles to ""Air"" or ""Solid"""
    Case 5: HotKeyDescriptionLabel1.Caption = "Load Stations must use data from a door leading into the room they use.  By pressing ""L"" over a door tile, you will open the Load Station form and have the option to use this door's data with a loading point." & vbCrLf & vbCrLf & "Note: The door *leads to* the room the load point will use."
    Case 6: HotKeyDescriptionLabel1.Caption = "Holding [Shift] while moving Samus's Ship will allow you to move the individual pieces seperately (in case you need to change the properties of some of the lower pieces)." & vbCrLf & vbCrLf & "*Just moving the mouse around with [Shift] held down will also reveal the Tile #/position in SMILE's caption."
    Case 18: HotKeyDescriptionLabel1.Caption = "Holding [Ctrl] will allow you to view/edit the starting surface of FX1 Liquids for the room, assuming a valid liquid is found."
    
    Case 7: HotKeyDescriptionLabel1.Caption = "Move the selected room to the co-ordinates the mouse is pointing at."
    
    Case 8: HotKeyDescriptionLabel1.Caption = "Show/hide Layer 1. This is usually the foreground of your level."
    Case 9: HotKeyDescriptionLabel1.Caption = "Show/hide Layer 2. This is usually the background of your level." & vbCrLf & vbCrLf & "You will only see your background in SMILE if you made a custom background."
    Case 10: HotKeyDescriptionLabel1.Caption = "Show/hide BTS. This includes slopes and special tiles such as super missile blocks."
    Case 11: HotKeyDescriptionLabel1.Caption = "Show/hide Enemies."
    Case 12: HotKeyDescriptionLabel1.Caption = "Show/hide PLM's."
    Case 17: HotKeyDescriptionLabel1.Caption = "Show Layer 1, Layer 2, BTS, Enemies, and PLM's." & vbCrLf & "Consider this to be your 'panic button'."
    
    Case 13: HotKeyDescriptionLabel1.Caption = "Takes a snapshot of either the current room or the current map, depending on which editor is in use." & vbCrLf & vbCrLf & "Note: Will also work in the scroll editor."
    
    Case 14: HotKeyDescriptionLabel1.Caption = "Brighten the level editor, if possible"
    Case 15: HotKeyDescriptionLabel1.Caption = "Darken the level editor, if possible"
    
    Case 16: HotKeyDescriptionLabel1.Caption = "If your cursor isn't over a door tile, this opens your emulator to the current room. Your cursor in the level editor will determine where Samus starts." & vbCrLf & vbCrLf & "You don't need to save before testing the ROM, as SMILE will make a temporary file with all your changes."
    
    Case 19: HotKeyDescriptionLabel1.Caption = "Enters whatever room the mouse is over."
    
    Case 20: HotKeyDescriptionLabel1.Caption = "Cycles through your metroid's behavior modes."
    
    Case 21: HotKeyDescriptionLabel1.Caption = "Bring up a small text box to quickly enter a BTS value for the tile your cursor is over." & vbCrLf & "0-9 will bring up the box with the appropriate number already in the box, so you only have to type the second value to be done." & vbCrLf & "# brings up an empty box, so you have to type in both characters."
    
    Case 22: HotKeyDescriptionLabel1.Caption = "Information about individual tiles that may prove useful to people who do their own ASM."
    Case Else: HotKeyDescriptionLabel1.Caption = ""
End Select
End Sub

Private Sub Text1_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
'Text1(Index).Text = TranslateKeyCode(KeyCode)

End Sub


Private Function TranslateKeyCode(KeyCode As Integer) As String
'gives the text to represent a key pressed (not just keyasci)
HotKeysForm1.Caption = KeyCode
'special cases
Select Case KeyCode
    Case 8: TranslateKeyCode = "[Back]"
    Case 9: TranslateKeyCode = "[Tab]"
    Case 13: TranslateKeyCode = "[Enter]"
    Case 16: TranslateKeyCode = "[Shift]"
    Case 17: TranslateKeyCode = "[Ctrl]"
    Case 18: TranslateKeyCode = "[Alt]"
    Case 19: TranslateKeyCode = "[Pause]"
    Case 20: TranslateKeyCode = "[Caps]"
    Case 32: TranslateKeyCode = "[Space]"
    Case 33: TranslateKeyCode = "[Pg Up]"
    Case 34: TranslateKeyCode = "[Pg Down]"
    Case 35: TranslateKeyCode = "[End]"
    Case 36: TranslateKeyCode = "[Home]"
    Case 37: TranslateKeyCode = "[Left]"
    Case 38: TranslateKeyCode = "[Up]"
    Case 39: TranslateKeyCode = "[Right]"
    Case 40: TranslateKeyCode = "[Down]"
    Case 45: TranslateKeyCode = "[Insert]"
    Case 46: TranslateKeyCode = "[Delete]"
    Case 91: TranslateKeyCode = "[Windows]"
    Case 93: TranslateKeyCode = "[Bullet]"
    Case 101: TranslateKeyCode = "[Num 5]"
    
    Case 106: TranslateKeyCode = "[Num *]"
    Case 107: TranslateKeyCode = "[Num +]"
    Case 109: TranslateKeyCode = "[Num -]"
    Case 111: TranslateKeyCode = "[Num /]"
    
    Case 144: TranslateKeyCode = "[Num Lock]"
    Case 186: TranslateKeyCode = ":"
    Case 187: TranslateKeyCode = "="
    Case 188: TranslateKeyCode = ","
    Case 189: TranslateKeyCode = "-"
    Case 190: TranslateKeyCode = "."
    Case 191: TranslateKeyCode = "/"
    Case 192: TranslateKeyCode = "~"
    Case 219: TranslateKeyCode = "["
    Case 220: TranslateKeyCode = "\"
    Case 221: TranslateKeyCode = "]"
    Case 222: TranslateKeyCode = """"
    Case Else: TranslateKeyCode = "???"
End Select

'key was found, so we leave the function
If TranslateKeyCode <> "???" Then Exit Function
'is it a number?
If KeyCode > 47 And KeyCode < 58 Then
    TranslateKeyCode = KeyCode - 48
End If
'is it a number from the number pad?
If KeyCode > 95 And KeyCode < 106 Then
    TranslateKeyCode = KeyCode - 96
End If
'is it an F key?
If KeyCode > 111 And KeyCode < 124 Then
    TranslateKeyCode = "[F" & (KeyCode - 111) & "]"
End If
'is it a-z?
If KeyCode > 64 And KeyCode < 91 Then
    TranslateKeyCode = Chr$(KeyCode + 32)
End If
'unknown
If TranslateKeyCode = "???" Then TranslateKeyCode = "[" & KeyCode & "]"
End Function
