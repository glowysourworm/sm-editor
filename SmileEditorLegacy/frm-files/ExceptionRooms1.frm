VERSION 5.00
Begin VB.Form ExceptionRooms1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Ceres Shaft"
   ClientHeight    =   4125
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8055
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   275
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   537
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00400000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Left            =   4200
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   3
      Top             =   0
      Width           =   3840
      Begin VB.Image Target 
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   255
         Index           =   1
         Left            =   0
         Top             =   0
         Width           =   255
      End
   End
   Begin VB.CommandButton RefreshRoom1 
      Caption         =   "Re-Open Room"
      Height          =   255
      Index           =   0
      Left            =   0
      TabIndex        =   2
      Top             =   3840
      Width           =   1935
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3840
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   0
      Top             =   0
      Width           =   3840
      Begin VB.PictureBox Picture1 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   1905
         Left            =   1680
         ScaleHeight     =   127
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   127
         TabIndex        =   1
         Top             =   1560
         Visible         =   0   'False
         Width           =   1905
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
End
Attribute VB_Name = "ExceptionRooms1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type ShaftType
    Tile As Byte
    DrawMethod As Byte
End Type
Private SHAFTDATA(0 To 1055) As ShaftType   'actual shaft data (8x8 tile map)
Private DraggedDroppedL3 As ShaftType       'clipboard



Private Sub Form_Load()
Dim TempVarPath As String
Dim TempGraphicsPath As String
Dim TempTileMapPath As String
Dim GraphicsData() As Byte
Dim TileMapData() As Byte
Dim TileI As Integer
Dim TileX As Integer
Dim TileY As Integer

Me.Icon = Smile.Icon
TempVarPath = App.Path & "\files\temp\var.bin"
TempGraphicsPath = App.Path & "\files\temp\graphics.bin"
TempTileMapPath = App.Path & "\files\temp\tilemap.bin"
MsgBox "Not even close to finished, so don't ask."

Open TempVarPath For Binary As #1
ReDim GraphicsData(0 To ((LOF(1) \ 2) - 1)) As Byte
ReDim TileMapData(0 To ((LOF(1) \ 2) - 1)) As Byte
For I = 0 To (UBound(GraphicsData) - 1)
    Get #1, , TileMapData(I)
    Get #1, , GraphicsData(I)
Next I
Close #1


'if data is too small, then it's a normal room/sheet
If UBound(GraphicsData) < &H3FFF Then
    MsgBox "This is not an exception room/sheet." & vbCrLf & "Exit the form and open a room that is." & vbCrLf & "Don't edit anything.", vbInformation, "Oops."
    Exit Sub
End If
'create graphics file to use in a seperate tile editor
Open TempGraphicsPath For Binary As #1
Put #1, , GraphicsData()
Close #1
'create tilemap file to use in smile or externally
Open TempTileMapPath For Binary As #1
Put #1, , TileMapData()
Close #1
MsgBox TempGraphicsPath & vbCrLf & TempTileMapPath
'draw tiles to invisible picturebox
TileX = -8
TileY = 0
For TileI = 0 To 255
    TileX = TileX + 8
    If TileX > 127 Then
        TileY = TileY + 8
        TileX = 0
    End If
MakeOne8x8_8BPP (TileI * &H40), Picture1.hdc, TileX, TileY, TempGraphicsPath
Next TileI
'stretch onto visible picturebox that the user will use
Picture2.Cls
StretchBlt Picture2.hdc, 0, 0, 256, 256, Picture1.hdc, 0, 0, 128, 128, SRCCOPY
Picture2.Refresh
'ReOpenRoom1_Click
End Sub



Private Sub Picture2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Private Sub Picture3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'FOR MOVING TARGET BOX
If X < 0 Then X = 0
If Y < 0 Then Y = 0
If X > Picture3.Width Then X = Picture3.Width - 1
If Y > Picture3.Height Then Y = Picture3.Height - 1

Dim RealX
Dim RealY
RealX = (X \ 16) * 16
RealY = (Y \ 16) * 16
Target(1).Move RealX, RealY
End Sub

Private Sub RefreshRoom1_Click(Index As Integer)
Dim ShaftPath As String
Dim ShaftOffset As Long
Dim NewData() As Byte
Dim CMD1 As New OpenSave
Dim TempTileMapPath As String
Dim TileMapData() As Byte

TempTileMapPath = App.Path & "\files\temp\tilemap.bin"

Select Case Index
    Case 0: GoTo READ_SHAFT
    Case 1: GoTo SAVE_SHAFT
    Case Else: Exit Sub
End Select

READ_SHAFT:
'retrieve tilemap data
Open TempTileMapPath For Binary As #1
ReDim TileMapData(0 To LOF(1) - 1)
    Get #1, , TileMapData()
Close #1
GoTo FinishREADSAVE

'saves to the temp file, but does not reinterlace, recompress, or insert
SAVE_SHAFT:
Open TempTileMapPath For Binary As #1
    Put #1, , TileMapData()
Close #1

FinishREADSAVE:
'RefreshL3Preview
End Sub

