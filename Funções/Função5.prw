#include 'Protheus.ch'

/*Criar uma fun��o que recebe um valor inteiro e verifica se o valor � par ou �mpar. A
fun��o deve retornar um valor booleano.*/

User function f5()

Local nNum := Val(FWInputBox("Digite aqui um n�mero:"))

u_f5c(nNum)

Return

User function f5c(nNum)

If nNum % 2 == 1

alert (.F.)


Else 

alert (.T.)

Endif
Return 