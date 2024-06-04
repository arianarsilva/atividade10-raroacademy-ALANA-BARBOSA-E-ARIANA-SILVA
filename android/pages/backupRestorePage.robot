*** Settings ***

Resource    ../base.robot

*** Variables ***
${BTN_MENU}                    id=br.com.pztec.estoque:id/Button3
${BTN_BACKUP}                  id=br.com.pztec.estoque:id/btn_backup
${BTN_RESTORE}                 xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_restore"]
${BTN_BACKUP_GERAR}            id=br.com.pztec.estoque:id/btn_gerar
${BTN_BACKUP_OK}               id=android:id/button1
${BTN_ENVIAR}                  id=br.com.pztec.estoque:id/btn_send
${BTN_RESTORE_PROCURAR}        id=br.com.pztec.estoque:id/btn_procurar

${TXT_BACKUP_DATA_FILE}        id=br.com.pztec.estoque:id/datafile
${TXT_BACKUP_SUCESSO}          id=android:id/alertTitle
${TXT_ENVIAR}                  id=android:id/message
${TXT_INFO}                    id=br.com.pztec.estoque:id/textView4
${TXT_RESTORE_FILE}            id=android:id/alertTitle
${TXT_RESTAURAR}               id=br.com.pztec.estoque:id/textView3

${PASTA_RESTORE}               xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${ARQUIVO_RESTORE}             xpath=//android.widget.TextView[contains(@text,'APP')][last()]

*** Keywords ***
Dado que o usuário acessou o botão Menu
    Espera o elemento e faz o clique           ${BTN_MENU}

Quando acessar a funcionalidade de backup
    Espera o elemento e faz o clique        ${BTN_BACKUP}

E gerar um backup
    Espera o elemento e faz o clique    ${BTN_BACKUP_GERAR}

Então o sistema informará sucesso
    Wait Until Element Is Visible    ${TXT_BACKUP_SUCESSO}
    Visualiza texto    ${TXT_ENVIAR}    Enviar
    Espera o elemento e faz o clique    ${BTN_BACKUP_OK}
    Wait Until Element Is Visible       ${TXT_BACKUP_DATA_FILE}

E será possível compartilhar backup
    Espera o elemento e faz o clique    ${BTN_ENVIAR}

Quando acessar a funcionalidade de Restore
    Espera o elemento e faz o clique    ${BTN_RESTORE}
    Wait Until Element Is Visible    ${TXT_RESTAURAR}
    Visualiza texto    ${TXT_RESTAURAR}    Restaurar backup
    
E clicar em selecionar arquivo
    Espera o elemento e faz o clique    ${BTN_RESTORE_PROCURAR}

Então o sistema irá direcionar para os arquivos do device
    Wait Until Element Is Visible        ${TXT_RESTORE_FILE}
    Espera o elemento e faz o clique     ${PASTA_RESTORE}
    Wait Until Element Is Visible        ${ARQUIVO_RESTORE}
    