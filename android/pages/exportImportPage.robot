*** Settings ***

Resource    ../base.robot

*** Variables ***
${MENU_EXPORT}                       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_exportar"]
${EXPORT_TELA}                       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${EXPORT_TITULO}                     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${EXPORT_AD}                         xpath=//android.webkit.WebView
${EXPORT_FORMATO}                    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]

${EXPORT_GERAR_DADOS}                xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${EXPORT_ARQUIVO1}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileprod"]                #text= produtos.csv
${EXPORT_ARQUIVO2}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileent"]                 #text= entradas.csv
${EXPORT_ARQUIVO3}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilesai"]                 #text= saidas.csv
${EXPORT_ARQUIVO4}                   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilegrupo"]               #text= grupos.csv

${EXPORT_ENVIAR1}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_prod"]  #ENVIAR
${EXPORT_ENVIAR2}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_ent"]
${EXPORT_ENVIAR3}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_sai"]
${EXPORT_ENVIAR4}                    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupo"]

*** Keywords ***