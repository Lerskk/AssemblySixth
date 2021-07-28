	.data
vec: .word 2, -4, -6
res: .space 3

	.text
	.globl main
main: 
    lb $t1, vec+0($0)
    lb $t2, vec+4($0)
    lb $t3, vec+8($0)

	sge $t9, $t1, $0
	sb $t9, res+0($0)

	sge $t9, $t2, $0
	sb $t9, res+1($0)

	sge $t9, $t3, $0
	sb $t9, res+2($0)
	.end