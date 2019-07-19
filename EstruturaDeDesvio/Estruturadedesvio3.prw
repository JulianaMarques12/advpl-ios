#include 'protheus.ch'
/*Ler um valor e escrever se é positivo, negativo ou zero.*/

User function positivo()

Local nValor := Val(FWInputBox("Digite um valor"))

If nValor > 0
alert ("Este número é positivo")

Else 
alert ("Este número é negativo ou nulo")

Endif

return