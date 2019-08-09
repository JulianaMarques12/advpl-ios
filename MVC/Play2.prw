#include 'Protheus.ch'

User function playios()

Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA7")
//set você coloca as configurações para executar a função.
oBrowse:SetMenuDef('playios')
oBrowse:Activate() 

Return

//Função que pertence somente a este fonte

Static Function MenuDef()

Return FWMVCMenu('playios') //Menu padrão do C.R.U.D

Static Function ModelDef()

Local oModel := MPFormModel():New("Li")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local bPos := {|oModelField| PosVldAutor(oModelField) }
//Form Field : Campo de formulário

oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7, /**/, bPos)
Return oModel

/*Static Function PosVldAutor(oModelField)
Local lTudoOk := .T.
Local dFalec := oModelField:GetValue("ZA7_DTAFAL")
Local cNome := oModelField:GetValue("ZA7_NOME")
If dFalec > Date()
     lTudoOk := .F.
    Help( ,, 'HELP',, 'Não adivinhe o futuro', 1, 0,,,,,, {"Digite uma data menor " + dtoc(date())})

ElseIf 'RICARDO' $ UPPER(cNome) .or. Empty(cNome)
     lTudoOk := .F.

Help( ,, 'HELP',, 'Ele não pode estar aqui', 1, 0,,,,,, {"Digite um nome valido"})

Endif
Return lTudoOk
*/
Static Function ViewDef()

Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA7")

oView:SetModel(ModelDef())


oView:AddField("ZA7_VIEW", oStruct, "ZA7MASTER")
oView:CreateHorizontalBox("BOXZA7", 100)
oView:SetOwnerView("ZA7_VIEW","BOXZA7")
//ele linka o componente junto com o box criado
Return oView