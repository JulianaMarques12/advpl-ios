#include 'protheus.ch'

/*Buscar todos os autores/interpretes da ZA0 
e exibir seus nomes em uma mensagem*/
User function BuscaAut()

Local aArea := GetArea() //guarda estado da area de trabalho ativa
Local aAreaZA0 := ZA0->(GetArea()) //guarda estado da tabela especificada
Local cMensagem := ''

DbSelectArea("ZA0") //Abre a tabela 
ZA0->(DbSetOrder(2)) //define o indice que será utilizado

While ZA0->(!EOF())  //enquanto nao chegar o Fim de Arquivo (end of file)
    cMensagem += ZA0->ZA0_NOME + CRLF //pega o valor do campo ZA0_NOME
    ZA0->(DBSkip()) //Pula linha na tabela
EndDo

Alert(cMensagem)

Return



User function GTA() //GeT Author

Local aArea := GetArea() //guarda estado da area de trabalho ativa
Local aAreaZA0 := ZA0->(GetArea()) //guarda estado da tabela especificada
Local cMensagem := ''
Local cNome := FWInputBox('Digite o nome do autor:')
Local cTipo := ''

DbSelectArea("ZA0") //Abre a tabela 
ZA0->(DbSetOrder(2)) //define o indice que será utilizado

//indice 2 = ZA0_FILIAL+ZA0_NOME

//busca um registro na tabela baseada no indice ativo
If ZA0->(DBSeek(xFilial("ZA0") + PADR(Upper(cNome),TamSX3('ZA0_NOME')[1] ) )) 

    If ZA0->ZA0_TIPO = '1' 
        cTipo := 'Autor'
    else 
        cTipo := 'Interprete'
    EndIf

    cMensagem += 'Código: ' + ZA0->ZA0_CODIGO + CRLF 
    cMensagem += 'Data falecimento: ' + DTOC(ZA0->ZA0_DTAFAL) + CRLF 
    cMensagem += 'Tipo: ' + cTipo
    
EndIf

Alert(cMensagem)

Return