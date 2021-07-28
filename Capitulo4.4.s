# Cambia el valor de los bits 3,7,9 del entero 0xff0f1235 almacenado en
# memoria a partir de la dirección 0x10000000, sin modificar el resto

    .data 0x10000000
number: .word 0xff0f1235
neu: .word 0x00000144
    .text
    .globl main
main:
    lw $t0, number($0)
    lw $t1, neu($0)
    xor $t2, $t0, $t1
    sw $t2, number($0)
.end
