*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot

*** Variables ***

${btnNovoCadastro}              xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${btnValidade}                  xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${btnSalvar}                    xpath=//android.widget.Button[contains(@text,"SALVAR")]

${txtCodigo}                    xpath=//android.widget.TextView[@text="Código"]
${txtDescricao}                 xpath=//android.widget.TextView[@text="Descrição"]
${txtUnidade}                   xpath=//android.widget.TextView[@text="Unidade"]
${txtQuantidade}                xpath=//android.widget.TextView[@text="Quantidade"]
${txtValUnit}                   xpath=//android.widget.TextView[@text="Val.Unit."]
${txtLote}                      xpath=//android.widget.TextView[@text="Val.Unit."]
${txtCadastroDeProdutos}        xpath=//android.widget.TextView[contains(@text,"Cadastro de Produtos")]


${inputCodigo}                  xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${inputDescricao}               xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${inputUnidade}                 xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${inputQuantidade}              xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${inputValUnit}                 xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${inputLote}                    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]

${produtosPage}                 xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/todoObjeto"]



*** Keywords ***

Dado que o usuário está na tela inicial
    Wait Until Element Is Visible    ${txtCadastroDeProdutos}

Quando acessar a funcionalidade de cadastro

    Click Element    ${btnNovoCadastro}

E preencher todos os campos disponíveis com informações válidas
    Wait Until Element Is Visible        ${inputCodigo}
    Input Text    ${inputCodigo}        001
    Input Text    ${inputDescricao}     Fone De Ouvido Gamer
    Input Text    ${inputUnidade}       05
    Input Text    ${inputQuantidade}    10
    Input Text    ${inputValUnit}       15,00
    Input Text    ${inputLote}          12345
    # Espera o elemento e faz o clique    ${btnValidade}


Então será possível cadastrar um novo produto
    Click Element    ${btnSalvar}


