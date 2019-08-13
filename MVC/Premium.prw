#include 'Protheus.ch'

User Function Premium() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA7")

/* Se Utiliza este método quando o nome da função principal não possui o mesmo
nome do fonte .prw */
oBrowse:SetMenuDef('Premium') 
oBrowse:Activate() // \o/

Return 

//Função que pertence somente a este fonte
Static Function Menudef()
 
Return FWMVCMenu('Premium') //Menu Padrão com C.R.U.D.

//MVC - Model (Dados e regra de negócio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() //Não tinha teto não tinha nada
Local oModel := MPFormModel():New("ZA7MODEL")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local oStruZA8 := FWFormStruct(1, "ZA8")
Local bValid := {|oModelGrid| ValidPremium(oModelGrid) }
Local oStruConsulta



//Form Field (Campo do formulário)
oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7,/* */)
//oStruConsulta:RemoveField("ZA7_FILIAL")
oModel:AddGrid( 'ZA8DETAIL', 'ZA7MASTER', oStruZA8,/*bLinePre*/,bValid) 
oModel:GetModel( 'ZA8DETAIL' ):SetUniqueLine( { "ZA8_MUSICA"})
oModel:SetRelation( 'ZA8DETAIL', { {'ZA8_FILIAL', "xFilial('ZA8')"},;
 {"ZA8_PLAY" , "ZA7_CODIGO"} }, ZA8->( IndexKey( 1 ) ) )

oModel:GetModel( 'ZA7MASTER' ):SetDescription( 'Dados da Musica' )
oModel:GetModel( 'ZA8DETAIL' ):SetDescription( 'Dados do Autor Da Musica'  )

Return oModel


Static Function ViewDef() //O.O
Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA7")
Local oStructZA8 := FWFormStruct(2, "ZA8")

oView:SetModel(ModelDef()) //return do ModelDef para SetModel

//Remove os campos padrões do Grid
oStruct:RemoveField("ZA7_FILIAL")
oStructZA8:RemoveField("ZA8_FILIAL")
oStructZA8:RemoveField("ZA8_PLAY")


              //ID       , Estrutura, ID do Model
oView:AddField("ZA7_VIEW", oStruct, "ZA7MASTER")
oView:AddGrid( 'ZA8_VIEW', oStructZA8, 'ZA8DETAIL',,/*bValid*/ )
// Define campos que terao Auto Incremento
oView:AddIncrementField( 'ZA8_VIEW', 'ZA8_ITEM' )

oView:CreateHorizontalBox("BOXZA7", 50)
oView:CreateHorizontalBox("BOXZA8", 50)

oView:SetOwnerView("ZA7_VIEW","BOXZA7") //Cajuzinho ?
oView:SetOwnerView("ZA8_VIEW","BOXZA8") 

oView:EnableTitleView('ZA8_VIEW') //habilita a descricao do submodelo

Return oView

//Static Function ValidPremium (oGridModel, nLine, cAction, cIDField, xValue, xCurrentValue)
Static Function ValidPremium(oModelGrid)

Local lOk := .T.
Local lPremium := oModelGrid:GetModel("ZA7MASTER"):GetValue('ZA7MASTER', "ZA7_PREMIU")
Local nMusicas := oModelGrid:GetModel():GetModel("ZA8DETAIL"):Length() 
If nMusicas > 5 .And. lPremium == .F.
  lOk := .F.

  Help(NIL, NIL, "Você não pode adicionar mais músicas", NIL, "Você não possui uma playlist Premium", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Volte e selecione a opção Premium"})
Endif

return lOk