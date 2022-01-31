$100FD4-$101168
{
	PHB
	PEA #$A000
	PLB
	PLB
	REP #$30
	LDA $0E4C  ; Checks to see if there are any enemies. If not, JMP to end

	BNE BRANCH_ALPHA

	JMP $9145  ;  $101145 IN ROM

BRANCH_ALPHA

	LDA $0E1C  ; Unknown at the moment
	CMP #$FFFF

	BEQ BRANCH_BETA

	TAX
	LDA #$0040
	STA $0FA2, X
	LDA #$FFFF
	STA $0E1C

BRANCH_BETA

	STZ $17AA ; Index of enemy indexes to process
	STZ $17A8 ; Index of enemy indexes that might interact with Samus

$100FFF ALTERNATE ENTRY POINT

	LDY $17A8
	LDA $17AC, Y
	CMP #$FFFF ; JMP to end when there are no more enemy indexes

	BNE BRANCH_GAMMA

	JMP $9145  ;  $101145 IN ROM

BRANCH_GAMMA

	STA $0E54 ; Current enemy index
	TAX
	CLC
	ADC #$0F78
	STA $0E58 ; pointer to start of current enemy's memory
	LDA $0FA6, X ; Enemy data bank
	STA $1786
	LDA $0F86, X ; Enemy property bits
	BIT #$0400

	BNE BRANCH_DELTA ; This branch shouldn't ever happen, I think.

	LDA $0FA0, X ; Unknown use for right now

	BEQ BRANCH_EPSILON

	DEC $0FA0, X
	JMP $9057  ;  $101057 IN ROM

BRANCH_EPSILON

	LDA $0E12 ; Debug only, ignore

	BNE BRANCH_DELTA ; Never branches

	LDA $0A78 ; If gameplay is paused with x-ray or reserve tanks
	ORA $185E ; Debug only, ignore

	BNE BRANCH_ZETA

	JSR $9758  ;  $101758 IN ROM. Interaction with Samus's projectiles, bombs, and herself.
	LDX $0E54
	LDA $0F78, X ; Enemy ID

	BNE BRANCH_ZETA ; I think this should always happen.

	JMP $9118  ;  $101118 IN ROM

BRANCH_ZETA

	LDX $0E54 
	LDA $0F88, X ; Extra property bits
	BIT #$0001 ; Check whether or not to display

	BNE BRANCH_THETA

$101057 ALTERNATE ENTRY POINT
BRANCH_DELTA

	STZ $17A2
	LDA $0A78 ; if game is paused ala x-ray or reserve tank
	ORA $185E

	BEQ BRANCH_IOTA

	LDA $0F78, X
	TAY
	LDA $0020, Y

	BEQ BRANCH_THETA

	STA $1784 ; Set x-ray/Reserve tank AI to run. Skipped if #$0000

	BRA BRANCH_KAPPA

BRANCH_IOTA

	LDX #$0000
	LDY $0E54
	LDA $0F8A, Y ; AI Index

	BEQ BRANCH_RHO

BRANCH_SIGMA

	INX
	LSR A

	BCS BRANCH_RHO

	BRA BRANCH_SIGMA

BRANCH_RHO

	TXA
	ASL A
	CLC ; So A = 2*(lowest bit set in 0F8A) at this point, or 0 if none are set
	ADC $0F78, Y
	TAX
	LDA $0018, X
	STA $1784 ; Long pointer to stuff in the enemy's bank

BRANCH_KAPPA

	PHB
	JSL $A09096  ;  $101096 IN ROM. Is this obfuscation necessary?
	PLB

	BRA BRANCH_LAMBDA

$101096 ALTERNATE ENTRY POINT

	LDX $0E54
	LDA $0FA6, X
	STA $1786
	XBA
	PHA
	PLB
	PLB
	JML [$1784] ; And it's off to the movement AI.

BRANCH_LAMBDA

	LDA $0A78
	ORA $185E

	BNE BRANCH_THETA

	LDX $0E54
	INC $0FA4, X
	LDA $0F86, X
	BIT #$2000 ; Check if enemy should be processed

	BEQ BRANCH_THETA

	LDA #$0002
	STA $7EF378
	JSR $C26A  ;  $10426A IN ROM. Processes enemy instructions (similar to PLM stuff)

BRANCH_THETA

	LDX $0E54
	LDA $0F88, X
	BIT #$0001 ; Check whether or not to run movement AI?

	BEQ BRANCH_MU

	LDA $0F9C, X
	CMP #$0001

	BEQ BRANCH_NU

	LDA $0F9E, X
	CMP #$0001

	BNE BRANCH_MU

BRANCH_NU

	LDA #$0000
	STA $7E7002, X
	LDA #$0000
	JSL $A0A3AF  ;  $1023AF IN ROM

BRANCH_MU

	LDX $0E54
	LDA $0F88, X
	BIT #$0004

	BNE BRANCH_XI

	JSL $A0ADE7  ;  $102DE7 IN ROM

	BEQ BRANCH_XI

	BRA BRANCH_OMICRON

BRANCH_XI

	LDX $0E54
	LDA $0F86, X
	BIT #$0300

	BNE BRANCH_OMICRON

	LDA $17A2
	BIT #$0001

	BNE BRANCH_OMICRON

	JSR $9423  ;  $101423 IN ROM

$101118 ALTERNATE ENTRY POINT
BRANCH_OMICRON

	LDX $0E54
	LDA $0F9C, X

	BEQ BRANCH_PI

	LDA $0A78
	ORA $185E

	BNE BRANCH_PI

	DEC $0F9C, X
	LDA $0F9C, X
	CMP #$0008

	BPL BRANCH_PI

	LDA $0F8A, X
	AND #$FFFD
	STA $0F8A, X

BRANCH_PI

	INC $17A8
	INC $17A8
	JMP $8FFF  ;  $100FFF IN ROM. Loops to next enemy

$101145 ALTERNATE ENTRY POINT

	JSL $B4BC82  ;  $1A3C82 IN ROM
	INC $0E44
	LDA #$FFFF
	STA $182C
	STA $182E
	STA $1830
	STA $1832
	STZ $1834
	STZ $1836
	STZ $1838
	STZ $183A
	PLB
	RTL
}