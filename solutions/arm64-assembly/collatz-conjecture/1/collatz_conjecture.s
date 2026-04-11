.equ INVALID_NUMBER, -1

.text
.globl steps

steps:
        // Setup Step counter
        mov x1, #0 // x1 = 0

        // Confirm x0 >= 1
        cmp x0, #1 
        b.lt error  // Branch to error if x0 < 0

loop:
        // Check for x0 = 1
        cmp x0, #1
        b.eq is_done

        // Increment Step Counter
        add x1, x1, #1
        
        // Check if odd
        tst x0, #1
        b.ne is_odd

is_even:
        // Divide x0 by 2
        lsr x0, x0, #1

        // Go through loop again
        b loop

is_odd:
        // Multiply x0 by 3 and then Add 1
        mov x2, #3
        mul x0, x0, x2
        add x0, x0, #1
        
        // Go through loop again
        b loop

error:  // Return -1
        mov x0, INVALID_NUMBER
        ret

is_done : 
        mov x0, x1 // Move Counter to return value
        ret
