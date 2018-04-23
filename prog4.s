@ Austin Queen & Andre Robinson
@ austinq
@ Program 4 
@ This program
@ Rose Lowe
@ Due: Wednesday, April 25th

key	.req r0
str     .req r1
encryp  .req r2
decryp  .req r3
count   .req r4


	.file   "prog4.s"
        .text
        .align  2
        .global main
	.global prepareKey, encode, decode
	.type   prepareKey, %function
        .type   encode, %function
        .type   decode, %function

.prepareKey:
	push {r4, r5, lr}        	
        
        ldr r5, [r0]		// store dereference key into r5
	mov r4, #27		// store 27 in r4 for character comparison
        cmp r5, r4
        bge next
        


        pop  {r4,r5, pc}
.encode:
	



.decode:
  
