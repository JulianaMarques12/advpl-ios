#include 'Protheus.ch'

/*Crie uma janela com um bot�o de fechar. Ao clicar nesse bot�o a janela dever�
ser fechada.*/

User function cv1()

Local oDlg
Local cTitulo := 'Titulo'

DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000, 000 to 400, 600 PIXEL

@150, 120 BUTTON "Confirmar" SIZE 080, 047 PIXEL OF oDlg ACTION oDlg:End()

ACTIVATE MSDIALOG oDlg CENTERED

Return