# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    li $t0, 0  			# z = 0 in $t0
	li $t1, 0			# i = 0 in $t1
	li $t3, 5			# $t3 = 5

	loop_start:
	slt $t2, $t1, $t3
	beq $t2, $zero, end_loop

	# Body of the loop 

	sll $t4, $a0, 1  # Multiply x by 2 and store in $t4
	sub $t5, $t4, $a1 	# 2x-y in $t5
	add $t0, $t0, $t5 

	li $t5, 3
	slt $t2, $a0, $t5
	beq $t2, $zero, x_greater_than_3
	j increment_x

	x_greater_than_3:
	addi $a1, $a1, -1
	j increment_x

	increment_x: 
	addi $a0, $a0, 1
	addi $t1, $t1, 1
	j loop_start

	end_loop:
	move $v0, $t0
	jr $ra

main:

	li $a0, 5
	li $a1, 7
	jal conv

	move $a0, $v0
	li $v0, 1
	syscall
exit:
	li $v0, 10
	syscall

