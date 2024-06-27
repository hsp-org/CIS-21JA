; Assignment 6 Exercise #1: Simple Addition
; By: Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
val1 SDWORD ?
val2 SDWORD ?
str1 BYTE "Enter the first integer: ",0
str2 BYTE "Enter the second integer: ",0
str3 BYTE "The sum is: ",0

.code
main PROC
    call Clrscr                                             ; clear the screen

    ; locate the cursor near the middle
    mov dl, 37                                              ; cursor's x-coordinate (column)
    mov dh, 14                                              ; cursor's y-coordinate (row)
    call Gotoxy                                             ; move the cursor to x=37, y=14

    ; prompt the number input
    mov edx, OFFSET str1                                    ; load edx with the offset of str1
    call WriteString                                        ; write to console the stored value in edx

    ; read and save the first input
    call ReadInt                                            ; read input value from keyboard for first integer
    mov val1, eax                                           ; save the input to val1

    ; input the second integer
    ; locate the cursor below the first input
    mov dl, 37                                              ; cursor's 2nd x-coordinate (column)
    mov dh, 16                                              ; cursor's 2nd y-coordinate (row)
    call Gotoxy                                             ; move the cursor to x=37, y=16

    ; prompt the number input
    mov edx, OFFSET str2                                    ; load edx with the offset of str2
    call WriteString                                        ; write to console the stored value in edx

    ; read and save the second input
    call ReadInt                                            ; read input value from keyboard for second integer
    mov val2, eax                                           ; save the input to val2

    ; perform addition
    mov eax, val1                                           ; load eax with the value of val1
    add eax, val2                                           ; add the value of val2 to eax

    ; locate the cursor below the second input
    mov dl, 37                                              ; cursor's 3rd x-coordinate (column)
    mov dh, 18                                              ; cursor's 3rd y-coordinate (row)
    call Gotoxy                                             ; move the cursor to x=37, y=18

    ; display the sum
    mov edx, OFFSET str3                                    ; load edx with the offset of str3
    call WriteString                                        ; write to console the stored value in edx
    call WriteInt                                           ; write the sum to console
    call Crlf                                               ; print new line
    call WaitMsg                                            ; pause the program


    exit                                                    ; exit the program
    invoke ExitProcess,0                                    ; stop program
main ENDP
end main
