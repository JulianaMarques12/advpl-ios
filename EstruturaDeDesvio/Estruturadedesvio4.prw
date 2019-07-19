#include 'Protheus.ch'
/*Faça um algoritmo para ler: a descrição do produto (nome), a
quantidade adquirida e o preço unitário. Calcular e escrever o
total (total = quantidade adquirida * preço unitário), o desconto
e o total a pagar (total a pagar = total - desconto), sabendo-se
que:
- Se quantidade menor ou igual 5 o desconto será de 2%
- Se quantidade maior que 5 e quantidade menor ou igual a 10
o desconto será de 3%
- Se quantidade maior que 10 o desconto será de 5%
*/

User function loja()

Local cNome := (FWInputBox("Digite o nome do Produto"))
Local nQuantidade := Val(FWInputBox("Digite a quantidade adquirida"))
Local nPreço := Val(FWInputBox("Digite o preço unitário do produto"))
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

nTotal1 := nQuantidade*nPreço
nTotal2 := nTotal1 - (nDesconto*nTotal1)

alert(nTotal2) 

return