#include 'Protheus.ch'

/*Criar uma função que recebe a altura (alt) e o sexo de uma pessoa e retorna o seu
peso ideal. Para homens, calcular o peso ideal usando a fórmula peso ideal = 72.7 x alt
- 58 e, para mulheres, peso ideal = 62.1 x alt - 44.7.*/

User function f6()

//-----------------------------------------
// ENTRADA DE DADOS
//-----------------------------------------
//Receber (ou definir) o peso e a altura
//receber o sexo da pessoa

    Local nAltura := Val(FWInputBox("Digite a sua altura"))
    Local cSexo := FWInputBox("Digite M para Masculino e F para Feminino:")
    Local nPeso 
//-----------------------------------------
// PROCESSAMENTO DE DADOS
//-----------------------------------------
//processa o calculo e o peso ideal

    nPeso := u_calculo(nAltura, cSexo)

//-----------------------------------------
// SAIDA DE DADOS
//-----------------------------------------
//exibo a saida de dados com o valor do peso ideal 

alert("Seu peso ideal é: "+ cValToChar(nPeso))

Return

User function calculo(nAltura, cSexo)

//homens peso ideal = 72.7 x alt - 58
//mulheres peso ideal = 62.1 x alt - 44.7

Local nRet := 0

If Upper(cSexo) == 'M'
nRet := 72.7 * nAltura - 58

ElseIf Upper(cSexo) == 'F'
nRet := 62.1 * nAltura - 44.7
EndIf

Return nRet