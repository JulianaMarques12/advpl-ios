#include 'Protheus.ch'

/*Faça um algoritmo que tenha um array com duas colunas, a primeira coluna
corresponde ao sexo e a segunda coluna corresponde a altura.
Este programa deverá calcular e mostrar :
a. A menor altura do grupo;
b. A média de altura das mulheres;
c. O número de homens;
d. O sexo da pessoa mais alta.*/

User function estrep4()

    Local nLinda := 0
    Local aPessoa := {}

Local cSexo1 := FWInputBox("Digite o sexo da primeira pessoa")
Local cSexo2 := FWInputBox("Digite o sexo da segunda pessoa")
Local cSexo3 := FWInputBox("Digite o sexo da terceira pessoa")

Local nAltura1 := Val(FWInputBox("Digite a altura da primeira pessoa"))
Local nAltura2 := Val(FWInputBox("Digite a altura da segunda pessoa"))
Local nAltura3 := Val(FWInputBox("Digite a altura da terceira pessoa"))

Local nMenor := nAltura1
Local cSexo  := cSexo1

aAdd(aPessoa, {cSexo1, nAltura1})
aAdd(aPessoa, {cSexo2, nAltura2})
aAdd(aPessoa, {cSexo3, nAltura3})

For nLinda := 1 to Len(aPessoa)

If nMenor > aPessoa[nLinda][2]
nMenor := aPessoa[nLinda][2]
  alert(nMenor)

Elseif nSexo := "Feminino"
cSexo := aPessoa[nLinda][1]


EndIf
 Next

Return