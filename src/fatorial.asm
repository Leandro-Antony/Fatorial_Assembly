# Universidade Federal do Rio Grande do Norte
# Bacharelado em Ciência da Computação
# Disciplina: DIM0127 - ARQUITETURA DE COMPUTADORES - T01 (2026.2) 
# Docente: Mônica Magalhães Pereira
# Discente: Leandro Antony Batista Lemos

# Segue o código desenvolvido para o algoritmo do fatorial.
	# Os testes realizados foram com os seguintes valores de 
	# entrada: -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
	# De acordo com essas entradas, se obteve as correspondentes
	# saídas: 1, 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 39916800,
	#	479001600, 479001600 
.data
input_msg: .asciiz "Digite um número no seguinte intervalo [0,12]: "
err_lower: .asciiz "Valor de entrada inválido (< 0), mudando para 1\n" 
err_greater: .asciiz "Valor de entrada inválido (>= 13), mudando para 12\n" 
output_msg: .asciiz "Resultado: "

.text
main:
	la $a0, input_msg
	li $v0, 4
	syscall # mensagem para input
	
	li $v0, 5 # código de syscall para int input
	syscall 
	add $t0, $v0, $zero # move valor de input para $t0
	
	li $t1, 1 # acc
	
	beq $t0, 0, input_0 # Se input == 0, vai para input_0
	
	blez $t0, fix_lower # Se input <= 0, vai para fix_lower
	
	li $t2, 13
	sub $t3, $t2, $t0 # realiza 13 - input
	blez $t3, fix_greater # Se input >= 13, vai para fix_greater
	j loop

input_0:
	li $t0, 1 # Carrega 1 em $t0
	j loop # Vai para loop

fix_lower:
	la $a0, err_greater
	li $v0, 4
	syscall
	
	li $t0, 1 # Carrega valor 1 em $t0, valores <= 0 resultam em 1, neste algoritmo
	j loop

fix_greater:
	la $a0, err_greater
	li $v0, 4
	syscall
	
	li $t0, 12 # Carrega valor 12 em $t0, 32bits não suportam 13!
	j loop
loop:
	beq $t0, 1, end # Se $t0 == 1, então encerra (vai para end)
	mul $t1, $t0, $t1 # Multiplica $t0 * $t1 e armazena em $t1 (acc)
	addi $t0, $t0, -1 # subtrai 1 de $t0
	j loop # Repete o laço

end:
	li $v0, 4
	la $a0, output_msg 
	syscall # Exibe a mensagem de saída do resultado
	
	add $a0, $t1, $zero
	li $v0, 1
	syscall # Exibe o resultado
	
	li $v0, 10
	syscall # Encerra o código
