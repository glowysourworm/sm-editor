VERSION 5.00
Begin VB.Form SPI1 
   Caption         =   "SMILE Plug-In Maker"
   ClientHeight    =   6375
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   8310
   LinkTopic       =   "Form1"
   ScaleHeight     =   6375
   ScaleWidth      =   8310
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CellMarker1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Height          =   255
      Index           =   0
      Left            =   4920
      Style           =   1  'Graphical
      TabIndex        =   18
      TabStop         =   0   'False
      ToolTipText     =   "0"
      Top             =   0
      Width           =   3375
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   0
      Max             =   0
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   6120
      Width           =   4815
   End
   Begin VB.Frame Frame1 
      Caption         =   "Plug-In Header"
      Height          =   6135
      Index           =   0
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   4815
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   3
         Left            =   120
         MaxLength       =   4
         TabIndex        =   2
         Text            =   "Ver#"
         ToolTipText     =   "Ver#"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   0
         Left            =   120
         MaxLength       =   32
         TabIndex        =   0
         Text            =   "Author"
         ToolTipText     =   "Author"
         Top             =   360
         Width           =   4575
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   1
         Left            =   120
         MaxLength       =   32
         TabIndex        =   1
         Text            =   "Title"
         ToolTipText     =   "Title"
         Top             =   720
         Width           =   4575
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2535
         Index           =   2
         Left            =   120
         MaxLength       =   432
         MultiLine       =   -1  'True
         TabIndex        =   3
         Text            =   "SPI1.frx":0000
         ToolTipText     =   "Description"
         Top             =   1440
         Width           =   4575
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Hex By Word"
      Height          =   6135
      Index           =   3
      Left            =   0
      TabIndex        =   35
      Top             =   0
      Width           =   4815
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   7
         Left            =   3720
         MaxLength       =   4
         TabIndex        =   44
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text4"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   6
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   43
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text4"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   5
         Left            =   2280
         MaxLength       =   4
         TabIndex        =   42
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text4"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   4
         Left            =   1560
         MaxLength       =   4
         TabIndex        =   41
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text4"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   3
         Left            =   840
         MaxLength       =   4
         TabIndex        =   40
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text4"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   0
         Left            =   120
         TabIndex        =   37
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Caption"
         ToolTipText     =   "Caption"
         Top             =   360
         Width           =   4575
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   1
         Left            =   120
         MaxLength       =   6
         TabIndex        =   38
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Address"
         ToolTipText     =   "Address"
         Top             =   615
         Width           =   4575
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   2
         Left            =   120
         MaxLength       =   4
         TabIndex        =   39
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text4"
         Top             =   1320
         Width           =   615
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Clear All"
         Height          =   255
         Left            =   120
         TabIndex        =   36
         TabStop         =   0   'False
         Top             =   5640
         Width           =   2655
      End
      Begin VB.Label Label1 
         Caption         =   "Clean values at address:"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   45
         Top             =   1080
         Width           =   1815
      End
      Begin VB.Image Cell1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         DragMode        =   1  'Automatic
         Height          =   990
         Index           =   3
         Left            =   3600
         Picture         =   "SPI1.frx":000E
         Top             =   5040
         Width           =   990
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Hex By Byte"
      Height          =   6135
      Index           =   2
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   4815
      Begin VB.CommandButton Command1 
         Caption         =   "Clear All"
         Height          =   255
         Left            =   120
         TabIndex        =   34
         TabStop         =   0   'False
         Top             =   5640
         Width           =   2655
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   9
         Left            =   3480
         MaxLength       =   2
         TabIndex        =   32
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   8
         Left            =   3000
         MaxLength       =   2
         TabIndex        =   31
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   7
         Left            =   2520
         MaxLength       =   2
         TabIndex        =   30
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   6
         Left            =   2040
         MaxLength       =   2
         TabIndex        =   29
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   5
         Left            =   1560
         MaxLength       =   2
         TabIndex        =   28
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   4
         Left            =   1080
         MaxLength       =   2
         TabIndex        =   27
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   3
         Left            =   600
         MaxLength       =   2
         TabIndex        =   26
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   2
         Left            =   120
         MaxLength       =   2
         TabIndex        =   25
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Text2"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   1
         Left            =   120
         MaxLength       =   6
         TabIndex        =   24
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Address"
         ToolTipText     =   "Address"
         Top             =   615
         Width           =   4575
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   0
         Left            =   120
         TabIndex        =   23
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Caption"
         ToolTipText     =   "Caption"
         Top             =   360
         Width           =   4575
      End
      Begin VB.Image Cell1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         DragMode        =   1  'Automatic
         Height          =   990
         Index           =   2
         Left            =   3600
         Picture         =   "SPI1.frx":0A73
         Top             =   5040
         Width           =   990
      End
      Begin VB.Label Label1 
         Caption         =   "Clean values at address:"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   33
         Top             =   1080
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Checkboxes"
      Height          =   6135
      Index           =   1
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   4815
      Begin VB.CommandButton Command2 
         Caption         =   "Clear All"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         TabStop         =   0   'False
         Top             =   4680
         Width           =   2655
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   12
         Left            =   120
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Check"
         ToolTipText     =   "Check"
         Top             =   4230
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   11
         Left            =   120
         TabIndex        =   20
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Clean"
         ToolTipText     =   "Clean"
         Top             =   3975
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   10
         Left            =   120
         MaxLength       =   6
         TabIndex        =   19
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Address"
         ToolTipText     =   "Address"
         Top             =   3720
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   9
         Left            =   120
         TabIndex        =   17
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Check"
         ToolTipText     =   "Check"
         Top             =   3270
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   8
         Left            =   120
         TabIndex        =   16
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Clean"
         ToolTipText     =   "Clean"
         Top             =   3015
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   7
         Left            =   120
         MaxLength       =   6
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Address"
         ToolTipText     =   "Address"
         Top             =   2760
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   6
         Left            =   120
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Check"
         ToolTipText     =   "Check"
         Top             =   2310
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   5
         Left            =   120
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Clean"
         ToolTipText     =   "Clean"
         Top             =   2055
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   4
         Left            =   120
         MaxLength       =   6
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Address"
         ToolTipText     =   "Address"
         Top             =   1800
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   3
         Left            =   120
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Check"
         ToolTipText     =   "Check"
         Top             =   1350
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   2
         Left            =   120
         TabIndex        =   10
         TabStop         =   0   'False
         Tag             =   "1"
         Text            =   "Clean"
         ToolTipText     =   "Clean"
         Top             =   1095
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   1
         Left            =   120
         MaxLength       =   6
         TabIndex        =   9
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Address"
         ToolTipText     =   "Address"
         Top             =   840
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
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
         Index           =   0
         Left            =   120
         TabIndex        =   8
         TabStop         =   0   'False
         Tag             =   "0"
         Text            =   "Caption"
         ToolTipText     =   "Caption"
         Top             =   360
         Width           =   4575
      End
      Begin VB.Image Cell1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         DragMode        =   1  'Automatic
         Height          =   990
         Index           =   1
         Left            =   3720
         Picture         =   "SPI1.frx":14D8
         Top             =   4680
         Width           =   990
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuSave 
         Caption         =   "&Save"
      End
      Begin VB.Menu mnuSpacer00 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu mnuViewFrames 
         Caption         =   "&Header"
         Checked         =   -1  'True
         Index           =   0
      End
      Begin VB.Menu mnuViewFrames 
         Caption         =   "&Check Boxes"
         Index           =   1
      End
      Begin VB.Menu mnuViewFrames 
         Caption         =   "&Hex By Byte"
         Index           =   2
      End
      Begin VB.Menu mnuViewFrames 
         Caption         =   "&Hex By Word"
         Index           =   3
      End
   End
End
Attribute VB_Name = "SPI1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type SPI_HEADER
    ID As String * 3            'so SMILE knows it's not executable
    Version As String * 1       'in case future changes for compatibility
    UserVersion As String * 4   'version assigned by the author to the plug-in
    Date As String * 8          'mm-dd-yyyy of compile
    Author As String * 32       'author of plug-in
    Title As String * 32        'title of program
    Description As String * 432 'description of program
End Type


Private MY_HEADER As SPI_HEADER
Private CellData(0 To 24) As String 'actual data for a cell
Private TempString As String        'copy of celldata that we're currently working with
Private FullString As String        'user data when opening a file




Private Sub CellMarker1_Click(Index As Integer)
For I = 0 To CellMarker1.UBound
    CellMarker1(I).BackColor = RGB(200, 200, 200)
Next I
CellMarker1(Index).BackColor = RGB(255, 255, 200)
TempString = CellData(Index)

If Left$(TempString, 19) = "StartCell=Automated" Then ParseAutomated    'check boxes
If Left$(TempString, 15) = "StartCell=Text2" Then ParseText2            '2 byte hex
If Left$(TempString, 15) = "StartCell=Text4" Then ParseText4            '4 byte hex
End Sub

Private Sub CellMarker1_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
Select Case Source.Index
    Case 1: GoTo FigureAutomated
    Case 2: GoTo FigureText2
    Case 3: GoTo FigureText4
End Select

FigureAutomated:
CellMarker1(Index).Caption = Text2(0).Text
CellData(Index) = "StartCell=Automated" & vbCrLf
For I = 0 To Text2.UBound
    If Text2(I).Text = "" Or Text2(I).Text = Text2(I).ToolTipText Then GoTo DoNextI
    CellData(Index) = CellData(Index) & Text2(I).ToolTipText & "="
    If Text2(I).ToolTipText = "Caption" Then
        CellData(Index) = CellData(Index) & Text2(I).Text & vbCrLf
    Else
        CellData(Index) = CellData(Index) & Replace(Text2(I).Text, " ", "") & vbCrLf
    End If
DoNextI:
Next I
CellData(Index) = CellData(Index) & "EndCell"
Exit Sub


FigureText2:
CellMarker1(Index).Caption = Text3(0).Text
CellData(Index) = "StartCell=Text2" & vbCrLf
For I = 0 To Text3.UBound
    If Text3(I).Text = "" Then GoTo DoNextI2
    CellData(Index) = CellData(Index) & Text3(I).ToolTipText & "="
    If Text3(I).ToolTipText = "Caption" Then
        CellData(Index) = CellData(Index) & Text3(I).Text & vbCrLf
    Else
        CellData(Index) = CellData(Index) & Replace(Text3(I).Text, " ", "") & vbCrLf
    End If
DoNextI2:
Next I
CellData(Index) = CellData(Index) & "EndCell"
Exit Sub


FigureText4:
CellMarker1(Index).Caption = Text4(0).Text
CellData(Index) = "StartCell=Text4" & vbCrLf
For I = 0 To Text4.UBound
    If Text4(I).Text = "" Then GoTo DoNextI3
    CellData(Index) = CellData(Index) & Text4(I).ToolTipText & "="
    If Text4(I).ToolTipText = "Caption" Then
        CellData(Index) = CellData(Index) & Text4(I).Text & vbCrLf
    Else
        CellData(Index) = CellData(Index) & Replace(Text4(I).Text, " ", "") & vbCrLf
    End If
DoNextI3:
Next I
CellData(Index) = CellData(Index) & "EndCell"
Exit Sub





End Sub


Private Sub Command1_Click()
For I = 0 To Text3.UBound
    Text3(I).Text = ""
Next I

End Sub

Private Sub Command2_Click()
For I = 0 To Text2.UBound
    Text2(I).Text = ""
Next I
End Sub

Private Sub Command3_Click()
For I = 0 To Text4.UBound
    Text4(I).Text = ""
Next I

End Sub

Private Sub Form_Load()
HScroll1.Max = Frame1.UBound
Text1(2).Text = "Description"   'needed, as a vbCrLf added by GUI
CellMarker1(0).BackColor = RGB(200, 200, 200)
For I = 1 To 24
    Load CellMarker1(I)
    CellMarker1(I).Top = CellMarker1(I - 1).Top + CellMarker1(I - 1).Height
    CellMarker1(I).ToolTipText = CellMarker1(I).Caption
    CellMarker1(I).Visible = True
    CellMarker1(I).TabStop = False
Next I
End Sub

Public Sub HScroll1_Change()
Frame1(HScroll1.Value).ZOrder 0

For I = 0 To Frame1.UBound
    mnuViewFrames(I).Checked = False
Next I
mnuViewFrames(HScroll1.Value).Checked = True

If HScroll1.Value = 0 Then
    For I = 0 To Text1.UBound
        Text1(I).TabStop = True
    Next I
    For I = 0 To Text2.UBound
        Text2(I).TabStop = False
    Next I
    For I = 0 To Text3.UBound
        Text3(I).TabStop = False
    Next I
    For I = 0 To Text4.UBound
        Text4(I).TabStop = False
    Next I
    Text1(0).SetFocus
    Text1_Click 0
End If
If HScroll1.Value = 1 Then
    For I = 0 To Text1.UBound
        Text1(I).TabStop = False
    Next I
    For I = 0 To Text2.UBound
        Text2(I).TabStop = True
    Next I
    For I = 0 To Text3.UBound
        Text3(I).TabStop = False
    Next I
    For I = 0 To Text4.UBound
        Text4(I).TabStop = False
    Next I
    Text2(0).SetFocus
    Text2_Click 0
End If
If HScroll1.Value = 2 Then
    For I = 0 To Text1.UBound
        Text1(I).TabStop = False
    Next I
    For I = 0 To Text2.UBound
        Text2(I).TabStop = False
    Next I
    For I = 0 To Text3.UBound
        Text3(I).TabStop = True
    Next I
    For I = 0 To Text4.UBound
        Text4(I).TabStop = False
    Next I
    Text3(0).SetFocus
    Text3_Click 0
End If
If HScroll1.Value = 3 Then
    For I = 0 To Text1.UBound
        Text1(I).TabStop = False
    Next I
    For I = 0 To Text2.UBound
        Text2(I).TabStop = False
    Next I
    For I = 0 To Text3.UBound
        Text3(I).TabStop = False
    Next I
    For I = 0 To Text4.UBound
        Text4(I).TabStop = True
    Next I
    Text4(0).SetFocus
    Text4_Click 0
End If


End Sub

Private Sub HScroll1_Scroll()
HScroll1_Change
End Sub

Private Sub mnuExit_Click()
End
End Sub

Private Sub mnuOpen_Click()
Dim OneCharacter As String * 1
Dim DataSize As Integer
Dim CMD1 As New OpenSave
Dim TempPath As String
CMD1.Filter = "SMILE Plug-Ins|*.SPI"
CMD1.InitDir = App.Path

CMD1.ShowOpen
TempPath = CMD1.FileName
For I = 1 To Len(TempPath)
    If Asc(Mid$(TempPath, I, 1)) = 0 Then Exit For
Next I
TempPath = Mid$(TempPath, 1, I - 1)
If TempPath = "" Then Exit Sub

FullString = ""
TempString = ""
Open TempPath For Binary As #1
    Get #1, 1, MY_HEADER
    DataSize = LOF(1) - &H200
    Do
        Get #1, , OneCharacter
        FullString = FullString & OneCharacter
    Loop Until EOF(1)
Close #1
Text1(0).Text = MY_HEADER.Author
Text1(1).Text = MY_HEADER.Title
Text1(2).Text = MY_HEADER.Description
Text1(3).Text = MY_HEADER.UserVersion
OpenAllCells
CellMarker1_Click 0
HScroll1.Value = 0
End Sub

Private Sub mnuSave_Click()
Dim II As Byte
Dim TempZero As Byte
Dim CMD1 As New OpenSave
Dim TempPath As String
CMD1.Filter = "SMILE Plug-Ins|*.SPI"
CMD1.InitDir = App.Path

CMD1.ShowSave
TempPath = CMD1.FileName
For I = 1 To Len(TempPath)
    If Asc(Mid$(TempPath, I, 1)) = 0 Then Exit For
Next I
TempPath = Mid$(TempPath, 1, I - 1)
If TempPath = "" Then Exit Sub

TempZero = 0
MY_HEADER.ID = "SPI"
MY_HEADER.Version = "1"
MY_HEADER.Author = Text1(0).Text
MY_HEADER.Title = Text1(1).Text
MY_HEADER.Description = Text1(2).Text
MY_HEADER.UserVersion = Text1(3).Text
MY_HEADER.Date = Right$("00" & DateTime.Month(DateTime.Date$), 2) & "-" & Right$("00" & DateTime.Day(DateTime.Date$), 2) & "-" & Right$("00" & DateTime.Year(DateTime.Date$), 2)

TempString = "0000000000000000"
Open TempPath For Binary As #1
Close #1
Kill TempPath
Open TempPath For Binary As #1
    Put #1, , MY_HEADER
    For I = 0 To UBound(CellData)
        If CellData(I) <> "" Then Put #1, , CellData(I)
    Next I
    II = LOF(1) Mod 16
    Do
        If II = 0 Then Exit Do
        Put #1, , TempZero
        II = II - 1
    Loop
Close #1

End Sub

Private Sub mnuViewFrames_Click(Index As Integer)
HScroll1.Value = Index
End Sub

Public Sub Text1_Click(Index As Integer)
For I = 0 To Text1.UBound
    If I <> Index Then
        Text1(I).BackColor = vbWhite
        Text1(I).BorderStyle = 0
    End If
Next I
Text1(Index).BackColor = vbYellow
Text1(Index).BorderStyle = 1


If Text1(Index).Text = Text1(Index).ToolTipText Then
    Text1(Index).SelStart = 0
    Text1(Index).SelLength = Len(Text1(Index).Text)
End If
End Sub

Private Sub Text1_GotFocus(Index As Integer)
Text1_Click Index
End Sub


Public Function TypeHex(KeyAscii As Integer) As Integer
If KeyAscii = 8 Then Exit Function  'backspace
If KeyAscii = 13 Then Exit Function 'enter

'numbers
If KeyAscii >= 48 And KeyAscii <= 57 Then GoTo Hexed
'a-f become A-F
If KeyAscii >= 97 And KeyAscii <= 102 Then KeyAscii = KeyAscii - 32
'A-F
If KeyAscii >= 65 And KeyAscii <= 70 Then GoTo Hexed
'space
If KeyAscii = 32 Then GoTo Hexed
'not a match
KeyAscii = 0

Hexed:
TypeHex = KeyAscii
End Function


Public Sub Text2_Click(Index As Integer)
For I = 0 To Text2.UBound
    If I <> Index Then
        Text2(I).BackColor = vbWhite
        Text2(I).BorderStyle = 0
    End If
Next I
Text2(Index).BackColor = vbYellow
Text2(Index).BorderStyle = 1


If Text2(Index).Text = Text2(Index).ToolTipText Then
    Text2(Index).SelStart = 0
    Text2(Index).SelLength = Len(Text2(Index).Text)
End If

End Sub

Private Sub Text2_GotFocus(Index As Integer)
Text2_Click Index
End Sub

Private Sub Text2_KeyPress(Index As Integer, KeyAscii As Integer)
If Text2(Index).ToolTipText = "Caption" Then Exit Sub
TypeHex KeyAscii
End Sub


Private Function GrabData(AddSpaces As Boolean) As String
Dim EStart As Integer
Dim VStart As Integer
Dim TempGrab As String

EStart = InStr(1, TempString, "=") + 1
VStart = InStr(EStart, TempString, vbCrLf)
If VStart < EStart Then Exit Function
GrabData = Mid$(TempString, EStart, Val(VStart - EStart))
TempString = Right$(TempString, Len(TempString) - VStart - 1)
If AddSpaces = True Then
    TempGrab = GrabData
    If Len(TempGrab) Mod 2 <> 0 Then TempGrab = TempGrab & "0"
    GrabData = ""
    Do
        GrabData = GrabData & Left$(TempGrab, 2) & " "
        TempGrab = Right$(TempGrab, Len(TempGrab) - 2)
    Loop Until Len(TempGrab) = 0
    If Right$(GrabData, 1) = " " Then GrabData = Left$(GrabData, Len(GrabData) - 1)
End If
End Function


Private Sub ParseAutomated()
Dim DoSpaces As Boolean
'focus on the correct frame
HScroll1.Value = 1
'remove the non-user data
TempString = Replace(TempString, "StartCell=Automated" & vbCrLf, "")
TempString = Replace(TempString, "EndCell", "")
'clear all fields
For I = 0 To Text2.UBound
    Text2(I).Text = ""
Next I
'fill the rest of the fields
For I = 0 To Text2.UBound
    If Len(TempString) = 0 Then Exit For
    If Text2(I).Tag = 1 Then DoSpaces = True Else DoSpaces = False
    Text2(I).Text = GrabData(DoSpaces)
Next I
End Sub


Private Sub ParseText2()
Dim DoSpaces As Boolean
'focus on the correct frame
HScroll1.Value = 2
'remove the non-user data
TempString = Replace(TempString, "StartCell=Text2" & vbCrLf, "")
TempString = Replace(TempString, "EndCell", "")
'clear all fields
For I = 0 To Text3.UBound
    Text3(I).Text = ""
Next I
'fill the rest of the fields
For I = 0 To Text3.UBound
    If Len(TempString) = 0 Then Exit For
    If Text3(I).Tag = 1 Then DoSpaces = True Else DoSpaces = False
    Text3(I).Text = GrabData(DoSpaces)
Next I
End Sub



Private Sub ParseText4()
Dim DoSpaces As Boolean
'focus on the correct frame
HScroll1.Value = 3
'remove the non-user data
TempString = Replace(TempString, "StartCell=Text4" & vbCrLf, "")
TempString = Replace(TempString, "EndCell", "")
'clear all fields
For I = 0 To Text4.UBound
    Text4(I).Text = ""
Next I
'fill the rest of the fields
For I = 0 To Text4.UBound
    If Len(TempString) = 0 Then Exit For
    If Text4(I).Tag = 1 Then DoSpaces = True Else DoSpaces = False
    Text4(I).Text = GrabData(DoSpaces)
Next I
End Sub
Private Sub OpenAllCells()
Dim EndOfCell As Integer
Dim CaptionStart As Integer
Dim CaptionEnd As Integer
I = 0
Do
    EndOfCell = InStr(1, FullString, "EndCell") + 6
    If EndOfCell = 6 Then Exit Sub
    TempString = Left$(FullString, EndOfCell)
    FullString = Right$(FullString, Len(FullString) - EndOfCell)
    CellData(I) = TempString
    CaptionStart = InStr(1, TempString, "Caption=") + 8
    CaptionEnd = InStr(CaptionStart, TempString, vbCrLf)
    CellMarker1(I).Caption = Mid$(TempString, CaptionStart, CaptionEnd - CaptionStart)
    I = I + 1
Loop Until Len(FullString) = 0
End Sub



Private Sub Text3_Click(Index As Integer)
For I = 0 To Text3.UBound
    If I <> Index Then
        Text3(I).BackColor = vbWhite
        Text3(I).BorderStyle = 0
    End If
Next I
Text3(Index).BackColor = vbYellow
Text3(Index).BorderStyle = 1


If Text3(Index).Text = Text3(Index).ToolTipText Then
    Text3(Index).SelStart = 0
    Text3(Index).SelLength = Len(Text3(Index).Text)
End If
End Sub


Private Sub Text3_GotFocus(Index As Integer)
Text3_Click Index
End Sub


Private Sub Text3_KeyPress(Index As Integer, KeyAscii As Integer)
If Text3(Index).ToolTipText = "Caption" Then Exit Sub
TypeHex KeyAscii

End Sub

Private Sub Text4_Click(Index As Integer)
For I = 0 To Text4.UBound
    If I <> Index Then
        Text4(I).BackColor = vbWhite
        Text4(I).BorderStyle = 0
    End If
Next I
Text4(Index).BackColor = vbYellow
Text4(Index).BorderStyle = 1


If Text4(Index).Text = Text4(Index).ToolTipText Then
    Text4(Index).SelStart = 0
    Text4(Index).SelLength = Len(Text4(Index).Text)
End If
End Sub


Private Sub Text4_GotFocus(Index As Integer)
Text4_Click Index
End Sub


Private Sub Text4_KeyPress(Index As Integer, KeyAscii As Integer)
If Text4(Index).ToolTipText = "Caption" Then Exit Sub
TypeHex KeyAscii

End Sub


