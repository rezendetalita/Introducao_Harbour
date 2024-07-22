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
 * =============================================================================
 *                             Cria��o de tabela
 *
 * Cria uma tabela. Exemplo:
/*
 IF !IsDirectory("DBF")
    Run("MD DBF")
 ENDIF

 IF !File("DBF\PRODUTOS.DBF")
    DBCreate("DBF\PRODUTOS.DBF",{{"CODIGO" ,"N",05,0},;
                                 {"NOME"   ,"C",50,0},;
                                 {"PRECO"  ,"N",06,2},;
                                 {"DATA"   ,"D",08,0},;
                                 {"INATIVO","L",01,0}})
 ENDIF

 IF !File("DBF\CLIENTES.DBF")
    DBCreate("DBF\CLIENTES.DBF",{{"CODIGO" ,"N",05,0},;
                                 {"NOME"   ,"C",50,0}})
 ENDIF
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
 *                       Abertura e sele��o de tabela
 *
 * Sempre que a aplica��o precisar acessar uma tabela, seja para inserir, alterar, excluir ou ler os dados dela, essa tabela tem que estar aberta e selecionada.
 * Para abrir uma tabela usamos dois comandos:
 /*
 SELECT 1          // Prepara uma �rea de ID 1 para "armazenar" a tabela que ser� aberta em seguida
 USE DBF\PRODUTOS  // Abre a tabela PRODUTOS

 SELECT 2         // Prepara uma �rea de ID 2 para "armazenar" a tabela que ser� aberta em seguida
 USE DBF\CLIENTES // Abre a tabela CLIENTES
 */
 * Para cada tabela, deve haver uma �rea somente para ela. Por exemplo, se voc� fizer isso:
 /*
 SELECT 1
 USE DBF\PRODUTOS

 SELECT 1
 USE DBF\CLIENTES
 */
 *
 * A tabela PRODUTOS ser� fechada, porque a CLIENTES foi aberta na �rea em que ela estava.
 * Para evitar esse tipo de problema, sempre use SELECT 0. Ao usar o 0, a aplica��o usar� a pr�xima �rea dispon�vel automaticamente:
 /*
 SELECT 0     // Prepara a �rea de ID 1
 USE DBF\PRODUTOS

 SELECT 0     // Prepara a �rea de ID 2
 USE DBF\CLIENTES
 */
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
 *                         Fechamento de tabela
 *
 * DBCloseAll() fecha todas as tabelas abertas. Use-o sempre que terminar de us�-las. Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT 0
 USE DBF\CLIENTES

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
 *                            Novo registro
 *
 * Para criar um novo registro na tabela:
 *
 * 1 - Selecione a tabela              = SELECT (a tabela precisa estar aberta)
 * 2 - Crie um novo registro em branco = DBAppend()
 * 3 - Preencha os campos              = REPLACE
 * 4 - Salve as inser��es              = DBCommit() ou DBCommitAll()
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 1
 REPLACE NOME    WITH "PRODUTO TESTE"
 REPLACE PRECO   WITH 2.50
 REPLACE DATA    WITH CToD("18/07/2024")
 REPLACE INATIVO WITH .F.
 DBCommit()

 DBCloseAll()
 */
 * Voc� pode usar DBCommitAll(), ao inv�s de DBCommit(), para salvar tudo de uma vez. Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT 0
 USE DBF\CLIENTES

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 2
 REPLACE NOME    WITH "PRODUTO TESTE 2"

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 3
 REPLACE NOME    WITH "PRODUTO TESTE 3"

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO WITH 1
 REPLACE NOME   WITH "JOS�"

 DBCommitAll()
 DBCloseAll()
 */
 * =============================================================================
 *                            Alterar um registro
 *
 * Para alterar um registro na tabela:
 *
 * 1 - Selecione a tabela    = SELECT (a tabela precisa estar aberta)
 * 2 - Posicione no registro = Vamos ver isso mais pra frente
 * 3 - Trave o registro      = RLock()
 * 4 - Preencha os campos    = REPLACE
 * 5 - Salve as altera��es   = DBCommit() ou DBCommitAll()
 * 6 - Destrave o registro   = DBUnlock() ou DBUnlockAll()
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 RLock()
 REPLACE NOME WITH "AMORA"
 DBCommit()
 DBUnlock()

 DBCloseAll()
 */
 * Assim como DBCommitAll(), voc� pode usar DBUnlockAll() para desbloquear todos os registros travados:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT 0
 USE DBF\CLIENTES

 SELECT PRODUTOS
 RLock()
 REPLACE NOME WITH "ABACAXI"

 SELECT CLIENTES
 RLock()
 REPLACE NOME WITH "MARIA"

 DBCommitAll()
 DBUnlockAll()
 */
 * Os exemplos acima alteram o primeiro registro das tabelas PRODUTOS e CLIENTES.
 * Para alterar outro registro, voc� precisa posicionar nele, antes de trav�-lo.
 *
 * Geralmente, isso � feito com DBSeek() ou DBSkip().
 * Vamos abordar esse assunto mais pra frente.
 *
 * Outro detalhe, � poss�vel travar uma tabela toda com a fun��o FLock().
 * Mas � indicado apenas em casos de extrema necessidade.
 *
 * =============================================================================
 *                           Exclus�o de um registro
 *
 * Para excluir um registro na tabela:
 *
 * 1 - Selecione a tabela              = SELECT
 * 2 - Posicione no registro           = Vamos ver isso mais pra frente
 * 3 - Trave o registro                = RLock()
 * 4 - Marque o registro como deletado = DELETE
 * 5 - Destrave o registro             = DBUnlock() ou DBUnlockAll()
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 RLock()
 DELETE
 DBUnlock()

 DBCloseAll()
 */
 * Para remover registros marcados como deletados para "sempre" (isso � feito ao reindexar o Autosys), use o comando PACK.
 * Esse comando s� funciona se a tabela tiver sido aberta em modo exclusivo.
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS EXCLUSIVE
 PACK
 DBCloseAll()
 */
 * =============================================================================
 *                            Obtendo o valor de um campo
 *
 * Para ler o valor que est� armazenado em um campo, utilize a seguinte sintaxe: NOME_DA_TABELA->NOME_DO_CAMPO.
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 MessageBox(,"C�digo: " +Str(PRODUTOS->CODIGO)  +Chr(13)+Chr(10)+;
             "Nome: "   +PRODUTOS->NOME         +Chr(13)+Chr(10)+;
             "Pre�o: "  +Str(PRODUTOS->PRECO)   +Chr(13)+Chr(10)+;
             "Data: "   +DToC(PRODUTOS->DATA)   +Chr(13)+Chr(10)+;
             "Inativo: "+LToC(PRODUTOS->INATIVO)+Chr(13)+Chr(10))

 DBCloseAll()
 */
 *
 * =============================================================================
 *                             �ndices e ordena��o
 *
 * �ndices podem ser usados para ordenar uma tabela. Exemplo:
 /*
 IF !IsDirectory("NTX")
    Run("MD NTX")
 ENDIF

 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 INDEX ON PRODUTOS->NOME                         TAG IND_NOME        TO NTX\IND_PRODUTOS // Cria o �ndice por nome
 INDEX ON PRODUTOS->CODIGO                       TAG IND_CODIGO      TO NTX\IND_PRODUTOS // Cria o �ndice por c�digo
 INDEX ON Str(PRODUTOS->CODIGO,5)+PRODUTOS->NOME TAG IND_CODIGO_NOME TO NTX\IND_PRODUTOS // Cria o �ndice por c�digo + nome

 DBCloseAll()
 */
 * No exemplo acima, foram criados tr�s �ndices, no arquivo de nome IND_PRODUTOS (na pasta NTX):
 * 1 - IND_NOME ordena a tabela por nome
 * 2 - IND_CODIGO ordena a tabela por c�digo
 * 3 - IND_CODIGO_NOME ordena a tabela por c�digo + nome (como CODIGO � num�rico, foi preciso convert�-lo para caractere, para concaten�-lo ao NOME)
 *
 * Depois de criado, o arquivo de �ndice continuar� existindo at� que seja deletado.
 * Portanto, n�o h� necessidade de ficar indexando (INDEX ON) a tabela toda hora.
 *
 * Se o �ndice j� existe em arquivo, basta "amarrar" o arquivo � tabela.
 *
 * O relacionamento entre tabela e arquivo de �ndice ser� perdido quando a tabela � fechada.
 * Ao abrir a tabela, para recuperar esse relacionamento, use o comando SET INDEX TO diret�rio+nome_do_arquivo:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS // Relaciona o arquivo IND_PRODUTOS com a tabela PRODUTOS
 DBCloseAll()
 */
 * E para desfazer o relacionamento entre tabela e arquivo de �ndice (sem precisar fechar a tabela) use o comando SET INDEX TO:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS // Relaciona o arquivo IND_PRODUTOS com a tabela PRODUTOS
 SET INDEX TO                  // Desfaz o relacionamento
 DBCloseAll()
 */
 * Como o primeiro �ndice do arquivo � o IND_NOME, a tabela ser� ordenada pelo campo NOME.
 * Para trocar a ordena��o da tabela, use a fun��o OrdSetFocus(TAG):
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_CODIGO") // Ordena a tabela por c�digo

 SELECT PRODUTOS
 OrdSetFocus("IND_NOME") // Ordena a tabela por nome

 DBCloseAll()
 */
 *
 * =============================================================================
 *                         Posicionamento de um registro
 *
 * Existem diversas formas de navegar pelos registros de uma tabela.
 * Qual vai ser usada? Tudo depende da situa��o.
 *
 * Lembre-se de selecionar a tabela desejada, antes de navegar por ela :)
 *
 * Se voc� quer ir para o primeiro registro da tabela, use DBGoTop():
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoTop()

 DBCloseAll()
 */
 *
 * Se voc� quer ir para o pr�ximo registro, use DBSkip():
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBSkip()

 DBCloseAll()
 */
 *
 * Se voc� quer ir para o �ltimo registro, use DBGoBottom():
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoBottom()

 DBCloseAll()
 */
 * Se voc� quer percorrer todos os registros de uma tabela, voc� pode fazer assim:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoTop()       // Posiciona no primeiro registro
 DO WHILE !Eof() // Fazer enquanto n�o for o final do arquivo
    DBSkip()     // Pula para o pr�ximo registro. Se o pr�ximo registro � o final do arquivo, vai sair do DO WHILE.
 ENDDO

 DBCloseAll()
 */
 *
 * Se voc� quer posicionar em um registro espec�fico, mas n�o sabe onde ele est�, voc� precisa buscar alguma informa��o que identifique-o.
 * Para isso, usaremos a fun��o DBSeek(). Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_CODIGO") // Ordena a tabela por c�digo
 DBSeek(2)                 // Busca o n�mero 2 no campo ordenado (CODIGO)
 */
 * No exemplo acima, DBSeek() vai posicionar no primeiro registro que existir na tabela, com o campo CODIGO igual � 2.
 *
 * Voc� pode tamb�m, buscar mais de uma informa��o:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_CODIGO_NOME") // Ordena a tabela por c�digo
 DBSeek(Str(2,5)+"PRODUTO TESTE 2") // Busca "    3"+ "PRODUTO TESTE 2" nos campos ordenados (Str(CODIGO,5)+NOME)
 */
 * DBSeek() retorna .T. se encontrar algum registro, .F. se n�o encontrar.
 * Voc� pode us�-lo em um IF para confirmar se um registro foi encontrado ou n�o.
 *
 * E se ele encontrar mais de um registro?
 * Como dito anteriormente, DBSeek() posicion�ria no primeiro registro que encontrou.
 * E j� que a tabela est� ordenada, os demais registros vir�o em seguida.
 *
 * Nesse caso, voc� pode fazer um DO WHILE para percorrer os demais registros v�lidos:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_NOME") // Ordena a tabela por c�digo
 DBSeek("PRODUTO TESTE") // Busca "PRODUTO TESTE" no campo ordenado (NOME)

 // H� dois produtos com esse nome na tabela PRODUTOS. DBSeek() posicionou no primeiro.
 // O DO WHILE abaixo vai percorrer a tabela PRODUTOS, enquanto o NOME do registro posicionado, corresponder ao que foi buscado ("PRODUTO TESTE").
 // Portanto, a mensagem ser� exibida duas vezes.

 DO WHILE !Eof() .AND. PRODUTOS->NOME=="PRODUTO TESTE"
    MessageBox(,Str(PRODUTO->CODIGO)+' '+PRODUTO->NOME)
    DBSkip()
 ENDDO
 */
 *
 * =============================================================================
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL