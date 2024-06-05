*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

1- Acessar a funcionalidade Exportar dados
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Exportar dados
    Então será possível visualizar as opções para exportar dados

2- Não deve ser possível exportar dados sem registros no sistema
    Dado que o usuário acessou o Menu
    Quando acessar a funcionalidade Exportar dados
    E clicar no botão para gerar uma exportação
    Então os arquivos não serão gerados
    E não será possível enviar o arquivo exportado

3- Deve ser possível exportar dados de Produtos com sucesso
    Dado que o usuário cadastrou um produto no sistema
    Quando acessar a seção Exportar dados
    E gerar uma exportação
    Então será possível visualizar a mensagem de sucesso
    E o arquivo de exportação de produtos será gerado
    E será possível enviar o arquivo de exportação de dados de produtos

4- Deve ser possível exportar dados de Entradas com sucesso
    Dado que o usuário adicionou estoque em um produto
    Quando acessar a seção Exportar dados
    E gerar uma exportação
    Então será possível visualizar a mensagem de sucesso
    E o arquivo de exportação de entradas será gerado
    E será possível enviar o arquivo de exportação de dados de entradas

5- Deve ser possível exportar dados de Saídas com sucesso
    Dado que o usuário diminuiu estoque em um produto
    Quando acessar a seção Exportar dados
    E gerar uma exportação
    Então será possível visualizar a mensagem de sucesso
    E o arquivo de exportação de saídas será gerado
    E será possível enviar o arquivo de exportação de dados de saídas

6- Deve ser possível exportar dados de Grupos de produtos com sucesso
    Dado que o usuário adicionou um grupo de produtos
    Quando acessar a funcionalidade Exportar dados
    E gerar uma exportação
    Então será possível visualizar a mensagem de sucesso
    E o arquivo de exportação de grupos será gerado
    E será possível enviar o arquivo de exportação de dados de grupos