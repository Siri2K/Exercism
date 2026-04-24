.text
.globl two_fer

two_fer:
        cbz     x1, empty

        adr     x2, msg_prefix
prefix_loop:
        ldrb    w3, [x2], #1
        cbz     w3, copy_name
        strb    w3, [x0], #1
        b       prefix_loop

copy_name:
        mov     x2, x1
name_loop:
        ldrb    w3, [x2], #1
        cbz     w3, copy_suffix
        strb    w3, [x0], #1
        b       name_loop

copy_suffix:
        adr     x2, msg_suffix
suffix_loop:
        ldrb    w3, [x2], #1
        strb    w3, [x0], #1
        cbnz    w3, suffix_loop
        b       done

empty:
        adr     x2, msg_no_name
empty_loop:
        ldrb    w3, [x2], #1
        strb    w3, [x0], #1
        cbnz    w3, empty_loop

done:
        ret

msg_no_name:
        .asciz "One for you, one for me."
msg_prefix:
        .asciz "One for "
msg_suffix:
        .asciz ", one for me."
