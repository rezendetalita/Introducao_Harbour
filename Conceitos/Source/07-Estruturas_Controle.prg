/* Estruturas de controle
   Nas estruturas de controle, determinada a��o ocorre caso uma condi��o seja Verdadeira ou Falsa*/

* =============================================================================== *
*                                    Sintaxe - IF                                 *
*   IF <condi��o>
*      se a condi��o for .T., fa�a algo
*   ENDIF

*   IF <condi��o>
*      se a condi��o for .T., fa�a algo
*    ELSE
*      sen�o, fa�a outra coisa
*   ENDIF
*
*   IF <condi��o>
*      se a condi��o for .T., fa�a algo
*    ELSEIF <condi��o2>
*      sen�o se a condi��o2 for .T., fa�a algo
*    ELSE
*      sen�o, se nenhuma das condi��es anteriores for .T., fa�a outra coisa
*   ENDIF

   //Sintaxe especial do IF
*   IIF{condi��o, se a condi��o for .T. fa�a algo, sen�o fa�a outra coisa}

* =============================================================================== *
*                                   Sintaxe - DO CASE                             *

*   DO CASE
*      CASE <condi��o1>
*           fa�a algo
*      CASE <condi��o2>
*           fa�a algo
*      .
*      .
*      .
*      OTHERWISE
*          caso nenhuma condi��o seja atendida
*   ENDCASE

* =============================================================================== *
*                                   Sintaxe - SWITCH
*
*   SWITCH <xVariavel>
*     CASE <valor1>
*         <instru��es>...
*         [EXIT]
*     CASE <valor2>]
*         <instru��es>...
*         [EXIT]
*     [OTHERWISE]
*         <instru��es>...
*   END
*/
* =============================================================================== *

 FUNCTION  ESTRUTURAS_CONTROLE()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Estruturas de controle/decisao",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,00 SAY "IF...ELSEIF...ELSE"
 @ 05,01 SAY CONDICAO_IF()
 *
 @ 08,00 SAY Replicate("-",119)
 *
 @ 10,00 SAY "DO CASE"
 @ 11,01 SAY "Motivo da desoneracao: " + DO_CASE()
 *
 @ 12,00 SAY Replicate("-",119)
 *
 @ 13,00 SAY "SWITCH"
 @ 14,01 SAY SWITCH()


 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*----------------------------------------------*
 FUNCTION CONDICAO_IF()

 LOCAL cUF:='MG'

 @ 06,01 SAY "UF informada: " + AllTrim(cUF)

 IF cUF='AC'
    @ 07,01 SAY "CodIBGE inicia com: 12"
  ELSEIF cUF='AL'
    @ 07,01 SAY "CodIBGE inicia com: 27"
  ELSEIF cUF='AP'
    @ 07,01 SAY "CodIBGE inicia com: 16"
  ELSEIF cUF='AM'
    @ 07,01 SAY "CodIBGE inicia com: 13"
  ELSEIF cUF='MG'
    @ 07,01 SAY "CodIBGE inicia com: 31"
  ELSE
    @ 07,01 SAY "UF nao cadastrada."
 ENDIF

 RETURN NIL
*----------------------------------------------*

 FUNCTION DO_CASE()

 LOCAL nTipo:=3, cDescrOpc:=''

 DO CASE
   CASE nTipo==0
      cDescrOpc:=' '
   CASE nTipo==1
      cDescrOpc:='Taxi'
   CASE nTipo==3
      cDescrOpc:='Produtor Agropecuario'
   CASE nTipo==4
      cDescrOpc:='Frotista/Locadora'
   CASE nTipo==5
      cDescrOpc:='Diplomatico/Consular'
   CASE nTipo==6
      cDescrOpc:='Utilitarios e Motocicletas da Amazonia e Areas de Livre Comercio'
   OTHERWISE
      cDescrOpc:='Motivo invalido'
 ENDCASE

RETURN cDescrOpc

*----------------------------------------------*

 FUNCTION SWITCH()

 LOCAL cRetorno:='', nOpc

 INPUT "Escolha uma opcao de 1 a 4: " TO nOpc
 *
 SWITCH nOpc
   CASE 1
      cRetorno:='Inclusao de cheque'
      EXIT
   CASE 2
      cRetorno:='Pagamento com cheque'
      EXIT
   CASE 3
      cRetorno:='Recebimento com cheque'
      EXIT
   CASE 4
      cRetorno:='Transferencia do cheque'
      EXIT
 END
 *
 RETURN cRetorno
