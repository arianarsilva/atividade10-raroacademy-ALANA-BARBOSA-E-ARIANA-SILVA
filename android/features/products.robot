*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

Cadastro de vários produtos
    [Template]    Cadastrar vários produtos no app
    FOR    ${counter}    IN RANGE      1
        001    Galaxy Tab S9 FE        05    10    150,00    12345
        002    Galaxy Tab S9 FE        02    05    900,00    1234
        003    Teclado Mecânico        08    10    200,00    12346
    END

