#include 'Protheus.ch'

User Function musica() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA1")
oBrowse:SetMenuDef('ios02') 
/* Se Utiliza este m�todo quando o nome da fun��o principal n�o possui o mesmo
nome do fonte .prw */

oBrowse:Activate() // \o/

Return 

//Fun��o que pertence somente a este fonte
Static Function Menudef()
 
Return FWMVCMenu('ios02') //Menu Padr�o com C.R.U.D.

//MVC - Model (Dados e regra de neg�cio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() //N�o tinha teto n�o tinha nada
Local oModel := MPFormModel():New("ZA1MODEL")
Local oStruZA1 := FWFormStruct(1, "ZA1")
Local oStruZA2 := FWFormStruct(1, "ZA2")
Local bValid := {|oModelGrid| ValidAutor(oModelGrid)}

//Form Field (Campo do formul�rio)
oModel:AddFields("ZA1MASTER",/* Owner */,oStruZA1,/* */)
oModel:AddGrid( 'ZA2DETAIL', 'ZA1MASTER', oStruZA2, ,bValid) 
oModel:SetRelation( 'ZA2DETAIL', { {'ZA2_FILIAL', "xFilial('ZA2')"},;
 {"ZA2_MUSICA" , "ZA1_MUSICA"} }, ZA2->( IndexKey( 1 ) ) )

oModel:GetModel( 'ZA1MASTER' ):SetDescription( 'Dados da Musica' )
oModel:GetModel( 'ZA2DETAIL' ):SetDescription( 'Dados do Autor Da Musica'  )

Return oModel


Static Function ViewDef() //O.O
Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA1")
Local oStructZA2 := FWFormStruct(2, "ZA2")
oView:SetModel(ModelDef()) //return do ModelDef para SetModel

              //ID       , Estrutura, ID do Model
oView:AddField("ZA1_VIEW", oStruct, "ZA1MASTER")
oView:AddGrid( 'ZA2_VIEW', oStructZA2, 'ZA2DETAIL' )
// Define campos que terao Auto Incremento
oView:AddIncrementField( 'ZA2_VIEW', 'ZA2_ITEM' )

oView:CreateHorizontalBox("BOXZA1", 50)
oView:CreateHorizontalBox("BOXZA2", 50)

oView:SetOwnerView("ZA1_VIEW","BOXZA1") //Cajuzinho ?
oView:SetOwnerView("ZA2_VIEW","BOXZA2") 

oView:EnableTitleView('ZA2_VIEW') //habilita a descricao do submodelo

Return oView

Static Function ValidAutor(oModelGrid)

Local lRet := .F.
Local cCodAutor := oModelGrid:GetValue('ZA2_AUTOR')
                                  //  (CAMPO, NUMERO DA LINHA)
/* 1) Buscar na ZA0 o registro do autor que est� sendo inserido no GRID
   2) Pegar a data de falescimento
   3) Se a data de falescimento n�o estiver em branco, bloquear a inclus�o exibindo a mensagem de erro */

/* Guardar a area ativa e a area da tabela
   Abrir a tabela ZA0
   Setar o indice da ZA0(indice que contenha filial + c�digo)
   Buscar o registro filtrando o c�digo especifico
   Se eu achar o registro eu avalio o campo de data de falescimento
   Restaurar a area da tabela e a area ativa*/

Local aArea := GetArea()
Local aAreaZA0 := ZA0->(GetArea())
Local cMensagem := ''

DbSelectArea("ZA0")
ZA0->(DbSetOrder(3))

If 


Endif


Return lRet