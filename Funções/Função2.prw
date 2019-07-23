#include 'Protheus.ch'
/*Criar uma função que receba dois números reais e retorne seu produto.*/

User function f2()

Local nNum1 := Val(FWInputBox("Digite o primeiro número"))
Local nNum2 := Val(FWInputBox("Digite o segundo número"))

alert(u_produto(nNum1,nNum2))

return

User function produto(nNum1, nNum2)


return nNum1 * nNum2