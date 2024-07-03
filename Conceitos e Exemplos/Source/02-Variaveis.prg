/*Proyecto: Variaveis e seus tipos
 Vari�veis s�o aloca��es da mem�ria devidamente identifcadas, usadas para armazenar um determinado valor.
 Valor esse, que pode ser alterado durante a execu��o do programa.

Classes/Escopo das v�riaveis:
 LOCAL   = Valem apenas dentro da rotina onde foram declaradas.
 PRIVATE = Valem dentro da rotina onde foram declaradas e em todas as fun��es abaixo que estiverem dentro desse bloco.
           As vari�veis PRIVATE s�o o tipo default de vari�vel, ou seja, se voc� criar uma vari�vel sem dizer seu tipo, ela ser� declarada como PRIVATE.
 PUBLIC  = Valem dentro de todo o projeto.

 Tipos de vari�veis:
 num�ricas  = armazenam n�meros inteiros e decimais: 5, 2, 3.89, 5.41
 caracteres = armazenam strings: "Maria", "Harbour","R","A"
 l�gicas    = armazenam valores booleanos: Verdadeiro - 1 e Falso - 0
 data       = armazenam datas: o Harbour vem pr�-configurado para exibir as datas no formato norte-americano ( m�s/dia/ano )
                               para usar o padr�o brit�nico(dia/m�s/ano) � usado a configura��o SET DATE BRITISH

 arrays     = armazenam um conjunto de valores acess�veis por suas posi��es
              vetor (unidimensional):{'ARROZ', 'FEIJAO', 'ACUCAR', 'CAFE'}
              matriz(multidimensional): {{ "Apto 101" , "Apto 102" },{ "Apto 201" , "Apto 202" }}

 hash       = um Hash � um tipo especial de array, cujo ponteiro pode ser uma string: hCliente[ "nome" ] := "Joao"
*/

 FUNCTION VARIAVEIS()

 LOCAL nValor:=0, nValor_Decimal
 LOCAL cProduto, cObsProduto
 LOCAL lVerdadeiro, lFalso
 LOCAL dVencimento

 LOCAL aProdutos:={}, aLocalProduto:={}
 LOCAL hClientes:=HASH()

 //PRIVATE
 //PUBLIC

 //Formata data para modo brit�nico
 SET DATE BRITISH

 nValor:=12
 nValor_Decimal:=1.65

 cProduto:='ARROZ'
 cObsProduto:='Rapido cozimento,rende muito e fica soltinho'

 lVerdadeiro:=.T.
 lFalso:=.F.

 dVencimento:=Date()

 aProdutos:={"ARROZ", "FEIJAO", "ACUCAR", "CAFE"}
 *            [1]       [2]       [3]      [4]

 aLocalProduto:={{ "Prateleira 101" , "Prateleira 102" },;
                 { "Prateleira 201" , "Prateleira 202" }}
 *                     [1][1]       ,      [1][2]
 *                     [2][1]       ,      [2][2]

 hClientes['Clientes']                :=HASH()
 hClientes['Clientes']['Nome']        :="Joao"
 hClientes['Clientes']['Sobrenome']   :="Silva"

 CLEAR

 //Exibi��o na tela
 @ 01,00 SAY "-----------------------------------------------------------------------------"
 @ 02,00 SAY "                           Tipos de Variaveis                                "
 @ 03,00 SAY "-----------------------------------------------------------------------------"
 @ 04,01 SAY "Numericas"
 @ 06,02 SAY "---------"
 @ 07,02 SAY "nValor        : " + AllTrim(Str(nValor))
 @ 08,02 SAY "nValor_Decimal: " + AllTrim(Str(nValor_Decimal))
 @ 09,02 SAY "                                                                             "
 @ 10,02 SAY "Caracteres"
 @ 11,02 SAY "----------"
 @ 12,02 SAY "cProduto   : " + cProduto
 @ 13,02 SAY "cObsProduto: " + cObsProduto
 @ 14,02 SAY "                                                                             "
 @ 15,01 SAY "Logicas"
 @ 16,01 SAY "--------"
 @ 17,01 SAY "lVerdadeiro: " + ltoc(lVerdadeiro)
 @ 18,01 SAY "lFalso     : " + ltoc(lFalso)
 @ 20,01 SAY "Data"
 @ 21,01 SAY "-----"
 @ 22,02 SAY "dVencimento: " + DToC(dVencimento)
 @ 24,02 SAY "Arrays"
 @ 25,02 SAY "-------"
 @ 26,02 SAY "Vetor"
 @ 27,02 SAY "aProdutos[1]: " + aProdutos[1]
 @ 28,02 SAY "aProdutos[2]: " + aProdutos[2]
 @ 29,02 SAY "aProdutos[3]: " + aProdutos[3]
 @ 31,01 SAY "Matriz"
 @ 32,01 SAY "aLocalProduto[1][1]: " + aLocalProduto[1][1]
 @ 33,01 SAY "aLocalProduto[1][2]: " + aLocalProduto[1][2]
 @ 34,01 SAY "aLocalProduto[2][1]: " + aLocalProduto[2][1]
 @ 35,01 SAY "aLocalProduto[2][2]: " + aLocalProduto[2][2]
 @ 37,01 SAY "Hash"
 @ 38,01 SAY "-----"
 @ 39,01 SAY "hClientes['Clientes']['Nome']     : " + hClientes['Clientes']['Nome']
 @ 40,01 SAY "hClientes['Clientes']['Sobrenome']: " + hClientes['Clientes']['Sobrenome']
 @ 41,01 SAY "-----------------------------------------------------------------------------"

 Inkey(0)

 RETURN NIL