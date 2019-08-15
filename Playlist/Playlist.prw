#include 'Protheus.ch'

User Function Play() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA7")

/* Se Utiliza este m�todo quando o nome da fun��o principal n�o possui o mesmo
nome do fonte .prw */
oBrowse:SetMenuDef('Playlist') 
oBrowse:SetDescription('Premium/Comum') //Legenda Premium/Status do usuario
oBrowse:AddLegend( "ZA7_PREMIUM==.T.", "GREEN", "Premium" ) 
oBrowse:AddLegend( "ZA7_PREMIUM==.F.", "RED"  , "Comum" )


oBrowse:Activate() // \o/

Return 

//Fun��o que pertence somente a este fonte
Static Function Menudef()
 
Return FWMVCMenu('Playlist') //Menu Padr�o com C.R.U.D.

//MVC - Model (Dados e regra de neg�cio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() 
Local oModel := MPFormModel():New("ZA7MODEL")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local oStruZA8 := FWFormStruct(1, "ZA8")
Local bValidZA8 := {|oModelGrid| ValidZA8(oModelGrid) }
Local bValidZA7 := {|oModelField| ValidZA7(oModelField)}

Local oStruConsulta



//Form Field (Campo do formul�rio)
oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7,/* */, bValidZA7 )
//oStruConsulta:RemoveField("ZA7_FILIAL")
oModel:AddGrid( 'ZA8DETAIL', 'ZA7MASTER', oStruZA8,/*bLinePre*/,bValidZA8)
oModel:GetModel( 'ZA8DETAIL' ):SetLPre(bValidZA8) // Faz a valida��o Premium enquanto o usu�rio adiciona as m�sicas

oModel:GetModel( 'ZA8DETAIL' ):SetUniqueLine( { "ZA8_MUSICA"}) // Garante que o c�digo da m�sica n�o ser� repetido
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

//Remove os campos padr�es do Grid
oStruct:RemoveField("ZA7_FILIAL")
oStruct:RemoveField("ZA7_PATH")
oStructZA8:RemoveField("ZA8_FILIAL")
oStructZA8:RemoveField("ZA8_PLAY")
oStructZA8:RemoveField("ZA8_FILE")
oStructZA8:RemoveField("ZA8_ALBUM")
//-----------------------------------



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

//Valida��o Premium
Static Function ValidZA8(oModelGrid)

Local lOk := .T.
Local lPremium := oModelGrid:GetModel("ZA7MASTER"):GetValue('ZA7MASTER', "ZA7_PREMIU") // Verifica se o usu�rio � premium
Local nMusicas := oModelGrid:GetModel():GetModel("ZA8DETAIL"):Length(.T.) // Verifica a quant. de linhas do grid (ignora linhas deletadas(.T.) )

If nMusicas > 5 .And. lPremium == .F.// Impede que a playlist possua mais que 5 m�sicas se o usu�rio n�o for premium.
  lOk := .F.

  Help(NIL, NIL, "Voc� n�o pode adicionar mais m�sicas", NIL, "Voc� n�o possui uma playlist Premium", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Volte e selecione a op��o Premium"})
Endif


Return lOk

//Valida��o data Futura
Static Function ValidZA7(oModelField)
Local dData := oModelField:GetValue("ZA7_DATA") //Recebe o valor do campo de data na tabela
Local lTudoOk := .T.
If dData > Date() // Verifica se o valor da tabela � maior que a data atual
    lTudoOk := .F.
    Help(NIL, NIL, "Data Futura", NIL, "Voc� n�o pode colocar uma data de cria��o futura", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Coloque a data atual."})

Endif

return lTudoOk


