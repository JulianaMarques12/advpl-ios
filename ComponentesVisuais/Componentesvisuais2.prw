#include 'Protheus.ch'

/*Crie uma janela com 2 campos do tipo GET para solicitar o nome de um usuário
e sua senha. Adicione um botão de OK e um de cancelar. Ao clicar em OK deve-
se avaliar se a senha é igual a "IOS2019", caso seja, exibir uma mensagem de
senha correta. Se estiver errado exibir uma mensagem de senha incorreta. Ao
clicar em cancelar deve-se fechar a janela*/

User function cv2()
Local oDlg 
Local cTitulo := 'Tela de Usuario'
Local oFont
Local oSay
Local oGet
Local cNome := Space(100)
Local cSen := Space(12)
Local lCheck := .F.
local oCheck


DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 600,800 PIXEL

// Cria Fonte para visualização
oFont := TFont():New('Courier new',,-18,.T.)
// Cria o Objeto tSay usando o comando @ .. SAY
@ 10,10 SAY oSay PROMPT 'Nome de usuario' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
@ 50,10 SAY oSay PROMPT 'Senha' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
@ 10,100 GET oGet VAR cNome FONT oFont SIZE 200,20 OF oDlg PIXEL VALID !empty(cNome) 
@ 50,50 GET oGet VAR cSen FONT oFont SIZE 50,20 OF oDlg PIXEL 

@80,120 BUTTON "Confirmar" FONT oFont SIZE 080, 047 PIXEL OF oDlg ACTION u_cv2c(oDlg,cSen)
@150,120 BUTTON "Cancelar" FONT oFont SIZE 080, 047 PIXEL OF oDlg ACTION oDlg:End()

ACTIVATE MSDIALOG oDlg CENTERED

Return
User Function cv2c(oDlg,cSen)
If cSen != "IOS2019"

alert("Senha Incorreta")

Else
alert("Senha correta, login efetuado.")
Endif
Return