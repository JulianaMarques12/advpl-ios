#include 'Protheus.ch'

/*Criar uma fun��o que recebe a altura (alt) e o sexo de uma pessoa e retorna o seu
peso ideal. Para homens, calcular o peso ideal usando a f�rmula peso ideal = 72.7 x alt
- 58 e, para mulheres, peso ideal = 62.1 x alt - 44.7.*/

User function f6c()

// ENTRADA DE DADOS

Local aPessoas := {}
Local cMensagem := ''
Local nX := 1
aAdd(aPessoas,{1.56, 'M', 0})
aAdd(aPessoas,{2, 'F', 0})
aAdd(aPessoas,{1.60, 'M', 0})
aAdd(aPessoas,{2.89, 'F', 0})
aAdd(aPessoas,{1.84, 'F', 0})

// PROCESSAMENTO DE DADOS

    for nX := 1 to Len(aPessoas) 
    aPessoas[nX,3] := u_calculo(aPessoas [nX,1], aPessoas [nX,2])
    
    cMensagem += u_Mensagem(nX, aPessoas[nX,3])
    
     /*cMensagem += "O peso ideal da pessoa " + cValToChar(nX) + ;
    " � " + STR(aPessoas[nX,3],6,2) + CRLF*/
    next

// SAIDA DE DADOS


alert(cMensagem)

Return

User function Mensagem(nPosicao, nPeso)
Local cMensagem := ''

cMensagem := "O peso ideal da pessoa " + cValToChar(nPosicao) + ; 
" � " +STR(nPeso,6,2) + CRLF

return cMensagem

