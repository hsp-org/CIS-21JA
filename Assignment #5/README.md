# Programming Exercise 1 (20 pts) - Summing Array Elements in a Range
Write a snippet of code that calculates the sum of all array elements falling within the range lower limit...upper limit (inclusive). In other words, when the array element is outside of the range, don't add it to the sum. Put the sum in the EAX register. Then display it on the console; by calling DumpRegs, or according to your won output display design for ease of read format.

Use the following pair of range variables, and given data sets for your test cases:
```
.data
lowerLimit dword 20
upperLimit dword 40
array_1 sdword 10,30,25,15,17,19,40,41,43
array_2 sdword 10,-30,25,15,-17,55,40,41,43
```
Note:  Your program should calculate TWO sums; run the program twice, have two similar code blocks, or call the procedure twice(if you implement a procedure, not required). But, Don't sum all the elements of Both arrays from above.

IMPORTANT: for this exercise, NOT allowable to use any one of these directives: .IF, .ELSE, .ELSEIF, .WHILE, .REPEAT, etc

 
# Programming Exercise 2 (20 pts) - Bitwise Multiplication
Write a procedure named BitwiseMultiply that multiplies any unsigned 32-bit integer by EAX(multiplier), using Only Shifting and Addition. Pass the unsigned 32-bit integer(multiplicand) to the procedure in the EBX register, and return the product in the EAX register. Write a short test program that calls the procedure and displays the product. (We will assume that the product is never larger than 32 bits.)

This is a fairly challenging program to write. One possible approach is to use a loop to shift the multiplier to the right, keeping track of the number of shifts that occur before the Carry flag is set. The resulting shift count can then be applied to the SHL instruction, using the multiplicand as the destination operand. Then, the same process must be repeated until you find the last 1 bit in the multiplier.

 

Test Cases :

![test case image](https://github.com/hsp-org/CIS-21JA/blob/main/Assignment%20%235/image.png)

 

IMPORTANT: for this exercise, NOT allowable to use any one of these directives: .IF, .ELSE, .ELSEIF, .WHILE, .REPEAT, etc
