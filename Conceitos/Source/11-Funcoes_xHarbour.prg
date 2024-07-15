/*
 Lista com as fun��es que mais usamos do xHarbour. Verifique o manual para mais detalhes.
*/

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
 */
 * =============================================================================
 *                              MessageBox()
 *
 * Essa � uma fun�ao do windows: https://learn.microsoft.com/pt-br/windows/win32/api/winuser/nf-winuser-messagebox
 * Usada para exibir uma mensagem, que vai no segundo par�metro:
 *
 * MessageBox(,"Ol�")
 *
 * Obs: para exibir dados que n�o s�o string, � necess�rio convert�-los. Caso contr�rio, a mensagem ficar� em branco.
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
 *                                Memoread()
 *
 * Retorna o conte�do de um arquivo. Exemplo:
 *
 * Memoread("teste.txt") // resultado: "Todo o texto que estiver dentro do arquivo"
 *
 * =============================================================================
 *                                 FCreate()
 *
 * Cria um arquivo. Exemplo:
 *
 * FCreate("teste.txt")    // resultado: Cria o arquivo na pasta raiz. Retorna o ID do arquivo para ser manipulado ex: 1).
 * FCreate("C:\teste.txt") // resultado: Cria o arquivo no diret�rio informado. Retorna o ID do arquivo para ser manipulado ex: 1).
 *
 * =============================================================================
 *                                  FOpen()
 *
 * Abre um arquivo existente. Exemplo:
 *
 * FOpen("teste.txt")    // resultado: Abre o arquivo na pasta raiz. Retorna o ID do arquivo para ser manipulado ex: 1).
 * FOpen("C:\teste.txt") // resultado: Abre o arquivo no diret�rio informado. Retorna o ID do arquivo para ser manipulado (ex: 1).
 *
 * =============================================================================
 *                                  FClose()
 *
 * Fecha o arquivo criado ou aberto anteriormente. Exemplo:
 /*
   nArquivo:=FOpen("teste.txt")
   *
   FClose(nArquivo)
 */
 *
 * Obs: Sempre feche um arquivo depois que terminar de us�-lo.
 *
 * =============================================================================
 *                                 FWrite()
 *
 * Escreve no arquivo criado ou aberto anteriormente. Exemplo:
 /*
  nArquivo:=FOpen("teste.txt")
  *
  FWrite(nArquivo,"In�cio")
  FWrite(nArquivo,"Fim")
  *
  FClose(nArquivo)
 */
 *
 * FWrite() escreve no arquivo a partir da �ltima posi��o.
 * Portanto, o arquivo ficar� assim:
 * In�cioFim
 *
 * Lembre-se de colocar a quebra de linha, se for necess�rio separ�-las. Exemplo:
 /*
   FWrite(nArquivo,"In�cio"+Chr(13)+Chr(10))
   FWrite(nArquivo,"Fim")
 */
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