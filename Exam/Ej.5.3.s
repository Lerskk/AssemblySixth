	.data
vec: .word 1, -4, -5, 2
res: .space 1

	.text
	.globl main
main: 
    lb $t1, vec+0($0)
    lb $t2, vec+4($0)
    lb $t3, vec+8($0)
    lb $t4, vec+12($0)
	
	slt $t1, $t1, $0
	slt $t2, $t2, $0
	slt $t3, $t3, $0
	slt $t4, $t4, $0

	and $t1, $t1, $t2
	and $t1, $t1, $t3
	and $t1, $t1, $t4
	sb $t1, res($0)

	li $v0, 10
	syscall
	.end