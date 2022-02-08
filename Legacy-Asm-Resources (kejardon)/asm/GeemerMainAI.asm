;$11E669-$11E6C1

;AI Initialization
org $A3E669
	LDX $0E54
	LDA $0F92, X	;Get orientation
	AND #$0003
	ASL A
	TAY
	LDA $E2CC, Y	;E25C, E278, E294, E2B0
	STA $0F92, X	;Set graphic AI
	LDA #$804D
	STA $0F8E, X	;Advanced hit box pointer. Probably unused, Geemers are simple squares
	LDA #$0001
	STA $0F94, X	;Start graphic AI immediately
	LDA #$E6C1
	STA $0FB2, X	;Main AI pointer initialized to E6C1
	LDA $0FB4, X	;'Speed' from SMILE. Intended to be 0000 - 001F or 00FF
	CMP #$00FF		;No idea what 00FF is intended to do... probably also 'no motion'
	BEQ +
	ASL A
	TAY
	LDA $E5F0, Y	;Just look them up. Speeds up from 00 to 1D, 1E is a repeat, 1F is 'no motion'
	STA $0FA8, X	;Horizontal and
	STA $0FAA, X	;Vertical speeds.
+
	LDA $0F86, X
	AND #$0003
	BNE +
	LDA $0FA8, X	;Swap X speed if initially moving left (0)
	EOR #$FFFF
	INC A
	STA $0FA8, X
	RTL
+
	CMP #$0002
	BNE +
	LDA $0FAA, X	;Swap Y speed if initially moving up (2)
	EOR #$FFFF
	INC A
	STA $0FAA, X
+
	RTL				;Right is probably 1, down is probably 3.




;Main AI script:
org $A3E6C2
	LDX $0E54
	JMP ($0FB2, X)	;Custom variable 5 = AI pointer

;Known pointers: E6C1 (Do nothing), E7F2 (Roof or floor), E6C8 (Left or Right wall), E785 (falling)

;E6C8: Left or Right Wall
	LDA $1840
	CMP #$001E
	BNE +
	LDA $183E
	CMP #$0014
	BNE +				;Checks for wall shaking due to super missile
	LDA $0FB2, X
	STA $7E7806, X		;Save current AI
	LDA #$E785
	STA $0FB2, X		;Set to falling AI
+
	STZ $12
	STZ $14
	LDA $0FA8, X		;Current horizontal speed
	BPL +
	DEC $14
+
	STA $13
	LDA $14
	BPL +
	DEC A
	BRA ++
+
	INC A
++
	STA $14
	JSL $A0C6AB 		;Common horizontal movement routine. NOT vertical.
	BCC +++				;Branch if no wall encountered
	LDA #$0000
	STA $7E7808, X		;0 frames since wall detected?
	JSL $A0C8AD			;Align to vertical slopes. Um. Wait. When would this happen? Maybe for one brief moment at a corner
	STZ $12
	STZ $14
	LDA $0FAA, X
	BPL +
	DEC $14
+
	STA $13
	JSL $A0C786			;Commmon vertical movement routine.
	BCS +				;Branch if roof/floor encountered
	RTL
+
	LDA $0FA8, X
	EOR #$FFFF
	INC A
	STA $0FA8, X		;Reverse horizontal speed
	LDY $0FB6, X		;'Speed2' from SMILE
	LDA $0FAA, X		;Just checking sign (Goto E63C if moving down, E630 if moving up)
	BPL +
	LDA $E630, Y		;E294, E294, E294, B5D3, 96AB, 98AB
	BRA ++
+
	LDA $E63C, Y		;E2B0, E2B0, E2B0, B5DB, 96C3, 990B
++
	STA $0F92, X		;Set graphic AI
	LDA #$0001
	STA $0F94, X		;and tell it to go now. Note that the new graphic AIs generally change the AI pointer
	RTL
+++
	LDA $7E7808, X
	INC A
	STA $7E7808, X		;How many frames a wall has not been detected?
	CMP #$0004
	BMI +
	LDA $0FB2, X
	STA $7E7806, X		;Save current AI
	LDA #$E785
	STA $0FB2, X		;Set falling AI
	RTL
+
	LDA $0FAA, X
	EOR #$FFFF
	INC A
	STA $0FAA, X		;Change speed (attempt to turn around corner)
	LDY $0FB6, X
	LDA $0FAA, X
	BPL +
	LDA $E630, Y
	BRA ++
+
	LDA $E63C, Y
++
	STA $0F92, X
	LDA #$0001
	STA $0F94, X
	RTL


;E785: Falling
	LDA $7E7802, X		;Uh. Not sure when this was initialized.
	STA $12
	LDA $7E7804, X
	STA $14
	JSL $A0C786			;Vertical motion
	BCC +				;Branch if no collision
	LDA $0FB4, X		;Check initial speed?
	CMP #$00FF
	BNE ++
	LDA #$0080
	STA $0FA8, X
	STA $0FAA, X
++
	LDA #$0000
	STA $7E7802, X
	STA $7E7804, X
	STA $7E7808, X		;Clear speeds
	LDA $7E7806, X
	STA $0FB2, X		;Restore previous AI
	RTL
+
	LDA $7E7804, X
	CMP #$0004			;Cap speed at 4 pixels per frame
	BPL +
	LDA $7E7802, X
	CLC
	ADC #$8000
	STA $7E7802, X
	LDA $7E7804, X
	ADC #$0000
	STA $7E7804, X		;Accelerate due to gravity
+
	LDA $7E7802, X
	BNE +
	LDA $7E7804, X
	BNE +
	LDA #$E6C8
	STA $0FB2, X		;... If stopped, set to floor AI? This probably doesn't ever happen
+
	RTL


;E7F2: Floor/Roof. Almost the same as walls but for horizontal
	LDA $1840
	CMP #$001E
	BNE +
	LDA $183E
	CMP #$0014
	BNE +
	LDA $0FB2, X
	STA $7E7806, X
	LDA #$E785
	STA $0FB2, X
+
	STZ $12
	STZ $14
	LDA $0FAA, X
	BPL +
	DEC $14
+
	STA $13
	LDA $14
	BPL +
	DEC A
	BRA ++
+
	INC A
++
	STA $14
	JSL $A0C786		;Vertical movement
	BCC +++			;Branch if no roof/ceiling hit
	LDA #$0000
	STA $7E7808, X
	JSR $E8A5		;This is new... Scales speed according to slope currently traversing and puts into $14.$12
	JSL $A0C6AB		;Horizontal movement
	BCS +
	JSL $A0C8AD
	RTL
+
	LDA $0FAA, X
	EOR #$FFFF
	INC A
	STA $0FAA, X
	LDY $0FB6, X
	LDA $0FA8, X
	BPL +
	LDA $E648, Y
	BRA ++
+
	LDA $E654, Y
++
	STA $0F92, X
	LDA #$0001
	STA $0F94, X
	RTL
+++
	LDA $7E7808, X
	INC A
	STA $7E7808, X
	CMP #$0004
	BMI +
	LDA $0FB2, X
	STA $7E7806, X
	LDA #$E785
	STA $0FB2, X
	RTL
+
	LDA $0FA8, X
	EOR #$FFFF
	INC A
	STA $0FA8, X
	LDY $0FB6, X
	LDA $0FA8, X
	BPL +
	LDA $E648, Y
	BRA ++
+
	LDA $E654, Y
++
	STA $0F92, X
	LDA #$0001
	STA $0F94, X
	RTL