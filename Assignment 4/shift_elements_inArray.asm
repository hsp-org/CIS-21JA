; Assignment 4 Exercise 3: Shift Elements in an Array
; By Hari Prakash

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
array DWORD 10h, 20h, 30h, 40h
array_size DWORD LENGTHOF array
before_shifting BYTE "Before Shifting: ", 0
after_shifting BYTE "After Shifting: ", 0

.code
main PROC
    
    mov edx, OFFSET before_shifting         ; edx holds the content of before_shifting
    call WriteString                        ; write to console window

    mov ecx, LENGTHOF array                 ; load the length of array into ecx
    mov esi, OFFSET array                   ; esi will point to the start of the array
    mov ebx, 4                              ; setting ebx to 4 
    call DumpMem                            ; display the memeory of the array 

    mov esi, OFFSET array                   ; esi will have the address of the first element
    mov eax, [esi]                          ; eax will have the address of previous element
    mov ecx, LENGTHOF array-1               ; ecx will be the loop counter
    
    mov ebx, [esi+4]                        ; moving the ebx to the next element 
    mov [esi+4], eax                        ; replacing the next element with the current one
    mov eax, ebx                            ; eax will now hold the value of ebx
    add esi, 4                              ; move the esi to the next element

    mov array, eax                          ; put the last element, which you got from ebx, into the start of the array
    call Crlf                               ; add a new line

    mov edx, OFFSET after_shifting          ; edx will print the contents of after_shifting
    call WriteString                        ; display to console window

    mov ecx, LENGTHOF array                 ; show the numbers of elements again
    mov esi, OFFSET array                   ; esi holds new updated array 
    mov ebx, 4                              ; ebx will set the size to 4 bytes
    call DumpMem                            ; show memory of array after shifting

    invoke ExitProcess, 0
main ENDP

END main
