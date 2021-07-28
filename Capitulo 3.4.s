# Diseña un programa ensamblador que, dada la palabra 0x10203040 definida en
# memoria la reorganice en la misma posición, intercambiando el orden se sus
# medias palabras. Nota: utiliza la instrucción lh y sh.

    .data
palabra: .word 0x10203040

    .text
    .globl main
main:
    lh $t0, palabra($0)
    lh $t1, palabra+2($0)

    sh $t1, palabra($0)
    sh $t0, palabra+2($0)
.end