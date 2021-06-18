	.data
vec: .word 1, 2, 3, 0, 0, 0
leng: .word 6
total: .space 4

	.text
	.globl main
main:
	la $t0, vec($0)
	li $t1, 0
	lw $t2, leng($0)
	li $t3, 0
	li $t4, 0
	for:
		beq $t1, $t2, exit
		lw $t5, 0($t0)
		seq $t4, $t5, $0 
		add $t3, $t3, $t4
		addi $t0, 4
		addi $t1, 1
		j for
	exit:
		sw $t3, total($0)
		li $v0, 10
		syscall
	.end