	.data
vec: .word 2, 10, 50, 70, 34
res: .space 1
	.text
	.globl main
main: 
	li $v0, 10
	lw $t0, vec+0($0)
	lw $t1, vec+4($0)
	lw $t2, vec+8($0)
	lw $t3, vec+12($0)
	lw $t4, vec+16($0)
	bgt $t4, $t0, if
	j endif
	if:
		blt $t4, $t1, then
		j endif

		then: 
			li $t5, 1
			sb $t5, res($0)
			syscall

	endif:
		bgt $t4, $t2, ifTwo
		j exit

		ifTwo:
			blt $t4, $t3, thenTwo
			j exit

		thenTwo:
			li $t5, 1
			sb $t5, res($0)
			syscall

	exit:
		li $t5, 0
		sb $t5, res($0)
		syscall