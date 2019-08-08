#include 'Protheus.ch'
#include 'FWMVCDEF.ch'

//-------------------------------------------------------------------
/*/{Protheus.doc} ios03
Função principal, chamada pelo Menu.
Deve abrir o browse de musicas e exibir ações para os registros

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
User Function za7() //O nome da function foi definido com o nome do Browse
Local oBrowse := FWMBrowse():New()
oBrowse:SetAlias("ZA7")
//-------------------------------------------------------------------
// Se Utiliza este método quando o nome da função principal não 
// possui o mesmo nome do fonte .prw
//-------------------------------------------------------------------
//oBrowse:SetMenuDef('ios03') 
oBrowse:Activate() // \o/
Return 

//-------------------------------------------------------------------
/*/{Protheus.doc} ModelDef
Contem as ações do browse

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function MenuDef()
Return FWMVCMenu('za7') 

//-------------------------------------------------------------------
/*/{Protheus.doc} ModelDef
Contem a descricao do negocio e validacoes

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function ModelDef() 
Local oModel := MPFormModel():New("ZA7MODEL")
Local oStruZA7 := FWFormStruct(1, "ZA7")
Local oStruZA8 := FWFormStruct(1, "ZA8")
Local oStruConsulta

oModel:AddFields("ZA7MASTER",/* Owner */,oStruZA7)
oModel:AddGrid( 'ZA8DETAIL', 'ZA7MASTER', oStruZA8 ) 

oModel:SetRelation( 'ZA8DETAIL', { ;
                                    {'ZA8_FILIAL', "xFilial('ZA8')"},;
                                    {"ZA8_PLAY" , "ZA7_CODIGO"} ;
                                },;
                    ZA8->( IndexKey( 1 ) );
                 )

oModel:GetModel( 'ZA7MASTER' ):SetDescription( 'Playlist' )
oModel:GetModel( 'ZA8DETAIL' ):SetDescription( 'Músicas da Playlist'  )

oStruConsulta := FWFormStruct( 1, 'ZA7')

//---------------------------------------------------------------------
// Grid de consulta de musicas, para realizar copia dos autores
//---------------------------------------------------------------------
//Remove campos do grid
oStruConsulta:RemoveField("ZA7_DATA")
oStruConsulta:RemoveField("ZA7_NOME")
oStruConsulta:AddField('SELECT', ' ', 'SELECT', 'L', 1, 0, , , {}, .F.,FWBuildFeature( STRUCT_FEATURE_INIPAD, ".F.")) 

// /*cria o grid
// oModel:AddGrid( 'CONSULTA', 'ZA7MASTER', oStruConsulta, /*bLinePre*/, /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )
// oModel:GetModel( 'CONSULTA' ):SetDescription( 'Copia de Autores' )

// //define que o grid nao deve ser gravado no banco de dados
// oModel:GetModel('CONSULTA'):SetOnlyQuery()

// //define que o grid nao é obrigatorio
// oModel:GetModel('CONSULTA'):SetOptional()

// //define uma acao para ser executada depois que o modelo for carregado e antes da tela ser mostrada
// oModel:SetActivate({|oModel| AfterActivate(oModel)})

Return oModel

//-------------------------------------------------------------------
/*/{Protheus.doc} ViewDef
Contem toda a interface grafica

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function ViewDef() //O.O
Local oView := FWFormView():New()
Local oStruct := FWFormStruct(2, "ZA7")
Local oStructZA8 := FWFormStruct(2, "ZA8")
//Local oStruConsulta := FWFormStruct( 2, 'ZA7' )   

oView:SetModel(ModelDef()) //return do ModelDef para SetModel

//Remove Campos do Grid
oStructZA8:RemoveField("ZA8_MUSICA")

//Remove campos do grid
oStruConsulta:RemoveField("ZA7_DATA")
oStruConsulta:RemoveField("ZA7_NOME")

//Desabilita edicao dos campos na view
oStruConsulta:SetProperty("ZA7_MUSICA",MVC_VIEW_CANCHANGE,.F.)
oStruConsulta:SetProperty("ZA7_TITULO",MVC_VIEW_CANCHANGE,.F.)

//adiciona um campo de selecao no grid
oStruConsulta:AddField( 'SELECT','01','SELECT','SELECT',, 'Check')

oView:AddField("ZA7_VIEW", oStruct, "ZA7MASTER")
oView:AddGrid( 'ZA8_VIEW', oStructZA8, 'ZA8DETAIL' )
oView:AddGrid(  'VIEW_CONSULTA', oStruConsulta, 'CONSULTA' )

//Cria um painel para adicionar componentes graficos
oView:AddOtherObject("PANEL_SEL",{|oPanel,oOtherObject| criaButtonSel(oPanel,oOtherObject)})

// Define campos que terao Auto Incremento
oView:AddIncrementField( 'ZA8_VIEW', 'ZA8_ITEM' )

oView:CreateHorizontalBox("BOXZA1", 20)
oView:CreateHorizontalBox("BOXZA8", 40)
oView:CreateHorizontalBox( 'CONSULTA', 30 )
oView:CreateHorizontalBox( "BOX_SEL",10)

oView:SetOwnerView("ZA1_VIEW","BOXZA1") //Cajuzinho ?
oView:SetOwnerView("ZA8_VIEW","BOXZA8")
oView:SetOwnerView( 'VIEW_CONSULTA', 'CONSULTA' ) 
oView:SetOwnerView('PANEL_SEL','BOX_SEL')    

oView:EnableTitleView('ZA8_VIEW') //habilita a descricao do submodelo
oView:EnableTitleView('CONSULTA') //habilita a descricao do submodelo

Return oView

//-------------------------------------------------------------------
/*/{Protheus.doc} AfterActivate
Carrega para o grid de consulta todas as musicas, exceto a musica
que esteja sendo alterada (caso haja alguma)

@param oModel Objeto do modelo de dado

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function AfterActivate(oModel)
Local aAreaZA1 := ZA1->(GetArea())
Local cMyCode := oModel:GetValue("ZA1MASTER", "ZA1_MUSICA")
Local oGridConsulta := oModel:GetModel("CONSULTA")
Local cMyFilial := xFilial("ZA1")

    ZA1->(DBSetOrder(1))    
    If ZA1->(DBSeek(cMyFilial))
        While ZA1->(!EOF()) .And. ZA1->ZA1_FILIAL == cMyFilial
            If ZA1->ZA1_MUSICA == cMyCode
                ZA1->(DBSkip())            
                Loop            
            EndIf

            //Verifica se o grid tem aquela primeira linha em branco
            If !oGridConsulta:IsEmpty()
                //Adiciona uma linha no grid
                oGridConsulta:AddLine()
            EndIf
            
            //Adiciona valores na linha, sem executar validacao e gatilho
            oGridConsulta:LoadValue("ZA1_MUSICA", ZA1->ZA1_MUSICA)
            oGridConsulta:LoadValue("ZA1_TITULO", ZA1->ZA1_TITULO)        

            ZA1->(DBSkip())
        EndDo
    EndIf

RestArea(aAreaZA1)
Return

//-------------------------------------------------------------------
/*/{Protheus.doc} criaButtonSel
Adiciona 2 botoes no painel criado usando addOtherObject

@param oPanel painel criado pelo MVC
@param oOtherObject componente da view

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function criaButtonSel(oPanel,oOtherObject)
    TButton():New( 01, 10, "Selecionar Todos",oPanel,{|| SelGrid(oOtherObject)}, 60,10,,,.F.,.T.,.F.,,.F.,,,.F. )
    TButton():New( 01, 80, "Copiar Autores da Musica",oPanel,{|| CopiaAutores(oOtherObject)}, 80,10,,,.F.,.T.,.F.,,.F.,,,.F. )
Return

//-------------------------------------------------------------------
/*/{Protheus.doc} SelGrid
Ação para "selecionar todos" os registros do grid

@param oOtherObject componente da view

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
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

//-------------------------------------------------------------------
/*/{Protheus.doc} CopiaAutores
Ação para copiar os autores do grid de consulta para o grid de autores

@param oOtherObject componente da view

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function CopiaAutores(oOtherObject)
Local oGrid := oOtherObject:GetModel():GetModel("CONSULTA")
Local nX
Local lSelected
Local oGridAutores := oOtherObject:GetModel():GetModel("ZA8DETAIL")
Local nLine := oGridAutores:GetLine()

    For nX:=1 to oGrid:Length()
        If !oGrid:isDeleted()
            lSelected := oGrid:GetValue("SELECT")
            If lSelected
                insereAutores(oGrid:GetValue("ZA1_MUSICA", nX), oGridAutores)
            EndIf
        EndIf
    Next nX

    oGridAutores:GoLine(nLine)
    oOtherObject:oControl:Refresh('ZA8_VIEW')
Return

//-------------------------------------------------------------------
/*/{Protheus.doc} insereAutores
Insere os autores de uma determinada musica no grid de autores

@param cCodMusica codigo da musica
@param oGridAutores grid do model de autores

@author Juliane Venteu
@since 07/08/2019
/*/
//-------------------------------------------------------------------
Static Function insereAutores(cCodMusica,oGridAutores)
Local aAreaZA8 := ZA8->(GetArea())

    ZA8->(DBSetOrder(1)) //ZA8_FILIAL+ZA8_MUSICA
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