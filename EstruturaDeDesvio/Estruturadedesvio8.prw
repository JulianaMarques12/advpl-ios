#include 'Protheus.ch'

/*Ler o nome de 2 times e o n�mero de gols marcados na partida
(para cada time). Escrever o nome do vencedor. Caso n�o haja
vencedor dever� ser impressa a palavra EMPATE.*/

User function ed8()

Local cTime1 := FWInputBox("Digite o nome do primeiro time")
Local cTime2 := FWInputBox("Digite o nome do segundo time")

Local nPlacar1 := Val(FWInputBox("Digite o tanto de gols do primeiro time"))
Local nPlacar2 := Val(FWInputBox("Digite o tanto de gols do segundo time"))

If nPlacar1 > nPlacar2
alert((cTime1) + " � o vencedor")

Elseif nPlacar1 == nPlacar2
alert("EMPATE")

Else 
alert((cTime2) + " � o vencedor")

EndIf

Return