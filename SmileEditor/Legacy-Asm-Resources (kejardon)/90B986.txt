$83986-$83A3D
{
	JSR $AC39  ;  Check if allowed to shoot

	BCS BRANCH_ALPHA

BRANCH_EPSILON

	LDA $0DC2
	CMP #$0010 ;  This was a charged shot (>003C). Duh. This always branches.

	BPL BRANCH_BETA

	PLP
	RTS

BRANCH_BETA

	STZ $0DC0
	LDA #$0002
	JSL $809021  ;  Disable charge sound
	PLP
	RTS

BRANCH_ALPHA

	LDX #$0000

BRANCH_DELTA

	LDA $0C2C, X ;  Damages

	BEQ BRANCH_GAMMA ; Find an empty spot

	INX
	INX
	CPX #$000A

	BMI BRANCH_DELTA

	DEX
	DEX

BRANCH_GAMMA

	STX $14
	JSR $BA56  ;  Setup acceleration and starting position, based on Samus's pose

	BCS BRANCH_EPSILON

	LDA #$000A
	STA $18AC
	LDX $14
	LDA #$0004
	STA $0C90, X ;  Trail timer
	LDA $09A6
	AND #$100F
	ORA #$8010
	STA $0C18, X ;  Projectile type
	AND #$000F
	ASL A
	TAY
	LDA $C2A7, Y ;  Sound? Guessing
	JSL $809021  ;  Plays sounds
	STZ $0DC0
	JSL $938000  ;  Sets up... damage, instruction (graphic only probably), Delay, and Size for beams
	LDA $0C18, X
	PHA
	AND #$003F
	TAY
	LDA $C254, Y ; Get Delay
	AND #$00FF
	STA $0CCC    ; Set Delay
	PLA
	BIT #$0001   ; Check Wave

	BNE BRANCH_ZETA

	STZ $0BDC, X
	STZ $0BF0, X
	STX $0DDE
	JSR $BD64  ;  $83D64 IN ROM
	LDX $0DDE
	LDA $0C18, X
	BIT #$0F00

	BNE BRANCH_THETA

	BRA BRANCH_IOTA

BRANCH_ZETA

	STZ $0BDC, X
	STZ $0BF0, X
	STX $0DDE
	JSR $BDB2  ;  $83DB2 IN ROM

BRANCH_IOTA

	STX $14
	LDA $0C18, X
	AND #$000F
	ASL A
	TAY
	LDA $BA3E, Y
	STA $0C68, X ; Code to run. Handles movement, trails, and deletion
	JSL $90B197  ;  Sets initial Speed

BRANCH_THETA

	LDA #$0004
	STA $0B18    ; 4 yellow frames
	PLP
	RTS
}