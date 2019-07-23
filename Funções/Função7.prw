#include 'Protheus.ch'
 
/*Realizar o processamento do salário de 5 funcionários, exibindo como resultado final
o Nome, salário bruto e salário líquido de cada funcionário. Os dados de entrada de
cada funcionário devem ser o nome, o valor hora e a quantidade de horas trabalhadas
no mês.
Criar uma função que receba esse valor hora de um funcionário e a quantidade de
horas trabalhadas no mês e retorne o Salário Bruno, Salário Líquido e INSS do
funcionário.
Considere que:
Salário Bruto = Qtde horas trabalhadas * valor hora
INSS = 8% do Salário Bruto
Salário Líquido = Salário Bruno - INSS*/

User Function F7()

Local aVar1 := {}
Local cNome := ''
Local nValor := 0
Local nHora := 0
Local cTotal := ''

    For nX := 1 to 5
        cNome1 := FWInputBox("Digite seu nome:")
        nValor := Val(FWInputBox("Digite o valor da hora:"))
        nHora := Val(FWInputBox("Digite quantas horas foram trabalhadas:"))

    cTotal := u_liq(nValor,  nHora, cNome)
    
    alert (cTotal)

    Next

Return

User function liq(nValor, nHora, cNome)

Local nSalb := 0
Local nSall := 0
Local nInss := 0
Local nResult := ''

nSalb :=  nHora * nValor

nInss := (nSalb * 8)/100

nSall := nSalb - nInss

//alert(i18n("Nome #1 Salario Bruto #2 Salario Liquido #3 Inss #4", {bSalb, nSall, nInss}))

nResult := 'Nome ' + cNome1 + ' Salario Bruto ' + cValToChar(nSalb) + ' Salario Liquido ' + cValToChar(nSall) + ' INSS ' + cValToChar(nInss)

Return nResult