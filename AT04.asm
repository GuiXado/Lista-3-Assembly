#4. Receba 4 notas bimestrais de um aluno. Calcule e mostre a média aritmética. Mostre a mensagem de acordo com a média:
#a. Se a média for >= 6,0 exibir “APROVADO”;
#b. Se a média for >= 3,0 ou < 6,0 exibir “EXAME”;
#c. Se a média for < 3,0 exibir “RETIDO”.
.data
	n1: .asciiz "primeira nota: "
	n2: .asciiz "segunda nota: "
	n3: .asciiz "terceira nota: "
	n4: .asciiz "quarta nota: "
	a: .asciiz "\nAPROVADO!\n"
	e: .asciiz "\nEXAME!\n"
	r: .asciiz "\nRETIDO!\n"
	m: .asciiz "média é: "
.text
main:
	li $v0, 4
	la $a0, n1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	#add $t0, $v0, 0
	
	li $v0, 4
	la $a0, n2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0
	#add $t0, $v0, %t0
	
	li $v0, 4
	la $a0, n3
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, 0
	#add $t0, $v0, $t0
	
	li $v0, 4
	la $a0, n4
	syscall
	li $v0, 5
	syscall
	add $t4, $v0, 0
	#add $t0, $v0, $t0
	#com esses add já vai tirando do v0 e somando no t0 pra depois só fazer a media
	
	add $s0, $t1, $t2
	add $s1, $t3, $t4
	add $s0, $s1, $s0
	div $s0, $s0, 4
	
	bge $s0, 6, aprovado
	blt $s0, 3, reprovado
#exame:
	li $v0, 4
	la $a0, e
	syscall 
	
	j fim
	
aprovado:
	li $v0, 4
	la $a0, a
	syscall
	
	j fim
reprovado:
	li $v0, 4
	la $a0, r
	syscall
	
	j fim

fim:
	li $v0, 4
	la $a0, m
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall	
