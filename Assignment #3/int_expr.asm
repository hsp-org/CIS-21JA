; Assignment 3: Integer Expression Calculation
; By: Hari Prakash

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data
output_statement	BYTE "The result of integer expression (A+B) - (C+D) is: ", 0
num_statement		BYTE "A=85, B=34, C=158, D=9",0

.code
main proc
	
	mov edx, OFFSET num_statement	; put "num_statement" into edx
	call WriteString			  	; show num_statement

	call Crlf						; put a new line after num_statement

	mov	eax, 85		; A = 85
	mov ebx, 34		; B = 34
	mov ecx, 158	; C = 158
	mov edx, 9		; D = 9

	;	(A+B) - (C+D)
	add	eax, ebx	; add the two values of A and B into As location
					; so 85 + 34 = 119, 119 will be new value of A

	add ecx, edx	; add the two values of C and D into Cs location
					; so 158 + 9 = 167, 167 will be the new value of C

	sub eax, ecx	; subtract current value A to the current value of C
					; so its 119 - 167 = -48. The result -48 will now be the new value of A

	mov	edx, OFFSET output_statement		; put the "output_statement" into edx
	call WriteString						; return the "output" to terminal
	call WriteInt							; return eax to terminal

	call Crlf								; put new line after output_statement

	invoke ExitProcess,0
main endp
end main
