#include 'Protheus.ch'

/*Elabore um programa que leia um n�mero inteiro entre 1 e 12 e
imprima o m�s correspondente. Caso seja digitado um valor
fora desse intervalo, dever� ser exibida uma mensagem
informando que n�o existe m�s com esse n�mero.*/

User function ed11()

Local nNum := Val(FWInputBox("Digite aqui um n�mero de um a doze:"))

If nNum == 1
alert("Janeiro")

Elseif nNum == 2
alert("Fevereiro")

Elseif nNum == 3
alert("Mar�o")

Elseif nNum == 4
alert("Abril")

Elseif nNum == 5
alert("Maio")

Elseif nNum == 6
alert("Junho")

Elseif nNum == 7
alert("Julho")

Elseif nNum == 8
alert("Agosto")

Elseif nNum == 9
alert("Setembro")

Elseif nNum == 10
alert("Outubro")

Elseif nNum == 11
alert("Novembro")

Elseif nNum == 12
alert("Dezembro")

Else 
alert("Este n�mero n�o pertence a nenhum m�s.")
    
EndIf

Return