# 2. Diseña un programa ensamblador que realiza la siguiente reserva de espacio en
# memoria a partir de la dirección 0x10001000: una palabra, un byte y otra palabra
# alineada en una dirección múltiplo de 4.

    .data 0x10001000
wordEspace: .space 4
byteEspace: .space 1
    .aling 2
wordEspace: .space 4
