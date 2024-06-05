*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../utils/config.robot

*** Variables ***

${INPUT_LOCALIZAR}                        id=android:id/search_src_text
${INPUT_CODIGO}                           id=br.com.pztec.estoque:id/txt_codigo
${INPUT_DESCRICAO}                        id=br.com.pztec.estoque:id/txt_descricao
${INPUT_UNIDADE}                          id=br.com.pztec.estoque:id/txt_unidade
${INPUT_QUANTIDADE}                       id=br.com.pztec.estoque:id/txt_quantidade
${INPUT_VAL_UNIT}                         id=br.com.pztec.estoque:id/txt_valunit
${INPUT_LOTE}                             id=br.com.pztec.estoque:id/txt_lote

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
${TXT_QUANTIDADE}                         id=br.com.pztec.estoque:id/txt_quantidade

${BTN_NOVO_CADASTRO}                      id=br.com.pztec.estoque:id/Button1
${BTN_SALVAR}                             id=br.com.pztec.estoque:id/btn_gravar_assunto
${BTN_DELETAR}                            id=br.com.pztec.estoque:id/deletar
${BTN_EDITAR}                             id=br.com.pztec.estoque:id/editar
${BTN_ENTRADA}                            id=br.com.pztec.estoque:id/entrada
${BTN_SAIDA}                              id=br.com.pztec.estoque:id/saida
${BTN_DELETAR_SIM}                        id=android:id/button1
${BTN_DELETAR_NAO}                        id=android:id/button2
${BTN_SALVAR2}                            id=br.com.pztec.estoque:id/btn_salvar
${BTN_BUSCA}                              id=android:id/search_button

${INPUT_SAIDA_ESTOQUE}                    id=br.com.pztec.estoque:id/txt_qtdsaida
${INPUT_ADICIONA_ESTOQUE}                 xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdentrada"]
${INPUT_MOTIVO}                           id=br.com.pztec.estoque:id/txt_motivo
${INPUT_DOC}                              id=br.com.pztec.estoque:id/txt_referencia
${PRODUTOS_PAGE}                          id=br.com.pztec.estoque:id/todoObjeto
${FIELD_DESCRICAO}                        id=br.com.pztec.estoque:id/txt_descricao


*** Keywords ***
Cadastro de vários produtos
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valUnit}    ${lote}    
    Wait Until Element Is Visible      ${BTN_NOVO_CADASTRO}
    Click Element                      ${BTN_NOVO_CADASTRO}
    Wait Until Element Is Visible      ${INPUT_DESCRICAO}
    Input Text                         ${INPUT_CODIGO}          ${codigo}
    Input Text                         ${INPUT_DESCRICAO}       ${descricao}
    Input Text                         ${INPUT_UNIDADE}         ${unidade}
    Input Text                         ${INPUT_QUANTIDADE}      ${quantidade}
    Input Text                         ${INPUT_VAL_UNIT}        ${valUnit}
    Input Text                         ${INPUT_LOTE}            ${lote}
    Click Element                      ${BTN_SALVAR}
    Wait Until Element Is Visible      ${BTN_BUSCA}
    Element Should Contain Text        //android.widget.TextView[@text='${descricao}']    ${descricao}

Dado que o usuário está na tela inicial
    Cadastro de vários produtos          004    Nintendo    un    10    5000    369

Quando acessar a funcionlidade de deletar um produto
    Espera o elemento e faz o clique     ${BTN_DELETAR}

E confirmar exclusão
    Wait Until Element Is Visible        ${TXT_CONFIRMA_EXCLUSAO}
    Espera o elemento e faz o clique     ${BTN_DELETAR_SIM}

Então o produto será excluído do estoque
    Element Should Not Contain Text      ${PRODUTOS_PAGE}    Nintendo

E não confirmar exclusão
    Wait Until Element Is Visible        ${TXT_CONFIRMA_EXCLUSAO}
    Espera o elemento e faz o clique     ${BTN_DELETAR_NAO}

Então o produto será ainda estará visível na página do estoque
    Wait Until Element Is Visible        ${FIELD_DESCRICAO}
    Element Should Contain Text          ${FIELD_DESCRICAO}    Nintendo

Quando acessar a funcionalidade de edição de cadastro
    Espera o elemento e faz o clique    ${BTN_EDITAR}

E inserir novas informaçoes nos campos desejados 
    Wait Until Element Is Visible      br.com.pztec.estoque:id/txt_descricao
    Clear Text                         br.com.pztec.estoque:id/txt_descricao
    Input Text                         br.com.pztec.estoque:id/txt_descricao      Headset USB Gamer

E confirmar operação
    Click Element                      ${BTN_SALVAR}
    Wait Until Element Is Visible      android:id/search_button

Então o produto terá seu cadastro atualizado
    Element Should Contain Text       ${FIELD_DESCRICAO}    Headset USB Gamer

Dado que o usuário está na tela de cadastro
    Wait Until Element Is Visible      br.com.pztec.estoque:id/Button1
    Click Element                      br.com.pztec.estoque:id/Button1

Quando não inserir informações nos campos indicados
    Wait Until Element Is Visible      br.com.pztec.estoque:id/txt_descricao
    Input Text                         br.com.pztec.estoque:id/txt_codigo         123

E tentar confirmar operação
    Click Element                      ${BTN_SALVAR}

Então a pagina de cadastro pemanece na tela para nova tentativa de cadastro
    Click Element                      ${BTN_SALVAR}
    Wait Until Element Is Visible      br.com.pztec.estoque:id/txt_descricao

Quando acessar a funcionalidade de acrescentar ítens ao estoque
    Espera o elemento e faz o clique    ${BTN_ENTRADA}

E inserir as informações necessárias
    Input Text    ${INPUT_ADICIONA_ESTOQUE}    4
    Input Text    ${INPUT_MOTIVO}              Entrada no estoque
    Input Text    ${INPUT_DOC}                 123


E salvar operação
    Espera o elemento e faz o clique    ${BTN_SALVAR2}


Então será possível ver a quantidade do produto atualizada com o acréscimo
    Wait Until Element Is Visible     ${TXT_QUANTIDADE}
    Element Attribute Should Match    ${TXT_QUANTIDADE}    text    14.0

Quando acessar a funcionalidade de saída de produtos
    Espera o elemento e faz o clique    ${BTN_SAIDA}

E inserir as informações de saída de estoque
    Wait Until Element Is Visible    ${INPUT_SAIDA_ESTOQUE}
    Input Text    ${INPUT_SAIDA_ESTOQUE}       4
    Input Text    ${INPUT_MOTIVO}              SAÍDA DE ESTOQUE
    Input Text    ${INPUT_DOC}                 123

Então será possível ver a quantidade do produto atualizada com a saída
    Wait Until Element Is Visible     ${TXT_QUANTIDADE}
    Element Attribute Should Match    ${TXT_QUANTIDADE}    text    6.0

Dado que o usuário está na lista de produtos
    Cadastro de vários produtos          004    Nintendo    un    10    5000    369
    Cadastro de vários produtos          004    Headset    un    10    5000    369
    Cadastro de vários produtos          004    Playstation 2    un    10    5000    369

Quando acessar funcionalidade de pesquisa
    Espera o elemento e faz o clique    ${BTN_BUSCA}

E inserir a a descrição do produto
    Wait Until Element Is Visible    ${INPUT_LOCALIZAR}
    Input Text                       ${INPUT_LOCALIZAR}    Headset
    Press Keycode    66

Então será possível encontrar o produto
    Wait Until Element Is Visible     ${FIELD_DESCRICAO}
    Element Should Contain Text       ${FIELD_DESCRICAO}    Headset