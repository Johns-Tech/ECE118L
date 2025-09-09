//include "address_map_arm.s"
/*
	write a program which reads in the value of the pushbuttons
	(KEY) values. When no pushbutton is pressed, the red LEDs should be
	completely off. When any button is pressed, all the red LEDs should illuminate.
*/
.data
.equ LEDR_BASE,0xff200000
.equ KEY_BASE, 0xff200050

.text
.global _start
_start:
	LDR R1, =LEDR_BASE /* Address of red LEDs. */
	LDR R2, =KEY_BASE /* Address of keys. */
	
	LOOP:	LDR R3, [R2] /* Read the state of keys.*/
			CMP R3, #0
			BNE TURNLEDSON
			/* The state of the keys are of a zero value leave all of leds off !*/
			STR R3, [R1]
			B LOOP
	TURNLEDSON:
			LDR R3, =0xFFFFFFFF /* The keys are not zero so turn on all leds !*/
			STR R3, [R1]
			B LOOP
.end