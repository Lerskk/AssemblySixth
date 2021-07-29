  .data
hex: .space 12
bin: .space 34
enter: .asciiz "\n"
posit: .asciiz "Positivo \n" 
negat: .asciiz "Negativo \n"
inputText: .asciiz "Introduzca un numero flotante: "
hexText: .asciiz "Representacion hexadecimal: 0x"
binText: .asciiz "Representacion binaria: "
signText: .asciiz "Signo: "
expoText: .asciiz "Exponente: "
mantText: .asciiz "Mantisa: "

  .text
.globl main
main:
  li $v0, 4 # display Introduzca un num...
  la $a0, inputText($0)
  syscall

  li $v0, 6 # read a float
  syscall

  # parameters for hexa
  mfc1 $t0, $f0 # move from $f0 to $t0

  move $a0, $t0 # input number
  la $a1, hex($0) # addres for the output
  jal hexa

  # print for hex
  li $v0, 4 # display Representacion hex... and { hexValue }
  la $a0, hexText($0)
  syscall 
  la $a0, hex($0)
  syscall

  # prameters for binary
  mfc1 $t0, $f0 # move from $f0 to $t0

  move $a0, $t0 #input number
  la $a1, bin($0) # addres for the output
  jal binary

  # print for binary
  li $v0, 4 # display Representacion bin... and { binValue }
  la $a0, binText($0)
  syscall
  la $a0, bin($0)
  syscall

  # parameters for sign
  mfc1 $t0, $f0 # move from $f0 to $t0

  move $a0, $t0 # input number
  jal sign

  # print for sign
  bne $v0, 0, true # if $v0 == 1 then positive else negative ($v0 return of sign)
    li $v0, 4 # display Signo and Positivo
    la $a0, signText($0)
    syscall
    la $a0, posit($0)
    syscall
    j exitSignPrint
    true:
      li $v0, 4 # display Signo and Negativo
      la $a0, signText($0)
      syscall
      la $a0, negat($0)
      syscall

    exitSignPrint:

  # parameter for expon
  mfc1 $t0, $f0 # move from $f0 to $t0

  move $a0, $t0 # input number
  jal expon

  # print for expon
  move $t0, $v0 # save return in a temporary variable
  li $v0, 4 # display Exponente
  la $a0, expoText($0)
  syscall

  move $a0, $t0 # restore temporary variable as int to print
  li $v0, 1 # print an int
  syscall
  li $v0, 4 # print an enter
  la $a0, enter($0)
  syscall

  # parameters for mant
  mfc1 $t0, $f0 # move from $f0 to $t0

  move $a0, $t0 # input number
  jal mant

  # print of mant
  mtc1 $v0, $f12 # move from rutern to print with syscall 2
  li $v0, 4 # display Mantisa 
  la $a0, mantText($0)
  syscall
  li $v0, 2 # print FP
  syscall

  # finish the execution of the progarm
  li $v0, 10
  syscall


hexa:
  li $t9, 28 # i = 28
  for:
  li $t8, 28
  beq $t9, -4, exitHexa
  sub $t8, $t8, $t9 # 28 - pos = the amount of shift needed 
  sll $t0, $a0, $t8
  srl $t0, $t0, 28 

  # correct the display
  bgt $t0, 9, elseHex # case between 1 to 9
  addi $t0, $t0, '0' # convert the number to char
  j ifExitHex

  elseHex: # case between a to f
    # convert the number to char
    addi $t0, $t0, 'a'
    addi $t0, $t0, -10
  ifExitHex:
  sb $t0, 0($a1)
  addi $a1, $a1, 1
  addi $t9, $t9, -4
  j for

exitHexa:
  li $t0, '\n' # add New line
  sb $t0, 0($a1) 
  addi $a1, $a1, 1 # move to the next position 
  li $t0, 0 # add the null terminator
  sb $t0, 0($a1)
  jr $ra

binary:
  li $t9, 31 # i = 31
  forBinary:
  li $t8, 31
  beq $t9, -1, exitBinary
  sub $t8, $t8, $t9 # 31 - pos = the amount of shift needed 
  sll $t0, $a0, $t8
  srl $t0, $t0, 31 

  addi $t0, $t0, '0' # convert the number to chart
  sb $t0, 0($a1)
  addi $a1, $a1, 1
  addi $t9, $t9, -1
  j forBinary

exitBinary:
  li $t0, '\n' # add New line
  sb $t0, 0($a1)
  addi $a1, $a1, 1 # move to the next position
  li $t0, 0 # add the null terminator
  sb $t0, 0($a1)
  jr $ra

sign:
  srl $a0, $a0, 31 # remove expanent and mantissa sign
  bne $a0, 0, pos # if the bit is not 0 then the number is negative otherwise it's positive
    move $v0, $a0
    jr $ra

  pos:
    move $v0, $a0
    jr $ra

expon:
  sll $a0, $a0, 1 # remove sign bit
  srl $a0, $a0, 24 # remove maintissa bits and the sifted bit
  addi $v0, $a0, -127 

  jr $ra

mant:
  # Set sign and exponent bits to 0
  sll $a0, $a0, 9
  srl $a0, $a0, 9  

  # add 0x3F800000 that's equeal to 0011 1111 1000 0000 ... (mask)
  li $t0, 0x3F800000
  add $a0, $a0, $t0

  # return the value of the mantissa
  move $v0, $a0
  jr $ra

.end 