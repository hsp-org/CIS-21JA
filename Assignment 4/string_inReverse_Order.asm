; Assignment 4 Exercise 2: String in Reverse Order
; By Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
BYTE 4 DUP('$')
source BYTE "This is the source string",0
BYTE 4 DUP('%')
target BYTE SIZEOF source DUP('#')
BYTE 4 DUP('^')


.code
main PROC
    mov esi, 0                          ; start in the begining of source string
    mov edi,LENGTHOF source - 2         ; position edi to point last character value in the target string (does not include null terminator)
    mov ecx,SIZEOF source               ; ecx value is length of source string (including null terminator)
    L1:                                 ; loop L1 starts
        mov al,source[esi]              ; load the character value from source string to AL 
        mov target[edi],al              ; hold the character value from AL into the target string at position edi
        inc esi                         ; increment esi to next character in the source string
        dec edi                         ; decrement edi to previous position in target string
        loop L1                         ; repeat loop L1 until finished
    
    mov edx, OFFSET target              ; edx hold the contents of target
    call WriteString                    ; print to console window
    call Crlf                           ; add a new line


    ; Display the whole data bank
    mov edx, OFFSET source-4      ; display the 4 "$" and source string
    call WriteString
    mov al, source[SIZEOF source-1] ; if the last char of source is Null, then display it as '.'
    cmp al, 0
    jz Disp_Null_char_1
    call WriteChar
    jmp Disp_target_str
    Disp_Null_char_1:
    mov al, '.'                   ; use '.' to represent the Null
    call WriteChar
    Disp_target_str:
    mov edx, OFFSET target-4      ; display the 4 "%" and target string
    call WriteString
    mov al, target[SIZEOF target-1] ; if the last char of target is Null, then display it as '.'
    cmp al, 0
    jz Disp_Null_char_2
    call WriteChar
    jmp Disp_4_hats
    Disp_Null_char_2:
    mov al, '.'                   ; use '.' to represent the Null
    call WriteChar
    Disp_4_hats:
    mov edx, OFFSET target + SIZEOF target   ; display the 4 "^"
   call WriteString
   

    invoke ExitProcess, 0
main ENDP

END main
