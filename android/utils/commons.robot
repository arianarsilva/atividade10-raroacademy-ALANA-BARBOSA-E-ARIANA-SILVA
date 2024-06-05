*** Settings ***

Resource    ../base.robot
Library    AppiumLibrary

*** Keywords ***

Espera o elemento e faz o clique
    [Arguments]                      ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Click Element                    ${elemento}

Clica em botão e espera elemento ficar visível
    [Arguments]    ${elemento1}    ${elemento2}
    Click Element                    ${elemento1}
    Wait Until Element Is Visible    ${elemento2}

Clica em botão e espera elemento desaparecer
    [Arguments]    ${elemento1}    ${elemento2}
    Click Element                    ${elemento1}
    Wait Until Page Does Not Contain Element    ${elemento2}

Clica em botão e verifica toast
    [Arguments]    ${elemento1}    ${elemento2}
    Click Element                    ${elemento1}
    Page Should Contain Element    ${elemento2}

Clica para voltar tela 2x
    Press Keycode    4
    Press Keycode    4

Visualiza texto
    [Arguments]                  ${elemento}           ${nome}
    Element Should Be Visible    ${elemento}
    ${text}=    AppiumLibrary.Get Element Attribute    ${elemento}    text
    Should Contain               ${text}               ${nome}

Visualiza conteudo
    [Arguments]    ${elemento}    ${nome}
    Element Should Be Visible    ${elemento}
    ${hint}=    AppiumLibrary.Get Element Attribute    ${elemento}    hint 
    Should Contain    ${hint}    ${nome}

Visualiza elemento
    [Arguments]                      ${elemento}
    Wait Until Element Is Visible    ${elemento}

Verifica se os elementos estão visíveis e habilitados
    [Arguments]    @{elementos}
    FOR    ${elemento}    IN    @{elementos}
        Element Should Be Visible    ${elemento}
        Element Should Be Enabled    ${elemento}
    END