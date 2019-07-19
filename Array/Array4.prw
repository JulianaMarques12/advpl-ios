#include 'Protheus.ch'
/*Crie um array com três linhas. Em cada linha deve-se ter o nome do aluno e um
outro array, pra guardar 4 notas de prova. Popule o array inteiro. Exiba o nome e as
notas do segundo aluno.*/

User function notas()

Local aNota := {}

aAdd(aNota, {"Juliana", {10,7,8,6}})
aAdd(aNota, {"Talita", {10,7,8,6}})
aAdd(aNota, {"Erick", {10,7,8,6}})


varinfo("test", aNota)

alert(aNota[1][1])
alert(i18n("#1 #2 #3 #4", {aNota[1][2][1], aNota[1][2][2], aNota[1][2][3], aNota[1][2][4]}))




return