#include 'Protheus.ch'

/*Criar um programa que leia dois n�meros inteiros, e que solicite
ao usu�rio qual a opera��o deseja realizar entre esses n�meros.
Caso o usu�rio digitar o caractere �*� ser� realizada uma
multiplica��o, caso seja digitado o caractere �/� ser� realizada
uma divis�o, caso seja digitado o caractere �+� ser� realizado
uma adi��o, e caso seja digitado o caractere ��� ser� realizada
uma subtra��o.*/

User function ed10()

Local nNum1 := Val(FWInputBox("Digite aqui o primeiro n�mero:"))
Local nNum2 := Val(FWInputBox("Digite aqui o segundo n�mero:"))
Local cOperador := FWInputBox("Digite aqui um operador matem�tico")

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