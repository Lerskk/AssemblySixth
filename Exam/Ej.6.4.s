	.data
var: .asciiz "hola mundo"
char: .byte 'o'
	.align 2
count: .space 4

	.text
	.globl main
main:
	lb $t2, char($0)
	for:
		lb $t0, var($t1)
		addi $t1, 1
		beq $t0, $0, exit
		seq $t0, $t2, $t0
		add $t3, $t3, $t0
		j for
	exit:
		sw $t3, count
		li $v0, 10
		syscall
	.end
	
