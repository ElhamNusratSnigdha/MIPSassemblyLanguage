.data 
	#MIPS -> Millions of Instructions Per Second
	#Rigisters -> CPU Registers (small memory & faster)
	#$zero = constant 0
	#$v0->
	#$a0->$a3 (for argument)
	#$t0->$t7 (temporary)
	#$s0-> $s7 (for store)
	age: .word 23 #word-> 32bits or 4 bytes [1byte = 8bits]
	PI: .float 3.14
	myDouble: .double 7.202
	zeroDouble: .double 0.0
	number1: .word 20
	number2: .word 8
.text 
	#Printing Integer
	li $v0,1 #float = 2
	lw $a0, age #[Load(lw)-> memory/RAM to register] [Store(sw)-> register to RAM]
	syscall
	
	#Printing Float [6 values of precision after .]
	li $v0, 2 #float = 2 
	#float goes to Core Processor1 (Coproc 1)
	lwc1 $f12, PI
	syscall 
	
	
	#Printing Double
	ldc1 $f2, myDouble
	ldc1 $f0, zeroDouble 
	li $v0, 3 #double=3
	add.d $f12, $f2, $f0
	syscall 
	
	
	#addition with integers
	lw $t0, number1($zero)
	lw $t1, number2($zero)
	add $t2, $t0, $t1
	
	#different approach
	li $v0,1
	add $a0, $zero, $t2
	syscall 
	
	
	#Subtraction with integer
	lw $s0, number1 #s0 = 20
	lw $s1, number2 #s1 = 8
	sub $t0, $s0, $s1 #t0=20-8
	
	li $v0, 1
	move $a0, $t0
	syscall 
	
	#Multiplication
		#'mul' takes 3 register
	addi $s0,$zero,10
	addi $s1,$zero,4
	mul $t0,$s0,$s1 #t0=10*4
	#to display the product
	li $v0,1
	add $a0,$zero,$t0
	syscall 
		#'mult' takes 2 registers
	addi $t0,$zero, 2000
	addi $t1,$zero,10
	mult $t0,$t1
	mflo $s0 #move from low register
	#display the product
	li $v0,1
	add $a0,$zero,$s0
	syscall 
		#'sll' shift left logical
	addi $s0,$zero,4 #s0=4
	sll $t0,$s0,2 #i=2, s0 going to multiply 2times, 2^i
	#display the product
	li $v0,1
	add $a0,$zero,$s0
	syscall 
	
	
	#Division
	addi $t0, $zero,30
	addi $t1,$zero, 5
	div $s0,$t0,$t1
	#display
	li $v0,1
	add $a0,$zero,$s0
	syscall 
		#different way1
	div $s0,$t0,10
	#display
	li $v0,1
	add $a0,$zero,$s0
	syscall 
		#different way2
	div $t0,$t1
	mflo $s0 #Quotient
	mfhi $s1 #Reminder
	#display
	li $v0,1
	add $a0,$zero,$s1
	syscall 