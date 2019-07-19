#include 'Protheus.ch'

/*Ler um valor inteiro (aceitar somente valores entre 1 e 10) e escrever a tabuada
de 1 a 10 do valor lido.*/

User function tabuada()

Local nDivisor := Val(FWInputBox("Insira o valor que deseja usar como divisor"))
Local nNumero := 1
Local nReult := ''

For nNumero := 1 to 10
nResult := nNumero * nDivisor
Alert(nResult)
Next


Return