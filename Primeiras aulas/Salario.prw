#include 'Protheus.ch'

User function test()
Local nCodigo := 0
Local cNome := ''
Local nSalario := 0
Local nPorc := 0
Local nLiqui := 0

nCodigo := Val(FWInputBox("Digite o código do funcionário:"))
cNome := Val(FWInputBox("Digite aqui o nome do funcionário"))
nSalario := Val(FWInputBox("Digite o salário bruto do funcionário:"))

nPorc := (nSalario*0.15)
nLiqui := (nSalario - nPorc)

// alert(nLiqui)
alert("O funcionário de código " + cValToChar(nCodigo) + "Tem o Salário Bruto de " + cValToChar(nLiqui))

return