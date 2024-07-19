/*
 Procedures s�o como fun��es, mas elas n�o tem retorno.
 Se tirarmos o RETURN informado nas procedures abaixo, voc� ver� que o projeto ser� compilado e executado normalmente.
 O RETURN � apenas para vermos onde a PROCEDURE termina.

 Normalmente, optamos por utilizar FUNCTION com RETURN NIL, ao inv�s de PROCEDURE.
*/

*---------------------*
 PROCEDURE PROCEDURE()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("PROCEDURE",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Procedure"
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN

*----------------------*
 PROCEDURE LIMPAR_TELA()

 * O comando abaixo pode ser usado no prompt para limpar a tela :)

 CLS

 RETURN

*----------------------*
 PROCEDURE PAUSAR_TELA()

 * A fun��o abaixo fica aguardando que uma tecla seja pressionada pelo usu�rio.
 * Al�m disso, ela retorna o c�digo da tecla, assim como a fun��o LastKey().

 Inkey(0)

 RETURN