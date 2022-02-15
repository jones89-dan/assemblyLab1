.arch armv6
.eabi_attribute 28, 1
.eabi_attribute 20, 1
.eabi_attribute 21, 1
.eabi_attribute 23, 3
.eabi_attribute 24, 1
.eabi_attribute 25, 1
.eabi_attribute 26, 2
.eabi_attribute 30, 6
.eabi_attribute 34, 1
.eabi_attribute 18, 4
.file	"test.c"
.text
.align	2
.global	test
.arch armv6
.syntax unified
.arm
.fpu vfp
.type	test, %function
@ test function uses the modulo operator to find int in the ones place
test:
@ args = 0, pretend = 0, frame = 8
@ frame_needed = 1, uses_anonymous_args = 0
@ link register save eliminated.

@ store value in frame pointer
str	fp, [sp, #-4]!
@ does interger addition
add	fp, sp, #0
@ does integer subtraction
sub	sp, sp, #12
@ stores value in register zero
str	r0, [fp, #-8]
@ create a literal constant for register two
ldr	r2, [fp, #-8]
ldr	r3, .L3
@ interprets values
smull	r1, r3, r3, r2
@ arithmetic shift
asr	r1, r3, #2
asr	r3, r2, #31
sub	r1, r1, r3
@ copies data form one r1 into r3
mov	r3, r1
@ performs a logical shift
lsl	r3, r3, #2
add	r3, r3, r1
lsl	r3, r3, #1
sub	r1, r2, r3
mov	r3, r1
mov	r0, r3
add	sp, fp, #0
@ sp needed
ldr	fp, [sp], #4
bx	lr
.L4:
.align	2
.L3:
.word	1717986919
.size	test, .-test
.section	.rodata
.align	2

@ string data
.LC0:
.ascii	"The digit in the ones place of %d is %d\012\000"
.text
.align	2
.global	main
.syntax unified
.arm
.fpu vfp
.type	main, %function

@ main function declares int, passes value to test funtion, prints result
main:
@ args = 0, pretend = 0, frame = 16
@ frame_needed = 1, uses_anonymous_args = 0
push	{fp, lr}
add	fp, sp, #4
sub	sp, sp, #16
str	r0, [fp, #-16]
str	r1, [fp, #-20]
ldr	r3, .L7
str	r3, [fp, #-8]
ldr	r0, [fp, #-8]
bl	test
mov	r3, r0
mov	r2, r3
ldr	r1, [fp, #-8]
ldr	r0, .L7+4
bl	printf
mov	r3, #0
mov	r0, r3
sub	sp, fp, #4
@ sp needed
pop	{fp, pc}
.L8:
.align	2
.L7:
.word	294
.word	.LC0
.size	main, .-main
.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
.section	.note.GNU-stack,"",%progbits
