# Diseña un programa ensamblador que defina el vector de enteros V=(10, 20, 25,
# 500, 3) en la memoria de datos a partir de la dirección 0x10000000 y cargue todos
# sus componentes en los registros $s0 - $s4.

    .data 0x10000000
V:  .word 10, 20, 25, 500, 3

    .text
    .globl main
main:
    lw $s0, V($0)
    lw $s1, V+4($0)
    lw $s2, V+8($0)
    lw $s3, V+12($0)
    lw $s4, V+16($0)
.end