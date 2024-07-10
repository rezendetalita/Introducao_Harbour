/* Variaveis e Tipos de vari�veis
 Vari�veis s�o aloca��es da mem�ria devidamente identificadas, usadas para armazenar um determinado valor.
 Valor esse, que pode ser alterado durante a execu��o do programa.

Escopo das vari�veis:
 LOCAL   = Valem apenas dentro da rotina onde foram declaradas.
 PRIVATE = Valem dentro da rotina onde foram declaradas e em todas as fun��es abaixo que estiverem dentro desse bloco.
           As vari�veis PRIVATE s�o o tipo default de vari�vel, ou seja, se voc� criar uma vari�vel sem declarar seu tipo, ela ser� declarada como PRIVATE.
 PUBLIC  = Valem dentro de todo o projeto.

 Tipos de vari�veis:
 num�ricas  = armazenam n�meros inteiros e decimais: 5, 2, 3.89, 5.41...
 caracteres = armazenam strings: "Maria","R","A"
 l�gicas    = armazenam valores booleanos: Verdadeiro - 1 e Falso - 0
 data       = armazenam datas, no Harbour as datas s�o exibidas no formato m�s/dia/ano
 arrays     = armazenam um conjunto de valores acess�veis por suas posi��es
              vetor (unidimensional):{'ARROZ', 'FEIJAO', 'ACUCAR', 'CAFE'}
              matriz(multidimensional): {{ "Apto 101" , "Apto 102" },{ "Apto 201" , "Apto 202" }}
 hash       = um Hash � um tipo especial de array, cujo ponteiro pode ser uma string: hCliente[ "nome" ] := "Joao"
*/

 FUNCTION VARIAVEIS()

 LOCAL nNumero, nPreco, cLetra, cTexto, lVerdadeiro, lFalso, aVetor, aMatriz, dData
 LOCAL hClientes:=HASH()
 PRIVATE nValor
 //MEMVAR cCliente

 //Variavel PRIVATE
 nValor:=10

 // N�merica
 nNumero:=1
 nPreco:=1.50

 // Caracter
 cLetra:='C'
 cTexto:="Oi, tudo bem?"

 // L�gica
 lVerdadeiro:=.T.
 lFalso:=.F.

 // Array
 aVetor:={"Um","Dois","Tres","Quatro","Cinco","Seis"}

 aMatriz:={{"Um","Dois"},{"Tres","Quatro"},{"Cinco","Seis"}}

 // Data
 dData:=01/01/1900

 //Hash
 hClientes['Clientes']              :=HASH()
 hClientes['Clientes']['Nome']      :="Joao"
 hClientes['Clientes']['Sobrenome'] :="Silva"
 *
 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Escopo de Variaveis",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 05,01 SAY "PRIVATE"
 @ 06,01 SAY "nValor:   " + AllTrim(Str(PRIVATE()))
 @ 08,01 SAY "PUBLIC"
 @ 09,01 SAY "cCliente: " //+ AllTrim(cCliente)
 *
 @ 11,00 SAY Replicate("-",119)
 @ 12,00 SAY PadC("Tipos de Variaveis",119)
 @ 13,00 SAY Replicate("-",119)
 *
 @ 15,01 SAY "nNumero:      " + AllTrim(Str(nNumero))
 @ 16,01 SAY "nPreco:       " + AllTrim(Str(nPreco))
 *
 @ 18,01 SAY "cLetra:       " + cLetra
 @ 19,01 SAY "cTexto:       " + cTexto
 *
 @ 21,01 SAY "lVerdadeiro:  " + LToC(lVerdadeiro)
 @ 22,01 SAY "lFalso:       " + LToC(lFalso)
 *
 @ 24,01 SAY "aVetor[1]:    " + aVetor[1]
 @ 25,01 SAY "aVetor[2]:    " + aVetor[2]
 @ 26,01 SAY "aVetor[3]:    " + aVetor[3]
 *
 @ 28,01 SAY "aMatriz[2,2]: " + aMatriz[2,2]
 @ 29,01 SAY "aMatriz[3,1]: " + aMatriz[3,1]
 @ 30,01 SAY "aMatriz[3,2]: " + aMatriz[3,2]
 *
 @ 32,01 SAY "hClientes['Clientes']['Nome']     : " + hClientes['Clientes']['Nome']
 @ 33,01 SAY "hClientes['Clientes']['Sobrenome']: " + hClientes['Clientes']['Sobrenome']

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*---------------------------*
 FUNCTION PRIVATE()

 LOCAL nValor2
 MEMVAR nValor

 nValor2:=50
 nValor:=nValor+nValor2

 RETURN nValor
