#include 'Protheus.ch'

User Function musica() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA1")
oBrowse:SetMenuDef('ios02') 
/* Se Utiliza este método quando o nome da função principal não possui o mesmo
nome do fonte .prw */

oBrowse:Activate() // \o/

Return 

//Função que pertence somente a este fonte
Static Function Menudef()
 
Return FWMVCMenu('ios02') //Menu Padrão com C.R.U.D.

//MVC - Model (Dados e regra de negócio) 
//      View (Interface) 
//      Controller (dentro da lib)


Static Function ModelDef() //Não tinha teto não tinha nada
Local oModel := MPFormModel():New("ZA1MODEL")
Local oStruZA1 := FWFormStruct(1, "ZA1")
Local oStruZA2 := FWFormStruct(1, "ZA2")
//Local bValid := {|oModelGrid| ValidAutor(oModelGrid)}
Local bValidNm := {|oModel| u_ValidNm(oModel) }

//Form Field (Campo do formulário)
oModel:AddFields("ZA1MASTER",/* Owner */,oStruZA1,/* */,bValidNm)
oModel:AddGrid( 'ZA2DETAIL', 'ZA1MASTER', oStruZA2, ) //bValid) 
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

User Function ValidNm(onModel)


local aAreaZa1 := GetArea('ZA1')

local flag := .T.
ZA1->(DbSetorder(2))
if ZA1 -> (DbSeek(xFilial("ZA1")+onModel:GetValue('ZA1_TITULO')))

flag := .F.

Help( ,, 'HELP','', 'Essa música já existe. Inclua uma música diferente', 1, 0)


End if

restarea(aAreaZa1)

return flag