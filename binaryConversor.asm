main:
	addi $a1, $a1, 2
	j	binario
	li   $v0, 10          # system call for exit
     syscall               # we are out of here.
binario:
	addi $sp, $sp, -8	#reservo espacio para 2 items
	sw	$ra, 4($sp)	#espacio de rsp
	sw	$a1, 0($sp)	#espacio de argumento
	#addi $t2, $zero, 1	#asigna el 1 a $t2
	#beq	$a1, $t2, endBinario2
	beq	$a1, $zero, endBinario
	addi	$t0, $zero,2	#asigna el 2 a $to
	div	$a1, $t0
	mfhi	$t1			#obtiene el mod de num%2
	mflo	$a1			#actualiza el valor de num para la siguiente llamada
	jal	binario		#llamada recursiva
	li	$v0, 1		# load appropriate system call code into register $v0;
					# code for printing integer is 1
	move $a0, $t1
	syscall
endBinario:
	lw	$a1, 0($sp)	#restore argument
	lw	$ra, 4($sp)	#restore Return address
	addi $sp, $sp, 8
	jr $ra			#return
endBinario2:
