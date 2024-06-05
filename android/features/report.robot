*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

1- Acessar a funcionalidade Relatório
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    Então será possível visualizar as opções para gerar relatórios

2- Gerar relatório de Inventário de estoque com sucesso
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    E selecionar a opção Inventário de estoque
    Então será possível gerar PDF do relatório
    E visualizar o PDF do relatório no aplicativo de escolha
    E enviar o PDF do relatório no aplicativo de escolha

3- Gerar relatório de Entradas no estoque com sucesso
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    E selecionar a opção Entradas no estoque
    E definir as datas desejadas
    Então será possível gerar PDF do relatório
    E visualizar o PDF do relatório no aplicativo de escolha
    E enviar o PDF do relatório no aplicativo de escolha

4- Não deve ser possível gerar relatório de Entradas no estoque sem definir datas
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    E selecionar a opção Entradas no estoque
    E tentar gerar relatório
    Então a mensagem "Por favor selecione um período de datas." será exibida
    E a mensagem será fechada ao clicar em OK

5- Gerar relatório de Saídas do estoque com sucesso
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    E selecionar a opção Saídas do estoque
    E definir as datas desejadas
    Então será possível gerar PDF do relatório
    E visualizar o PDF do relatório no aplicativo de escolha
    E enviar o PDF do relatório no aplicativo de escolha

6- Não deve ser possível gerar relatório de Saídas do estoque sem definir datas
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Relatório
    E selecionar a opção Saídas do estoque
    E tentar gerar relatório
    Então a mensagem "Por favor selecione um período de datas." será exibida
    E a mensagem será fechada ao clicar em OK