  .data
vec: .word 1, 2, 3, 4, 5
leng: .word 5
return: .word 3
  .text
  .globl main
main:
  la $a0, vec($0)
  lw $a1, leng($0)
  lw $a2, return($0)
  jal pos

  li $v0, 10
  syscall
.end
  
pos: 
  for:
    lw $t0, 0($a0)
    bne $t0, $a2, skip
    lw $t1, 0($a0)
    move $v0, $t1
    jr $ra
    skip:
      addi $a0, $a0, 4
      j for
.end