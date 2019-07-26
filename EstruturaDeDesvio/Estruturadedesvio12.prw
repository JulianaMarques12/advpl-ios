#include 'Protheus.ch'

/*Elabore um algoritmo que dada a idade de um nadador
classifique-o em uma das seguintes categorias:

Infantil A = 5 a 7 anos
Infantil B = 8 a 11 anos
Juvenil A = 12 a 13 anos
Juvenil B = 14 a 17 anos
Adultos = Maiores de 18 anos*/

User function ed12()

Local nIdade := Val(FWInputBox("Digite aqui a idade do primeiro nadador."))

If nIdade >= 5 .And. nIdade <= 7
alert("Este nadador é da equipe Infantil A.")

Elseif nIdade >= 8 .And. nIdade <= 11
alert("Este nadador é da equipe Infantil B.")

Elseif nIdade >= 12 .And. nIdade <= 13
alert("Este nadador é da equipe Juvenil A.")

Elseif nIdade >= 14 .And. nIdade <= 17
alert("Este nadador é da equipe Juvenil B.")

Else 
alert("Este nadador é adulto.")
EndIf


Return