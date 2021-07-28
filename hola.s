.data
numero: .word 20
.text
main: lw $t0,numero($0)
sll $t1,$t0,1 # mult *2 each bit

# little endian