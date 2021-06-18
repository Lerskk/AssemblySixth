	.data
var: .word 1, 2, 3, 1
long: .word 4
num: .word 2
res: .space 4

	.text
	.globl main
main:
	la $t0, var($0)
	lw $t1, long($0)
	lw $t2, num($0)
	la $t3, res($0)

	addi $sp, $sp, -16
	sw $t0, 12($sp)
	sw $t1, 8($sp) 
	sw $t2, 4($sp) 
	sw $t3, 0($sp) 
	jal equal

	li $v0, 10
	syscall

equal:
	addi $sp, $sp, -32
	sw $fp, 28($sp)
	addi $fp, $sp, 28
	sw $a0, 24($sp)
	sw $a1, 20($sp)
	sw $a1, 16($sp)
	sw $a1, 12($sp)
	sw $t0, 8($sp) 
	sw $t1, 4($sp) 
	sw $t2, 0($sp) 

	lw $a0, 16($fp)
	lw $a1, 12($fp)
	lw $a2, 8($fp)
	lw $a3, 4($fp)

	li $t0, 0
	li $t1, 0
	li $t2, 0

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