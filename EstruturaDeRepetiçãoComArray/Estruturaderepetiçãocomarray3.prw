#include 'Protheus.ch'

/*Baseado no algoritmo desenvolvido no exercicio1, altere-o para que ele pare a
execu��o se encontrar a letra F no array. Ao parar a execu��o ele deve mostrar
quantas letras conseguiu ler at� aquele momento e quantas letras faltaram
analisar.*/

User Function exer3()

Local aLetras := {'A','B','C','D','E','F','G','H','I'}
Local nX
Local nTotal := 0

For nX := 1 to Len(aLetras)
  If aLetras[nX] == 'F' 
    Exit
End If
nTotal++
Next 

Alert("Antes do F, foram percerridas " + cValToChar(nTotal))
alert("E faltaram ser analisadas " + cValToChar((Len(aLetras) - nTotal) -1))

Return






Return