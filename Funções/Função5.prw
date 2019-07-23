#include 'Protheus.ch'

/*Criar uma função que recebe um valor inteiro e verifica se o valor é par ou ímpar. A
função deve retornar um valor booleano.*/

User function f5()

Local nNum := Val(FWInputBox("Digite aqui um número:"))

u_f5c(nNum)

Return

User function f5c(nNum)

If nNum % 2 == 1

alert (.F.)


Else 

alert (.T.)

Endif
Return 