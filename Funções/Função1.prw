#include 'Protheus.ch'
/*Criar uma função que receba dois inteiros e retorne sua soma.*/

User function f1()

Local nNum1 := Val(FWInputBox("Digite o primeiro número"))
Local nNum2 := Val(FWInputBox("Digite o segundo número"))

alert(u_soma2(nNum1,nNum2))

return

User function soma2(nNum1, nNum2)


return nNum1 + nNum2