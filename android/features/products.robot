*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***
Verificar a funcionalidade de cadastro de produto
    Dado que o usuário está na tela inicial
    Quando acessar a funcionalidade de cadastro
    E preencher todos os campos disponíveis com informações válidas
    Então será possível cadastrar um novo produto
