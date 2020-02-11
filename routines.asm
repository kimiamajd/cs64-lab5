# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0



.text 
main:

li $a0, 5       # a = $a0
li $a1, 7       # b = $a1

jal routineA

move $s0, $v0   # put return value in $s0

# print result
li $v0, 1
move $a0, $s0
syscall

# exit program
li $v0, 10
syscall

routineA:

# save current $ra in $t0
# make space to store current value of $s1

addiu $sp, $sp, -12
sw $s1, 0($sp)
sw $s0, 4($sp)
sw $ra, 8($sp)

sll $t0, $a0, 1     # multiply x by 2 and store in $t0

li $t1, 3
mult $a1, $t1       # multiply y by 3 and store in $t2
mflo $t2

move $s0, $t0
move $a0, $t2

jal routineB
add $s1, $s0, $v0

addi $s1, $s1, -1

move $a0, $s1

jal routineB        # result now in $v0

lw $s1, 0($sp)
lw $s0, 4($sp)
lw $ra, 8($sp)
addiu $sp, $sp, -12

jr $ra

routineB: 

addi $t0, $a0, -5
sll $t0, $t0, 2

move $v0, $t0

jr $ra
