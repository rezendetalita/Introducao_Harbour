/*
 Lista com as fun��es que mais usamos do xHarbour. Verifique o manual para mais detalhes.
*/

#INCLUDE "WINUSER.CH" // Necess�rio para usar as flags na fun��o MessageBox().

*--------------------------*
 FUNCTION FUNCOES_XHARBOUR()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Funcoes uteis do xHarbour",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Funcoes_xHarbour"
 *
 * =============================================================================
 *                                     AllTrim()
 *
 * Remove os espacos em branco ao redor de uma string. Exemplo:
 *
 * AllTrim("     Sommus Sistemas     ") // resultado: "Sommus Sistemas"
 *
 * =============================================================================
 *                                       At()
 *
 * Procura uma letra ou palavra em uma string, e retorna sua posicao. Exemplo:
 *
 * At("i","Sommus Sistemas")        // resultado: 9
 * At("Sistemas","Sommus Sistemas") // resultado: 8
 *
 * =============================================================================
 *                                   Replicate()
 * Replica um caractere n vezes. Exemplo:
 *
 * Replicate("-",5) // resultado: "-----"
 *
 * =============================================================================
 *                             PadC() | PadL() | PadR()
 *
 * Retorna a string preenchida com o caractere informado. Essas fun��es s�o muito utilizadas para alinhamento. Exemplo:
 *
 * PadC("Sommus Sistemas",50,"_") // resultado: "_________________Sommus Sistemas__________________"
 * PadL("Sommus Sistemas",20,"_") // resultado: "_____Sommus Sistemas"
 * PadR("Sommus Sistemas",30,"_") // resultado: "Sommus Sistemas_______________"
 *
 * PadC adiciona o caractere a esquerda e a direita, de forma que a string fique no centro.
 * PadL adiciona o caractere a esquerda, de forma que a string fique a direita.
 * PadR adiciona o caractere a direita, de forma que a string fique a esquerda.
 *
 * Obs: Se o caractere nao for informado, por DEFAULT ser� o espaco em branco. Exemplo:
 * PadC("Sommus Sistemas",50) // resultado: "                 Sommus Sistemas                  "
 *
 *
 * =============================================================================
 *                                     Space()
 *
 * Retorna espa�os em branco n vezes. Muito usada quando se quer exibi-los sem poluir o c�digo. Exemplo:
 *
 * Space(1)  // resultado: " "
 * Space(20) // resultado: "                    "
 *
 * =============================================================================
 *                                   StrTran()
 *
 * Substitui um caractere ou string, por outro(a). Exemplo:
 *
 * StrTran("Sommus Sistemas","s","S")           // resultado: "SommuS SiStemaS"
 * StrTran("Sommus Sistemas","Sommus", "Teste") // resultado: "Teste Sistemas"
 * StrTran("Sommus Sistemas","Sistemas")        // resultado: "Sommus "
 *
 * =============================================================================
 *                                  SubStr()
 *
 * Corta uma string. Exemplo:
 *
 * SubStr("Sommus Sistemas",1,6) // resultado: "Sommus"
 * SubStr("Sommus Sistemas",2,6) // resultado: "ommus "
 * SubStr("Sommus Sistemas",1,1) // resultado: "S"
 *
 * Obs: O segundo par�metro � a posi��o onde o corte ser� iniciado. O terceiro par�metro s�o quantos caracteres ser�o cortados.
 *
 * =============================================================================
 *                                   Len()
 *
 * Retorna o tamanho de uma string, array ou hash. Exemplo:
 *
 * Len("Teste")                              // resultado: 5
 * Len({1,2,3})                              // resultado: 3
 * Len({ "Nome" => "Fulano", "Idade" => 10}) // resultado: 2
 *
 * =============================================================================
 *                                  Empty()
 *
 * Retorna se o valor passado est� vazio. Exemplo:
 *
 * Empty(NIL)      // resultado: .T.
 * Empty(0)        // resultado: .T.
 * Empty(.F.)      // resultado: .T.
 * Empty(CtoD("")) // resultado: .T.
 * Empty("")       // resultado: .T.
 * Empty("     ")  // resultado: .T.
 * Empty({})       // resultado: .T.
 * Empty({=>})     // resultado: .T.
 *
 * Empty(1)                      // resultado: .F.
 * Empty(.T.)                    // resultado: .F.
 * Empty(CtoD("08/07/2024"))     // resultado: .F.
 * Empty("A")                    // resultado: .F.
 * Empty({1,2,3})                // resultado: .F.
 * Empty({ "A" => 1, "B" => 2 }) // resultado: .F.
 *
 * =============================================================================
 *                                  Round()
 *
 * Arredonda decimais. Exemplo:
 *
 * Round(1234.5678,0) // resultado: 1235
 * Round(1234.5678,1) // resultado: 1234.6
 * Round(1234.5678,2) // resultado: 1234.57
 * Round(1234.5678,3) // resultado: 1234.568
 *
 * =============================================================================
 *                                  Date()
 *
 * Retorna a data atual. Exemplo:
 *
 * Date() // resultado: 08/07/2024
 *
 * =============================================================================
 *                                DateTime()
 *
 * Retorna a data e hora atual. Exemplo:
 *
 * DateTime() // resultado: {� 08/07/2024 10:59:59.00}
 *
 * =============================================================================
 *                                  Time()
 *
 * Retorna a hora atual. Exemplo:
 *
 * Time() // resultado: "10:59:59"
 *
 * =============================================================================
 *                              CToD() e SToD()
 *
 * Converte texto em data. Exemplo:
 *
 * CToD("01/02/2024") // resultado: 01/02/2024
 * StoD("20240201")   // resultado: 01/02/2024
 *
 * =============================================================================
 *                             DToC() e DToS()
 *
 * Converte data em texto. Exemplo:
 *
 * DToC(Date()) // resultado: "08/07/2024"
 * DToS(Date()) // resultado: "20240708"
 *
 * =============================================================================
 *                                 LToC()
 *
 * Converte l�gico em texto. Exemplo:
 *
 * LToC(.T.) // resultado: "T"
 *
 * =============================================================================
 *                                 Val()
 *
 * Converte texto em n�mero. Exemplo:
 *
 * Val("1") // resultado: 1
 *
 * =============================================================================
 *                                 Str()
 *
 * Converte n�mero em texto. Exemplo:
 *
 * Str(1) // resultado: "         1"
 *
 * =============================================================================
 *                               StrZero()
 *
 * Converte n�mero em texto, com zeros a esquerda.
 *
 * StrZero(1,5)  // resultado: "00001"
 * StrZero(10,3) // resultado: "010"
 *
 * =============================================================================
 *                               ValToPrg()
 *
 * A fun��o ValToPrg() aceita um valor de qualquer tipo e retorna uma string contendo o c�digo PRG.
 * Geralmente usamos em debug, quando queremos exibir o conte�do de uma vari�vel em uma mensagem.
 /*
   MessageBox(,ValToPrg("xHarbour"))             // resultado: "xHarbour"
   *
   MessageBox(,ValToPrg(1.2345))                 // resultado: "         1.2345"
   *
   MessageBox(,ValToPrg(Date()))                 // resultado: "SToD('20240708')"
   *
   MessageBox(,ValToPrg(.T.))                    // resultado: ".T."
   *
   MessageBox(,ValToPrg({1,2,3}))                // resultado: "M->__ValToPrg_Array := Array(3)
                                                 //                M->__ValToPrg_Array[1] :=          1
                                                 //                M->__ValToPrg_Array[2] :=          2
                                                 //                M->__ValToPrg_Array[3] :=          3"
   *
   MessageBox(,ValToPrg({{1,2},{3,4}}))          // resultado: "M->__ValToPrg_Array := Array(2)
                                                 //                M->__ValToPrg_Array[1] := Array(2)
                                                 //                   M->__ValToPrg_Array[1][1] :=          1
                                                 //                   M->__ValToPrg_Array[1][2] :=          2
                                                 //                M->__ValToPrg_Array[2] := Array(2)
                                                 //                   M->__ValToPrg_Array[2][1] :=          3
                                                 //                   M->__ValToPrg_Array[2][2] :=          4"
   *
   MessageBox(,ValToPrg({ "A" => 1, "B" => 2 })) // resultado: { "A" =>  1, "B" =>  2 }
   *
   MessageBox(,ValToPrg(NIL))                    // resultado: NIL
 */
 * =============================================================================
 *                              MessageBox()
 *
 * Essa � uma fun�ao do windows, usada para exibir uma mensagem, que vai no segundo par�metro:
 *
 * MessageBox(,"Ol�")
 *
 * Para deixar a mensagem mais bonitinha, voc� pode informar um t�tulo no terceiro par�metro, e flags no quarto:
 *
 * MessageBox(,"Ol�","T�tulo da mensagem",MB_YESNO+MB_ICONINFORMATION)
 *
 * No exemplo acima, h� uma combina��o de duas flags:
 *
 * MB_YESNO           = Exibe os bot�es "Sim" e "N�o"
 * MB_ICONINFORMATION = Exibe um �cone � esquerda do texto da mensagem
 *
 * Para usar as constantes acima, � necess�rio fazer o #include "WINUSER.CH" no in�cio do prg.
 * Veja mais flags na documenta��o da Microsoft: https://learn.microsoft.com/pt-br/windows/win32/api/winuser/nf-winuser-messagebox
 *
 * Obs: para exibir dados que n�o s�o string, � necess�rio convert�-los. Caso contr�rio, a mensagem ficar� em branco. Use ValToPrg() para isso.
 *
 * =============================================================================
 *                               Lastkey()
 *
 * Retorna o c�digo da �ltima tecla pressionada. Exemplo:
 *
 * LastKey() // resultado: se o usu�rio apertar ESC, a fun��o retorna 27.
 *
 * Obs: Tabela ASCII com os poss�veis c�digos: https://pt.wikipedia.org/wiki/ASCII
 *
 * =============================================================================
 *                                File()
 *
 * Verifica se o arquivo existe. Exemplo:
 *
 * File("teste.txt")    // resultado: Procura o arquivo na pasta raiz. Retorna .T. se existir, .F. se n�o
 * File("C:\teste.txt") // resultado: Procura o arquivo no diret�rio informado. Retorna .T. se existir, .F. se n�o
 *
 * =============================================================================
 *                              MemoRead()
 *
 * Retorna o conte�do de um arquivo. Exemplo:
 *
 * MemoRead("teste.txt")           // resultado: "Todo o texto que estiver dentro do arquivo"
 * MemoRead("C:\Sommus\teste.txt") // resultado: "Todo o texto que estiver dentro do arquivo"
 *
 * Se voc� s� precisa do conte�do, utilize essa fun��o.
 * Ela faz a leitura do arquivo, sem a necessidade de abrir e fech�-lo.
 * � mais pr�tico usar MemoRead() do que FRead().
 *
 * =============================================================================
 *                               FCreate()
 *
 * Cria um arquivo. Exemplo:
 *
 * FCreate("teste.txt")           // resultado: Cria o arquivo na pasta raiz. Retorna o ID do arquivo (ex: 1).
 * FCreate("C:\Sommus\teste.txt") // resultado: Cria o arquivo no diret�rio informado. Retorna o ID do arquivo (ex: 2).
 *
 * � uma boa pr�tica verificar se o arquivo n�o existe, antes de cri�-lo. Use a fun��o File() para isso.
 * Al�m disso, � comum salvar o retorno de FCreate() em uma vari�vel, para poder manipular o arquivo depois (ex: FWrite(), FClose()):
 /*
   IF !File("teste.txt")
      nArquivo:=FCreate("teste.txt")
   ENDIF
 */
 *
 * =============================================================================
 *                                FOpen()
 *
 * Abre um arquivo existente. Exemplo:
 *
 * FOpen("teste.txt")           // resultado: Abre o arquivo na pasta raiz. Retorna o ID do arquivo (ex: 1).
 * FOpen("C:\Sommus\teste.txt") // resultado: Abre o arquivo no diret�rio informado. Retorna o ID do arquivo (ex: 2).
 *
 * Assim como em FCreate(), � comum salvar o ID do arquivo em uma vari�vel, para manipular o arquivo em seguida.
 * Lembre-se de verificar se o arquivo existe antes de abri-lo. Caso contr�rio, o retorno de FOpen() ser� -1 (significa que a abertura deu erro).
 /*
   IF File("teste.txt")
      nArquivo:=FOpen("teste.txt")
   ENDIF
 */
 *
 * Por padr�o, o arquivo ser� aberto em modo leitura. Se necess�rio escrever no arquivo, informe o segundo par�metro (nMode), para abrir em modo escrita:
 *
 * nArquivo:=FOpen("teste.txt",1)
 *
 * A seguir, os poss�veis valores para o par�metro nMode (retirados do manual do xHarbour):
 *
 * 0  FO_READ       Modo leitura
 * 1  FO_WRITE      Modo escrita
 * 2  FO_READWRITE  Modo leitura e escrita
 *
 * Para usar as constantes (FO_READ, FO_WRITE ou FO_READWRITE) ao inv�s dos valores (0, 1 ou 2), fa�a o #include FILEIO.CH no in�cio do prg.
 *
 * =============================================================================
 *                               FClose()
 *
 * Fecha o arquivo criado ou aberto anteriormente. Exemplo:
 /*
   nArquivo_Temporario:=FCreate("teste.tmp")
   nArquivo_Teste     :=FOpen("teste.txt")
   *
   FClose(nArquivo_Temporario)
   FClose(nArquivo_Teste)
 */
 * Sempre feche um arquivo depois que terminar de us�-lo.
 *
 * =============================================================================
 *                                 FWrite()
 *
 * Escreve no arquivo criado ou aberto anteriormente. Exemplo:
 /*
   nArquivo:=FCreate("teste_fwrite.txt")
   *
   FWrite(nArquivo,"In�cio")
   FWrite(nArquivo,"Fim")
   *
   FClose(nArquivo)
 */
 * No exemplo acima, FWrite() escreve no arquivo, a partir da posi��o atual.
 * Ao criar o arquivo, a posi��o atual ser� o in�cio dele.
 * Depois de executar um FWrite(), a posi��o atual muda para o final da string que foi escrita.
 *
 * Por isso, o arquivo ficar� assim:
 *
 * In�cioFim
 *
 * Para pular a linha, coloque a quebra de linha no final da string:
 /*
   nArquivo:=FCreate("teste_fwrite.txt")
   *
   FWrite(nArquivo,"In�cio"+Chr(13)+Chr(10))
   FWrite(nArquivo,"Fim"+Chr(13)+Chr(10))
   *
   FClose(nArquivo)
 */
 * O arquivo ficar� assim:
 *
 * In�cio
 * Fim
 *
 * Para escrever em um arquivo que j� existe, abra-o em modo de escrita:
 *
 * nArquivo:=FOpen("teste_fwrite.txt", 1)
 *
 * Ao abrir o arquivo, a posi��o atual ser� o in�cio dele.
 * Antes do FWrite(), altere a posi��o para o final do arquivo, com a fun��o FSeek().
 * Isso vai evitar que o conte�do j� existente seja sobrescrito. Exemplo:
 /*
   nArquivo:=FOpen("teste_fwrite.txt", 1)
   *
   FSeek(nArquivo,0,2)
   *
   FWrite(nArquivo,"Mensagem"+Chr(13)+Chr(10))
   *
   FClose(nArquivo)
 */
 * =============================================================================
 *                Dica - File() + FCreate() + FOpen()
 *
 * Voc� pode usar File() para decidir se vai criar o arquivo, ou abri-lo. Exemplo:
 /*
   IF !File("teste.txt")
      nArquivo:=FCreate("teste.txt")
    ELSE
      nArquivo:=FOpen("teste.txt")
      FSeek(nArquivo,0,2)
   ENDIF
   *
   FWrite(nArquivo,"Mensagem"+Chr(13)+Chr(10))
   *
   FClose(nArquivo)
 */
 * =============================================================================
 *                                FError()
 *
 * As fun��es vistas acima: FCreate(), FOpen(), FClose() e FWrite(), n�o d�o erro.
 * Para saber se a a��o foi executada com sucesso ou n�o, utilize a fun��o FError().
 *
 * Essa fun��o retorna 0 em caso de sucesso, e um c�digo de erro caso contr�rio.
 * Para ver a lista de poss�veis c�digos, consulte a fun��o no manual do xHarbour.
 *
 * Exemplo:
 /*
   nArquivo:=FOpen("teste.txt")
   *
   IF FError()>0
      MessageBox(,"Erro ao abrir o arquivo. C�digo: "+Str(FError()))
   ENDIF
   *
   FWrite(nArquivo,"Mensagem")
   *
   IF FError()>0
      MessageBox(,"Erro ao escrever no arquivo. C�digo: "+Str(FError()))
   ENDIF
   *
   FClose(nArquivo)
   *
   IF FError()>0
      MessageBox(,"Erro ao fechar o arquivo. C�digo: "+Str(FError()))
   ENDIF
 */
 * No exemplo acima, ocorrer� um erro de c�digo 5 (acesso negado) no FWrite(), porque o arquivo foi aberto em modo leitura.
 *
 * =============================================================================
 *                                  Chr()
 *
 * Converte um n�mero ASCII em caractere:
 *
 * Chr(65)  // resultado: "A"
 * Chr(322) // resultado: "B"
 *
 * Geralmente usamos quando queremos a quebra de linha CR + LF, que seria: Chr(13)+Chr(10)
 *
 * Obs: Tabela ASCII com os poss�veis c�digos: https://pt.wikipedia.org/wiki/ASCII
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