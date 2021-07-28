# Diseña un programa en ensamblador que inicialice cuatro bytes a partir de la
# posición 0x10010002 a los siguientes valores 0x10, 0x20, 0x30, 0x40, y reserve
# espacio para una palabra a partir de la dirección 0x1001010. El programa
# transferirá los cuatro bytes contenidos a partir de la posición 0x10010002 a la
# dirección 0x1001010

    .data 0x10010002
byteOne: .byte 0x10
byteTwo: .byte 0x20
byteThree: .byte 0x30
byteFour: .byte 0x40

    .data 0x10010010
space: .space 4

    .text
    .globl main
main:
    lb $t0, byteOne($0)
    lb $t1, byteOne+1($0)
    lb $t2, byteOne+2($0)
    lb $t3, byteOne+3($0)

    sb $t0, space($0)
    sb $t1, space+1($0)
    sb $t2, space+2($0)
    sb $t3, space+3($0)
.end