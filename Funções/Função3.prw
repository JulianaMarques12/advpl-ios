#Include 'Protheus.ch'

/*Criar uma função que receba um vetor por referência e retorne este em ordem
decrescente*/

User function f3()
Local aVetor := {1,5,7,8,9,10}
Local aVetor1 := {}
 
aVetor1 := u_f3c(aVetor)

varinfo("aVetor1", aVetor1)

Return

User function f3c(aVetor)
Local aRet := {}
Local nX := 0

For nX := 6 to 1 step -1

aAdd(aRet, aVetor[nX])
    
Next
Return aRet
