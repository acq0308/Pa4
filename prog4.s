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
unSeen  .req r7

	.file   "prog4.s"
        .text
        .align  2
	.global prepareKey, encode, decode
	.type   prepareKey, %function
        .type   encode, %function
        .type   decode, %function

prepareKey:
	.fnstart
	push {r4-r12, lr}        	
        sub sp, sp, #54			     // make space for two arrays of 27 chars
	mov alphab, sp			     // one array in r5 (alphabet)
	add keystr, sp, #27		     // second array in r6 (keystring)
	mov count, #0
	
	forLoop1:               	     // Build the alphabet array
	cmp count, #26
	bge done                     	     // skip the loop if count >= 26
		
	add r2, count, #97	             // count + 'a', i.e. the next letter
	strb r2, [alphab, count]             // store letter in alphab[i]
			
	add count, count, #1                 // increment count
	b forLoop1
	
        done:
	
	mov r2, #0
	strb r2, [alphab, #26]               // Null terminate alphabet string

                                             // Create the key in keystr
  mov count, #0                        // count is index on keystr (j)
 	mov r2, #0                           // r2 is index on keyword   (i)
  
 	forLoop2:

    	ldrb r3, [key, r2]                // Store current letter in r3
      cmp r3, #0                        
      beq forLoop2Done                     // If current letter is null, we've read the whole string

                                             // Is r3 a lowercase letter?
    	cmp r3, #'a'                         // Is r3 above 'a'?
    	blt falseLower                       // If not, it's not a letter
    	cmp r3, #'z'                         // Is r3 below 'z'?
    	bgt falseLower                       // If not, it's not a letter

      	sub r9, r3, #'a'                   // get the corresponding location in alphab for the current letter
      	ldrb r7, [alphab, r9]                // Find the right entry in alphab
      	cmp r7, #' '                       // If entry is space, letter already used
        beq doneIfLower

          strb r3, [keystr, count]           // Store the character into keystr[j]
          add count, count, #1               // increment count
          mov r8, #' '                       // load space into r8
          strb r8, [alphab, r9]              // mark character as used
          b doneIfLower
          
    	falseLower:
        mov r0, #1
        b returnPK

    	doneIfLower:

      add r2, r2, #1
      b forLoop2
      forLoop2Done:
    
    mov r2, #0 // reset i to 0
    forLoop3:
      cmp r2, #26                            // for i from 0 to 25
      bge forLoop3Done                       // if i is 26 or above, exit loop
      ldrb r3, [alphab, r2]                  // load ith entry in alphab
      cmp r3, #' '                           // check if it's used
      beq forLoop3Continue                   // if it is, skip to the next letter
      strb r3, [keystr, count]               // store the current letter into keystr
      add count, count, #1                   // increment count (keystr index)

      forLoop3Continue:
      add r2, r2, #1
      b forLoop3
    forLoop3Done:
    mov r3, #0                            // store null into r3
    strb r3, [keystr, #26]                   // null terminate keystr

    mov r2, #0 // reset i to 0
    forLoop4:
      cmp r2, #27                            // for i from 0 to 26 (iterate over keystr)
      bge forLoop4Done
      ldrb r3, [keystr, r2]                  // load keystr[i]
      strb r3, [key, r2]                     // store into key[i]
      add r2, r2, #1
      b forLoop4
    forLoop4Done:

  mov r0, #0
  returnPK:
	add sp, sp, #54
  	pop  {r4-r12, pc}
	.fnend


.encode:
	



.decode:
  


