#include 'protheus.ch'
/*Ler 3 valores (considere que n�o ser�o informados valores
iguais) e escrev�-los em ordem crescente.*/

User function cresc()
Local nNum1 := Val(FWInputBox("Informe aqui o primeiro n�mero"))
Local nNum2 := Val(FWInputBox("Informe aqui o segundo n�mero"))
Local nNum3 := Val(FWInputBox("Informe aqui o terceiro n�mero"))

If nNum1 > nNum2 .And. nNum2 > nNum3
   alert (nNum1,nNum2,nNum3)
elseif nNum1 > nNum3 .And. nNum3 > nNum2
    alert (nNum1,nNum3,nNum2)
elseif nNum2 > nNum1 .And. nNum1 > nNum3
    alert (nNum2,nNum1,nNum3)
elseif nNum2 > nNum1 .And. nNum3 > nNum2
    alert (nNum2,nNum3,nNum1)
elseif nNum3 > nNum1 .And. nNum1 > nNum2
    alert (nNum3,nNum1,nNum2)
else
    alert (nNum3,nNum2,nNum1)
    
EndIf

return