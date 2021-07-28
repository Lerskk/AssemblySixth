# Diseña un programa ensamblador que divida los enteros 18,-1215 almacenados
# a partir de la dirección 0x10000000 entre el número 5 y que a partir de la
# dirección 0x10010000 almacene el cociente de dichas divisiones

    .data 0x10000000
numberOne: .word 18
numberTwo: .word fffffb41
giveMeAdivi: .word 5
    .data 0x10010000
resultOne: .space 4
resultTwo: .space 4

    .text
    .globl main
main:
    lw $t0, numberOne($0)
    lw $t1, numberTwo($0)
    lw $t2, giveMeAdivi($0)

    div $t0, $t2
    mflo $t3
    sw $t3, resultOne($0)

    div $t1, $t2
    mflo $t4
    sw $t4, resultTwo($0)
.end