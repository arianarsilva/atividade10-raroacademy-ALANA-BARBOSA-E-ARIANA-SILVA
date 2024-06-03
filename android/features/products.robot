*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

Cadastro de vários produtos
    [Template]    Adicionar produtos
    
    FOR    ${counter}    IN RANGE     1
        Galaxy Tab S9 FE        20    3700
        Fone de ouvido gamer    20    3700
        Teclado Mecânico        15    2300
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

 

    


