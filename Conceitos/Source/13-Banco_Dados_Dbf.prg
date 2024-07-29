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
 *
 IF !IsDirectory("DBF")
    Run("MD DBF")
 ENDIF

 IF !File("DBF\PRODUTOS.DBF")
    DBCreate("DBF\PRODUTOS.DBF",{{"CODIGO" ,"N",05,0},;
                                 {"NOME"   ,"C",50,0},;
                                 {"PRECO"  ,"N",06,2},;
                                 {"DATA"   ,"D",08,0},;
                                 {"INATIVO","L",01,0},;
                                 {"CLIENTE","N",05,0}})
 ENDIF

 IF !File("DBF\CLIENTES.DBF")
    DBCreate("DBF\CLIENTES.DBF",{{"NOME"   ,"C",50,0},;
                                 {"CODIGO" ,"N",05,0}})
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
 * No exemplo acima, a tabela CLIENTES est� selecionada, porque ela foi aberta por �ltimo.
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
 REPLACE NOME    WITH "PRODUTO TESTE 1"
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

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO WITH 1
 REPLACE NOME   WITH "JOS�"

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO WITH 3
 REPLACE NOME   WITH "GABRIEL"

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 2
 REPLACE NOME    WITH "PRODUTO TESTE 2"
 REPLACE CLIENTE WITH 3

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 3
 REPLACE NOME    WITH "PRODUTO TESTE 3"
 REPLACE CLIENTE WITH 3

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 4
 REPLACE NOME    WITH "PRODUTO TESTE 4"
 REPLACE CLIENTE WITH 1

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
 REPLACE PRECO WITH 4.00
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
 REPLACE PRECO WITH 3.00

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

 MessageBox(,"C�digo: "              +Str(PRODUTOS->CODIGO)  +Chr(13)+Chr(10)+;
             "Nome: "                +PRODUTOS->NOME         +Chr(13)+Chr(10)+;
             "Pre�o: "               +Str(PRODUTOS->PRECO)   +Chr(13)+Chr(10)+;
             "Data: "                +DToC(PRODUTOS->DATA)   +Chr(13)+Chr(10)+;
             "Inativo: "             +LToC(PRODUTOS->INATIVO)+Chr(13)+Chr(10))

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
 INDEX ON PRODUTOS->NOME                         TAG NOME    TO NTX\IND_PRODUTOS // Cria o �ndice por nome
 INDEX ON PRODUTOS->CODIGO                       TAG CODIGO  TO NTX\IND_PRODUTOS // Cria o �ndice por c�digo
 INDEX ON Str(PRODUTOS->CODIGO,5)+PRODUTOS->NOME TAG CODNOME TO NTX\IND_PRODUTOS // Cria o �ndice por c�digo + nome

 DBCloseAll()
 */
 *
 * ATEN��O: TAG � o nome do �ndice, e pode ter no m�ximo 10 caracteres. Se informado mais de 10, o nome � automaticamente cortado.
 *
 * No exemplo acima, foram criados tr�s �ndices, no arquivo de nome IND_PRODUTOS (na pasta NTX):
 * 1 - NOME ordena a tabela por nome
 * 2 - CODIGO ordena a tabela por c�digo
 * 3 - CODNOME ordena a tabela por c�digo + nome (como CODIGO � num�rico, foi preciso convert�-lo para caractere, para concaten�-lo ao NOME)
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
 * Como o primeiro �ndice do arquivo � o NOME, a tabela ser� ordenada pelo campo NOME.
 * Para trocar a ordena��o da tabela, use a fun��o OrdSetFocus(TAG):
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME") // Ordena a tabela por c�digo

 SELECT PRODUTOS
 OrdSetFocus("CODIGO") // Ordena a tabela por nome

 SELECT PRODUTOS
 OrdSetFocus("CODNOME") // Ordena a tabela por c�digo e nome

 DBCloseAll()
 */
 * =============================================================================
 *                         Posicionamento de um registro
 *
 * Existem diversas formas de navegar pelos registros de uma tabela.
 * Qual vai ser usada? Tudo depende da situa��o.
 *
 * DBGoTop() posiciona no primeiro registro da tabela.
 * DBSkip() posiciona no pr�ximo registro.
 * DBGoBottom() posiciona no �ltimo registro da tabela.
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoTop()       // Resultado: Posiciona no Registro 1
 DBSkip()        // Resultado: Posiciona no registro 2
 DBGoBottom()    // Resultado: Posiciona no registro 4

 DBCloseAll()
 */
 * Para percorrer todos os registros de uma tabela, voc� pode fazer assim:
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
 * Para posicionar em um registro espec�fico, mas n�o se sabe em que posi��o ele est�, voc� precisa buscar alguma informa��o que identifique-o.
 * Para isso, usaremos a fun��o DBSeek(). DBSeek() retorna .T. se encontrar algum registro, .F. se n�o encontrar.
 * Voc� pode us�-lo em um IF para confirmar se um registro foi encontrado ou n�o.
 *
 * No exemplo abaixo, DBSeek() vai posicionar no primeiro registro encontrado, com o campo CODIGO igual a 2:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("CODIGO") // Ordena a tabela pelo campo CODIGO

 IF DBSeek(2) // Busca o n�mero 2 no campo ordenado
    MessageBox(,"Achou: "+PRODUTOS->NOME)
  ELSE
    MessageBox(,"N�o achou")
 ENDIF

 DBCloseAll()
 */
 * Para buscar mais de uma informa��o:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("CODNOME") // Ordena a tabela por c�digo + nome (Str(CODIGO,5)+NOME)

 IF DBSeek(Str(3,5)+"PRODUTO TESTE 3") // Busca "    3"+"PRODUTO TESTE 3" nos campos ordenados
    MessageBox(,"Achou: "+PRODUTOS->NOME)
  ELSE
    MessageBox(,"N�o achou")
 ENDIF

 DBCloseAll()
 */
 * Se houver mais de um registro com a informa��o buscada, DBSeek() posicionar� no primeiro registro encontrado.
 * Por exemplo, na tabela temos 4 produtos com nome "PRODUTO TESTE n". Ao buscar por "PRODUTO TESTE", o DBSeek() encontrar� o primeiro: "PRODUTO TESTE 1":
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME") // Ordena a tabela pelo campo NOME
 DBSeek("PRODUTO TESTE") // Busca "PRODUTO TESTE" no campo ordenado
 MessageBox(,"Registro: "+Str(Recno())) // Resultado: Registro 1

 DBCloseAll()
 */
 * Vamos supor que voc� precisa inativar todos os produtos com nome "PRODUTO TESTE".
 * J� que a tabela est� ordenada por nome, os demais produtos est�o logo ap�s do primeiro registro encontrado.
 *
 * Nesse caso, voc� pode fazer um DO WHILE para percorrer os demais produtos:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT MOVPROD
 OrdSetFocus("NOME") // Ordena a tabela por c�digo
 DBSeek("PRODUTO TESTE") // Busca "PRODUTO TESTE" no campo ordenado (NOME)

 // H� quatro produtos com esse nome na tabela PRODUTOS. DBSeek() posicionou no primeiro.
 // O DO WHILE abaixo vai percorrer a tabela PRODUTOS, enquanto o NOME do registro posicionado, corresponder ao que foi buscado ("PRODUTO TESTE").
 // Portanto, a mensagem ser� exibida quatro vezes.

 DO WHILE !Eof() .AND. SubStr(PRODUTOS->NOME,1,13)=="PRODUTO TESTE"
    MessageBox(,"Come�o do DO WHILE"              +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo()))

    RLock()
    REPLACE INATIVO WITH .F.
    DBCommit()
    DBUnlock()

    DBSkip()

    MessageBox(,"Fim do DO WHILE"                 +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo()))
 ENDDO

 DBCloseAll()
 */
 * =============================================================================
 *                                  Filtro
 *
 * H� duas formas de filtrar uma tabela DBF:
 *
 * 1 - com INDEX ON ... FOR
 * 2 - com DBSetFilter()
 *
 * Exemplo de filtro com INDEX ON ... FOR:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 INDEX ON PRODUTOS->CODIGO TAG "CODFILTRO" TO NTX\IND_PRODUTOS FOR PRODUTOS->CODIGO==1 .OR. PRODUTOS->CODIGO==2

 SELECT PRODUTOS
 DBGoTop()
 DO WHILE !Eof() // Resultado: exibir� apenas os produtos de c�digo 1 e 2
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 * Como o filtro fica ligado � um �ndice, se a ordem da tabela mudar, o filtro tamb�m se perde. Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("CODFILTRO")
 DBGoTop()
 DO WHILE !Eof() // Exibir� os produtos de c�digo 1 e 2
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 SELECT PRODUTOS
 OrdSetFocus("CODIGO")
 DBGoTop()
 DO WHILE !Eof() // Exibir� todos os os produtos, porque o �ndice CODIGO n�o tem filtro
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 * Com DBSetFilter() isso j� n�o acontece, porque o filtro n�o estar� ligado � um �ndice.
 * Exemplo de filtro com DBSetFilter():
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME")
 DBSetFilter({|| PRODUTOS->CODIGO==1 .OR. PRODUTOS->CODIGO==2},"PRODUTOS->CODIGO==1 .OR. PRODUTOS->CODIGO==2")
 DBGoTop()
 DO WHILE !Eof() // Exibir� os produtos de c�digo 1 e 2
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 SELECT PRODUTOS
 OrdSetFocus("CODIGO")
 DBGoTop()
 DO WHILE !Eof() // Exibir� os produtos de c�digo 1 e 2, mesmo que a ordem tenha sido alterada
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBClearFilter()

 SELECT PRODUTOS
 DBGoTop()
 DO WHILE !Eof() // Exibir� todos os produtos
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "C�digo: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 *
 * =============================================================================
 *                              Relacionamento
 *
 * O relacionamento consiste em "amarrar" registros de duas tabelas que tenham algum dado em comum.
 * Dessa forma, ao navegar por uma tabela, automaticamente a outra acompanha essa navega��o.
 *
 * Por exemplo, vamos relacionar a tabela PRODUTOS e CLIENTES.
 * Esse relacionamento ser� feito usando os campos PRODUTOS->CLIENTE e CLIENTES->CODIGO:
 * A ideia �: percorrer os registros da tabela PRODUTOS, e exibir o nome do cliente.
 *
 * Primeiro, precisamos indexar a tabela CLIENTES pelo campo CODIGO, pois � a ordem que ir� apontar qual campo ser� relacionado:
 /*
 SELECT 0
 USE DBF\CLIENTES
 INDEX ON CLIENTES->CODIGO TAG CODIGO TO NTX\IND_CLIENTES
 INDEX ON CLIENTES->NOME   TAG NOME   TO NTX\IND_CLIENTES

 DBCloseAll()
 */
 * A ordena��o da tabela CLIENTES � que vai apontar qual campo ser� relacionado.
 * Para fazer o relacionamento:
 /*
 SELECT 0
 USE DBF\CLIENTES
 SET INDEX TO NTX\IND_CLIENTES

 SELECT CLIENTES
 OrdSetFocus("CODIGO") // Ordena a tabela pelo campo que ser� relacionado

 SELECT 0
 USE DBF\PRODUTOS
 DBSetRelation("CLIENTES",{|| PRODUTOS->CLIENTE},"PRODUTOS->CLIENTE") // Relaciona a tabela CLIENTES (campo CODIGO) com a PRODUTOS (campo CLIENTE)

 SELECT CLIENTES
 OrdSetFocus("NOME")

 SELECT PRODUTOS
 DBGoTop()
 DO WHILE !Eof()
    MessageBox(,"Produto: "+PRODUTOS->NOME+Chr(13)+Chr(10)+;
                "Cliente: "+CLIENTES->NOME+Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 *
 * ATEN��O: Mudar a ordem da tabela CLIENTES, e navegar na tabela PRODUTOS, desfaz o relacionamento.
 *
 * =============================================================================
 *            Dica - Salvar e restaurar o "status" da tabela
 *
 * Ao trabalhar com tabelas DBF, recomendamos que:
 *
 * 1 - Voc� salve a tabela selecionada, antes de fazer um SELECT
 * 2 - Voc� salve a ordem e o registro da tabela, antes de alter�-los
 *
 * Mas calma, que n�o � pra fazer isso toda hora rs
 *
 * A primeira dica � ideal de ser usada ao criar uma nova fun��o, onde ser� usado o SELECT em algum momento.
 * J� no come�o da fun��o SALVE a tabela, e antes de sair da fun��o, RESTAURE a tabela que estava selecionada antes.
 *
 * Exemplo:
 *
 * FUNCTION EXEMPLO()
 *
 * LOCAL nArea:=Select() // Salva na vari�vel nArea, o ID da tabela selecionada (ex: CLIENTES)
 *
 * SELECT PRODUTOS
 * Faz alguma coisa
 *
 * Select(nArea) // Restaura a tabela que estava selecionada antes (ex: CLIENTES)
 *
 * RETURN NIL
 *
 * A segunda dica � ideal  para casos em que � necess�rio alterar a ordem ou o registro de uma tabela.
 * SALVE a ordem e o registro da tabela antes de alter�-los, e depois RESTAURE-os.
 *
 * Exemplo:
 *
 * FUNCTION EXEMPLO()
 *
 * LOCAL nArea:=Select(), cOrdem_Produtos, nRegistro_Produtos
 *
 * SELECT PRODUTOS
 * cOrdem_Produtos   :=OrdSetFocus("NOME")  // Salva a ordem da tabela PRODUTOS (ex: CODIGO), e altera a ordem para NOME
 * nRegistro_Produtos:=RecNo()              // Salva o registro da tabela PRODUTOS (ex: 1)
 *
 * DBSeek("PRODUTO TESTE 3")                // Muda de registro (ex: 3)
 * Faz alguma coisa
 *
 * PRODUTOS->(OrdSetFocus(cOrdem_Produtos)) // Restaura a ordem anterior (ex: CODIGO)
 * PRODUTOS->(DBGoTo(nRegistro_Produtos))   // Restaura o registro anterior (ex: 1)
 *
 * Select(nArea) // Restaura a tabela que estava selecionada antes (ex: CLIENTES)
 *
 * RETURN NIL
 *
 * Ao salvar e restaurar esses status, voc� evitar� bugs que podem acontecer ao voltar para a fun��o pai.
 * Um exemplo bem comum no Autosys, s�o nas telas que exibem listas (ex: cadastro de clientes, produtos, etc).
 *
 * Ao acessar uma funcionalidade dentro dessas telas, e voltar para a lista, se o "Salvar e restaurar" n�o for feito corretamente, pode acontecer:
 * - Um erro, porque o sistema tentar� acessar campos de uma tabela que n�o est� selecionada mais.
 * - A ordem ser� alterada (ex: estava por ordem alfab�tica, e n�o est� mais)
 * - O registro n�o � mais o mesmo (ex: voc� estava no produto 1, e a� foi pro �ltimo)
 */
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL