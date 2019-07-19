#include 'Protheus.ch'

/*Baseado no algoritmo desenvolvido no exercício 1, altere-o para que ele ignore
a letra A e a letra B não devendo coloca-las na contagem das letras.*/

User function exer2()

Local aLetras := {'J','U','L','I','A','N','A'}
Local nX
Local nTotal := 0

For nX := 1 to Len(aLetras)
If aLetras[nX] <> 'A' .AND. aLetras[nX] <> 'B'
    nTotal++
End If

Next 

Alert(nTotal)
Return