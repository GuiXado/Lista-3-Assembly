#5. Receba 2 números inteiros, verifique qual o maior entre eles. Calcule e mostre o resultado da
#somatória dos números ímpares entre esses valores
.data
	n1: .asciiz "Digite o primeiro inteiro: "
	n2: .asciiz "Digite o segundo inteiro: "
	r: .asciiz "A soma dos impares entre eles é: "
.text
main:
	li $v0, 4
	la $a0, n1
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0 #s1 ta o primeiro valor
	
	li $v0, 4
	la $a0, n2
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0 #s2 o segundo valor
	
	li $t3, 0
	blt $s1, $s2, segue
	
	add $s3, $s2, 0
	add $s2, $s1, 0
	add $s1, $s3, 0
 	
segue:#nem precisava disso mas queria deixar o s1 de registro
 	add $t1, $s1, 0 #só to duplicando o valor do primeiro pro t1

volta:
	rem $t2, $t1, 2 #tira o resto por 2 
	beq $t2, 1, impar #resto 1 (impar) pula pro impar

	add $t1, $t1, 1 #contador
	beq $t2, 0, volta
impar:
	
	add $t3, $t1, $t3 #soma os impares e joga no t3
	add $t1, $t1, 1 #contador
	
	blt $t1, $s2, volta #enquanto menor que o s2 volta
fim:
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $t3, 0
	syscall