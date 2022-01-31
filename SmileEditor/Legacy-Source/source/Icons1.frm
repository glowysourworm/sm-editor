VERSION 5.00
Begin VB.Form Icons1 
   Caption         =   "ICONS"
   ClientHeight    =   4320
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4320
   LinkTopic       =   "Form1"
   ScaleHeight     =   288
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   288
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton PREFERENCES 
      BackColor       =   &H00C0FFFF&
      Caption         =   "PREFERENCES"
      Height          =   1440
      Left            =   0
      Picture         =   "Icons1.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2880
      Width           =   1440
   End
   Begin VB.CommandButton REFRESH1 
      BackColor       =   &H00C0FFFF&
      Caption         =   "REFRESH1"
      Height          =   1440
      Left            =   1440
      Picture         =   "Icons1.frx":050F
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1440
      Width           =   1440
   End
   Begin VB.CommandButton SWAP 
      BackColor       =   &H00C0FFFF&
      Caption         =   "SWAP"
      DisabledPicture =   "Icons1.frx":0AFF
      Height          =   1440
      Left            =   0
      Picture         =   "Icons1.frx":11F0
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   1440
      Width           =   1440
   End
   Begin VB.CommandButton SCREENSHOT 
      BackColor       =   &H00C0FFFF&
      Caption         =   "SCREENSHOT"
      Height          =   1440
      Left            =   2880
      Picture         =   "Icons1.frx":18A3
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1440
      Width           =   1440
   End
   Begin VB.CommandButton FAVORITES 
      BackColor       =   &H00C0FFFF&
      Caption         =   "FAVORITES"
      DisabledPicture =   "Icons1.frx":1F23
      Height          =   1440
      Left            =   2880
      Picture         =   "Icons1.frx":22B4
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   0
      Width           =   1440
   End
   Begin VB.CommandButton ROM 
      BackColor       =   &H00C0FFFF&
      Caption         =   "ROM"
      Height          =   1440
      Left            =   0
      Picture         =   "Icons1.frx":2658
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   0
      Width           =   1440
   End
   Begin VB.CommandButton SAVE 
      BackColor       =   &H00C0FFFF&
      Caption         =   "SAVE"
      Height          =   1440
      Left            =   1440
      Picture         =   "Icons1.frx":2D35
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   0
      Width           =   1440
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   1440
      Left            =   2880
      Picture         =   "Icons1.frx":32FA
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2880
      Width           =   1440
   End
End
Attribute VB_Name = "Icons1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
