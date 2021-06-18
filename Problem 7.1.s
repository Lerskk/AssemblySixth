    .text 
    .globl main
main: 
    li $v0, 5 # read int
    syscall
    move $t0, $v0

    li $v0, 5 # read int
    syscall

    add $t0, $t0, $v0 

    .end