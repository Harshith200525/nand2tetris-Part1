// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

(CHECKING)

@KBD
D = M //In this function I am taking the value from the keyboard register
@CLICK
D;JGT //I am checking if the user is clicking or not, if clicked jumping to click label
@NO
D;JMP //If not jump to NO label

(CLICK)

@R0
M = -1 // I am assigning a value of -1 to a register
@BLACKEN
0;JMP // And asking it to jump to blacken label

(NO)

@R0
M = 0 // In No label I am assigning a register value of 0
@BLACKEN
0;JMP // And asking it to jump to blacken label

(BLACKEN)

@8191
D = A // In blacken label I am assigning 8191 becuase we need 8192 pixels to be filled
@R1
M = D // I am assigning it to a register R1

(NEXT)
@R1
D = M // I am taking the value out of the R1 register

@pos 
M = D // I am giving the same value to the pos register

@SCREEN 
D = A // In here I am taking screen register

@pos 
M = M + D // Adding the number of pixels that needed to be added for the display screen

@R0
D = M // I am checking the value of R0 register we did before jumping

@pos
A = M 
M = D // I am assigning the values of that to the pos

@R1
D = M - 1
M = D // I am negating one from the R1 register and adding it back

@NEXT
D;JGE // This will loop will run until it blackens the screen

@CHECKING
0;JMP // This will will trigger an while loop to not execute when the user does not press any button