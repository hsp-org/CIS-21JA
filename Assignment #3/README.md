# 1. Integer Expression Calculation( 15 pts )
Using the AddTwo program from Section 3.2 as a reference, write a program that calculates the following expression, using registers: A = (A + B) − (C + D). Assign integer values to the EAX, EBX, ECX, and EDX registers.

Note: you can hard code integer literal onto the registers, e.g. mov    eax,55

 

Proof of your solution and testing is Required:

To show the operation of your program and to verify the calculation results, you should use the procedures WriteString and WriteInt to display the result. Read Ch 5.1 - 5.3 ( up to PowerPoint slide #20 in Module 2 ); see Example 3 & 5 on how to call these two procedures(Hint: you have to find out which register is for storing the parameter value). Make sure the library file Irvine32.inc is included on top of your code; this .inc file includes WriteString and WriteInt, and more. Without integrating the calls to these procedures to output the result onto the console, you Will Not earn full credit. 

In addition to the .asm file, please also submit screen captures showing the successful Build and execution with correct result - saved in pdf format. See sample of each shown below:

1. Screen capture of successful Build:

2. Screen capture of successful execution:

# 2. Listing File for AddTwoSum ( 10 pts )
Generate a listing file for AddTwoSum.asm(in 3.4.3 of the text) and write a description of the machine code bytes generated for each instruction. You can write your descriptions directly over the .lst file. You might have to guess at some of the meanings of the byte values.

Submit the .lst file with your description over it. 

Hints: Watch Tutorial #3 and read section 3.3.2 for an example of listing file and to learn how to configure the assembler to generate one; You can read more on op codes and other code bytes for each instruction in Ch 12.3.
