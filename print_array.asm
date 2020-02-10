# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
contents: .asciiz "The contents of the array are:\n"
newline: .asciiz "\n"
array: .word 1 2 3 4 5 6 7 8 9 10
arrayLength: .word 10

.text

main:

# output "The contents of the array are: "
la $a0, contents
li $v0, 4
syscall

# put array address in $a01, arrayLength in $a02 
la $a0, array
lw $a1, arrayLength

jal printA


li $v0, 10
syscall

printA:

li $t0, 0  			# x is in $t0
move $t4, $a0       # t4 holds address of array 

loop:
slt $t1, $t0, $a1	# check if x is less than arraylength
beq $t1, $zero, end_loop

sll $t2, $t0, 2 	# multiply x by 4 
addu $t3, $t4, $t2	# add to address of array

lw $a0, 0($t3)      # load word into $v0 
li $v0, 1           # print what is in $a0
syscall     

# print a newline
la $a0, newline
li $v0, 4
syscall

addiu $t0, $t0, 1   # increment x 
j loop 

end_loop:
jr $ra