*** Settings ***

Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***

1- Deve ser possível realizar backup dos produtos cadastrados
    Dado que o usuário acessou o botão Menu
    Quando acessar a funcionalidade de backup
    E gerar um backup
    Então o sistema informará sucesso
    E será possível compartilhar backup

2- Deve ser possível realizar restore dos produtos cadastrados
    Dado que o usuário acessou o botão Menu
    Quando acessar a funcionalidade de Restore
    E clicar em selecionar arquivo
    Então o sistema irá direcionar para os arquivos do device