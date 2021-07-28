# Diseña un programa ensamblador que copie el vector definido en el problema
# anterior a partir de la dirección 0x10010000.

    .data 0x10000000
V:  .word 10, 20, 25, 500, 3

    .data 0x10010000
space:  .space 20
    .text
    .globl main
main:
    lw $t0, V($0)
    lw $t1, V+4($0)
    lw $t2, V+8($0)
    lw $t3, V+12($0)
    lw $t4, V+16($0)

    sw $t0, space($0)
    sw $t1, space+4($0)
    sw $t2, space+8($0)
    sw $t3, space+12($0)
    sw $t4, space+16($0)
.end