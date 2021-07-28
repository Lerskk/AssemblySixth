	.data
var: .word 1, 2, 3, 1
long: .word 4
num: .word 1
res: .space 4

	.text
	.globl main
main:
	la $a0, var($0)
	la $a1, long($0)
	la $a2, num($0)
	la $a3, res($0)
	jal equal

	li $v0, 10
	syscall

equal:
	addi $sp, $sp, -16
	sw $t1, 16($sp) 
	sw $t2, 12($sp) 
	sw $t4, 8($sp)
	sw $t5, 4($sp)
	sw $t6, 0($sp)

	lw $t1, 0($a1) # long
	lw $t2, 0($a2) # numero

	for:
		beq $t4, $t1, exit
		addi $t4, $t4, 1

		lw $t5, ($a0)
		addi $a0, $a0, 4

		seq $t5, $t5, $t2
		add $t6, $t6, $t5
		j for
	exit:
		sw $t6, 0($a3)

	lw $t1, 16($sp) 
	lw $t2, 12($sp) 
	sw $t4, 8($sp)
	sw $t5, 4($sp)
	sw $t6, 0($sp)
	addi $sp, $sp, 16
	jr $ra