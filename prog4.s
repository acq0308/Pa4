@ Austin Queen & Andre Robinson
@ austinq
@ Program 4 
@ This program
@ Rose Lowe
@ Due: Wednesday, April 25th

strn    .req r1
encryp  .req r2
decryp  .req r3

	.file   "prog4.s"
        .text
        .align  2
	.global prepareKey, encode, decode
	.type   prepareKey, %function
        .type   encode, %function
        .type   decode, %function

key     .req r0
count   .req r4
alphab  .req r5
keystr  .req r6

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

                                 // Create the key in keystr
  mov count, #0                  // Count through key until null character
  mov r2, #0
  forLoop2:
    ldrb r3, [key, count]        // Store current letter in r3
                                 // Is r3 a lowercase letter?
    cmp r3, #'a'                    // Is r3 above 'a'?
    blt falseLower                 // If not, it's not a letter
    cmp r3, #'z'                    // Is r3 below 'z'?
    bgt falseLower                 // If not, it's not a letter

    trueLower:                   // r3 is a lowercase letter
                                 // Is r3 already used in the key?
      sub r4, r3, #'a'
      ldrb r4, [alphab, r4]      // Find the right entry in alphab
      cmp r4, #0                 // If entry is null, letter already used
        trueUsed:                // What to do if entry is unused
          b doneUsed             // This is what I'm working on, look at line 26 in prepareKey.c

        falseUsed:               // What to do if entry is used

        doneUsed:
      b doneIfLower
    
    falseLower:

    doneIfLower:

	add sp, sp, #54
  pop  {r4, r5, r6, pc}
	.fnend


.encode:
	



.decode:
  


