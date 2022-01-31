//for API
#include <windows.h>
//not needed anymore?
#include <math.h>



//DrawScreenDLL - figures the number of tiles in an area
extern int _stdcall Figure_TotalNumberOfTiles(int StartingTile, int AreaWidth, int AreaHeight)
{
	if(StartingTile == 0){return AreaWidth * AreaHeight;}
	else{return 0;}
}


//(ByRef RoomTileX As Long, ByRef RoomTileY As Long, ByVal CurTile As Long, ByVal Tilesize As Long, ByVal Temppixel As Long)
void _stdcall Figure_RoomTileXY(int *RoomTileX, int *RoomTileY, int CurTile, int TileSize, int TempPixelWide)
{
	//figure RoomTileY
	*RoomTileX = CurTile * TileSize;
	*RoomTileY = (*RoomTileX / TempPixelWide) * TileSize;
	//figure RoomTileX
	*RoomTileX = *RoomTileX % TempPixelWide;
}



//DrawScreenDLL - figures the y value of a tile
void _stdcall FormDrag(HWND hwnd)
{
    ReleaseCapture();
    SendMessage(hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0);
}


///////////////////////////////////
//how make varialbe optional??////
//how handle strings??///////////
////////////////////////////////
extern int _stdcall CrystalBlt(HDC DestHDC, int DestX, int DestY, int DestWidth, int DestHeight, HDC MaskHDC, HDC SpriteHDC, unsigned char BlockID, unsigned char TempSheet, int SpriteWidth, int SpriteHeight, bool Do2)
{

//variables
	int WidthFlip = 0, HeightFlip = 0, xx, yy;
	double YY;

	YY = BlockID / 32;
	yy = (int)YY;
	xx = BlockID - (yy * 32);
	xx = xx * 16;
	yy = (yy * 16) + (TempSheet * 128);
//flip width/height if they are negative
	if(DestWidth < 0){WidthFlip = 1;}
	if(DestHeight < 0){HeightFlip = 1;}

	if(SpriteWidth == 0){SpriteWidth = DestWidth;}
	if(SpriteHeight == 0){SpriteHeight = DestHeight;}
//if Layer 2 isn't being drawn, cover potential leftover graphics with black
	if(Do2 == false)
	{
		StretchBlt (DestHDC, DestX + WidthFlip, DestY + HeightFlip, DestWidth, DestHeight, MaskHDC, xx, yy, SpriteWidth, SpriteHeight, BLACKNESS);
	}
//do the drawing
		StretchBlt (DestHDC, DestX, DestY, DestWidth, DestHeight, MaskHDC, xx, yy, SpriteWidth, SpriteHeight, SRCAND);
		StretchBlt (DestHDC, DestX, DestY, DestWidth, DestHeight, SpriteHDC, xx, yy, SpriteWidth, SpriteHeight, SRCPAINT);

		return yy;
}



////////////////////////////////////////////
extern char _stdcall FromBin(char InputArray[])
{
	char ReturnValue = 0;
	for(char I = 0; I < 8; I++)
	{
		ReturnValue |= (InputArray[7 - I] << I);
	}
	return ReturnValue;
}



extern void _stdcall ToBin(char InputValue, char OutputArray[])
{
	for(char I = 0; I < 8; I++)
	{
		OutputArray[I] = (InputValue >> (7 - I)) & 1;
	}
}


//just testing accessing an internal function in a dll
extern char _stdcall IntExtTest(char InputArray[])
{
	char DD;
	DD = FromBin(InputArray);
    return DD;
}



extern char _stdcall DrawSquare(HDC hdc, int StartX, int StartY, int EndX, int EndY)
{
	LPPOINT OldPoint = 0;
	    
	MoveToEx(hdc, StartX, StartY, OldPoint);
	LineTo(hdc, EndX, StartY);
	LineTo(hdc, EndX, EndY);
	LineTo(hdc, StartX, EndY);
	LineTo(hdc, StartX, StartY);
	return 1;
}

extern char _stdcall DrawLine(HDC hdc, int StartX, int StartY, int EndX, int EndY)
{
	LPPOINT OldPoint = 0;
	    
	MoveToEx(hdc, StartX, StartY, OldPoint);
	LineTo(hdc, EndX, EndY);
	return 1;
}

extern char _stdcall DrawSquareSpaced(HDC hdc, int StartX, int StartY, int EndX, int EndY)
{
	LPPOINT OldPoint = 0;
	    
	MoveToEx(hdc, StartX+2, StartY, OldPoint);
	LineTo(hdc, EndX-2, StartY);

	MoveToEx(hdc, EndX, StartY+2, OldPoint);
	LineTo(hdc, EndX, EndY-2);

	MoveToEx(hdc, StartX+2, EndY, OldPoint);
	LineTo(hdc, EndX-2, EndY);

	MoveToEx(hdc, StartX, EndY+2, OldPoint);
	LineTo(hdc, StartX, StartY-2);
	return 1;
}