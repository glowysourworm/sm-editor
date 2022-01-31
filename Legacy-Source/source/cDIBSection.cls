VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cDIBSection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' ******************************************************************************
' DIBSection class v1.0 (modifying image bits directly)
' Copyright © 2001 by Warren Galyen
' wgalyen@ earthlink.net
' - for Edais (http://members.nbci.com/EDais/)
' ******************************************************************************

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)

Private Type SAFEARRAYBOUND
    cElements As Long
    lLbound As Long
End Type
Private Type SAFEARRAY2D
    cDims As Integer
    fFeatures As Integer
    cbElements As Long
    cLocks As Long
    pvData As Long
    Bounds(0 To 1) As SAFEARRAYBOUND
End Type
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long

Private Type RGBQUAD
    rgbBlue As Byte
    rgbGreen As Byte
    rgbRed As Byte
    rgbReserved As Byte
End Type
Private Type BITMAPINFOHEADER
    biSize As Long              ' Size of BITMAPINFO structure
    biWidth As Long             ' Width of image in pixels
    biHeight As Long            ' Height of image in pixels
    biPlanes As Integer         ' # of color planes (set to 1)
    biBitCount As Integer       ' Bits per pixel (set to 24)
    biCompression As Long       ' must set this to BI_RGB (uncompressed) to work with the bits
    biSizeImage As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed As Long
    biClrImportant As Long
End Type

Private Const BITMAPTYPE As Integer = &H4D42
Private Type BITMAPFILEHEADER
        bfType As Integer
        bfSize As Long
        bfReserved1 As Integer
        bfReserved2 As Integer
        bfOffBits As Long
End Type

Private Type BITMAPINFO
    bmiHeader As BITMAPINFOHEADER
    bmiColors As RGBQUAD
End Type
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetDC Lib "user32" (ByVal hWnd As Long) As Long

Private Declare Function CreateDIBSection Lib "gdi32" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO, ByVal un As Long, lplpVoid As Long, ByVal handle As Long, ByVal dw As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Const BI_RGB = 0&
Private Const BI_RLE4 = 2&
Private Const BI_RLE8 = 1&
Private Const DIB_RGB_COLORS = 0

Private Type BITMAP
    bmType As Long
    bmWidth As Long
    bmHeight As Long
    bmWidthBytes As Long
    bmPlanes As Integer
    bmBitsPixel As Integer
    bmBits As Long
End Type
Private Declare Function GetObjectAPI Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
Private Declare Function timeGetTime Lib "winmm.dll" () As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long

Public Event Progress(ByVal lPosition As Integer)
Public Event Complete(ByVal lTimeMs As Long)

' Handle to the current DIBSection
Private hDibSec As Long
' Handle to the old bitmap in the DC
Private hBmpOld As Long
' Handle to the device context holding the DIBSection
Private hdc As Long
' Address of memory pointing to the DIBSection's bits
Private lPtr As Long
' Type containing the Bitmap information
Private tBI As BITMAPINFO

'TFG
' Meta Table
Private MetaTable() As Byte
' 4BPP Palette
Private Type Palette_4BPP
    Color(15) As Long
End Type
' Palettes
Private Palettes(0) As Palette_4BPP


Public Function CreateDIB(ByVal lHDC As Long, ByVal lWidth As Long, ByVal lheight As Long, hDib As Long) As Boolean
    
    With tBI.bmiHeader
        .biSize = Len(tBI.bmiHeader)
        .biWidth = lWidth
        .biHeight = lheight
        .biPlanes = 1
        .biBitCount = 32
        .biCompression = BI_RGB
        .biSizeImage = BytesPerScanLine * .biHeight
    End With
    hDib = CreateDIBSection(lHDC, tBI, DIB_RGB_COLORS, lPtr, 0, 0)
    CreateDIB = (hDib <> 0)
End Function

' Creates a DIB from a picture object
Public Function CreateFromPicture(ByRef picThis As StdPicture)
Dim lHDC As Long
Dim lhDCDesktop As Long
Dim lhBmpOld As Long
Dim tBMP As BITMAP
    
    GetObjectAPI picThis.handle, Len(tBMP), tBMP
    If (Create(tBMP.bmWidth, tBMP.bmHeight)) Then
        lhDCDesktop = GetDC(GetDesktopWindow())
        If (lhDCDesktop <> 0) Then
            lHDC = CreateCompatibleDC(lhDCDesktop)
            DeleteDC lhDCDesktop
            If (lHDC <> 0) Then
                lhBmpOld = SelectObject(lHDC, picThis.handle)
                LoadPictureBlt lHDC
                SelectObject lHDC, lhBmpOld
                DeleteObject lHDC
            End If
        End If
    End If
End Function

' Creates a DIB with the specified width and height in pixels.
Public Function Create(ByVal lWidth As Long, ByVal lheight As Long) As Boolean
    CleanUp
    hdc = CreateCompatibleDC(0)
    If (hdc <> 0) Then
        If (CreateDIB(hdc, lWidth, lheight, hDibSec)) Then
            hBmpOld = SelectObject(hdc, hDibSec)
            Create = True
        Else
            DeleteObject hdc
            hdc = 0
        End If
    End If
End Function

' Returns the number of bytes horizontally, taking into account the bits per pixel and 4 byte boundary padding
Public Property Get BytesPerScanLine() As Long
    BytesPerScanLine = (tBI.bmiHeader.biWidth * 3 + 3) And &HFFFFFFFC
End Property

Public Property Get Width() As Long
    Width = tBI.bmiHeader.biWidth
End Property
Public Property Get Height() As Long
    Height = tBI.bmiHeader.biHeight
End Property
Public Property Get BITSPERPIXEL() As Integer
    BITSPERPIXEL = tBI.bmiHeader.biBitCount
End Property
Public Property Get DotsPerMeterX() As Long
    DotsPerMeterX = tBI.bmiHeader.biXPelsPerMeter
End Property
Public Property Get DotsPerMeterY() As Long
    DotsPerMeterY = tBI.bmiHeader.biYPelsPerMeter
End Property
Public Property Get ColorsUsed() As Integer
    ColorsUsed = tBI.bmiHeader.biClrUsed
End Property

' I'm not exactly sure if the size if correct, but I've compared it with various image editors and it seems correct.
Public Property Get DIBSize() As Long
Dim Size As Long

    Size = Len(tBI)
    Size = Size + (ColorsUsed * Len(tBI.bmiColors))
    Size = Size + (BytesPerScanLine * Height)
    
    DIBSize = Size
End Property

' Copies an image from a device context into our DIB
Public Sub LoadPictureBlt(ByVal lHDC As Long, Optional ByVal lSrcLeft As Long = 0, Optional ByVal lSrcTop As Long = 0, _
                          Optional ByVal lSrcWidth As Long = -1, Optional ByVal lSrcHeight As Long = -1, _
                          Optional ByVal eRop As RasterOpConstants = vbSrcCopy)
        
    If lSrcWidth < 0 Then lSrcWidth = tBI.bmiHeader.biWidth
    If lSrcHeight < 0 Then lSrcHeight = tBI.bmiHeader.biHeight
    BitBlt hdc, 0, 0, lSrcWidth, lSrcHeight, lHDC, lSrcLeft, lSrcTop, eRop
End Sub

' Paints the DIB onto a device context
Public Sub Render(ByVal lHDC As Long, Optional ByVal lDestLeft As Long = 0, Optional ByVal lDestTop As Long = 0, _
                        Optional ByVal lDestWidth As Long = -1, Optional ByVal lDestHeight As Long = -1, _
                        Optional ByVal lSrcLeft As Long = 0, Optional ByVal lSrcTop As Long = 0, _
                        Optional ByVal eRop As RasterOpConstants = vbSrcCopy)
        
    If (lDestWidth < 0) Then lDestWidth = tBI.bmiHeader.biWidth
    If (lDestHeight < 0) Then lDestHeight = tBI.bmiHeader.biHeight
    BitBlt lHDC, lDestLeft, lDestTop, lDestWidth, lDestHeight, hdc, lSrcLeft, lSrcTop, eRop
End Sub

' Returns the memory device context used to hold the DIB Section
Public Property Get ImageDibHDC() As Long
    ImageDibHDC = hdc
End Property

' Returns a handle to the DIB Section
Public Property Get hDib() As Long
    hDib = hDibSec
End Property

' Returns the address of the DIB's bits in memory
Public Property Get DIBSectionBitsPtr() As Long
    DIBSectionBitsPtr = lPtr
End Property

' Frees up any GDI objects used by our class
Public Sub CleanUp()
    If (hdc <> 0) Then
        If (hDib <> 0) Then
            SelectObject hdc, hBmpOld
            DeleteObject hDibSec
        End If
        DeleteObject hdc
    End If
    hdc = 0
    hDibSec = 0
    hBmpOld = 0
    lPtr = 0
End Sub

Private Sub Class_Terminate()
    CleanUp
End Sub

Public Sub VFlip()
  Dim TMPsection As New cDIBSection
    
  TMPsection.Create Width, Height
  StretchBlt TMPsection.ImageDibHDC, 0, Height - 1, Width, -Height, ImageDibHDC, 0, 0, Width, Height, vbSrcCopy
  
  BitBlt ImageDibHDC, 0, 0, Width, Height, TMPsection.ImageDibHDC, 0, 0, vbSrcCopy
  TMPsection.CleanUp
End Sub

Public Sub HFlip()
  Dim TMPsection As New cDIBSection
  
  TMPsection.Create Width, Height
  StretchBlt TMPsection.ImageDibHDC, Width - 1, 0, -Width, Height, ImageDibHDC, 0, 0, Width, Height, vbSrcCopy
  
  BitBlt ImageDibHDC, 0, 0, Width, Height, TMPsection.ImageDibHDC, 0, 0, vbSrcCopy
  TMPsection.CleanUp
End Sub

' Performs Sobel Edge Detection filter on an image
Public Sub SubEdge()
Dim bDib() As Byte
Dim tSA As SAFEARRAY2D
Dim xMax As Long, yMax As Long
Dim x As Long, y As Long
Dim lTime As Long
    
    ' get the bits in from DIB section
    With tSA
        .cbElements = 1
        .cDims = 2
        .Bounds(0).lLbound = 0
        .Bounds(0).cElements = Height
        .Bounds(1).lLbound = 0
        .Bounds(1).cElements = BytesPerScanLine
        .pvData = DIBSectionBitsPtr
    End With
    CopyMemory ByVal VarPtrArray(bDib), VarPtr(tSA), 4
    
    xMax = Width - 2
    yMax = Height - 2
    
    ' Uses image subtraction to detect edges
    lTime = timeGetTime()
    For x = 0 To (xMax * 3) Step 3
        For y = 0 To yMax
            bDib(x + 2, y) = Abs(CInt(bDib(x + 2, y)) - bDib(x + 2 + 3, y + 1))
            bDib(x + 1, y) = Abs(CInt(bDib(x + 1, y)) - bDib(x + 1 + 3, y + 1))
            bDib(x, y) = Abs(CInt(bDib(x, y)) - bDib(x + 3, y + 1))
        Next y
        RaiseEvent Progress((x * 100) \ (xMax * 3))
    Next x
    
    ' Be sure to clear up the SAFEARRAY pointer we have created
    CopyMemory ByVal VarPtrArray(bDib), 0&, 4
    
    RaiseEvent Complete(timeGetTime - lTime)
    
End Sub




Public Sub RenderToDC(ByVal hdc As Long, ByVal idTile As Integer, ByVal idPalette As Integer, ByVal x As Integer, ByVal y As Integer)
    'On Error GoTo errHandler
    
    ' Render the tile
    Dim I As Byte
    For I = 0 To 63
        SetPixelV hdc, x + (I Mod 8), y + Int(I / 8), Palettes(idPalette).Color(MetaTable(idTile * 64 + I))
    Next I
    Exit Sub
errHandler:
    MsgBox "Error description: " & Err.Description, vbOKOnly + vbCritical, "cls4BPP Class"
End Sub

Public Sub CreateMetaTable(sFile As String, lOffset As Long, lNoTiles As Long)

    ' Temporary buffer for the 4BPP tiles
    Dim bTiles() As Byte, I As Long, cBitMask As Byte, ixMT As Integer, ixTile As Integer, mVal As Byte
    
    ' Indexed pixels (speed! speed!)
    Dim ix_1 As Long, ix_2 As Long, ix_3 As Long, ix_4 As Long
    
    ' Verify file
    If Dir$(sFile) = "" Then
        MsgBox "File not found [" & sFile & "]", vbCritical + vbOKOnly, "cls4BPP Class"
        Exit Sub
    End If
    
    ' Allocate memory for tiles
    If lNoTiles > 0 Then
        ReDim MetaTable((lNoTiles * 64) - 1)
        ReDim bTiles((lNoTiles * 32) - 1)
    Else
        MsgBox "Can't rip 0 tiles.", vbCritical + vbOKOnly, "cls4BPP Class"
        Exit Sub
    End If
    ' Get tiles
    Open sFile For Binary As #1
        Get #1, lOffset + 1, bTiles
    Close #1
    
    ' Create Meta Table
    For I = 0 To (lNoTiles - 1)
        For ixTile = 0 To 7
            ' Reset bitmask
            cBitMask = 128
            ix_1 = (I * 32) + (ixTile * 2)
            ix_2 = (I * 32) + (ixTile * 2) + 1
            ix_3 = (I * 32) + (ixTile * 2) + 16
            ix_4 = (I * 32) + (ixTile * 2) + 17
            
            ' Coded in "loopless" form to gain some speed.
            MetaTable(I * 64 + ixTile * 8 + 0) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 1) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 2) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 3) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 4) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 5) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 6) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
            MetaTable(I * 64 + ixTile * 8 + 7) = ((bTiles(ix_1) And cBitMask) / cBitMask) Or (((bTiles(ix_2) And cBitMask) / cBitMask) * 2) Or (((bTiles(ix_3) And cBitMask) / cBitMask) * 4) Or (((bTiles(ix_4) And cBitMask) / cBitMask) * 8): cBitMask = RShift(cBitMask, 1)
        Next ixTile
    Next I
    
    ' Wipe out bTiles
    Erase bTiles
End Sub

Public Sub CreatePalette(ColorRow As Integer)
Dim ColorLoop As Byte

ColorRow = ColorRow * 16
' Get palette
For ColorLoop = 0 To 15
    Palettes(0).Color(ColorLoop) = FlipRGB(PcPalette(ColorRow + ColorLoop))
Next ColorLoop

End Sub

Private Function LShift(ByVal pnValue As Long, ByVal pnShift As Long)
    LShift = CByte((pnValue * (2 ^ pnShift)) And 255)
End Function

Private Function RShift(ByVal pnValue As Long, ByVal pnShift As Long)
    RShift = CByte((pnValue \ (2 ^ pnShift)) And 255)
End Function


