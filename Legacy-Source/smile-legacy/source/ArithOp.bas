Attribute VB_Name = "Arithmetic"
'******************************************************************************
'* The following functions perform arithmetic Rotate Left (ROL),              *
'*  Rotate Right (ROR), Shift Left (SHL) and Shift Right (SHR).               *
'*  The input value can be Byte (8-bit),Integer (16-bit) or Long (32-bit),    *
'*  for each of which just use ROL8, ROL16 and ROL32 , respectively           *
'*                                                                            *
'*  BY: Nadeem Afanah                                                         *
'*  E-mail: Nad__Af@hotmail.com                                               *
'******************************************************************************

'============================================
'Rotate Right 8-bit version  ( Byte )
'============================================
Function ROR8(ByVal bNum As Byte) As Byte
Dim bRes As Byte

bRes = (1 And bNum) * 128   '128 = 2 ^ 7
bRes = bRes Or (bNum / 2)
ROR8 = bRes
End Function
'--------------------------------------------


'=============================================
'Rotate Right 16-bit version  ( Integer )
'=============================================
Function ROR16(ByVal iNum As Integer) As Integer
Dim iRes As Integer

iRes = (1 And iNum) * &H8000   '&H8000 = 2^15
iRes = iRes Or (iNum / 2)
ROR16 = iRes
End Function
'---------------------------------------------


'==============================================
'Rotate Right 32-bit version  ( Long )
'==============================================
Function ROR32(ByVal LNum As Long) As Long
Dim LRes As Long

LRes = (1 And LNum) * &H800000   '800000 = 2^23
LRes = LRes Or (LNum / 2)
ROR32 = LRes
End Function
'----------------------------------------------

'==============================================
'Rotate Left 8-bit Version  ( Byte )
'==============================================
Function ROL8(ByVal bNum As Byte) As Byte
Dim bRes As Byte
bRes = IIf(128 And bNum, 1, 0)
bNum = bNum And &H7F    'you might get an overflow (01111111 = 0x7F)
bRes = (bNum * 2) Or bRes
ROL8 = bRes
End Function
'--------------------------------------------

'==============================================
'Rotate Left 16-bit Version  ( Integer )
'==============================================
Function ROL16(ByVal iNum As Integer) As Integer
Dim iRes As Integer
iRes = IIf(&H8000 And iNum, 1, 0)
iNum = iNum And &H3FFF  'you might get an overflow 011111111111111 = 0x3FFF
iRes = (iNum * 2) Or iRes
ROL16 = iRes
End Function
'----------------------------------------------

'==============================================
'Rotate Left 32-bit Version  ( Long )
'==============================================
Function ROL32(ByVal LNum As Long) As Long
Dim LRes As Long
LRes = IIf(&H80000000 And LNum, 1, 0)
LNum = LNum And &H7FFFFFFF  'you might get an overflow
LRes = (LNum * 2) Or LRes
ROL32 = LRes
End Function
'-----------------------------------------------

'==============================================
'Shift Left 8-bit version ( Byte )
'==============================================
Function SHL8(ByVal bNum As Byte, ByVal bCount As Byte) As Byte
On Error Resume Next    'you might get an overflow
SHL8 = bNum * 2 ^ bCount
End Function
'-----------------------------------------------

'==============================================
'Shift Left 16-bit version ( Integer )
'==============================================
Function SHL16(ByVal iNum As Integer, ByVal bCount As Byte) As Integer
'Variant   because cannot return 32,768 (overflow)
Dim bRes As Variant
bRes = iNum * 2 ^ bCount
SHL16 = IIf(bRes > 32767, (Not bRes) + 1, bRes) 'two's comp
End Function
Function ASL(ByVal iNum As Integer, ByVal bCount As Byte) As Integer
'Variant   because cannot return 32,768 (overflow)
Dim bRes As Variant
bRes = iNum * 2 ^ bCount
ASL = IIf(bRes > 32767, (Not bRes) + 1, bRes) 'two's comp
End Function


'==============================================
'Shift Left 32-bit version ( Long )
'==============================================
Function SHL32(ByVal LNum As Long, ByVal bCount As Byte) As Long
'Variant   because cannot return 32,768 (overflow)
Dim bRes As Variant
bRes = LNum * 2 ^ bCount
SHL32 = bRes - IIf(bRes > 2147483647, 4294967296#, 0)
End Function
'--------------------------------------------------

'==============================================
'Shift Right 8-bit version ( Byte )
'==============================================
Function SHR8(ByVal bNum As Byte, ByVal bCount As Byte) As Byte
SHR8 = bNum \ 2 ^ bCount
End Function
'-----------------------------------------------

'==============================================
'Shift Right 16-bit version ( Integer )
'==============================================
Function SHR16(ByVal iNum As Integer, ByVal bCount As Byte) As Integer
SHR16 = iNum \ 2 ^ bCount
End Function
'--------------------------------------------------

'==============================================
'Shift Right 32-bit version ( Long )
'==============================================
Function SHR32(ByVal LNum As Long, ByVal bCount As Byte) As Long

If bCount > 30 Then
SHR32 = 0
Exit Function
End If

SHR32 = LNum \ 2 ^ bCount
End Function
'--------------------------------------------------

