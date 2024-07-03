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

 FUNCTION TIPOS_VARIAVEIS()

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


   //Exibi��o na tela
   ? "-----------------------------------------------------------------------------"
   ? "                           Tipos de Variaveis                                "
   ? "-----------------------------------------------------------------------------"
   ? "Numericas"
   ? "---------"
   ? "nValor        : " + AllTrim(Str(nValor))
   ? "nValor_Decimal: " + AllTrim(Str(nValor_Decimal))
   ? "                                                                             "
   ? "Caracteres"
   ? "----------"
   ? "cProduto   : " + cProduto
   ? "cObsProduto: " + cObsProduto
   ? "                                                                             "
   ? "Logicas"
   ? "--------"
   ? "lVerdadeiro: " + ltoc(lVerdadeiro)
   ? "lFalso     : " + ltoc(lFalso)
   ? "                                                                             "
   ? "Data"
   ? "-----"
   ? "dVencimento: " + DToC(dVencimento)
   ? "                                                                             "
   ? "Arrays"
   ? "-------"
   ? "Vetor"
   ? "aProdutos[1]: " + aProdutos[1]
   ? "aProdutos[2]: " + aProdutos[2]
   ? "aProdutos[3]: " + aProdutos[3]
   ? "                                                                             "
   ? "Matriz"
   ? "aLocalProduto[1][1]: " + aLocalProduto[1][1]
   ? "aLocalProduto[1][2]: " + aLocalProduto[1][2]
   ? "aLocalProduto[2][1]: " + aLocalProduto[2][1]
   ? "aLocalProduto[2][2]: " + aLocalProduto[2][2]
   ? "                                                                             "
   ? "Hash"
   ? "-----"
   ? "hClientes['Clientes']['Nome']     : " + hClientes['Clientes']['Nome']
   ? "hClientes['Clientes']['Sobrenome']: " + hClientes['Clientes']['Sobrenome']
   ? "-----------------------------------------------------------------------------"


 RETURN NIL