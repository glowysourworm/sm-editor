$83887-$8396D
{
	LDA $0A76

	BEQ BRANCH_ALPHA

	JMP $BCD1  ;  Hyper Beam

BRANCH_ALPHA

	JSR $AC39  ;  Check if allowed to shoot

	BCS BRANCH_BETA

BRANCH_ZETA

	LDA $0DC2  ;  Check charge held
	CMP #$0010

	BPL BRANCH_GAMMA

	PLP
	RTS

BRANCH_GAMMA

	STZ $0DC0
	LDA #$0002
	JSL $809021  ;  Clear charge sound
	PLP
	RTS

BRANCH_BETA          ;  Fire a beam. I think.

	LDX #$0000

BRANCH_EPSILON

	LDA $0C2C, X ;  Damage array... this is used to check if projectiles are live?

	BEQ BRANCH_DELTA

	INX
	INX
	CPX #$000A

	BMI BRANCH_EPSILON

	DEX
	DEX

BRANCH_DELTA

	STX $14
	JSR $BA56    ;  Setup acceleration and starting position, based on Samus's pose

	BCS BRANCH_ZETA ; Whoops, can't fire in this pose. I don't think this ever happens

	LDA #$000A
	STA $18AC
	LDX $14
	LDA #$0004
	STA $0C90, X ;  Trail timer
	LDA $09A6
	ORA #$8000
	STA $0C18, X ;  Projectile type
	AND #$000F
	ASL A
	TAY
	LDA $C28F, Y ;  Sound? Guessing
	JSL $809021  ;  Plays sounds
	STZ $0DC0
	JSL $938000  ;  Sets up... damage, instruction (graphic only probably), Delay, and Size for beams
	LDA $09A6
	BIT #$1000

	BNE BRANCH_THETA

	LDA $8F
	BIT $09B2    ;  Check if fire was just pressed

	BNE BRANCH_THETA

	LDA $0E00
	BIT $09B2    ;  Or was pressed last frame. o_O

	BNE BRANCH_THETA

	LDA $0C18, X
	PHA
	AND #$003F
	TAY
	LDA $C283, Y
	AND #$00FF
	STA $0CCC
	PLA
	BIT #$0001   ;  Check Wave

	BNE BRANCH_IOTA

	BRA BRANCH_KAPPA

BRANCH_THETA

	LDA $0C18, X
	PHA
	AND #$003F
	TAY
	LDA $C254, Y
	AND #$00FF
	STA $0CCC
	PLA
	BIT #$0001

	BNE BRANCH_IOTA

BRANCH_KAPPA

	STZ $0BDC, X
	STZ $0BF0, X
	STX $0DDE
	JSR $BD64  ;  $83D64 IN ROM
	LDX $0DDE
	LDA $0C18, X
	BIT #$0F00

	BNE BRANCH_LAMBDA

	BRA BRANCH_MU

BRANCH_IOTA

	STZ $0BDC, X
	STZ $0BF0, X
	STX $0DDE
	JSR $BDB2  ;  $83DB2 IN ROM

BRANCH_MU

	STX $14
	LDA $0C18, X
	AND #$000F
	ASL A
	TAY
	LDA $B96E, Y
	STA $0C68, X ; Code to run. Handles movement, trails, and deletion
	JSL $90B197  ;  Sets initial Speed

BRANCH_LAMBDA

	PLP
	RTS
}