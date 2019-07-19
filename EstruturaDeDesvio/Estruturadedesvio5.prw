#include 'Protheus.ch'

/*Ler 3 valores (considere que não serão informados valores
iguais)e escrever o maior deles.
*/

User function maior()

Local nNum1 := Val(FWInputBox("Informe aqui o primeiro número"))
Local nNum2 := Val(FWInputBox("Informe aqui o segundo número"))
Local nNum3 := Val(FWInputBox("Informe aqui o terceiro número"))


If nNum1 > nNum2 .And. nNum1 > nNum3
alert ("O primeiro número é maior " + cValToChar(nNum1))
elseif nNum2 > nNum1 .And. nNum2 > nNum3
alert ("O segundo número é maior " + cValToChar(nNum2))
else 
alert ("O terceiro número é maior " + cValToChar(nNum3))
EndIf

return