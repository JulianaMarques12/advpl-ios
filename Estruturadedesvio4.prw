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

Local cNome := Val(FWInputBox("Digite o nome do Produto"))
Local nQuantidade := Val(FWInputBox("Digite a quantidade adquirida"))
Local nPreço := Val(FWInputBox("Digite o preço unitário do produto"))
Local nTotal := 