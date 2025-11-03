#3. Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor valor.
.data
	a: .asciiz "Digite o primeiro inteiro: "
	b: .asciiz "Digite o segundo inteiro: "
	r: .asciiz "A diferença do maior pelo menor é: "
.text
main:
	li $v0, 4 
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, b
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	bgt $s2, $s1, se
	
	sub $s0, $s1, $s2
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
	j fim

se:
	sub $s0, $s2, $s1
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
		
fim: