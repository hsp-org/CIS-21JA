; Assignment 5 Exercise #2: Bitwise Multiplication
; By: Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data 
c1 BYTE "Case #1: 65531 * 1029 = ", 0
c2 BYTE "Case #2: 699050 * 5461 = ", 0
c3 BYTE "Case #3: 21 * 178956970 = ", 0

.code 
main PROC 

    ; Case #1
    mov edx, OFFSET c1                  ; display c1's string message
    call WriteString                    ; write to console
    mov ebx, 65531                      ; multiplicand
    mov eax, 1029                       ; multiplier
    call Multiply                       ; call Multiply procedure
    call WriteDec                       ; convert to decimal and write to console
    call CrLf                           ; print new line

    ; Case #2
    mov edx, OFFSET c2                  ; display c2's string message
    call WriteString                    ; write to console
    mov ebx, 0AAAAAh                    ; multiplicand but in hex
    mov eax, 01555h                     ; multiplier but in hex
    call Multiply                       ; call Multiply procedure
    call WriteDec                       ; convert to decimal and write to console
    call CrLf                           ; print new line

    ; Case #3           
    mov edx, OFFSET c3                  ; display c3's string message
    call WriteString                    ; write to console
    mov ebx, 015h                       ; multiplicand but in hex
    mov eax, 0AAAAAAAh                  ; multiplier but in hex
    call Multiply                       ; call Multiply procedure
    call WriteDec                       ; convert to decimal and write to console
    call CrLf                           ; print new line

    invoke ExitProcess, 0               ; stop the program
main ENDP 



Multiply PROC                           ; start of Multiply procedure
    push ecx                            ; ecx is used as a counter
    push edx                            ; edx is used to store multiplier
    push esi                            ; esi is used to store multiplicand

    mov edx, eax                        ; save multiplier in edx
    mov eax, 0                          ; clear eax for sum
    mov cl, 0                           ; clear cl for counter

    L1:                                 ; start of L1
        shr edx, 1                      ; shift edx to the right by 1
        jnc L2                          ; if CF = 0, jump to L2
        mov esi, ebx                    ; save multiplicand in esi
        shl esi, cl                     ; shift esi to the left by cl
        add eax, esi                    ; add esi to eax

    L2:                                 ; start of L2
        inc cl                          ; increament cl by 1 to keep in check the number of shifts
        cmp cl, 32                      ; compare cl to 32 because there are 32 bits in a DWORD
        jb L1                           ; if cl < 32, then jump to L1

        pop esi                         ; restore esi from stack
        pop edx                         ; restore edx from stack
        pop ecx                         ; restore ecx from stack
        ret                             ; return to main
Multiply ENDP                           ; end of Multiply procedure

END main
