#include 'Protheus.ch'

/*Ler um valor e escrever a mensagem � MAIOR QUE 10! se o
valor lido for maior que 10, caso contr�rio escrever N�O �
MAIOR QUE 10.*/

User function ed1()

Local nNum1 := Val(FWInputBox("Digite aqui um n�mero"))


If nNum1 > 10
alert("Este n�mero � maior que 10.")

Elseif nNum1 == 10
alert("Este n�mero � igual a 10")

Else 
alert("Este n�mero � menor que 10.")

EndIf

Return