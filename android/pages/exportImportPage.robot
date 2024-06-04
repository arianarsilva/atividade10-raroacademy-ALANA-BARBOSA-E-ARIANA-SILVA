*** Settings ***

Resource    ../base.robot

*** Variables ***
${MENU_EXPORT}                       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_exportar"]
${EXPORT_TELA}                       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${EXPORT_TITULO}                     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${EXPORT_AD}                         xpath=//android.webkit.WebView
${EXPORT_FORMATO}                xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]
${EXPORT_DADOS}                xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]


*** Keywords ***