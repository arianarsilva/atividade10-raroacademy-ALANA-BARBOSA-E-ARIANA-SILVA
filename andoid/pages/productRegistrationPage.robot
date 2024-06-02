*** Settings ***

Resource    ../base.robot

*** Variables ***

${btnCadastroNovo}        xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${btnVal}                   path=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${btnSalvar}                xpath=//android.widget.Button[contains(@text,"SALVAR")]

${txtCodigo}                xpath=//android.widget.TextView[@text="Código"]
${txtDescricao}             xpath=//android.widget.TextView[@text="Descrição"]
${txtUnidade}               xpath=//android.widget.TextView[@text="Unidade"]
${txtQuantidade}            xpath=//android.widget.TextView[@text="Quantidade"]
${txtValUnit}               xpath=//android.widget.TextView[@text="Val.Unit."]
${txtLote}                  xpath=//android.widget.TextView[@text="Val.Unit."]


${inputCodigo}              xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${inputDescricao}           xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${inputUnidade}             xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${inputQuantidade}          xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${inputValorUnitario}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${inputLote}                xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]



*** Keywords ***

