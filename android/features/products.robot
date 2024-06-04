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
    Dado que o usuário está na tela de cadastro
    Quando não inserir informações nos campos indicados
    E tentar confirmar operação
    Então a pagina de cadastro pemanece na tela para nova tentativa de cadastro

Deve ser possível registrar a entrada de ítens no estoque
    Dado que o usuário está na tela inicial
    Quando acessar a funcionalidade de acrescentar ítens ao estoque
    E inserir as informações necessárias
    E salvar operação
    Então será possível ver a quantidade do produto atualizada com o acréscimo

Deve ser possível registrar a saída de produtos do estoque
    Dado que o usuário está na tela inicial
    Quando acessar a funcionalidade de saída de produtos
    E inserir as informações de saída de estoque
    E salvar operação
    Então será possível ver a quantidade do produto atualizada com a saída

Deve ser possível pesquisar um produto cadastrado
    Dado que o usuário está na lista de produtos
    Quando acessar funcionalidade de pesquisa
    E inserir a a descrição do produto
    Então será possível encontrar o produto