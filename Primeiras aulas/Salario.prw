#include 'Protheus.ch'

User function test()
Local nCodigo := 0
Local cNome := ''
Local nSalario := 0
Local nPorc := 0
Local nLiqui := 0

nCodigo := Val(FWInputBox("Digite o c�digo do funcion�rio:"))
cNome := Val(FWInputBox("Digite aqui o nome do funcion�rio"))
nSalario := Val(FWInputBox("Digite o sal�rio bruto do funcion�rio:"))

nPorc := (nSalario*0.15)
nLiqui := (nSalario - nPorc)

// alert(nLiqui)
alert("O funcion�rio de c�digo " + cValToChar(nCodigo) + "Tem o Sal�rio Bruto de " + cValToChar(nLiqui))

return