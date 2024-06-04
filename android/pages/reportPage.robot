*** Settings ***

Resource    ../base.robot

*** Variables ***
${MENU_RELATORIO}                       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_relatorios"]
${RELATORIO_TELA}                       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${RELATORIO_TITULO}                     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/lbl_titulo"]
${RELATORIO_AD}                         xpath=//android.webkit.WebView
${RELATORIO_INVENTARIO}                 xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/inventario"]
${RELATORIO_ENTRADAS}                   xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/relentrada"]
${RELATORIO_SAIDAS}                     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/relsaida"]

${RELATORIO_GERAR_PDF}                  xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${RELATORIO_DATA_ARQV}                  xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafile"]
${RELATORIO_VISUALIZAR}                 xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_abrir"]
${RELATORIO_ENVIAR}                     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_email"]
${RELATORIO_SELECIONAR}                 xpath=//android.widget.TextView[@resource-id="android:id/title"]
${RELATORIO_DATA_INICIAL}               xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data1"]
${RELATORIO_DATA_FINAL}                 xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data2"]

${RELATORIO_CALENDARIO}                 xpath=//android.view.View[@resource-id="android:id/month_view"]
${RELATORIO_OK_CALENDARIO}              xpath=//android.widget.Button[@resource-id="android:id/button1"]

${RELATORIO_JANELA_MSG}                 xpath=//android.widget.LinearLayout[@resource-id="android:id/parentPanel"]
${RELATORIO_TITULO_MSG}                 xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${RELATORIO_CORPO_MSG}                  xpath=//android.widget.TextView[@resource-id="android:id/message"]
${RELATORIO_OK_MSG}                     xpath=//android.widget.Button[@resource-id="android:id/button1"]

*** Keywords ***
Dado que o usuário acessou o Menu
    Espera o elemento e faz o clique    ${BTN_MENU}
    Wait Until Element Is Visible   ${MENU_RELATORIO}  

Quando acessar a funcionalidade Relatório
    Click Element    ${MENU_RELATORIO}
    Wait Until Element Is Visible    ${RELATORIO_TELA}

Então será possível visualizar as opções para gerar relatórios
    Verifica se os elementos estão visíveis e habilitados    ${RELATORIO_INVENTARIO}    ${RELATORIO_ENTRADAS}    ${RELATORIO_SAIDAS}
    Element Should Contain Text    ${RELATORIO_INVENTARIO}    INVENTÁRIO DE ESTOQUE
    Element Should Contain Text    ${RELATORIO_ENTRADAS}    ENTRADAS NO ESTOQUE
    Element Should Contain Text    ${RELATORIO_SAIDAS}    SAÍDAS DO ESTOQUE

E selecionar a opção Inventário de estoque
    Click Element    ${RELATORIO_INVENTARIO}
    Wait Until Element Is Visible    ${RELATORIO_GERAR_PDF}

Então será possível gerar PDF do relatório
    Click Element    ${RELATORIO_GERAR_PDF}
    Wait Until Element Is Visible    ${RELATORIO_DATA_ARQV}

E visualizar o PDF do relatório no aplicativo de escolha
    Click Element    ${RELATORIO_VISUALIZAR}
    Wait Until Element Is Visible    ${RELATORIO_SELECIONAR}
    Element Should Contain Text    ${RELATORIO_SELECIONAR}    Selecione uma aplicação.

E enviar o PDF do relatório no aplicativo de escolha
    Click Element    ${RELATORIO_ENVIAR}
    Wait Until Element Is Visible    ${RELATORIO_SELECIONAR}
    Element Should Contain Text    ${RELATORIO_SELECIONAR}    Selecione uma aplicação.

E selecionar a opção Entradas no estoque
    Click Element    ${RELATORIO_ENTRADAS}
    Wait Until Element Is Visible    ${RELATORIO_GERAR_PDF}

E definir as datas desejadas
    Click Element    ${RELATORIO_DATA_INICIAL}
    Wait Until Element Is Visible    ${RELATORIO_CALENDARIO}
    Click Element    ${RELATORIO_OK_CALENDARIO}

    Click Element    ${RELATORIO_DATA_FINAL}
    Wait Until Element Is Visible    ${RELATORIO_CALENDARIO}
    Click Element    ${RELATORIO_OK_CALENDARIO}

E tentar gerar relatório
    Click Element    ${RELATORIO_GERAR_PDF}

Então a mensagem "Por favor selecione um período de datas." será exibida
    Wait Until Element Is Visible    ${RELATORIO_JANELA_MSG}
    Visualiza texto    ${RELATORIO_TITULO_MSG}    Mensagem
    Visualiza texto    ${RELATORIO_CORPO_MSG}    Por favor selecione um período de datas.

E a mensagem será fechada ao clicar em OK
    Click Element    ${RELATORIO_OK_MSG}
    Wait Until Page Does Not Contain Element    ${RELATORIO_JANELA_MSG}

