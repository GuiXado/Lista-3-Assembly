#2. Receba o raio de uma circunferência. Calcule e mostre o comprimento da circunferência.
#Considere PI = 3.
.data
	r: .asciiz "qual o raio: "
	c: .asciiz "A circunferência é: "
.text
main:
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	mul $s1, $s1, 6
	#mul $s1, $s1, 2 # conta é 2.pi.r
	#mul $s1, $s1, 3 #valor de PI
	
	li $v0, 4
	la $a0, c
	syscall
	li $v0, 1
	add $a0, $s1, 0
	syscall
