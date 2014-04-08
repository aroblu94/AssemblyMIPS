## Semplice programma in Assembly MIPS che calcola se il numero
## inserito è primo o no

## Struttura algoritmo:
## leggo N
## a = 2
## N = a? --SI--> N è primo
##        --NO--> N:a
## resto = 0? --SI--> N non è primo
##            --NO--> a = a + 1
## ripeti il ciclo

.data
    str0: .asciiz "Inserisci un numero: "
    str1: .asciiz "Il numero inserito e' primo "
    str2: .asciiz "Il numero inserito NON e' primo "
    str3: .asciiz "\n"
    
.text
main:
    li $v0, 4                   # Stampa str0
    la $a0, str0
    syscall
    li $v0, 5                   # Legge il numero
    syscall
    add $s0, $zero, $v0         # E lo salva in $s0
    
    addi $s1, $zero, 2          # a = 2
    
loop:
    beq $s0, $s1, primo         # N = a --> N è primo
    div $s0, $s1
    mfhi $t0
    beq $t0, $zero, nonprimo
    addi $s1, $s1, 1
    j loop
    
primo:
    li $v0, 4                   # Stampa str1
    la $a0, str1
    syscall
    j end
    
nonprimo:
    li $v0, 4                   # Stampa str2
    la $a0, str2
    syscall
    
end:
    li $v0, 4                   # A capo
    la $a0, str3
    syscall
    li $v0, 10                  # Uscita
    syscall
    
    
    
    
    
    
    