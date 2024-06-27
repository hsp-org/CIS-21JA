; Assignment 5 Exercise #3: Color Matrix
; By: Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

CHAR_VAL = 'X'
NUM_OF_ROWS = 16
NUM_OF_COLS = 16

.code 
main PROC
    call Clrscr                         ; Clear the screen
    mov ecx, NUM_OF_ROWS                ; load the number of rows into ecx
    mov edx, 0                          ; reset the background color to 0

    L1:                                 ; start of L1 loop
        push ecx                        ; push ecx onto the stack
        mov ecx, NUM_OF_COLS            ; load the number of columns into ecx
        mov ebx, 0                      ; reset the foreground color to 0

        L2:                             ; start of L2 loop
            mov eax, edx                ; load the background color into eax
            shl eax, 4                  ; shift the background color to the left by 4 bits
            or eax, ebx                 ; combine the background and foreground colors
            call SetTextColor           ; set the text color

            mov al, CHAR_VAL            ; load the character value into al
            call WriteChar              ; write 'X' to the screen

            inc ebx                     ; increment the foreground color
            and ebx, 0Fh                ; foreground color from 0 - 15
            loop L2                     ; end loop L2

        call Crlf                       ; print a new line
        pop ecx                         ; pop ecx from the stack

        inc edx                         ; increment the background color
        and edx, 0Fh                    ; background color from 0 - 15
        loop L1                         ; end loop L1

    mov eax, white + (black * 16)       ; Set text color to white on black
    call SetTextColor                   ; set the text color
    call Crlf                           ; print a new line
    exit
main ENDP
END main
