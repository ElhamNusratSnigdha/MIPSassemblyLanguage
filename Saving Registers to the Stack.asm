.data
	newLine: .asciiz "\n"
.text
	main:
		addi $s0,$zero,10
		jal increaseMyRegister
		#print a new line
		li $v0,4
		la $a0, newLine
		syscall
		#print value
		li $v0,1
		move $a0,$s0
		syscall
	#end of the process
	li $v0,10
	syscall
	
	increaseMyRegister:
		#'sp'->Stack Pointer
		addi $sp,$sp,-4
		sw $s0, 0($sp)
		addi $s0,$s0,30
		#print new value in function
		li $v0,1
		move $a0,$s0
		syscall
		
		lw $s0,0($sp)
		addi $sp,$sp,4
		jr $ra