#include 'protheus.ch'

/* Ler dois valores (considere que não serão lidos valores iguais)e
escrever o maior deles.
*/

User Function mais()

Local nNum1 := Val(FWInputBox("N1"))
Local nNum2 := Val(FWInputBox("N2"))

If nNum1 > nNum2
 alert ("O primeiro valor é maior")
 Else 
 alert ("O segundo valor é o maior")    

EndIf

return
