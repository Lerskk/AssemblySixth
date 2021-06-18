	.data
var: .word 1, 2, 3, 1
long: .word 4
num: .word 1
res: .space 4

	.text
	.globl main
main:
	la $a0, var($0)
	lw $a1, long($0)
	lw $a2, num($0)
	la $a3, res($0)
	jal equal

	li $v0, 10
	syscall

equal:
	addi $sp, $sp, -16
	sw $a0, 12($sp)
	sw $t0, 8($sp) 
	sw $t1, 4($sp) 
	sw $t2, 0($sp) 

	for:
		beq $t2, $a1, exit
		addi $t2, $t2, 1

		lw $t0, ($a0)
		addi $a0, $a0, 4

		seq $t0, $t0, $a2
		add $t1, $t1, $t0
		j for
	exit:
		sw $t1, 0($a3)
	lw $a0, 12($sp)
	lw $t0, 8($sp) 
	lw $t1, 4($sp) 
	lw $t2, 0($sp) 
	addi $sp, $sp, 16
	jr $ra