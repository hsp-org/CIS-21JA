; Assignment 5 Excerise #1: Simple Addition
; By: Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
lowerLimit dword 20
upperLimit dword 40
array_1 sdword 10,30,25,15,17,19,40,41,43
array_2 sdword 10,-30,25,15,-17,55,40,41,43
output1 byte "sum of Array_1 is: ",0			; string statement for output1
output2 byte "sum of Array_2 is: ",0			; string statement for output2
sol1 DWORD ?									; store sum of array_1 in sol1
sol2 DWORD ?									; store sum of array_2 in sol2

.code
main PROC
	mov esi, OFFSET array_1			; load address of array_1 into esi
	mov ecx, LENGTHOF array_1		; load length of array_1 into ecx
	mov eax, 0						; put sum = 0

	sum1:							; start of sum1
		mov ebx, [esi]				; load value of array_1 into ebx
		cmp ebx, lowerLimit			; compare value of array_1 with lowerLimit
		jl skip1					; if value of array_1 is less than lowerLimit then do skip1
		cmp ebx, upperLimit			; compare value of array_1 with upperLimit
		jg skip1					; if value of array_1 is greater than upperLimit then do skip1
		add eax, ebx				; add value of array_1 to sum

	skip1:							; start of skip1
		add esi, 4					; increment esi by 4 to next element
		loop sum1					; loop sum1

	mov sol1, eax					; sum value of array_1 is stored in sol1

	mov esi, OFFSET array_2			; load value of array_2 into esi
	mov ecx, LENGTHOF array_2		; load length of array_2 into ecx	
	mov eax, 0						; put sum = 0

	sum2:							; start of sum2
		mov ebx, [esi]				; load value of array_2 into ebx
		cmp ebx, lowerLimit			; compare value of array_2 with lowerLimit
		jl skip2					; if value of array_2 is less than lowerLimit then do skip2
		cmp ebx, upperLimit			; compare value of array_2 with upperLimit
		jg skip2					; if value of array_2 is greater than upperLimit then do skip2
		add eax, ebx				; add value of array_2 to sum

	skip2:							; start of skip2
		add esi, 4					; increment esi by 4 to next element
		loop sum2					; loop sum2

	mov sol2, eax					; sum value of array_2 is stored in sol2

	mov edx, OFFSET output1			; load edx value into output1
	call WriteString				; write output1 to console
	mov eax, sol1					; load eax value into sol1
	call WriteDec					; convert sol1 to decimal
	call Crlf						; print new line

	mov edx, OFFSET output2			; load edx value into output2
	call WriteString				; write output2 to console
	mov eax, sol2					; load eax value into sol2
	call WriteDec					; convert sol2 to decimal
	call Crlf						; print new line

	invoke ExitProcess,0			; stop program
main ENDP
end main

