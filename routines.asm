# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
    addi $a2, $a2, -5
    sll $v0, $a2, 2
    jr $ra

routineA:
    
    # store $s1 on stack 

    addi $sp, $sp, -4
    sw $s1, 0($sp)

    li $t0, 2
    li $t1, 3

    mult $t0, $a0
    mflo $t2     # 2x is in $t2

    mult $t1, $a1  # 3y is in $t3
    mflo $t3
    
    move $a2, $t3       # move t3 to a2
    move $t4, $ra
    jal routineB
    move $s1, $v0 

    addi $s1, $s1, -1
    move $a2, $s1
    jal routineB

    lw $s1, 0($sp)
    addi $sp, $sp, 4

    jr $t4

main:

    li $a0, 5
    li $a1, 7

    jal routineA
    move $s0, $v0           #routine a will save this SPOT as ra in t4

    move $a0, $s0
    li $v0, 1
    syscall

exit:
	li $v0, 10
    syscall
