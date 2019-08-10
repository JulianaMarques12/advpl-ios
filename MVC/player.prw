#INCLUDE "TOTVS.CH"
USER FUNCTION TMediaPlayer()
    local nLeft := 1
    local nTopBtn := 202
    local showBar := .F.
    local isMute := .F.
    local nVolume := 70
 
    SetStyle(5)
 
    DEFINE MSDIALOG oDlg TITLE "TMediaPlayer" FROM 0,0 TO 424,510 PIXEL
 
        oMedia := TMediaPlayer():New(1,nLeft,255,200,oDlg,"c:/music/file.mp3",nVolume,showBar)
 
        TButton():New( nTopBtn, nLeft, "Open", oDlg,;
            {|| oMedia:openFile( FWInputBox("Escolha o arquivo", "c:/music/file.mp3") ) },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "Play", oDlg,;
            {|| oMedia:play() },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "Pause", oDlg,;
            {|| oMedia:pause() },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "Stop", oDlg,;
            {|| oMedia:stop() },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "SetVolume", oDlg,;
            {|| oMedia:setVolume( Val( FWInputBox("Escolha a altura do volume [0-100]", cValToChar(oMedia:nVolume)) ) ) },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "GetVolume", oDlg,;
            {|| MsgAlert( oMedia:nVolume ) },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "ShowBar", oDlg,;
            {|| showBar:=!showBar, oMedia:setShowBar( showBar ) },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "nPlayCount", oDlg,;
            {|| oMedia:nPlayCount := ( Val( FWInputBox("Escolha o numero de repetições", cValToChar(oMedia:nPlayCount)) ) ) },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
        TButton():New( nTopBtn, nLeft+=28, "SetMute", oDlg,;
            {|| isMute:=!isMute, oMedia:setMute( isMute ) },;
            28,010,,,.F.,.T.,.F.,,.F.,,,.F. )
 
    ACTIVATE MSDIALOG oDlg CENTERED
 
RETURN
