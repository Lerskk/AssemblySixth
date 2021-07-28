# Multiplica el número 0x1237, almacenado en memoria a partir de la dirección
# 0x10000000, por 32 (25) sin utilizar las instrucciones de multiplicación ni las
# pseudoinstrucciones de multiplicación.

    .data
number: .word 0x1237

    .text
    .globl main
main:
    lw $t0, number
    sll $t1, $t0, 5
.end
