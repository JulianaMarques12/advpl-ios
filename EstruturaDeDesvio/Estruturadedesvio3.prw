#include 'protheus.ch'
/*Ler um valor e escrever se � positivo, negativo ou zero.*/

User function positivo()

Local nValor := Val(FWInputBox("Digite um valor"))

If nValor > 0
alert ("Este n�mero � positivo")

Else 
alert ("Este n�mero � negativo ou nulo")

Endif

return