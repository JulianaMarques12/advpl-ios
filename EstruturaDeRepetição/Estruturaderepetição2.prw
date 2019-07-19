#include 'Protheus.ch'
/*Escreva um algoritmo para ler as notas da 1a. e 2a. avaliações de um aluno,
calcule e imprima a média (simples) desse aluno. Só devem ser aceitos valores
válidos durante a leitura (0 a 10) para cada nota.*/

User function media()

Local nNota1 := Val(FWInputBox("Digite  a primeira nota:"))
Local nNota2 := Val(FWInputBox("Digite  a segunda nota:"))
Local nResult := 0

While nNota1 > 10 .or. nNota1 < 0
nNota1 := Val(FWInputBox("Digite um valor valido para a primeira nota"))
End Do
While nNota2 > 10 .or. nNota2 < 0
nNota2 := Val(FWInputBox("Digite um valor valido para a segunda nota"))
End Do
alert("A média é " + cValToChar((nNota1+nNota2)/2))

Return