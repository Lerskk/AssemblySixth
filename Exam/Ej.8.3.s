  .data
vec: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
row: .word 5
colum: .word 3
searchRow: .word 0
searchColum: .word 0
# Para buscar el valor se debe hacer searchRow * colum + searchColum

  .text
  .globl main
main:
  la $a0, vec($0)
  lw $a1, row($0)
  lw $a2, colum($0)
  lw $a3, searchRow($0)
  lw $t0, searchColum($0)
  addi $sp, $sp, -4
  sw $t0, 0($sp)
  jal pos

  addi $sp, $sp, 4

  li $v0, 10
  syscall
.end

pos:
  lw $t0, 0($sp)
  
  move $t1, $a3
  mul $t1, $t1, $a2
  add $t1, $t1, $t0

  li $t2, 4
  mul $t1, $t1, $t2
  add $a0, $a0, $t1

  lw $v0, 0($a0)
  jr $ra
.end