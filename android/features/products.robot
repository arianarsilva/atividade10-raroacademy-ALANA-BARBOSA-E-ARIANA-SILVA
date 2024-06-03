*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

Cadastro de vários produtos
    [Template]    Cadastro de vários produtos
    FOR    ${counter}    IN RANGE     1
        001    Galaxy Tab S9 FE           un        20     5000    258
        002    Fone de ouvido gamer       un        20     200     258
        003    Teclado Mecânico           un        20     5000    258
    END

Validar funcionalidade de deletar produto
    Dado que o usuário está na tela inicial
    Quando acessar a funcionlidade de deletar um produto
    E confirmar exclusão
    Então o produto será excluído do estoque

Validar funcionalidade de não deletar produto
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

 

    


