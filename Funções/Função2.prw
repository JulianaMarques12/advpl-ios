#include 'Protheus.ch'
/*Criar uma fun��o que receba dois n�meros reais e retorne seu produto.*/

User function f2()

Local nNum1 := Val(FWInputBox("Digite o primeiro n�mero"))
Local nNum2 := Val(FWInputBox("Digite o segundo n�mero"))

alert(u_produto(nNum1,nNum2))

return

User function produto(nNum1, nNum2)


return nNum1 * nNum2