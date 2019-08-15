#include 'Protheus.ch'
#include 'FWMVCDEF.ch'


User Function za7() 
Local oBrowse := FWMBrowse():New()
oBrowse:SetAlias("ZA7")


oBrowse:Activate()
Return 


Static Function MenuDef()
Return FWMVCMenu('za7') 

Static Function ModelDef() 
Local oModel := MPFormModel():New("ZA7MODEL")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local oStruZA8 := FWFormStruct(1, "ZA8")
Local oStruConsulta

oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7)
oModel:AddGrid( 'ZA8DETAIL', 'ZA7MASTER', oStruZA8 ) 

oModel:SetRelation( 'ZA8DETAIL', { ;
                                    {'ZA8_FILIAL', "xFilial('ZA8')"},;
                                    {"ZA8_PLAY" , "ZA7_CODIGO",} ;
                                },;
                    ZA8->( IndexKey( 1 ) );
                 )

oModel:GetModel( 'ZA7MASTER' ):SetDescription( 'Playlist' )
oModel:GetModel( 'ZA8DETAIL' ):SetDescription( 'Músicas da Playlist'  )

oStruConsulta := FWFormStruct( 1, 'ZA7')


oStruConsulta:RemoveField("ZA7_DATA")
oStruConsulta:RemoveField("ZA7_NOME")
oStruConsulta:AddField('SELECT', ' ', 'SELECT', 'L', 1, 0, , , {}, .F.,FWBuildFeature( STRUCT_FEATURE_INIPAD, ".F.")) 


Return oModel


Static Function ViewDef() 
Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA7")
Local oStructZA8 := FWFormStruct(2, "ZA8")

oView:SetModel(ModelDef()) 

Static Function criaButtonSel(oPanel,oOtherObject)
    TButton():New( 01, 10, "Selecionar Todos",oPanel,{|| SelGrid(oOtherObject)}, 60,10,,,.F.,.T.,.F.,,.F.,,,.F. )
    TButton():New( 01, 80, "Copiar Autores da Musica",oPanel,{|| CopiaAutores(oOtherObject)}, 80,10,,,.F.,.T.,.F.,,.F.,,,.F. )
Return

Static Function SelGrid(oOtherObject)
Local oGrid := oOtherObject:GetModel():GetModel("CONSULTA")
Local nX
Local lValue
    For nX:=1 to oGrid:Length()
        oGrid:GoLine(nX)
        If !oGrid:isDeleted()
            lValue := oGrid:GetValue("SELECT")
            oGrid:LoadValue("SELECT", !lValue)
        EndIf
    Next nX
    oGrid:GoLine(1)
    oOtherObject:oControl:Refresh('VIEW_CONSULTA')
Return



Static Function insereAutores(cCodMusica,oGridAutores)
Local aAreaZA8 := ZA8->(GetArea())

    ZA8->(DBSetOrder(1)) 
    If ZA8->(DBSeek(xFilial("ZA8")+cCodMusica))                 
        While ZA8->(!EOF()) .AND. ZA8->ZA8_FILIAL == xFilial("ZA8") .AND.  ZA8->ZA8_MUSICA == cCodMusica
            If !oGridAutores:IsEmpty()
                oGridAutores:AddLine()
            EndIf
            oGridAutores:SetValue("ZA8_AUTOR", ZA8->ZA8_AUTOR)

            ZA8->(DBSkip())
        EndDo
    EndIf

RestArea(aAreaZA8)
Return