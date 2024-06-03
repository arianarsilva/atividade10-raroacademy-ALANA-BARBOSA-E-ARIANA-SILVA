*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../utils/config.robot

*** Variables ***

${BTN_NOVO_CADASTRO}                      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${BTN_VALIDADE}                           xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${BTN_SALVAR}                             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gravar_assunto"]
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
${TXT_CADASTRO_DE_PRODUTOS}               xpath=//android.widget.TextView[@text="Cadastro de Produtos"]
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
Cadastro de vários produtos
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valUnit}    ${lote}    
    Wait Until Element Is Visible      br.com.pztec.estoque:id/Button1
    Click Element                      br.com.pztec.estoque:id/Button1
    Wait Until Element Is Visible      br.com.pztec.estoque:id/txt_descricao
    Input Text                         br.com.pztec.estoque:id/txt_codigo         ${codigo}
    Input Text                         br.com.pztec.estoque:id/txt_descricao      ${descricao}
    Input Text                         br.com.pztec.estoque:id/txt_unidade        ${unidade}
    Input Text                         br.com.pztec.estoque:id/txt_quantidade     ${quantidade}
    Input Text                         br.com.pztec.estoque:id/txt_valunit        ${valUnit}
    Input Text                         br.com.pztec.estoque:id/txt_lote           ${lote}
    Click Element                      ${BTN_SALVAR}
    Wait Until Element Is Visible      android:id/search_button
    Element Should Contain Text        //android.widget.TextView[@text='${descricao}']    ${descricao}

Dado que o usuário está na tela inicial
    # Wait Until Element Is Visible        ${TXT_CADASTRO_DE_PRODUTOS}
    # Espera o elemento e faz o clique     ${BTN_NOVO_CADASTRO}
    Cadastro de vários produtos          004    Nintendo    un    10    5000    369

Quando acessar a funcionlidade de deletar um produto

    Espera o elemento e faz o clique    ${BTN_DELETAR}

E confirmar exclusão
    Wait Until Element Is Visible        ${TXT_CONFIRMA_EXCLUSAO}
    Espera o elemento e faz o clique     ${BTN_DELETAR_SIM}

Então o produto será excluído do estoque
    Element Should Not Contain Text    ${PRODUTOS_PAGE}    Nintendo

E não confirmar exclusão
    Wait Until Element Is Visible        ${TXT_CONFIRMA_EXCLUSAO}
    Espera o elemento e faz o clique     ${BTN_DELETAR_NAO}