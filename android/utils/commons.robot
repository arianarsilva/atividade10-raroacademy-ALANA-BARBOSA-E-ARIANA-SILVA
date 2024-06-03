*** Settings ***

Resource    ../base.robot
Library    AppiumLibrary

*** Keywords ***

Espera o elemento e faz o clique
    [Arguments]                      ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Click Element                    ${elemento}

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


