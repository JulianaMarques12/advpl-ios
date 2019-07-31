#include 'Protheus.ch'


Class Humano
    Data nOlhos
    Data nBracos
    Data nPernas

    Method New(nOlhos, nBracos, nPernas) CONSTRUCTOR
    Method Acao_Correr()
EndClass


Method Acao_Correr() Class Humano
    Alert('Estou correndo')
return


Method New(nOlhos, nBracos, nPernas) Class Humano
self:nOlhos := nOlhos
self:nBracos := nBracos
self:nPernas := nPernas
return


User Function CriaHumanos()
Local oHumaninho := Humano():New(2,2,2)

oHumaninho:Acao_Correr()

return


