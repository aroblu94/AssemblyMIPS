## Programma che letto un numero stampa
## tutti i numeri primi minori del numero inserito
## Questo programma utilizza l'algoritmo di NumeroPrimo.asm

.data
    str0: .asciiz "Inserisci un numero: "
    str1: .asciiz "Numeri primi trovati: "
    str2: .asciiz "\n"
    
.text
main:
    li $v0, 4
    la $a0, str0
    syscall
    li $v0, 5
    syscall
    add $s0, $zero, $v0             # salvo N in $s0
    
    addi $s1, $zero, 2              # a = 2 
    
    li $v0, 4
    la $a0, str1
    syscall
    
loopScorriNumeri1:
    beq $s1, $s0, end               # quando a = N termina
    addi $s2, $zero, 2              # b = 2
    
loopTrovaPrimo:   
    beq $s1, $s2, primo
    div $s1, $s2
    mfhi $t0
    beq $t0, $zero, loopScorriNumeri2
    addi $s2, $s2, 1
    j loopTrovaPrimo
    
loopScorriNumeri2:
    addi $s1, $s1, 1                # incremento a
    j loopScorriNumeri1

primo:
    li $v0, 4                       # vado a capo
    la $a0, str2
    syscall
    li $v0, 1                       # stampo il numero se è primo
    add $a0, $s1, $zero
    syscall
    j loopScorriNumeri2
    
end:
    li $v0, 4                       # vado a capo
    la $a0, str2
    syscall
    
    li $v0, 10
    syscall
    
    
    
    
    