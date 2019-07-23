#include 'Protheus.ch'
 
/*Realizar o processamento do sal�rio de 5 funcion�rios, exibindo como resultado final
o Nome, sal�rio bruto e sal�rio l�quido de cada funcion�rio. Os dados de entrada de
cada funcion�rio devem ser o nome, o valor hora e a quantidade de horas trabalhadas
no m�s.
Criar uma fun��o que receba esse valor hora de um funcion�rio e a quantidade de
horas trabalhadas no m�s e retorne o Sal�rio Bruno, Sal�rio L�quido e INSS do
funcion�rio.
Considere que:
Sal�rio Bruto = Qtde horas trabalhadas * valor hora
INSS = 8% do Sal�rio Bruto
Sal�rio L�quido = Sal�rio Bruno - INSS*/

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