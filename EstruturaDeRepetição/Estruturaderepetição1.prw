#include 'Protheus.ch'

/*Escreva um algoritmo para ler 2 valores e se o segundo valor informado for
ZERO, deve ser lido um novo valor, ou seja, para o segundo valor n�o pode ser
aceito o valor zero e imprimir o resultado da divis�o do primeiro valor lido pelo
segundo valor lido.*/

User function val()

Local nValor1 := Val(FWInputBox("Insira o primeiro valor"))
Local nValor2 := Val(FWInputBox("Insira o segundo valor"))

While nValor2 == 0
    nValor2 := Val(FWInputBox("Insira o segundo valor novamente sendo ele diferente de ZERO"))
EndDo

Alert ("O resultado desta divis�o � " + cValToChar(nValor1/nValor2))


return