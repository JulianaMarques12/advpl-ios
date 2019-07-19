#include 'Protheus.ch'
/*Criar um array para guardar o nome de 5 alunos, os nomes deverão ser colocados no
array depois da declaração do mesmo, inserindo um valor de cada vez. Exiba o nome
do terceiro aluno.*/

User function aluno()

Local aAluno := {} //Array()

Local cAluno1 := FWInputBox("Digite o nome do primeiro aluno")
Local cAluno2 := FWInputBox("Digite o nome do segundo aluno")
Local cAluno3 := FWInputBox("Digite o nome do terceiro aluno")
Local cAluno4 := FWInputBox("Digite o nome do quarto aluno")
Local cAluno5 := FWInputBox("Digite o nome do quinto aluno")

aAdd(aAluno,cAluno1)
aAdd(aAluno,cAluno2)
aAdd(aAluno,cAluno3)
aAdd(aAluno,cAluno4)
aAdd(aAluno,cAluno5)

alert("Nome do aluno " + aAluno[3])

return