#include 'protheus.ch'

User function Soma1()
Local nNum1 := 0
Local nNum2 := 0
Local nTotal := 0
Local cNum1 := ''
Local cNum2 := ''

cNum1 := FwInputBox("Digite aqui o primeiro número")
cNum2 := FwInputBox("Digite aqui o segundo número")

nNum1 := Val(cNum1)
nNum2 := Val(cNum2)

nTotal := nNum1 +nNum2
Alert("A soma dos números é " + cValToChar(nTotal))

Return