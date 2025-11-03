#6. Receba 10 números inteiros reais. Verifique e mostre o maior e o menor valor.
#Obs.: somente valores positivos. Se o número for negativo, deve ser desconsiderado e solicitado novamente.
.data
	n: .asciiz "Digite um número inteiro: "
	# da nao. i: .asciiz "Número invalido. "
	maio: .asciiz "\nO maior número é: "
	meno: .asciiz "\nO menor número é: "
.text
main:
	li $t0, 0 #contador
comeco:
	beq $t0, 5, fim #mudar pra 10 depois
	
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0
	
	blt $s0, 0, comeco #só isso aqui já ignora número negativo
	
	add $t0, $t0, 1 # +1 pro contador
	beq $t0, 1, inicia
	
	blt $s1, $s0, menor
	bge $s2, $s0, maior
	j comeco
	
inicia:
	add $s1, $s0, 0
	add $s2, $s0, 0
	j comeco
menor:
	add $s1, $s0, 0 
	j comeco
maior:
	add $s2, $s0, 0
	j comeco
fim:
	li $v0, 4
	la $a0, meno
	syscall
	li $v0, 1
	add $a0, $s1, 0
	syscall
	
	li $v0, 4
	la $a0, maio
	syscall
	li $v0, 1
	add $a0, $s2, 0
	syscall