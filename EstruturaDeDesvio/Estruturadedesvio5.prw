#include 'Protheus.ch'

/*Ler 3 valores (considere que n�o ser�o informados valores
iguais)e escrever o maior deles.
*/

User function maior()

Local nNum1 := Val(FWInputBox("Informe aqui o primeiro n�mero"))
Local nNum2 := Val(FWInputBox("Informe aqui o segundo n�mero"))
Local nNum3 := Val(FWInputBox("Informe aqui o terceiro n�mero"))


If nNum1 > nNum2 .And. nNum1 > nNum3
alert ("O primeiro n�mero � maior " + cValToChar(nNum1))
elseif nNum2 > nNum1 .And. nNum2 > nNum3
alert ("O segundo n�mero � maior " + cValToChar(nNum2))
else 
alert ("O terceiro n�mero � maior " + cValToChar(nNum3))
EndIf

return