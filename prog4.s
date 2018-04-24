@ Austin Queen & Andre Robinson
@ austinq
@ Program 4 
@ This program
@ Rose Lowe
@ Due: Wednesday, April 25th

key     .req r0
strn    .req r1
encryp  .req r2
decryp  .req r3
count   .req r4
alphab  .req r5
keystr  .req r6

	.file   "prog4.s"
        .text
        .align  2
	.global prepareKey, encode, decode
	.type   prepareKey, %function
        .type   encode, %function
        .type   decode, %function
prepareKey:
	.fnstart
	push {r4, r5, r6, lr}        	
        sub sp, sp, #54			     // make space for two arrays of 27 chars
	mov alphab, sp			           // one array in r5 (alphabet)
	add keystr, sp, #27		         // second array in r6 (keystring)
	mov count, #0
	
	forLoop1:               	     // Build the alphabet array
		cmp count, #26
		bge done                     // skip the loop if count >= 26
		
		add r2, count, #97	         // count + 'a', i.e. the next letter
		strb r2, [alphab, count]     // store letter in alphab[i]
			
		add count, count, #1         // increment count
		b forLoop1
	done:
	
	mov r2, #0
	strb r2, [alphab, #26]         // Null terminate alphabet string

  ldr r0, =fmtstr                // Print the alphabet before clearing the stack
  mov r1, alphab
  bl printf

	mov r0, alphab
	add sp, sp, #54
  pop  {r4, r5, r6, pc}
	.fnend


.encode:
	



.decode:
  


fmtstr:
  .ascii "Alphabet in prog1.s: %s\n"
