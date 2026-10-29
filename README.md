## Arquitetura de Computadores
### Docente: Mônica Magalhães Pereira
### Discente: Leandro Antony Batista Lemos

# Fatorial em Assembly MIPS

Programa em Assembly MIPS32 que realiza a leitura de um valor inteiro `n` e calcula `n!`. Desenvolvido e testado no simulador **MARS 4.5**

## Como funciona

1. Pede um número ao usuário com syscall 5
2. Valida a entrada: se `n >= 13`, exibe um aviso e usa `n = 12`, pois `13!` não cabe em 32 bits.
3. Calcula o fatorial com um laço, acumulando o resultado com `mul`.
4. Imprime o resultado (syscall 1) e encerra o programa (syscall 10).

## Pseudocódigo

```
ler n
se n >= 13: n = 12
senão se n < 0: n = 0
resultado = 1 
enquanto n > 1:
    resultado = resultado * n
    n = n - 1
imprimir resultado
```

## Registradores utilizados 
| Registrador | Uso |
|-------------|------------------------------|
| `$t0` | valor lido e contador |
| `$t1` | acumulador do resultado |
| `$t2` | armazena valor 13 para substração |
| `$t3` | armazena subtração `13 - $t0` |
| `$a0` | argumento das syscalls |
| `$v0` | código da syscall / leitura |

## Como executar

1. Abra `fatorial.asm` no MARS.
2. Monte o programa com **F3** (Run > Assemble).
3. Execute com **F5**, ou passo a passo com **F7** para melhor visualização das etapas.
4. Digite o valor na janela **Run I/O**.

## Exemplos de teste

| Entrada | Saída esperada |
|-------------|------------------------------|
| `< 0` | `1` (aviso valor <== 0) |
| `0` | `1` |
| `1` | `1` |
| `5` | `120` |
| `12` | `479001600` |
| `> 12` | `479001600` (aviso valor <== 12) |

## Limitações

- Usa inteiros de 32 bits: o maior fatorial exato é `12!`.
- Entrada menores que 0 são limitadas a 0.
- Entradas maiores que 12 são limitadas a 12.
