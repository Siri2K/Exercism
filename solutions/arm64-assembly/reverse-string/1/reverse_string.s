.text
.globl reverse

reverse:
    // x0 = address of the string (input/output is usually in-place for this exercise)
    
    // 1. Find the end of the string
    mov     x1, x0              // x1 will be our "end" pointer
    
find_end:
    ldrb    w2, [x1]            // Load byte into 32-bit register w2
    cbz     w2, setup_swap      // If byte is \0, we found the end
    add     x1, x1, #1          // Move to next char
    b       find_end

setup_swap:
    sub     x1, x1, #1          // Back up one space (move off the \0 onto the last char)
    mov     x2, x0              // x2 will be our "start" pointer

    // 2. Swap loop
swap_loop:
    cmp     x2, x1              // Compare start and end pointers
    b.ge    done                // If they met or crossed, we are finished

    ldrb    w3, [x2]            // Load char from start
    ldrb    w4, [x1]            // Load char from end
    
    strb    w4, [x2]            // Store end char at start position
    strb    w3, [x1]            // Store start char at end position

    add     x2, x2, #1          // Move start pointer forward
    sub     x1, x1, #1          // Move end pointer backward
    b       swap_loop

done:
    ret