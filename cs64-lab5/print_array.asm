# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	myArray: .word 1 2 3 4 5 6 7 8 9 10

	arrayLength: .word 10

	contents: .asciiz "The contents of the array are: \n"

	endline: .asciiz "\n"

.text
printA:
    li $t0, 0 # t0 = i = 0
	move $t1, $a0  # address of array now saved in $t1
	li $v0, 4
	la $a0, contents
	syscall 


	loop:
	slt $t2, $t0, $a1
	beq $t2, $zero, end_loop

	
	lw $t3, 0($t1)
	move $a0, $t3
	li $v0, 1
	syscall

	la $a0, endline
	li $v0, 4
	syscall

	addi $t1, $t1, 4
	addi $t0, $t0, 1
	j loop


	end_loop:

	jr $ra

main:
	la $a0, myArray				# address of array in $a0

	la $t0, arrayLength
	lw $a1, 0($t0)

	jal printA


exit:
	li $v0, 10
	syscall
