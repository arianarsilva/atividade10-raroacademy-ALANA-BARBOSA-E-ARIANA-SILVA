*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

Acessar a funcionalidade Relatórios
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    Então será possível visualizar as opções para gerar relatórios