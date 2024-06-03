*** Settings ***

Resource    ../base.robot
Library     AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}        UiAutomator2
${ANDROID_PLATFORM_NAME}          Android
${ANDROID_APP_ACTIVITY}           .Inicio
${ANDROID_APP_PACKAGE}            br.com.pztec.estoque
${APPIUM_URL}                     http://127.0.0.1:4723


*** Keywords ***

Abrir App
    Open Application    ${APPIUM_URL}    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}    
    ...    appActivity=${ANDROID_APP_ACTIVITY}    appPackage=${ANDROID_APP_PACKAGE}        autoGrantPermissions=${true}

Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications