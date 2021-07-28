# Diseña un programa ensamblador que defina, en el espacio de datos, la siguiente
# cadena de caracteres: “Esto es un problema” utilizando
# a) .ascii
# b) .byte
# c) .word

    .data
ascii: .ascii "Esto es un problema"
byte:   .byte 'E', 's', 't', 'o', ' ', 'e', 's', ' ', 'u', 'n', ' ', 'p', 'r', 'o', 'b', 'l', 'e', 'm', 'a'
word:   .word 'E', 's', 't', 'o', ' ', 'e', 's', ' ', 'u', 'n', ' ', 'p', 'r', 'o', 'b', 'l', 'e', 'm', 'a'
