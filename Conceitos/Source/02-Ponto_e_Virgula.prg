/*
No caso espec�fico da Linguagem Harbour e xHarbour, o ponto e v�rgula poder� ser utilizado em duas situa��es especificas:

Para indicar quando h� uma quebra de linha.
   No caso onde linhas de comando ficam muito extensas, usa-se o ";" para indicar que essa instru��o n�o acabou e deve ser continuada na linha seguinte.

Para realizar o agrupamento de v�rias instru��es em uma mesma linha.
   Nesse caso, v�rias linhas de comando ficam em uma mesma linha, sendo separadas apenas pelo ";"
   Essa pr�tica n�o � t�o legal, pois pode deixar o c�digo mais dificil de ser lido.
*/

*-------------------------*

 FUNCTION PONTO_E_VIRGULA()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Uso do Ponto e virgula",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 05,00 SAY "Quebra de linha"
 @ 07,01 SAY QUEBRA_LINHA()
 *
 @ 09,00 SAY Replicate("-",119)
 *
 @ 11,00 SAY "Agrupamento de linhas de comando:"
 @ 13,01 SAY JUNTA_LINHAS()

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*-----------------*
 FUNCTION QUEBRA_LINHA()

 LOCAL cInf_Complementar:=''
 LOCAL cProduto, nBCMonoRet,nAliqAdrem

 cProduto  :='GASOLINA A COMUM'
 nBCMonoRet:=13.584
 nAliqAdrem:=1.3721

 cInf_Complementar:=cProduto+;
                    ' - '+'BC ICMS Mono:'+AllTrim(Str(nBCMonoRet))+;
                    ' - '+'Aliq. Adrem:'+AllTrim(Str(nAliqAdrem))

 RETURN cInf_Complementar

*-----------------*
 FUNCTION JUNTA_LINHAS()

 LOCAL cInf_Complementar:=''
 LOCAL cProduto, nBCMonoRet,nAliqAdrem

 cProduto:='GASOLINA A COMUM' ; nBCMonoRet:=13.584 ; nAliqAdrem:=1.3721

 cInf_Complementar:=cProduto+' - BC ICMS Mono:'+AllTrim(Str(nBCMonoRet))+' - Aliq. Adrem:'+AllTrim(Str(nAliqAdrem))

 RETURN cInf_Complementar

