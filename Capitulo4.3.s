# Pon a cero los bits 3,7,9 del entero 0xabcd12bd almacenado en memoria a
# partir de la dirección 0x10000000, sin modificar el resto

    .data 0x10000000
number: .word 0xabcd12bd
neu: .word 0xfffffebb

    .text
    .globl main
main:
    lw $t0, number($0)
    lw $t1, neu($0)

    and $t1, $t0, $t1
    sw $t1, number($0)
.end
