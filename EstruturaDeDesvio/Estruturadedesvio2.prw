#include 'protheus.ch'

/* Ler dois valores (considere que n�o ser�o lidos valores iguais)e
escrever o maior deles.
*/

User Function mais()

Local nNum1 := Val(FWInputBox("N1"))
Local nNum2 := Val(FWInputBox("N2"))

If nNum1 > nNum2
 alert ("O primeiro valor � maior")
 Else 
 alert ("O segundo valor � o maior")    

EndIf

return
