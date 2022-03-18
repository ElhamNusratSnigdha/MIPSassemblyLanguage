.data
	message: .asciiz "Hi,everybody. \nMy name is Amell.\n"
.text
	#Working with Functions
	#Java-> Methods, C++->functions, MIPS->Procedures
	main: #main method
		jal displayMessage
		addi $s0,$zero,5
		#print 5
		li $v0,1
		add $a0,$zero,$s0
		syscall 
		
	#tell the system that the progam is done
	li $v0,10
	syscall 
	displayMessage:
		li $v0,4
		la $a0,message
		syscall 
		jr $ra