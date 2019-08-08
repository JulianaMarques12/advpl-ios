#include 'Protheus.ch'

User Function MUSPLAY() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA7")
oBrowse:SetMenuDef('playlist') 
/* Se Utiliza este método quando o nome da função principal não possui o mesmo
nome do fonte .prw */

oBrowse:Activate() // \o/

Return 

//Função que pertence somente a este fonte
Static Function Menudef()
 
Return FWMVCMenu('playlist') //Menu Padrão com C.R.U.D.

//MVC - Model (Dados e regra de negócio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() //Não tinha teto não tinha nada
Local oModel := MPFormModel():New("ZA7MODEL")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local oStruZA8 := FWFormStruct(1, "ZA8")
Local bValid := {|oModelGrid| ValidAutor(oModelGrid)}

//Form Field (Campo do formulário)
oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7,/* */)
oModel:AddGrid( 'ZA8DETAIL', 'ZA7MASTER', oStruZA8, ,bValid) 
oModel:SetRelation( 'ZA8DETAIL', { {'ZA8_FILIAL', "xFilial('ZA8')"},;
 {"ZA8_PLAY" , "ZA7_MUSICA"} }, ZA8->( IndexKey( 1 ) ) )

oModel:GetModel( 'ZA7MASTER' ):SetDescription( 'Dados da Musica' )
oModel:GetModel( 'ZA8DETAIL' ):SetDescription( 'Dados do Autor Da Musica'  )

Return oModel


Static Function ViewDef() //O.O
Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA7")
Local oStructZA8 := FWFormStruct(2, "ZA8")
oView:SetModel(ModelDef()) //return do ModelDef para SetModel

              //ID       , Estrutura, ID do Model
oView:AddField("ZA7_VIEW", oStruct, "ZA7MASTER")
oView:AddGrid( 'ZA8_VIEW', oStructZA8, 'ZA8DETAIL' )
// Define campos que terao Auto Incremento
oView:AddIncrementField( 'ZA8_VIEW', 'ZA8_ITEM' )

oView:CreateHorizontalBox("BOXZA7", 50)
oView:CreateHorizontalBox("BOXZA8", 50)

oView:SetOwnerView("ZA7_VIEW","BOXZA7") //Cajuzinho ?
oView:SetOwnerView("ZA8_VIEW","BOXZA8") 

oView:EnableTitleView('ZA8_VIEW') //habilita a descricao do submodelo

Return oView

Static Function ValidAutor(oModelGrid)

Local lRet := .F.
Local cCodAutor := oModelGrid:GetValue('ZA8_AUTOR')
                                  //  (CAMPO, NUMERO DA LINHA)
/* 1) Buscar na ZA0 o registro do autor que está sendo inserido no GRID
   2) Pegar a data de falescimento
   3) Se a data de falescimento não estiver em branco, bloquear a inclusão exibindo a mensagem de erro */

/* Guardar a area ativa e a area da tabela
   Abrir a tabela ZA0
   Setar o indice da ZA0(indice que contenha filial + código)
   Buscar o registro filtrando o código especifico
   Se eu achar o registro eu avalio o campo de data de falescimento
   Restaurar a area da tabela e a area ativa*/

Local aArea := GetArea()
Local aAreaZA0 := ZA0->(GetArea())
Local cMensagem := ''

DbSelectArea("ZA0")
ZA0->(DbSetOrder(3))

//If 


//Endif


Return lRet