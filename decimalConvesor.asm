.data

d: .word 0
e: .word 0
c: .word 0
#num: .word 10

	.text
	
	la $t0, d	#load adress of every variable d,e,c
	la $t1, e
	la $t2, c
	li $s0, 10 #variable num
	li $s1, 1 #contador para el pow
	li $s3, 2 #numero inicial para hacer el pow
	li $s4, 2 #constante para operaciones multi

loop:
	bge $a0,$s0,branch	#Verifies if $a0 parameter is bigger/equals than $s0(10)
	
	#Aqui va la parte de d = d+c*pow(2,e) y luego el printf
	jal pow
	
	mult $t2,$s3		##Guardo en una variable temporal $t5 el valor de c*pow(2,e)
	mflo $t6
	add $t0, $t0,$t6
	
	
branch: ##DENTRO DEL PRIMERO WHILE
	li $t2, 0
	bge $a0,$s0,while2 #Verifies again and joins another loop
	
	####Aqui viene la linea del d = d+b*pow(2,e)
	
	mult $a0,$s3		##Guardo en una variable temporal $t5 el valor de b*pow(2,e)
	mflo $t5
	add $t0, $t0,$t5
	
	addi $t1,$t1,1
	move $a0,$t2
	
	j loop
	
	
while2: ## INTERIOR 2DO WHILE
	
	addi $a0,$a0,-10
	addi $t2,$t2,1
	
	j branch
	
pow:	#Recibe 2 argumentos
	bge $s1,$t1,labelderegreso
	
	mult $s3,$s4
	mflo $s3 
	addi $s1,$s1,1
	
	j pow
	
labelderegreso:
	jr $ra