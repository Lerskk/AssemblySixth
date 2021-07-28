    .data
keyOne: .asciiz "TUZCAMYDFXIHQBKJOLNERSPVGW"
keyTwo: .space 26
fraseOne: .asciiz "HOLA" 
fraseTwo: .space 32

    .text
    .globl main
main:
    # send something by reference mans by their addres
    la $a0, keyOne($0)
    la $a1, fraseOne($0)
    la $a2, fraseTwo($0)
    jal cifrar # jal will jumt to the function and also he'll save the value on $ra to then returne to the next line with j
    la $a1, keyTwo($0)
    jal decifrar 

cifrar:
    addi $sp, $sp, -12 # I'm reserving 12 of space in the stack to 3 variables
    sw $ra, 12($sp) # lowest item in the stack => greater number in the addres 
    sw $a1, 4($sp) 
    sw $a2, 0($sp) # topest item in the stack => lower numer in the addres

    loop:
        lb $t0, 0($a1) # Copy from memory to register (Load). In thins case I'm coping the value (each byte) of the fraseOne to $t0
        beq $t0, $0, endLoop # Test if register are equal. If $t0 is equal to 0 thats mean $t0 is equal to the \n of fraseOne
        addi $t0, $t0, -65 # add immediate, "Immediate" means a contant number. I'm subtracting 65 because is equal to the Position of A in the ascii table
        add $t0, $a0, $t0 # I'm adding the addres of the key ($a0) to the vaule on $t0, thats returs the addres of the letter that I want 
        lb $t0, 0($t0) # I'm loading the letter that I'll want to store 
        sb $t0, 0($a2) # I'm saving the letter in the momory
        addi $a1, $a1, 1 # adding 1 to the position of fraseOne
        addi $a2, $a2, 1 # adding 1 to the position of fraseTwo
        j loop
    endLoop:
        j $ra

decifrar:
    li $t1, 65
    loopDec:
        lb $t0, 0($a0) # I'm loading the value of the first letter in keyOne
        beq $t0, $0, endLoopDec
        addi $t0, $t0, -65 # Here I'll have the position of A in keyTwo
        add $t0, $a1, $t0 # I have the addres of the position of A in keyTwo
        sb $t1, 0($t0)
        addi $t1, $t1, 1
        addi $a0, $a0, 1
        j loopDec
    endLoopDec:
        li $v0, 10
        syscall
    .end