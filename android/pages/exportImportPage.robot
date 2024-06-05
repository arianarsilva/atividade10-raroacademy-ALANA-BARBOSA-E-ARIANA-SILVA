*** Settings ***

Resource    ../base.robot

*** Variables ***
${MENU_EXPORT}                       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_exportar"]
${EXPORT_TELA}                       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${EXPORT_TITULO}                     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${EXPORT_AD}                         xpath=//android.webkit.WebView
${EXPORT_FORMATO}                    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]

${EXPORT_GERAR_DADOS}                xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${EXPORT_ARQUIVO1}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileprod"]
${EXPORT_ARQUIVO2}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileent"]
${EXPORT_ARQUIVO3}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilesai"]
${EXPORT_ARQUIVO4}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilegrupo"]

${EXPORT_ENVIAR1}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_prod"]
${EXPORT_ENVIAR2}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_ent"]
${EXPORT_ENVIAR3}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_sai"]
${EXPORT_ENVIAR4}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupo"]
${EXPORT_SELECIONAR}                 xpath=//android.widget.TextView[@resource-id="android:id/title"]

${EXPORT_JANELA_MSG}                 xpath=//android.widget.LinearLayout[@resource-id="android:id/parentPanel"]
${EXPORT_TITULO_MSG}                 xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${EXPORT_CORPO_MSG}                  xpath=//android.widget.TextView[@resource-id="android:id/message"]
${EXPORT_OK_MSG}                     xpath=//android.widget.Button[@resource-id="android:id/button1"]
${EXPORT_TOAST}                      xpath=//android.widget.Toast[@text="O arquivo PDF ainda não foi gerado!"]

${MENU_GRUPO}                        xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupo"]
${GRUPO_ADD}                         xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/addgrupo"]
${GRUPO_INPUT}                       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${GRUPO_SALVAR}                      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_salvar"]

*** Keywords ***
Quando acessar a funcionalidade Exportar dados
    Clica em botão e espera elemento ficar visível    ${MENU_EXPORT}    ${EXPORT_TELA}

Então será possível visualizar as opções para exportar dados
    Verifica se os elementos estão visíveis e habilitados     ${EXPORT_GERAR_DADOS}    ${EXPORT_ENVIAR1}    ${EXPORT_ENVIAR2}    ${EXPORT_ENVIAR3}    ${EXPORT_ENVIAR4}
    Element Should Contain Text    ${EXPORT_TITULO}    Exportar dados

E clicar no botão para gerar uma exportação
    Clica em botão e espera elemento ficar visível    ${EXPORT_GERAR_DADOS}    ${EXPORT_JANELA_MSG}
    Visualiza texto    ${EXPORT_TITULO_MSG}    Operação concluída!
    Visualiza texto    ${EXPORT_CORPO_MSG}    Enviar
    Clica em botão e espera elemento desaparecer    ${EXPORT_OK_MSG}    ${EXPORT_JANELA_MSG}

Então os arquivos não serão gerados
    Visualiza texto    ${EXPORT_ARQUIVO1}    O arquivo PDF ainda não foi gerado!
    Visualiza texto    ${EXPORT_ARQUIVO2}    O arquivo PDF ainda não foi gerado!
    Visualiza texto    ${EXPORT_ARQUIVO3}    O arquivo PDF ainda não foi gerado!
    Visualiza texto    ${EXPORT_ARQUIVO4}    grupos.csv

E não será possível enviar o arquivo exportado
    Clica em botão e verifica toast    ${EXPORT_ENVIAR1}    ${EXPORT_TOAST}
    Clica em botão e verifica toast    ${EXPORT_ENVIAR2}    ${EXPORT_TOAST}
    Clica em botão e verifica toast    ${EXPORT_ENVIAR3}    ${EXPORT_TOAST}

Dado que o usuário cadastrou um produto no sistema
    Cadastro de um produto

Quando acessar a seção Exportar dados
    Dado que o usuário acessou o botão Menu
    Quando acessar a funcionalidade Exportar dados

E gerar uma exportação
    Espera o elemento e faz o clique    ${EXPORT_GERAR_DADOS}

Então será possível visualizar a mensagem de sucesso
    Wait Until Element Is Visible    ${EXPORT_JANELA_MSG}
    Visualiza texto    ${EXPORT_TITULO_MSG}    Operação concluída!
    Visualiza texto    ${EXPORT_CORPO_MSG}    Enviar
    Clica em botão e espera elemento desaparecer    ${EXPORT_OK_MSG}    ${EXPORT_JANELA_MSG}

E o arquivo de exportação de produtos será gerado
    Visualiza texto    ${EXPORT_ARQUIVO1}    produtos.csv

E será possível enviar o arquivo de exportação de dados de produtos
    Espera o elemento e faz o clique    ${EXPORT_ENVIAR1}
    Wait Until Element Is Visible    ${EXPORT_SELECIONAR}
    #Element Should Contain Text    ${EXPORT_SELECIONAR}    Selecione uma aplicação.

Dado que o usuário adicionou estoque em um produto
    Cadastro de um produto
    Entrada de um produto

E o arquivo de exportação de entradas será gerado
    Visualiza texto    ${EXPORT_ARQUIVO2}    entradas.csv

E será possível enviar o arquivo de exportação de dados de entradas
    Espera o elemento e faz o clique    ${EXPORT_ENVIAR2}
    Wait Until Element Is Visible    ${EXPORT_SELECIONAR}
    #Element Should Contain Text    ${EXPORT_SELECIONAR}    Selecione uma aplicação.

Dado que o usuário diminuiu estoque em um produto
    Cadastro de um produto
    Saida de um produto

E o arquivo de exportação de saídas será gerado
    Visualiza texto    ${EXPORT_ARQUIVO3}    saidas.csv

E será possível enviar o arquivo de exportação de dados de saídas
    Espera o elemento e faz o clique    ${EXPORT_ENVIAR3}
    Wait Until Element Is Visible    ${EXPORT_SELECIONAR}
    #Element Should Contain Text    ${EXPORT_SELECIONAR}    Selecione uma aplicação.

Dado que o usuário adicionou um grupo de produtos
    Dado que o usuário acessou o Menu
    Espera o elemento e faz o clique    ${MENU_GRUPO}
    Espera o elemento e faz o clique    ${GRUPO_ADD}
    Wait Until Element Is Visible    ${GRUPO_INPUT}
    Input Text    ${GRUPO_INPUT}    Eletrônicos
    Click Element    ${GRUPO_SALVAR}
    Clica para voltar tela 2x

E o arquivo de exportação de grupos será gerado
    Visualiza texto    ${EXPORT_ARQUIVO4}    grupos.csv

E será possível enviar o arquivo de exportação de dados de grupos
    Espera o elemento e faz o clique    ${EXPORT_ENVIAR4}
    Wait Until Element Is Visible    ${EXPORT_SELECIONAR}
    #Element Should Contain Text    ${EXPORT_SELECIONAR}    Selecione uma aplicação.


#Ações de cadastro e movimentação de estoque de produto

Cadastro de um produto
    Espera o elemento e faz o clique    ${BTN_NOVO_CADASTRO}
    Input Text    br.com.pztec.estoque:id/txt_codigo    003
    Input Text    br.com.pztec.estoque:id/txt_descricao    Teclado Mecânico
    Input Text    br.com.pztec.estoque:id/txt_unidade    un
    Input Text    br.com.pztec.estoque:id/txt_quantidade    20
    Input Text    br.com.pztec.estoque:id/txt_valunit    500
    Swipe By Percent    50    40    50    05
    Input Text    br.com.pztec.estoque:id/txt_lote    001
    Click Element    ${BTN_SALVAR}

Entrada de um produto
    Espera o elemento e faz o clique    ${BTN_ENTRADA}
    Wait Until Element Is Visible    ${INPUT_ADICIONA_ESTOQUE}
    Input Text    ${INPUT_ADICIONA_ESTOQUE}    4
    Input Text    ${INPUT_MOTIVO}              Entrada no estoque
    Input Text    ${INPUT_DOC}                 123
    Espera o elemento e faz o clique    ${BTN_SALVAR2}

Saida de um produto
    Espera o elemento e faz o clique    ${BTN_SAIDA}
    Wait Until Element Is Visible    ${INPUT_SAIDA_ESTOQUE}
    Input Text    ${INPUT_SAIDA_ESTOQUE}       3
    Input Text    ${INPUT_MOTIVO}              SAÍDA DE ESTOQUE
    Input Text    ${INPUT_DOC}                 123
    Espera o elemento e faz o clique    ${BTN_SALVAR2}