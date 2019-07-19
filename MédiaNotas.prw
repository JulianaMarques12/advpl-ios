#include "Protheus.ch"

User function exer()

Local nNota1 := 0
Local nNota2 := 0
Local nNota3 := 0
Local nMédia := 0
Local cNota1 := ''
Local cNota2 := ''
Local cNota3 := ''

cNota1 := FWInputBox("Digite aqui a primeira nota")
cNota2 := FWInputBox("Digite aqui a segunda nota")
cNota3 := FWInputBox("Digite aqui a terceira nota")

nNota1 := Val(cNota1)
nNota2 := Val(cNota2)
nNota3 := Val(cNota3)

nMédia := ((2*nNota1)+(3*nNota2)+(5*nNota3))/10

alert("A média é " + cValToChar(nMédia))

return

