/*
 Uma tabela DBF � composta de registros (linhas) e campos (colunas).
*/

*-------------------------*
 FUNCTION BANCO_DADOS_DBF()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Banco dados DBF",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Banco_Dados_Dbf"
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 * =============================================================================
 *                          Cria��o - DBCreate()
 *
 * Cria uma tabela. Exemplo:
 *
 /* DBCreate("PRODUTOS.DBF",{{"CODIGO" ,"N",05,0},;
                             {"NOME"   ,"C",50,0},;
                             {"PRECO"  ,"N",06,2},;
                             {"DATA"   ,"D",08,0},;
                             {"INATIVO","L",01,0}})
 */
 * O primeiro par�metro � o nome da tabela, e o segundo um array com a estrutura da tabela.
 *
 * Na estrutura temos 4 informa��es:
 *
 * 1� - Nome do campo (n�o pode ultrapassar 10 caracteres)
 * 2� - Tipo do campo: N - Num�rico, C - Texto, D - Data, L - L�gico
 * 3� - Tamanho do campo
 * 4� - Quantidade de decimais
 *
 * Cada tipo de campo possui um tamanho m�ximo. Portanto, n�o informe um tamanho maior que o permitido:
 *
 * | Tipo      | Tamanho m�ximo |
 * | -------------------------- |
 * | Caractere |            254 |
 * | Num�rico  |             19 |
 * | L�gico    |              1 |
 * | Data      |              8 |
 *
 * Outra informa��o importante � que o tamanho de um campo num�rico com decimais deve englobar a v�rgula e os decimais. Por exemplo:
 *
 * {"PRECO","N",6,2}
 *
 * Dos 6 d�gitos definidos no tamanho, 2 deles ser�o reservados aos decimais e 1 � v�rgula. Portanto, nesse campo h� espa�o para at� 3 inteiros.
 *
 * =============================================================================
 *                       Abertura e sele��o - SELECT e USE
 *
 * Sempre que a aplica��o precisar acessar uma tabela, seja para inserir, alterar, excluir ou ler os dados dela, essa tabela tem que estar aberta e selecionada.
 * Para abrir uma tabela usamos dois comandos:
 *
 * SELECT 1      // Prepara uma �rea de ID 1 para "armazenar" a tabela que ser� aberta em seguida
 * USE PRODUTOS  // Abre a tabela PRODUTOS
 *
 * SELECT 2     // Prepara uma �rea de ID 2 para "armazenar" a tabela que ser� aberta em seguida
 * USE CLIENTES // Abre a tabela CLIENTES
 *
 * Para cada tabela, deve haver uma �rea somente para ela. Por exemplo, se voc� fizer isso:
 *
 * SELECT 1
 * USE PRODUTOS
 *
 * SELECT 1
 * USE CLIENTES
 *
 * A tabela PRODUTOS ser� fechada, porque a CLIENTES foi aberta na �rea em que ela estava.
 * Para evitar esse tipo de problema, sempre use SELECT 0. Ao usar o 0, a aplica��o usar� a pr�xima �rea dispon�vel automaticamente:
 *
 * SELECT 0     // Prepara a �rea de ID 1
 * USE PRODUTOS
 *
 * SELECT 0     // Prepara a �rea de ID 2
 * USE CLIENTES
 *
 * Depois de abrir a tabela, ela ficar� selecionada automaticamente.
 * No exemplo, a tabela CLIENTES est� selecionada, porque ela foi aberta por �ltimo.
 *
 * Para trocar de tabela, voc� precisa selecion�-la, dessa forma:
 *
 * SELECT PRODUTOS
 *
 * Dessa forma, a tabela selecionada no momento � a PRODUTOS, e n�o a CLIENTES.
 * A CLIENTES continua aberta, mas n�o selecionada.
 *
 * Esse comando � muito importante, e precisa ser utilizado sempre que for necess�rio usar uma tabela.
 * Use-o com sabedoria e cuidado, caso contr�rio, a aplica��o ir� ler ou alterar os dados da tabela errada.
 *
 * =============================================================================
 *                         Fechamento - DbCloseAll()
 *
 * Fecha todas as tabelas abertas. Use-o sempre que terminar de us�-las. Exemplo:
 /*
   SELECT 0
   USE PRODUTOS

   SELECT 0
   USE CLIENTES

   SELECT PRODUTOS
   // ... faz alguma coisa na PRODUTOS ...

   SELECT CLIENTES
   // ... faz alguma coisa na CLIENTES ...

   SELECT PRODUTOS
   // ... faz mais alguma coisa na PRODUTOS ...

   DBCloseAll() // Fecha todas as tabelas, porque elas n�o ser�o mais usadas
 */
 *
 * Lembrando que depois de fechada, a aplica��o n�o consegue usar mais a tabela.
 * Portanto, pra n�o ter que ficar abrindo e fechando tabela toda hora, apenas feche quando tudo tiver terminado.
 *
 * =============================================================================
 *          Novo registro -  DBAppend(), REPLACE, DBCommit() e DBCommitAll()
 *
 * Para criar um novo registro na tabela:
 *
 * 1 - Selecione a tabela              = SELECT
 * 2 - Crie um novo registro em branco = DBAppend()
 * 3 - Preencha os campos              = REPLACE
 * 4 - Salve as inser��es              = DBCommit()
 *
 * Exemplo:
 /*
   SELECT PRODUTOS
   DBAppend()
   REPLACE CODIGO  WITH 1
   REPLACE NOME    WITH "PRODUTO TESTE"
   REPLACE PRECO   WITH 2.50
   REPLACE DATA    WITH CToD("01/01/2024")
   REPLACE INATIVO WITH .F.
   DBCommit()
 */
 * Voc� pode usar DBCommitAll(), ao inv�s de DBCommit(), para salvar tudo de uma vez. Exemplo:
 /*
   SELECT PRODUTOS
   DBAppend()
   REPLACE CODIGO  WITH 1
   REPLACE NOME    WITH "PRODUTO TESTE"
   *
   SELECT CLIENTES
   DBAppend()
   REPLACE CODIGO WITH 1
   REPLACE NOME   WITH "JOS�"
   *
   DBCommitAll()
 */
 * =============================================================================
 *
 *
 RETURN NIL