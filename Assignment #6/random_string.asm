; Assignment 5 Excerise #2: Random Strings
; By: Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

STR_COUNT = 10
STR_SIZE = 20

.data
aString BYTE STR_SIZE DUP(0), 0

.code
main PROC
    call clrscr                                         ; clear the screen
    mov ecx, STR_SIZE                                   ; loop counter

    L1:                                                 ;  loop to generate strings
        ; generate a single string
        mov eax, STR_COUNT                              ; load the string size into EAX
        mov esi, OFFSET aString                         ; load the string offset into ESI
        call CreateRandomString                         ; call to procedure to create a random string

        ; display the string
        mov edx, OFFSET aString                         ; load the string offset into EDX
            
        call WriteString                                ; write to console the string
        Call Crlf                                       ; print a new line
        loop L1                                         ; end of loop 1

    exit
main ENDP

; ---------------------------------------------------
CreateRandomString PROC
; 
; Create a random string.
; Recieves: ESI points to the string.
; EAX contains the string size.
; Returns: nothing
; ---------------------------------------------------
    push ecx                                            ; push ECX onto the stack
    mov ecx, eax                                        ; load the string size into ECX

    L1:                                                 ; loop to generate the string
        mov eax, 26                                     ; load all the alphabets
        call RandomRange                                ; call to generate a random number
        add al, 'A'                                     ; add the ASCII value of 'A' to the random number
        mov [esi], al                                   ; store the random number in the string
        inc esi                                         ; increment the string offset
        loop L1                                         ; end of L1 loop

    pop ecx                                             ; pop ECX from the stack
    ret                                                 ; return to main proc
CreateRandomString ENDP

END main