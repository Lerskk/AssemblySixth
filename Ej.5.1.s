	.data
vec: .byte 0, 1, 1, 1, 0
res: .space 3

	.text
    .globl main
main: 
    la $t0, vec
    lb $t1, 0($t0)
    lb $t2, 1($t0)
    lb $t3, 2($t0)
    lb $t4, 3($t0)
    lb $t5, 4($t0)
    li $t8, 0

    and $t9, $t1, $t5
    sb $t9, res($t8)
    addi $t8, $t8, 1

    or $t9, $t2, $t4
    sb $t9, res($t8)
    addi $t8, $t8, 1

    or $t6, $t1, $t2
    and $t9, $t6, $t3
    sb $t9, res($t8)
    .end