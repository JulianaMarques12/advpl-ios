#include 'Protheus.ch'

/*Ler um valor e escrever a mensagem É MAIOR QUE 10! se o
valor lido for maior que 10, caso contrário escrever NÃO É
MAIOR QUE 10.*/

User function ed1()

Local nNum1 := Val(FWInputBox("Digite aqui um número"))


If nNum1 > 10
alert("Este número é maior que 10.")

Elseif nNum1 == 10
alert("Este número é igual a 10")

Else 
alert("Este número é menor que 10.")

EndIf

Return