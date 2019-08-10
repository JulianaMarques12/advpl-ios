#include 'Protheus.ch'

User Function Premium() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA7")

/* Se Utiliza este m�todo quando o nome da fun��o principal n�o possui o mesmo
nome do fonte .prw */
oBrowse:SetMenuDef('premium') 
oBrowse:Activate() // \o/

Return 

//Fun��o que pertence somente a este fonte
Static Function Menudef()
 
Return FWMVCMenu('premium') //Menu Padr�o com C.R.U.D.

//MVC - Model (Dados e regra de neg�cio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() //N�o tinha teto n�o tinha nada
Local oModel := MPFormModel():New("ZA7MODEL")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local oStruZA8 := FWFormStruct(1, "ZA8")
//Local bLinePre := {|oGridModel, nLine, cAction, cIDField, xValue, xCurrentValue| ValidPremium(oGridModel, nLine, cAction, cIDField, xValue, xCurrentValue)}
Local bValid := {|oModel| ValidPremium(oModel)}
//Local bValid := {|oModel| ValidPremium(oModel)}
Local oStruConsulta



//Form Field (Campo do formul�rio)
oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7,/* */)
//oStruConsulta:RemoveField("ZA7_FILIAL")
oModel:AddGrid( 'ZA8DETAIL', 'ZA7MASTER', oStruZA8,/*bLinePre*/,/*bValid*/) 
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
Local bValid := {|oModel| ValMusic(oModel)}
oView:SetModel(ModelDef()) //return do ModelDef para SetModel

//Remove os campos padr�es do Grid
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
Static Function ValidPremium (oModel)
Local oModelGrid := Nil
local lRet := .T.
Default  oModel := Nil  

 oModelGrid:= oModel:GetModel("ZA8DETAIL") 

//Impede que usu�rios que n�o s�o premium adicionem mais de 5 musicas.
 .and. "ZA7_PREMIU" = .F.
//if (!empty(oGridModel:nLine) .and. oGridModel:NLINE > 5 /*.and. "ZA7_PREMIUM" == .F.*/)
   
  //u_WeHelp(" Voc� n�o � premium","Voc� n�o pode adicionar mais m�sicas ", "Adquira uma conta premium")
    //lRet := .F.
//EndIf


return lRet 

