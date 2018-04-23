@ Austin Queen & Andre Robinson
@ austinq
@ Program 4 
@ This program
@ Rose Lowe
@ Due: Wednesday, April 25th

key	.req r0
strn    .req r1
encryp  .req r2
decryp  .req r3
count   .req r4
alphab	.req r5
keystr	.req r6

	.file   "prog4.s"
        .text
        .align  2
        .global main
	.global prepareKey, encode, decode
	.type   prepareKey, %function
        .type   encode, %function
        .type   decode, %function

.prepareKey:
	push {r4, r5, r6, lr}        	
        sub sp, sp, #54			// make space for two arrays of 27 chars
	ldr alphab, sp			// one array in r5 (alphabet)
	add keystr, sp, #27		// second array in r6 (keystring)
	mov count, #0
        ldr r1, [r0]			// store dereference key into r1
	
	forLoop1:               	// Build the alphabet array
		cmp count, #26
		bge done
		
		add r2, count, #97	// count + 'a', i.e. the next letter
		str r2, [alphab, count]
			
		add count, count, #1
		b forLoop1
	done:
	
	mov r2, #0
	str r2, [alphab, #26] //Null terminate alphabet string
	mov r0, alphab
	add sp, sp, #54
        pop  {r4, r5, r6, pc}
.encode:
	



.decode:
  
