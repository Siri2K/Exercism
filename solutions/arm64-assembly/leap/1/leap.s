.text
.globl leap_year

leap_year:
    // Check if divisible by 4
    and x1, x0, #3          // Fast way to get x0 % 4
    cbnz x1, not_leap       // If remainder != 0, not a leap year

    // Check if divisible by 100
    mov x1, #100
    udiv x2, x0, x1
    msub x2, x2, x1, x0     // x2 = x0 % 100
    cbnz x2, is_leap        // If not divisible by 100 (but is by 4), it's a leap year

    // Check if divisible by 400
    mov x1, #400
    udiv x2, x0, x1
    msub x2, x2, x1, x0     // x2 = x0 % 400
    cbz x2, is_leap         // If divisible by 400, it's a leap year

not_leap:
    mov x0, #0
    ret

is_leap:
    mov x0, #1
    ret