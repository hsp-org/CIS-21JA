; Assignment 4 Exercise 1: Convert Big Endian to Little Endian
; By Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ?

.code
main PROC

    mov al, byte ptr bigEndian+3                        ; put 78h into al
    mov ah, byte ptr bigEndian+2                        ; put 56h into ah
    mov word ptr littleEndian, ax                       ; store 78h and 56h as the first word of littleEndian

    mov al, byte ptr bigEndian+1                        ; put 34h of bigEndian into al
    mov ah, byte ptr bigEndian                          ; put 12h of bigEndian into ah
    mov word ptr littleEndian+2, ax                     ; store 34h and 12h as the secon word of littleEndian

    ; Output memory to verify correct byte order
    mov esi, OFFSET bigEndian
    mov ecx, SIZEOF bigEndian
    mov ebx, TYPE bigEndian
    mov ebx, BYTE                                       ; need this to display ebx correctly
    call DumpMem

    mov esi, OFFSET littleEndian
    mov ecx, SIZEOF littleEndian
    mov ebx, TYPE littleEndian
    mov ebx, BYTE                                       ; need this to display ebx correctly
    call DumpMem

    invoke ExitProcess, 0
main ENDP

END main
