# Programming Exercise 1 : CONVERTING FROM BIG ENDIAN TO LITTLE ENDIAN

Write a program that uses the variables below and MOV instructions to copy the value from bigEndian to littleEndian, reversing the order of the bytes. The number’s 32-bit value is understood to be 12345678 hexadecimal.
```
.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD?
``` 

Hint: Using DumpMem is the best way to show the effect - byte orders "before" and "after" 
```
Sample output:

DumpMem output showing Big Endian Byte Order
Dump of offset 001E6000
-------------------------------
12 34 56 78

DumpMem output showing Little Endian Byte Order
Dump of offset 001E6004
-------------------------------
78 56 34 12
IMPORTANT: for this exercise, NOT allowable to use any one of these directives: .IF, .ELSE, .ELSEIF, .WHILE, .REPEAT, etc
```
 

# Programming Exercise 2 : COPY A STRING IN REVERSE ORDER

Write a program with a loop (use the Loop instruction and ECX) and indirect addressing that copies a string from source to target, reversing the character order in the process. You MUST use the exact data block, memory allocation and initialization, as shown in the followings for testing - for showing that your code would not over-write the original data at the head(4 '$'s) middle(4 '%'s) and tail(4 '^'s):
```
BYTE 4 DUP('$')
source BYTE "This is the source string",0
BYTE 4 DUP('%')
target BYTE SIZEOF source DUP('#')
BYTE 4 DUP('^')
```
Hint: Should Not copy the null character, 0, at the end of the source string to the front of the target string. And, finish writing the target string by writing the null character, 0, to the last byte - replacing the last '#' there.

In the output of the program, both the source and target(reversed) strings should be shown, by calling the Irvine peripheral procedure(s). Use the following test code to display the Whole Data Bank:
```
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
```   
IMPORTANT: for this exercise, NOT allowable to use any one of these directives: .IF, .ELSE, .ELSEIF, .WHILE, .REPEAT, etc

 
# Programming Exercise 3 : SHIFTING THE ELEMENTS IN AN ARRAY

Using a loop and indexed addressing, write code that rotates the members of a 32-bit integer array forward - from lower index elements to upper index elements - one position; rotating elements in the SAME array, NOT copying elements to a new array with shifted positions. The value at the end of the array must wrap around to the first position. For example, the array  [10h, 20h, 30h, 40h] would be rotated to become [40h, 10h ,20h ,30h]. 

In the output of the program, the array values both before and after shifting should be shown, by calling the Irvine peripheral procedure(s).

IMPORTANT: for this exercise, NOT allowable to use any one of these directives: .IF, .ELSE, .ELSEIF, .WHILE, .REPEAT, etc
