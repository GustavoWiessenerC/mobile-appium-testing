
*** Settings ***
Resource    ./credentials/credentials.robot
Library     AppiumLibrary

*** Variables ***
${BUTTON_CADASTRAR}  button_cadastrar
${TEXT_INPUT_NAME}   TextInputNome
${TEXT_INPUT_EMAIL}  TextInputEmail
${TIMEOUT}           10s

*** Keywords ***
Open Session
    [Documentation]     Abre a sessão do Appium configurada com os parâmetros especificados.
    Set Appium Timeout  ${TIMEOUT}
    Open Application    ${APP_URL}
    ...                 platformName=${PLATFORM_NAME}
    ...                 deviceName=${DEVICE_NAME}
    ...                 app=${APP_PATH}
    ...                 appPackage=${APP_PACKAGE}

Close Session
    [Documentation]     Fecha a sessão atual do Appium.
    Close Application

Click CadastrarUsuário
    [Documentation]     Clica no botão de cadastro de usuário.
    Wait Until Page Contains Element    ${BUTTON_CADASTRAR}
    Click Element                       ${BUTTON_CADASTRAR}

Input Name Query
    [Arguments]         ${query}
    [Documentation]     Insere o nome fornecido no campo de nome.
    Wait Until Page Contains Element     ${TEXT_INPUT_NAME}
    Input Text                           ${TEXT_INPUT_NAME}  ${query}

Input Email Query
    [Arguments]         ${query}
    [Documentation]     Insere o e-mail fornecido no campo de e-mail.
    Input Text                           ${TEXT_INPUT_EMAIL}  ${query}

Click Identificação Query
    [Arguments]         ${query}
    [Documentation]     Clica no texto de identificação especificado.
    Click Text                           ${query}

Click Estado Query
    [Arguments]         ${query}
    [Documentation]     Seleciona o estado especificado da lista.
    Wait Until Page Contains             Acre
    Click Text                           Acre
    Wait Until Page Contains             Alagoas
    Click Text                           ${query}

Click BotaoCadastrar
    [Documentation]     Clica no botão para finalizar o cadastro.
    Click Element                       BotaoCadastrar
