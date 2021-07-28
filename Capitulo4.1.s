# Diseña un programa ensamblador que defina el vector de enteros de dos
# elementos V=(10,20) en la memoria de datos a partir de la dirección
# 0x10000000 y almacene su suma a partir de la dirección donde acaba el vector

    .data 0x10000000
V:  .word 10, 20
suma: .space 4

    .text
    .globl main
main:
    lw $t0, V($0)
    lw $t1, V+4($0)

    add $t2, $t0, $t1

    sw $t2, suma($0)
.end