.text                   // Tells the assembler this is executable code
.globl two_fer          // Makes the function "two_fer" visible to the test runner

two_fer:
        cbz     x1, empty           // If x1 (name pointer) is NULL (0), jump to 'empty' label

        adr     x2, msg_prefix      // Load the address of "One for " into x2
prefix_loop:
        ldrb    w3, [x2], #1        // Load 1 byte from x2 into w3, then increment x2 by 1
        cbz     w3, copy_name       // If the byte we just loaded is 0 (end of string), go to copy_name
        strb    w3, [x0], #1        // Write the byte in w3 to x0, then increment x0 by 1
        b       prefix_loop         // Repeat the loop for the next character

copy_name:
        mov     x2, x1              // Move the input name pointer (x1) into x2 to use as source
name_loop:
        ldrb    w3, [x2], #1        // Load 1 byte from the name into w3, increment x2
        cbz     w3, copy_suffix     // If we hit the end of the name (0), go to copy_suffix
        strb    w3, [x0], #1        // Write the name character into our buffer, increment x0
        b       name_loop           // Repeat for the next character of the name

copy_suffix:
        adr     x2, msg_suffix      // Load the address of ", one for me." into x2
suffix_loop:
        ldrb    w3, [x2], #1        // Load 1 byte from the suffix into w3, increment x2
        strb    w3, [x0], #1        // Write the byte to our buffer, increment x0
        cbnz    w3, suffix_loop     // If the byte was NOT 0, keep looping (copies the null terminator)
        b       done                // Jump to the end

empty:
        adr     x2, msg_no_name     // Load address of the full default "One for you, one for me."
empty_loop:
        ldrb    w3, [x2], #1        // Load 1 byte from the default string, increment x2
        strb    w3, [x0], #1        // Write the byte to our buffer, increment x0
        cbnz    w3, empty_loop      // Keep going until the null terminator is copied
        // Fall through to 'done'

done:
        ret                         // Return to the caller

// Data section located within the text segment for easy access via 'adr'
msg_no_name:
        .asciz "One for you, one for me."
msg_prefix:
        .asciz "One for "
msg_suffix:
        .asciz ", one for me."
