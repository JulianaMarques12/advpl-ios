#include 'protheus.ch'
/*Ler 3 valores (considere que não serão informados valores
iguais) e escrever a soma dos 2 maiores. */

User function soma()

Local nNum1 := Val(FWInputBox("Informe aqui o primeiro número"))
Local nNum2 := Val(FWInputBox("Informe aqui o segundo número"))
Local nNum3 := Val(FWInputBox("Informe aqui o terceiro número"))
Local nSoma := 0 

If nNum1 > nNum2 .And. nNum2 > nNum3
   nSoma += nNum1 + nNum2
elseif nNum3 > nNum1 .And. nNum1 > nNum2
    nSoma += nNum3 + nNum2
else
    nSoma += nNum3 + nNum2
    
EndIf
alert ("A Soma dos dois maiores é " + cValToChar(nSoma))
return