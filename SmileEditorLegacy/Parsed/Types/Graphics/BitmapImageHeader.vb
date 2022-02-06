'image header, total 40 bytes
Public Type BitmapImageHeader
     Size As Long          'Size of this header
     Width As Long         'width of your image
     Height As Long        'height of your image
     Planes As Integer     'always 1
     BitCount As Integer   'number of bits per pixel 1, 4, 8, or 24
     Compression As Long   '0 data is not compressed
     SizeImage As Long     'size of bitmap in bytes, typically 0 when uncompressed
     XPelsPerMeter As Long 'preferred resolution in pixels per meter
     YPelsPerMeter As Long 'preferred resolution in pixels per meter
     ClrUsed As Long       'number of colors that are actually used (can be 0)
     ClrImportant As Long  'which color is most important (0 means all of them)
End Type