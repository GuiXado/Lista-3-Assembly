#1. Receba os valores do comprimento, largura e altura de um paraleleípedo.
#Calcule e mostre seu Volume.
.data
	a: .asciiz "Qual a altura: "
	l: .asciiz "Qual a largura: "
	c: .asciiz "Qual o comprimento: "
	r: .asciiz "O volume é: "
.text
main:
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, l
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	li $v0, 4
	la $a0, c
	syscall
	li $v0, 5
	syscall
	add $s3, $v0, 0
	
	mul $s0, $s1, $s2
	mul $s0, $s0, $s3
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall