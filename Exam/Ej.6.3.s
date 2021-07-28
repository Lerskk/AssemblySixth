	.data
vec: .word 1, 2, 3, 4, 10
leng: .word 5
rang1: .word 1
rang2: .word 9
res: .byte 1

	.text
	.globl main
main:
	la $t0, vec($0)
	lw $t1, leng($0)
	lb $t2, res($0)
	lw $t8, rang1($0)
	lw $t9, rang2($0)

	for:
		bge $t3, $t1, exit 
		lw $t4, 0($t0)
		addi $t3, $t3, 1
		addi $t0, $t0, 4

		sgt $t5, $t4, $t8
		slt $t6, $t4, $t9
		and $t5, $t5, $t6
		li $t6, 1
		beq $t5, $t6, sum
			j for
		sum:
			addi $t7, $t7, 1
			j for

	exit: 
		sw $t7, res($0)
		li $v0, 10
		syscall
	.end