#include 'Protheus.ch'
/*Criar um array de 3 linhas e 2 colunas, cada linha deve guardar o nome de um aluno
e a idade do mesmo. Exiba os dados do segundo aluno.*/

user function nome()

    Local aAluno := {}

Local cNome1 := FWInputBox("Digite o nome do primeiro aluno")
Local cNome2 := FWInputBox("Digite o nome do segundo aluno")
Local cNome3 := FWInputBox("Digite o nome do terceiro aluno")

Local nIdade1 := Val(FWInputBox("Digite a idade do primeiro aluno"))
Local nIdade2 := Val(FWInputBox("Digite a idade do segundo aluno"))
Local nIdade3 := Val(FWInputBox("Digite a idade do terceiro aluno"))

aAdd(aAluno, {cNome1, cValToChar(nIdade1)})
aAdd(aAluno, {cNome2, cValToChar(nIdade2)})
aAdd(aAluno, {cNome3, cValToChar(nIdade3)})

alert("Nome do aluno " + aAluno[2][1] + "e a idade é " + aAluno[2][2])
return
