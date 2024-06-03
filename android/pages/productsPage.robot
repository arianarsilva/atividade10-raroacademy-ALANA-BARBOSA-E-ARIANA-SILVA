*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../utils/config.robot

*** Variables ***

${BTN_NOVO_CADASTRO}                      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${BTN_VALIDADE}                           xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${BTN_SALVAR}                             xpath=//android.widget.Button[contains(@text,"SALVAR")]
${BTN_DELETAR}                            xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/deletar"]
${BTN_EDITAR}                             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/editar"]
${BTN_ENTRADA}                            xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/entrada"]
${BTN_SAIDA}                              xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${BTN_MENU}                               xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]
${BTN_DELETAR_SIM}                        xpath=//android.widget.Button[@resource-id="android:id/button1"]
${BTN_DELETAR_NAO}                        xpath=//android.widget.Button[@resource-id="android:id/button2"]


${TXT_CONFIRMA_EXCLUSAO}                  xpath=//android.widget.TextView[contains(@text,"Confirma exclusão?")]  
${TXT_CADASTRO_CODIGO}                    xpath=//android.widget.TextView[@text="Código"]
${TXT_CADASTRO_DESCRICAO}                 xpath=//android.widget.TextView[@text="Descrição"]
${TXT_CADASTRO_UNIDADE}                   xpath=//android.widget.TextView[@text="Unidade"]
${TXT_CADASTRO_QUANTIDADE}                xpath=//android.widget.TextView[@text="Quantidade"]
${TXT_CADASTRO_VAL_UNITARIO}              xpath=//android.widget.TextView[@text="Val.Unit."]
${TXT_CADASTRO_LOTE}                      xpath=//android.widget.TextView[@text="Lote"]
${TXT_CADASTRO_DE_PRODUTOS}               xpath=//android.widget.TextView[contains(@text,"Cadastro de Produtos")]
${TXT_ID}                                 xpath=//android.widget.TextView[@text="ID"]
${TXT_CODIGO}                             xpath=//android.widget.TextView[@text="Código"]
${TXT_DESCRICAO}                          xpath=//android.widget.TextView[@text="Descrição"]


${INPUT_CODIGO}                           xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${INPUT_DESCRICAO}                        xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${INPUT_UNIDADE}                          xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${INPUT_QUANTIDADE}                       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${INPUT_VAL_UNIT}                         xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${INPUT_LOTE}                             xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]

${PRODUTOS_PAGE}                          xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/todoObjeto"]


*** Keywords ***

Dado que o usuário está na tela inicial
    Wait Until Element Is Visible    ${TXT_CADASTRO_DE_PRODUTOS}

Quando acessar a funcionalidade de cadastro
    Click Element    ${BTN_NOVO_CADASTRO}

E preencher todos os campos disponíveis com informações válidas
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valor}    ${lote}
    Wait Until Element Is Visible        ${INPUT_CODIGO}
    Input Text        ${INPUT_CODIGO}         001
    Input Text        ${INPUT_DESCRICAO}      Fone De Ouvido Gamer
    Input Text        ${INPUT_UNIDADE}        05
    Input Text        ${INPUT_QUANTIDADE}     10
    Input Text        ${INPUT_VAL_UNIT}       150,00
    Input Text        ${INPUT_LOTE}           12345

Então será possível cadastrar um novo produto
    Click Element    ${BTN_SALVAR}
    Wait Until Element Is Visible    ${TXT_CADASTRO_DE_PRODUTOS}


Cadastrar vários produtos no app
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valor}    ${lote}
    Wait Until Element Is Visible    ${BTN_NOVO_CADASTRO}
    Click Element     ${BTN_NOVO_CADASTRO}
    Wait Until Element Is Visible        ${INPUT_CODIGO}
    Input Text        ${INPUT_CODIGO}         ${codigo}
    Input Text        ${INPUT_DESCRICAO}      ${descricao}
    Input Text        ${INPUT_UNIDADE}        ${unidade}
    Input Text        ${INPUT_QUANTIDADE}     ${quantidade}
    Input Text        ${INPUT_VAL_UNIT}       ${valor}
    Input Text        ${INPUT_LOTE}           ${lote}
    Click Element     ${btnSalvar}
