#include 'Protheus.ch'

/*Fazer a função POW (base, expoente) que recebe base e expoente e retorna o valor
de base elevado a expoente. Se os valores de base e expoente não forem inteiros a
função deve retornar 0.*/

User function f4()

Local nBase := Val(FWInputBox("Digite um valor para base"))
Local nExpoente := Val(FWInputBox("Digite um valor para o expoente"))

Alert(u_f4c(nBase, nExpoente))

Return

User function f4c(nBase, nExpoente)
Local nX := 0
Local nResult := 0

For nX := 1 to nExpoente -1

nResult := nResult + (nBase*nBase)


Next


Return nResult