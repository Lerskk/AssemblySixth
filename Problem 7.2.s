    .data
name: .space 10
    .align 2
surname: .space 15
    .align 2
DNI: .space 4
    
    .text
    .globl main
main:
    li $v0, 8
    la $a0, name($0)
    syscall

    li $v0, 8
    la $a0, surname($0)
    syscall

    li $v0, 5
    syscall
    sw $v0, DNI($0)

    li $v0, 4
    la $a0, name($0)
    syscall
    
    li $v0, 4
    la $a0, surname($0)
    syscall

    li $v0, 1
    lw $a0, DNI($0)
    syscall

    li $v0, 10
    syscall
    .end