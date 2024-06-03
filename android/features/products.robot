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

Validar funcionalidade de deletar produto
    Dado que o usuário está na tela inicial
    Quando acessar a funcionlidade de deletar um produto
    E confirmar exclusão
    Então o produto será excluído do estoque

Validar funcionalidade de deletar produto
    Dado que o usuário está na tela inicial
    Quando acessar a funcionlidade de deletar um produto
    E não confirmar exclusão
    Então o produto será ainda estará visível na página do estoque 

Validar funcionalidade de edição de produto já cadastrado
    Dado que o usuário está na tela inicial
    Quando acessar a funcionalidade de edição de cadastro
    E inserir novas informaçoes nos campos desejados
    E confirmar operação
    Então o produto terá seu cadastro atualizado

Não deve ser possível deixar campos em branco ao cadastrar novo produto
    Dado que o usuário está na tela inicial
    Quando não insere informações nos campos indicados
    E confirmar operação
    Então será possível visualizar alerta nos campos obrigatórios

 

    


