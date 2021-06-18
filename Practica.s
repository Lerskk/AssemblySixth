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
	addi $sp, $sp, -20 # Aumentamos 4 el espacio en la pila para guardar el $fp
    sw $fp, 16($sp)  # Guardamos el $fp en la pila por si el main usaba el $fp
    move $fp, $sp # Guardamos el valor de la pila en $fp
	sw $a0, 12($sp)
	sw $t0, 8($sp) 
	sw $t1, 4($sp) 
	sw $t2, 0($sp) 

	for:
		beq $t2, $a1, exit
		addi $t2, $t2, 1

		lw $t0, ($a0)
        addi $sp, $sp, -4 # por cada iteracion reservamos 4 de espacio
        sw $a0, 0($sp)  
		addi $a0, $a0, 4

		seq $t0, $t0, $a2
		add $t1, $t1, $t0
		j for
	exit:
		sw $t1, 0($a3)
    move $sp, $fp # Restauramos el valor de la pila que seria igual a liberar el espacio que reservamos durante el for anterior
	lw $a0, 12($fp) # restauramos los registors a lo que guardamos antes de la ejecucion del for con respecto al $fp, no haria falta hacerlo al haber restaurado el valor de la pila
	lw $t0, 8($fp) 
	lw $t1, 4($fp) 
	lw $t2, 0($fp) 
    lw $fp, 16($fp) # se restaura el fp al final para poder restaurar los otros registros con respecto al $fp
	addi $sp, $sp, 20
	jr $ra