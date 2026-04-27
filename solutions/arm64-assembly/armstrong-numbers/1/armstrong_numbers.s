.text
.globl is_armstrong_number

is_armstrong_number:
    // x0: input number (n)
    mov x19, x0             // Save original number to x19
    mov x20, x0             // Second copy for digit counting
    mov x10, #10            // Constant divisor 10
    
    // 1. Count total digits (k)
    mov x1, #0              // x1 = k (digit count)
count_digits:
    udiv x20, x20, x10
    add x1, x1, #1
    cbnz x20, count_digits

    // 2. Extract digits and calculate sum of powers
    mov x20, x19            // Restore original number for processing
    mov x7, #0              // x7 = total sum accumulator
    
process_digits:
    // Modulo logic: x4 = x20 % 10
    udiv x2, x20, x10       // x2 = quotient
    msub x4, x2, x10, x20   // x4 = x20 - (x2 * 10) -> remainder
    
    // Calculate power: x5 = x4^k
    mov x5, #1              // Local product
    mov x6, x1              // Local counter for exponent
power_loop:
    mul x5, x5, x4
    subs x6, x6, #1
    b.ne power_loop
    
    add x7, x7, x5          // Add x4^k to total sum
    
    mov x20, x2             // Update x20 with quotient for next loop
    cbnz x20, process_digits

    // 3. Final Comparison
    cmp x7, x19
    cset w0, eq             // w0 = 1 if sum == original, else 0
    ret
