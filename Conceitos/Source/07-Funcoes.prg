/*
 Fun��es s�o rotinas que recebem dados de entrada (ou n�o), executam algum processo e retornam algo.

 Para criar uma fun��o utilize a palavra FUNCTION seguida do nome da fun��o e ().
 Informe um RETURN, que pode ser de qualquer tipo: num�rico, caracter, l�gico, etc. Se a fun��o n�o retorna nada, use o RETURN NIL.
 Entre FUNCTION e RETURN, fica o corpo da fun��o, onde s�o realizados os processamentos.
*/

#INCLUDE "COMMON.CH" // Necess�rio para usar o comando DEFAULT. Verifique a fun��o SOMA() para mais detalhes.

*------------------*
 FUNCTION FUNCOES()

 LIMPAR_TELA()
 *
 * Algumas fun��es podem ser importadas de bibliotecas. No exemplo abaixo, � poss�vel ver que as fun��es Replicate() e PadC() n�o foram criadas. Elas tem origem na biblioteca "rtl.lib".
 * � poss�vel importar bibliotecas atrav�s do menu: Proyecto > Propriedades del Proyecto > Librer�as.
 * Para saber de qual biblioteca a fun��o �, consulte a documenta��o dessa fun��o no manual do xHarbour.
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Funcoes",119)
 @ 03,00 SAY Replicate("-",119)
 *
 * A fun��o MES() recebe o n�mero do m�s como par�metro, e retorna o seu respectivo nome.
 *
 @ 04,00 SAY PadC("FUNCTION MES()",119)
 *
 @ 05,01 SAY "MES(1):"
 @ 05,20 SAY MES(1)
 *
 @ 06,01 SAY "MES(2):"
 @ 06,20 SAY MES(2)
 *
 @ 07,01 SAY "MES(7):"
 @ 07,20 SAY MES(7)
 *
 @ 08,00 SAY Replicate("-",119)
 *
 * A fun��o SOMA() recebe um, dois ou tr�s n�meros, e retorna o resultado da soma entre eles.
 *
 @ 09,00 SAY PadC("FUNCTION SOMA()",119)
 *
 @ 10,01 SAY "SOMA(1): "
 @ 10,20 SAY (SOMA(1))
 *
 @ 11,01 SAY "SOMA(10,17): "
 @ 11,20 SAY SOMA(10,17)
 *
 @ 12,01 SAY "SOMA(1000,1,0.50): "
 @ 12,20 SAY SOMA(1000,1,0.50)
 *
 @ 13,00 SAY Replicate("-",119)
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL

*-----------------*
 FUNCTION MES(nMes)

 /*
 As fun��es podem ou n�o ter par�metros para receber dados que ser�o usados.
 Os par�metros ficam dentro de (). No exemplo acima, a fun��o MES() recebe o par�metro nMes.
 � importante que quem chamar a fun��o MES(), informe um valor para esse par�metro. Caso contr�rio, o par�metro ficar� com o valor NIL.
 */

 LOCAL cMes:=""
 *
 IF nMes==1
    cMes:="Janeiro"
  ELSEIF nMes==2
    cMes:="Fevereiro"
  ELSEIF nMes==3
    cMes:="Mar�o"
  ELSEIF nMes==4
    cMes:="Abril"
  ELSEIF nMes==5
    cMes:="Maio"
  ELSEIF nMes==6
    cMes:="Junho"
  ELSEIF nMes==7
    cMes:="Julho"
  ELSEIF nMes==8
    cMes:="Agosto"
  ELSEIF nMes==9
    cMes:="Setembro"
  ELSEIF nMes==10
    cMes:="Outubro"
  ELSEIF nMes==11
    cMes:="Novembro"
  ELSEIF nMes==12
    cMes:="Dezembro"
 ENDIF
 *
 RETURN cMes

*------------------------------------------*
 FUNCTION SOMA(nNumero1, nNumero2, nNumero3)

 /*
 Nessa fun��o ocorre um erro na soma, se um dos par�metros n�o for informado, porque n�o � poss�vel somar um n�mero com um NIL.
 Ex: A chamada de SOMA(1) resultar� em 1 + NIL + NIL, porque nNumero2 e nNumero3 n�o foram informados.

 Por isso, � uma boa pr�tica definir um valor DEFAULT para os par�metros.
 Obs: Para usar o comando DEFAULT, � necess�rio incluir o arquivo COMMON.CH no in�cio do prg.
 */

 DEFAULT nNumero1 TO 0
 DEFAULT nNumero2 TO 0
 DEFAULT nNumero3 TO 0

 RETURN nNumero1+nNumero2+nNumero3