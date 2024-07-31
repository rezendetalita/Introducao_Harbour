/*Interface em modo texto*/

 FUNCTION TELA()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Funcoes da interface Harbour",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Tela"
 *
 * ===================================================================================*
 *                                     @...BOX e @...TO                               *
 *
 * Desenham uma estrutura retangular na tela.
 *
 * @...BOX  - permite determinar qual conjunto de caracteres voc� ir� usar na moldura.
 *            A ordem para informar os caracteres deve come�ar pelo caractere do
 *            canto superior esquerdo e terminar no caractere do lado esquerdo.
 * Sintaxe
 *   @ <nLinTopo>, <nColTopo>, <nLinBase>, <nColBase> BOX <cCaixa>
 *
 * Exemplo:
 * @ 06, 01, 05, 50 BOX "*"
 *
 *
 * @...TO  - � mais simples do que o @...BOX, porque ele j� pressup�e quais
 *           caracteres voc� usar� para fazer o contorno do ret�ngulo.
 * Sintaxe
 *   @ <nLinTopo>, <nColTopo> TO <nLinBase>, <nColBase>
 *
 *   @ <nLinTopo>, <nColTopo> TO <nLinBase>, <nColBase> [DOUBLE]
 *
 * Exemplo:
 * @ 06, 01 TO 10, 50
 *
 * @ 12, 01 TO 22, 50 DOUBLE
 *
 * ===================================================================================*
 *                                     @CLEAR e CLS                                   *
 *
 * Tanto o @CLEAR quanto o CLS servem para limpar um conte�do na tela.
 *
 * @CLEAR  - limpar a regi�o delimitada pelas coordenadas informadas.
 * CLS     - limpa a tela toda, por isso ele n�o tem o @
 *
 * Sintaxe
 *   @ <nLinTopo>, <nColTopo> CLEAR [TO <nLinBase>, <nColBase>]
 *
 * ===================================================================================*
 *                                     @PROMPT e MENU TO                              *
 *
 * Eles funcionam em conjunto e s�o usados para criar um menu simples na tela.
 *
 * Exemplo
 * PROMPT_MENUTO()
 *
 * ===================================================================================*
 *                                     @SAY, GET e READ
 *
 * O comando @...SAY...GET � usado para criar formul�rios de entradas de dados.
 * Ele exige que a vari�vel que receber� o valor da entrada de dados seja definida
 * previamente, e n�o basta somente declarar a vari�vel, voc� deve atribuir-lhe
 * um valor inicial.

 * O comando @...SAY...GET possui tamb�m uma vari�vel oculta que n�o aparece no comando,
 * mas que � necess�ria para seu funcionamento, � a vari�vel "GetList".
 *
 * O GetList � um array que vai armazenar os GET�s informados no formul�rio.
 * Portanto, sempre que for usar o comando @...GET ou @...SAY...GET declare o vetor
 * GetList com escopo local: LOCAL GetList:= {}
 *
 * Exemplo
 * SAY_GET()
 *
 * Complementos do comando:
 *
 * READ   - Cria um estado de espera, at� que o valor do GET seja capturado e permite
 *          a navega��o entre as op��es do formul�rio.
 *
 * SPACE()- Como vimos, eu sempre preciso inicializar a vari�vel que ser� usada no GET.
 *          Quando essa vari�vel for do tipo caractere, � preciso inicializ�-la
 *          com o tamanho m�ximo que ela ir� ocupar. Para isso, usamos a fun��o
 *          SPACE() que retorna uma string do tamanho informado como argumento na fun��o.
 *          Por exemplo: SPACE(50) retorna uma string com cinquenta espa�os.
 *
 * VALID  - S�o valida��es que voc� pode utilizar ao fazer a captura de GET.
 *          O VALID sempre retorna um valor l�gico (.T., .F.)
 *          Quando estamos preenchendo um campo que possui a cl�usula VALID, s� sairemos dele
 *          se o valor informado satisfazer a valida��o correspondente.
 *
 * WHEN   - A cl�usula WHEN possui um comportamento semelhante a cl�usula VALID.
 *          A diferen�a � que a valida��o feita por WHEN � executada sempre que o usu�rio
 *          tentar entrar no campo.
 *
 * Exemplo
 * SAY_GET_2()
 *
 * =============================================================================================*
 *                                     PICT
 *
 * O comando @...GET possui uma s�rie de �m�scaras� que permitem formatar a entrada de dados
 * de acordo com sua especifica��o.
 *
 * PICT "!�     = converte apenas um caractere para mai�scula e omite os demais da edi��o.
 *                O s�mbolo �!� limita a quantidade de caracteres de acordo com
 *                a quantidade de s�mbolos digitados.
 *
 * PICT "!!!!!� = Converte ent�o 5 caracteres para letra mai�scula
 *
 * PICT �!@�    = Esse pict usa o tamanho m�ximo da vari�vel e aplica o s�mbolo �!� a todos os
 *                caracteres, n�o importa quantos sejam.
 *
 * Exemplo 1
 * PICT_1()
 *
 * PICT �9�     = Restringe a entrada de somente n�meros
 *
 * PICT "@E"    = Inverte automaticamente a posi��o de pontos e v�rgulas durante a exibi��o da vari�vel
 *                dentro do GET. Ou seja, voc� pode digitar uma v�rgula para separar decimais,
 *                mas a vari�vel receber� automaticamente o simbolo �ponto� que � o separador correto.
 * Exemplo 2
 * PICT_2()
 *
 * ===============================================================================================================================*
 *                                     DBEdit()
 *
 * A fun��o DbEdit() � usada para exibir dados armazenados de um arquivo DBF na forma GRID.
 *
 * Sintaxe:
 * DbEdit( [<nTop>]           , ;    // <nTop> e <nLeft> indicam as coordenadas para o canto superior esquerdo da tela.
 *         [<nLeft>]          , ;
 *
 *         [<nBottom>]        , ;    // Indica a coordenada da linha inferior da tela (altura).
 *
 *         [<nRight>]         , ;    // Indica a coordenada da coluna direita da tela (largura).
 *
 *         [<aColumns>]       , ;    // Vetor contendo o nome dos campos da tabela que ser�o exibidos na tela.
 *                                      Se esse par�metro n�o for especificado, ser�o exibidos todos os campos da tabela atual.
 *
 *         [<bcUserFunc>]     , ;    // Envia o nome de uma fun��o definida pelo usu�rio que � executada quando uma tecla n�o reconhec�vel
 *                                      � pressionada ou quando n�o h� nenhuma tecla pendente no buffer do teclado.
 *                                      N�o coloque par�nteses ou argumentos.
 *
 *         [<xSayPictures>]   , ;    // Define a formata��o dos elementos apresentados, pode ser um vetor ou uma string.
 *                                      Se for um vetor, o seu conte�do deve ser as m�scaras de formata��o de cada coluna.
 *                                      Se for uma string, a mesma formata��o ser� aplicada a todas as colunas.
 *                                      Se n�o for especificado, a formata��o de dados adequada de cada dado ser� aplicada automaticamente.
 *
 *         [<xColumnHeaders>] , ;    // Define os cabe�alhos exibidos para cada coluna.
 *                                      Se n�o for informado, os cabe�alhos receber�o os nomes dos campos da tabela que ser�o retornados.
 *
 *         [<xHeadingSep>     , ;    // Usado para desenhar linhas horizontais que separam os t�tulos das colunas da �rea de exibi��o de dados.
 *
 *         [<xColumnSep>      , ;    // Define os separadores dos cabe�alhos das colunas. Tamb�m pode ser um vetor ou uma string.
 *                                      Se for um vetor, o seu conte�do deve ser os separadores dos cabe�alhos de cada coluna.
 *                                      Se for uma string, o mesmo separador ser� usado para todas as colunas.
 *
 *         [<xFootingSep>     , ;    // Utilizado como <xHeadingSep> para a exibi��o de uma linha horizontal separando a �rea de rodap�
 *                                      das colunas da �rea de dados.
 *
 *         [<xColumnFootings> , ;    // Usado como <xColumnHeaders> para a exibi��o dos rodap�s das colunas.

 *         [<xColumnPreBlock> , ;    // Usado para pr�-validar a entrada de dados na c�lula atual da tela.

 *         [<xColumnPostBlock>)      // Usado da mesma forma que <aColumnPreBlock>, mas � usado para p�s-valida��o.
 *
 * Exemplo
   DB_EDIT()
 *
 * =============================================================================================*

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*---------------------------------------------*
 FUNCTION PROMPT_MENUTO()

 LOCAL nOpcao

 // Cria uma caixa com @...TO
 @ 06, 06 TO 10, 19 DOUBLE

 //Inicia o menu
 @ 07,07 PROMPT " Cadastro "
 @ 08,07 PROMPT " Relatorios "
 @ 09,07 PROMPT " Utilitarios"

 //Seleciono a op��o
 MENU TO nOpcao

 //Analiso o valor de nOpcao
 DO CASE
    CASE nOpcao == 1
      @ 10,01 SAY "Voce selecionou cadastro"
    CASE nOpcao == 2
      @ 10,01 SAY "Voce selecionou relatorios"
    CASE nOpcao == 3
      @ 10,01 SAY "Voce selecionou utilitarios"
    OTHERWISE
      @ 10,01 SAY "Nenhuma das alternativas"
 ENDCASE

RETURN NIL

*--------------------------------------------------*
 FUNCTION SAY_GET()

 LOCAL nValor1 := 0
 LOCAL nValor2 := 0
 LOCAL GetList := {}

 @ 06,05 SAY "Informe o valor da parcela 1 : " GET nValor1
 @ 08,05 SAY "Informe o valor da parcela 2 : " GET nValor2

 READ

 RETURN NIL

*----------------------------------------------------*
 FUNCTION SAY_GET_2()

 LOCAL cNome:= SPACE(20)
 LOCAL cTipo:= SPACE(1)
 LOCAL cCPF := SPACE(11)
 LOCAL cCNPJ:= SPACE(15)
 LOCAL GetList := {}

 @ 06,05 SAY "Informe o nome : " GET cNome

 @ 08,05 SAY "Informe o tipo (F ou J): " GET cTipo VALID UPPER(cTipo) $"FJ"

 @ 10,05 SAY "Informe o CPF          : " GET cCPF  WHEN UPPER(cTipo) == "F"
 @ 12,05 SAY "Informe o CNPJ         : " GET cCNPJ WHEN UPPER(cTipo) == "J"

 READ

 @ 14,05 SAY cNome
 IF UPPER(cTipo) == "F"
    @ 15,05 SAY "CPF : " + cCPF
  ELSE
    @ 15,05 SAY "CNPJ: " + cCNPJ
 ENDIF

RETURN NIL

*------------------------------------------------*
 FUNCTION PICT_1()

 LOCAL cNome  := SPACE(20), cNome2:= SPACE(20), cNome3:= SPACE(20)
 LOCAL nIdade :=0, nIdade2:=0, nIdade3:= 0
 LOCAL GetList:= {}

 @ 07,05 SAY "Informe o nome : " GET cNome PICT "!"
 @ 08,05 SAY "Idade : " GET nIdade

 @ 10,00 SAY Replicate("-",70)

 @ 12,05 SAY "Informe o nome : " GET cNome2 PICT "!!!!!"
 @ 13,05 SAY "Idade : " GET nIdade2

 @ 15,00 SAY Replicate("-",70)

 @ 17,05 SAY "Informe o nome : " GET cNome3 PICT "!@"
 @ 18,05 SAY "Idade : " GET nIdade3

 READ

 RETURN NIL
*------------------------------------------------*

 FUNCTION PICT_2()

 LOCAL cCEP  := SPACE(10)
 LOCAL nIdade:= 0
 LOCAL GetList := {}

 @ 06,05 SAY "Informe o CEP " GET cCEP PICTURE "99999-999"
 @ 08,05 SAY "Idade : " GET nIdade PICTURE "999"

 READ

 @ 09,05 SAY cCEP+ Str(nIdade)

 RETURN NIL
*-------------------------------------------------*

 FUNCTION DB_EDIT()

 LOCAL aCampos, aTitulos

 LIMPAR_TELA()

 @ 01, 00 SAY PadC(" CADASTRO DE PRODUTOS ",80)
 @ 01, 00 SAY Date()
 @ 02, 00 SAY Replicate("-",80)
 @ 23, 00 SAY Replicate("-",80)

 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME")
 DBGoTop()

 aTitulos:={"Codigo","Nome","Preco","Inativo"}
 aCampos :={"CODIGO", "NOME", "PRECO","INATIVO"}

 //DBEdit sem par�metros
 *DBEdit()

 //Defini��o do tamanho do DbEdit
* DBEdit(03, 00, 22, 80, aCampos,,,aTitulos)  //(posLinhaInicial, posColunaInicial, alturaGrid, larguraGrid....)

 //DBEdit quase completo
 *DBEdit(03, 00, 22, 80, aCampos, , ,aTitulos,'#','*','$','@')

 RETURN NIL