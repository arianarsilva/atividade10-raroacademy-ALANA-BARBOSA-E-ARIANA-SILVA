*** Settings ***

Resource    ../base.robot

*** Variables ***
${MENU_RELATORIO}                      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_relatorios"]
${RELATORIO_TELA}                      xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${RELATORIO_TITULO}                    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/lbl_titulo"]
${RELATORIO_AD}                        xpath=//android.webkit.WebView
${RELATORIO_INVENTARIO}                xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/inventario"]
${RELATORIO_ENTRADAS}                  xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/relentrada"]
${RELATORIO_SAIDAS}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/relsaida"]

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