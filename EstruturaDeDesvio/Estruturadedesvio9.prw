#include 'Protheus.ch'

/*Um posto est� vendendo combust�veis com a seguinte tabela
de descontos:

Escreva um algoritmo que leia o n�mero de litros
vendidos e o tipo de combust�vel (codificado da seguinte
forma: A-�lcool, G-gasolina),calcule e imprima o valor a
ser pago pelo cliente sabendo-se que o pre�o do litro da
gasolina � R$ 3,30 e o pre�o do litro do �lcool � R$ 2,90.*/

User function ed9()

Local cTipo := FWInputBox("Voc� reabasteceu com Alcool ou Gasolina?")
Local nLitro := Val(FWInputBox("Quantos litros voc� abasteceu?"))
Local nValor := 0
local nDesconto := 0

If cTipo == "Gasolina" .AND. nLitro <= 20
nValor := nLitro * 3.30

nDesconto := nValor * 0.04

nTotal := nValor - nDesconto

Alert(nTotal)

Elseif cTipo == "Gasolina" .AND. nLitro > 20
nValor := nLitro * 3.30

nDesconto := nValor * 0.06

nTotal := nValor - nDesconto

Alert(nTotal)

Elseif cTipo == "Alcool" .AND. nLitro <= 20
nValor := nLitro * 2.90

nDesconto := nValor * 0.03

nTotal := nValor - nDesconto

Alert(nTotal)

Else 
nValor := nLitro * 2.90

nDesconto := nValor * 0.05

nTotal := nValor - nDesconto

Alert(nTotal)

EndIf
Return