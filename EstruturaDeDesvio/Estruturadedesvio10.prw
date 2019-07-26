#include 'Protheus.ch'

/*Criar um programa que leia dois números inteiros, e que solicite
ao usuário qual a operação deseja realizar entre esses números.
Caso o usuário digitar o caractere “*” será realizada uma
multiplicação, caso seja digitado o caractere “/” será realizada
uma divisão, caso seja digitado o caractere “+” será realizado
uma adição, e caso seja digitado o caractere “–” será realizada
uma subtração.*/

User function ed10()

Local nNum1 := Val(FWInputBox("Digite aqui o primeiro número:"))
Local nNum2 := Val(FWInputBox("Digite aqui o segundo número:"))
Local cOperador := FWInputBox("Digite aqui um operador matemático")

If cOperador == "+"
alert(nNum1 + nNum2)

Elseif cOperador == "-"
alert(nNum1 - nNum2)

Elseif cOperador == "*"
alert(nNum1 * nNum2)

Else
    alert(nNum1 / nNum2)
EndIf

Return