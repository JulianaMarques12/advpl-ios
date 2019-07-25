#include 'Protheus.ch'

/*Um posto está vendendo combustíveis com a seguinte tabela
de descontos:

Escreva um algoritmo que leia o número de litros
vendidos e o tipo de combustível (codificado da seguinte
forma: A-álcool, G-gasolina),calcule e imprima o valor a
ser pago pelo cliente sabendo-se que o preço do litro da
gasolina é R$ 3,30 e o preço do litro do álcool é R$ 2,90.*/

User function ed9()

Local cTipo := FWInputBox("Você reabasteceu com Alcool ou Gasolina?")
Local nLitro := Val(FWInputBox("Quantos litros você abasteceu?"))
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