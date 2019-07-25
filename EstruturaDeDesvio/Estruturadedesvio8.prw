#include 'Protheus.ch'

/*Ler o nome de 2 times e o número de gols marcados na partida
(para cada time). Escrever o nome do vencedor. Caso não haja
vencedor deverá ser impressa a palavra EMPATE.*/

User function ed8()

Local cTime1 := FWInputBox("Digite o nome do primeiro time")
Local cTime2 := FWInputBox("Digite o nome do segundo time")

Local nPlacar1 := Val(FWInputBox("Digite o tanto de gols do primeiro time"))
Local nPlacar2 := Val(FWInputBox("Digite o tanto de gols do segundo time"))

If nPlacar1 > nPlacar2
alert((cTime1) + " É o vencedor")

Elseif nPlacar1 == nPlacar2
alert("EMPATE")

Else 
alert((cTime2) + " É o vencedor")

EndIf

Return