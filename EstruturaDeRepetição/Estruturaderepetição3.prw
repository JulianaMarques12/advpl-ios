#include 'Protheus.ch'

/*Acrescente uma mensagem 'NOVO CÁLCULO (S/N)?' ao final do exercício
anterior. Se for respondido 'S' deve retornar e executar um novo cálculo, caso
contrário deverá encerrar o algoritmo.*/

User function novocal()

Local nNota1 := -1
Local nNota2 := -1
Local lResult := .T.

While lResult 
    nNota1 := -1
    nNota2 := -1

    While nNota1 < 0 .or. nNota1 > 10
        nNota1 := Val(FWInputBox("Digite a primeira nota"))
    End Do
    While nNota2 < 0 .or. nNota2 > 10
        nNota2 := Val(FWInputBox("Digite a segunda nota"))
    End Do

    alert("A média é " + cValToChar((nNota1+nNota2)/2))

   lResult := MSGYESNO("Deseja calcular novamente","Titulo qualquer")

End Do
Return