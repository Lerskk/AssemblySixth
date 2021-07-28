# Diseña un programa ensamblador que, dada la palabra 0x10203040 almacenada en
# una posición de memoria, la reorganice en otra posición, invirtiendo el orden de
# sus bytes.
    .data
palabra: .word 0x10203040
palabraI:   .space 4
    .text
    .globl main
main:
    lb $t0, palabra($0)
    lb $t1, palabra+1($0)
    lb $t2, palabra+2($0)
    lb $t3, palabra+3($0)

    sb $t3, palabraI($0)
    sb $t2, palabraI+1($0)
    sb $t1, palabraI+2($0)
    sb $t0, palabraI+3($0)
.end