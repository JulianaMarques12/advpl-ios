#include 'Protheus.ch'
/*Fa�a um algoritmo para ler: a descri��o do produto (nome), a
quantidade adquirida e o pre�o unit�rio. Calcular e escrever o
total (total = quantidade adquirida * pre�o unit�rio), o desconto
e o total a pagar (total a pagar = total - desconto), sabendo-se
que:
- Se quantidade menor ou igual 5 o desconto ser� de 2%
- Se quantidade maior que 5 e quantidade menor ou igual a 10
o desconto ser� de 3%
- Se quantidade maior que 10 o desconto ser� de 5%
*/

User function loja()

Local cNome := (FWInputBox("Digite o nome do Produto"))
Local nQuantidade := Val(FWInputBox("Digite a quantidade adquirida"))
Local nPre�o := Val(FWInputBox("Digite o pre�o unit�rio do produto"))
Local nTotal := 0
Local nTotal2 := 0
Local nDesconto := 0

if nQuantidade <=5
    nDesconto := 0.02

elseif nQuantidade >5 .or. nQuantidade <=10
    nDesconto :=0.03

else
    nDesconto :=0.05

endif

nTotal1 := nQuantidade*nPre�o
nTotal2 := nTotal1 - (nDesconto*nTotal1)

alert(nTotal2) 

return