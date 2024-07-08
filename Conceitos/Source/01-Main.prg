*---------------*
 PROCEDURE MAIN()

 LOCAL nOpcao:=0, GetList:={}
 *
 SET DATE       BRIT
 SET CENTURY    ON
 SET EPOCH      TO 1950
 *
 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Introducao a linguagem Harbour",119)
 @ 03,00 SAY Replicate("-",119)
 @ 04,01 SAY "Informe uma opcao: " GET nOpcao PICT "9"
 @ 06,01 SAY " 1 - MAIN()"
 @ 07,01 SAY " 2 - Variaveis"
 @ 08,01 SAY " 3 - Constantes"
 @ 09,01 SAY " 4 - Operadores"
 @ 10,01 SAY " 5 - Estruturas de controle"
 @ 11,01 SAY " 6 - Estruturas de repeticao"
 @ 12,01 SAY " 7 - Funcoes"
 @ 13,01 SAY " 8 - Funcoes do xHarbour"
 @ 14,01 SAY " 9 - PROCEDURE"
 @ 15,01 SAY "10 - Banco de dados DBF"
 @ 16,01 SAY "11 - Tela"
 @ 17,01 SAY "12 - Comandos SET"
 @ 18,01 SAY "13 - Comentarios"
 @ 19,01 SAY "14 - Ponto e virgula"
 *
 READ
 *
 DO CASE
    CASE nOpcao==1
       //
    CASE nOpcao==2
       VARIAVEIS()
    CASE nOpcao==3
       CONSTANTES()
    CASE nOpcao==4
       OPERADORES()
    CASE nOpcao==5
       ESTRUTURAS_CONTROLE()
    CASE nOpcao==6
       ESTRUTURAS_REPETICAO()
    CASE nOpcao==7
       FUNCOES()
    CASE nOpcao==8
       FUNCOES_XHARBOUR()
    CASE nOpcao==9
       PROCEDURE()
    CASE nOpcao==10
       BANCO_DADOS_DBF()
    CASE nOpcao==11
       TELA()
    CASE nOpcao==12
       COMANDOS_SET()
    CASE nOpcao==13
       COMENTARIOS()
    CASE nOpcao==14
       PONTO_E_VIRGULA()
 END
 *
 RETURN