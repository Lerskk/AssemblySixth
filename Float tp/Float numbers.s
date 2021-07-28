  .data
hex: .space 12
bin: .space 34
enter: .asciiz "\n"
posit: .asciiz "Positivo \n" 
negat: .asciiz "Negativo \n"
  .text
.globl main
main:
  # read a float
  li $v0, 6  
  syscall

  # parameters for hexa
  # move from $f0 to $t0
  mfc1 $t0, $f0

  move $a0, $t0 # input number
  la $a1, hex($0) # addres of the output
  jal hexa

  # print for hex
  li $v0, 4
  la $a0, hex($0)
  syscall

  # prameters for binary
  # move from $f0 to $t0
  mfc1 $t0, $f0

  move $a0, $t0
  la $a1, bin($0)
  jal binary

  # print for binary
  li $v0, 4
  la $a0, bin($0)
  syscall

  # parameter for expon
  # move from $f0 to $t0
  mfc1 $t0, $f0

  move $a0, $t0
  jal expon

  # print for expon
  move $a0, $v0 # int to print
  li $v0, 1 # print an int
  syscall
  li $v0, 4
  la $a0, enter($0)
  syscall

  # parameters for sign
  # move from $f0 to $t0
  mfc1 $t0, $f0

  move $a0, $t0
  jal sign

  # print for sign
  bne $v0, 0, true
    li $v0, 4
    la $a0, posit($0)
    syscall
    j exitSignPrint

  true:
    li $v0, 4
    la $a0, negat($0)
    syscall

  exitSignPrint:

  # finish the execution of the progarm
  li $v0, 10
  syscall


  # each heax is equal to 4 bits
  # I must take 2 bits and then store in 1 byte
  # 1000000000100000000000000000001


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
    addi $t0, $t0, 'a' # convert the number to char
    addi $t0, $t0, -10
  ifExitHex:
  sb $t0, 0($a1)
  addi $a1, $a1, 1
  addi $t9, $t9, -4
  j for

exitHexa:
  li $t0, '\n'
  sb $t0, 0($a1)
  addi $a1, $a1, 1
  li $t0, 0
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

  addi $t0, $t0, '0'
  sb $t0, 0($a1)
  addi $a1, $a1, 1
  addi $t9, $t9, -1
  j forBinary

exitBinary:
  li $t0, '\n'
  sb $t0, 0($a1)
  addi $a1, $a1, 1
  li $t0, 0
  sb $t0, 0($a1)
  jr $ra

sign:
  srl $a0, $a0, 31 # remove expanent and mantissa sign
  bne $a0, 0, pos
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

  .end