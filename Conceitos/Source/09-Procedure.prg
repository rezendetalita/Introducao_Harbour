/*
 Procedures s�o como fun��es, mas elas n�o tem retorno.
 Se tirarmos o RETURN informado nas procedures abaixo, voc� ver� que o projeto ser� compilado e executado normalmente.
 O RETURN � apenas para vermos onde a a PROCEDURE termina.

 Normalmente, optamos por utilizar FUNCTION com RETURN NIL, ao inv�s de PROCEDURE.
*/

*---------------------*
 PROCEDURE PROCEDURE()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("PROCEDURE",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Procedure"

 RETURN

*----------------------*
 PROCEDURE LIMPAR_TELA()

 CLS

 RETURN

*----------------------*
 PROCEDURE PAUSAR_TELA()

 Inkey(0)

 RETURN