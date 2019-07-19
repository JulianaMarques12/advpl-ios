#include 'Protheus.ch'

/*Crie um array para guardar o nome dos alunos dessa sala, usando o aAdd adicione o
nome de 10 alunos. Depois disso, exclua 5 alunos do array usando a função aDel e use
a função aSize pra redimensionar o tamanho de forma a não sobrar nenhuma posição
com o conteúdo NIL.*/

User function excluir()

Local aVetor := {}
Local nNum 

For nNum := 1 to 10
    aAdd(aVetor,{FWInputBox("Digite o nome do aluno")})
Next
Varinfo("Test", aVetor)
For nNum := 1 to 5
    aDel(aVetor,nNum)

Next  
Varinfo("Test", aVetor)
Return