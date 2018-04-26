@ Austin Queen & Andre Robinson
@ austinq & andre3
@ Program 4 
@ This program encodes data using a word or alphabetic string as its key
@ Rose Lowe
@ Due: Wednesday, April 25th


  .file   "prog4.s"
        .text
        .align  2
  .global prepareKey, encode, decode
  .type   prepareKey, %function
  .type   encode, %function
  .type   decode, %function

key     .req r0                       // the keyword we get from the parameters
count   .req r4                       // an iterator
alphab  .req r5                       // string containing the alphabet
keystr  .req r6                       // the processed keystring, to be copied into key

prepareKey:
  .fnstart
  push {r4-r12, lr}         
  sub sp, sp, #54                     // make space for two arrays of 27 chars
  mov alphab, sp                      // one array in r5 (alphabet)
  add keystr, sp, #27                 // second array in r6 (keystring)
  mov count, #0
  
  forLoop1:                           // Build the alphabet array
  cmp count, #26
  bge done                            // skip the loop if count >= 26
    
  add r2, count, #97                  // count + 'a', i.e. the next letter
  strb r2, [alphab, count]            // store letter in alphab[i]
      
  add count, count, #1                // increment count
  b forLoop1
  
        done:
  
  mov r2, #0
  strb r2, [alphab, #26]              // Null terminate alphabet string

                                      // Create the key in keystr
  mov count, #0                       // count is index on keystr (j)
  mov r2, #0                          // r2 is index on keyword   (i)
  
  forLoop2:

      ldrb r3, [key, r2]              // Store current letter in r3
      cmp r3, #0                        
      beq forLoop2Done                // If current letter is null, we're done

                                      // Is r3 a lowercase letter?
      cmp r3, #'a'                    // Is r3 above 'a'?
      blt falseLower                  // If not, it's not a letter
      cmp r3, #'z'                    // Is r3 below 'z'?
      bgt falseLower                  // If not, it's not a letter

        sub r9, r3, #'a'              // get the corresponding location in alphab
        ldrb r7, [alphab, r9]         // Find the right entry in alphab
        cmp r7, #' '                  // If entry is space, letter already used
        beq doneIfLower

          strb r3, [keystr, count]    // Store the character into keystr[j]
          add count, count, #1        // increment count
          mov r8, #' '                // load space into r8
          strb r8, [alphab, r9]       // mark character as used
          b doneIfLower
          
      falseLower:
        mov r0, #0                    // if there is an invalid character in key, return 0
        b returnPK

      doneIfLower:

      add r2, r2, #1
      b forLoop2
      forLoop2Done:
    
    mov r2, #0                        // reset i to 0
    forLoop3:
      cmp r2, #26                     // for i from 0 to 25
      bge forLoop3Done                // if i is 26 or above, exit loop
      ldrb r3, [alphab, r2]           // load ith entry in alphab
      cmp r3, #' '                    // check if it's used
      beq forLoop3Continue            // if it is, skip to the next letter
      strb r3, [keystr, count]        // store the current letter into keystr
      add count, count, #1            // increment count (keystr index)

      forLoop3Continue:
      add r2, r2, #1
      b forLoop3
    forLoop3Done:
    mov r3, #0                        // store null into r3
    strb r3, [keystr, #26]            // null terminate keystr

    mov r2, #0                        // reset i to 0
    forLoop4:
      cmp r2, #27                     // for i from 0 to 26 (iterate over keystr)
      bge forLoop4Done
      ldrb r3, [keystr, r2]           // load keystr[i]
      strb r3, [key, r2]              // store into key[i]
      add r2, r2, #1
      b forLoop4
    forLoop4Done:

  mov r0, #1                          // return true by default
  returnPK:
  add sp, sp, #54
    pop  {r4-r12, pc}
  .fnend
//Clear all the variables
.unreq  key
.unreq  count
.unreq  alphab
.unreq  keystr


string  .req r0                       // string to encode
key     .req r1                       // key to encode with
encryp  .req r2                       // where to store encoded string
iter1   .req r3                       // iterator
iter2   .req r4                       // iterator
strbuf  .req r5                       // holds character from string
keybuf  .req r6                       // holds character from key

encode:
  .fnstart
  push {r0-r8, lr}

  mov iter1, #0 //Initialize variables
  mov iter2, #0
  mov strbuf, #0
  mov keybuf, #0

  efor1:
    ldrb strbuf, [string, iter1]      // load next letter
    cmp strbuf, #0                    // check if null
    beq efor1break

    cmp strbuf, #'a'                  // check if character is between 'a' and 'z'
    blt efor1notLower
    cmp strbuf, #'z'
    bgt efor1notLower
    
    sub iter2, strbuf, #'a'           // get index
    ldrb keybuf, [key, iter2]         // load char from key
    strb keybuf, [encryp, iter1]      // store into encryp
    b efor1continue

    efor1notLower:
      strb strbuf, [encryp, iter1]    // if the char is not a-z, no processing required
                                      // just store it as-is into encryp
    efor1continue:
      add iter1, iter1, #1
      b efor1

  efor1break:
    strb strbuf, [encryp, iter1]      // null terminate string
  
  mov r0, encryp                      // return encryp
  pop {r0-r8, pc}
  .fnend

.unreq string
.unreq key
.unreq encryp
.unreq iter1
.unreq iter2
.unreq strbuf
.unreq keybuf

instr   .req r0                       // string to decode
key     .req r1                       // the key to decode with
decoded .req r2                       // where to store decoded string
iter1   .req r3                       // iterator
iter2   .req r4                       // iterator
keyBuf  .req r5                       // holds character from key
inBuf   .req r6                       // holds character from instr

decode:
  .fnstart
  push {r4-r8, lr}
  mov iter1, #0                       // initialize every non-parameter
  mov iter2, #0
  mov keyBuf, #0
  mov inBuf, #0

  dfor1:
    ldrb inBuf, [instr, iter1]        // load in the next character in instr
    cmp inBuf, #0                     // check if it is null
    beq dfor1break                    // terminate at null string

    difAlphaLower:
      cmp inBuf, #'a'                 // check if character is below 'a'
      blt dnotLower                   // don't decode if it is
      cmp inBuf, #'z'                 // check if character is above 'z'
      bgt dnotLower                   // don't decode if it is
      
      mov iter2, #0
      decodeLoop:
        ldrb keyBuf, [key, iter2]     // load the next character in the key
        cmp keyBuf, inBuf             // check if it's the same the instr char
        beq decodeDone                // if it is, we'll use the iterator later

        add iter2, iter2, #1          // if it isn't, increment iter2
        b decodeLoop
        decodeDone:
                                      // now iter2 is index of matching char in key
                                      // we can use this to calculate decoded char
        add iter2, iter2, #'a'        // iter2 is now the correct ascii char
        strb iter2, [decoded, iter1]  // store decoded char in decoded
        b dfor1continue               

      dnotLower:
        strb inBuf, [decoded, iter1]
        
    dfor1continue:
    add iter1, iter1, #1
    b dfor1
    dfor1break:
    mov inBuf, #0
    strb inBuf, [decoded, iter1]      // null terminate decoded
  pop {r4-r8, pc}
  .fnend

.unreq  instr
.unreq  key
.unreq  decoded
.unreq  iter1
.unreq  iter2

