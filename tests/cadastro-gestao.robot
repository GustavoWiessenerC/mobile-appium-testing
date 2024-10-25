*** Settings ***
Resource        ../resources/cadastro-resources.robot
Library         String 
Test Setup      Open Session
Test Teardown   Close Session

*** Variables ***
${tipo_identificacao}    Mulher
${estado}                Alagoas

*** Test Cases ***
Cadastrar pessoa válida
    [Documentation]    Realiza o cadastro de uma nova pessoa para a Gestão de Cadastros.
    ...                1. Gera um nome aleatório e e-mail baseado no nome.
    ...                2. Preenche os dados de identificação e estado.
    ...                3. Finaliza o cadastro e verifica se o sucesso foi exibido.

    # Gera um nome aleatório e um e-mail baseado no nome gerado
    ${Name} =   Generate Random String  6
    ${Email} =  Catenate    ${Name}   @test.com

    # Acessa a área de cadastro de usuários
    Click CadastrarUsuário

    # Preenche os campos de nome e e-mail
    Input Name Query        ${Name}
    Input Email Query       ${Email}

    # Seleciona a identificação e o estado especificado
    Click Identificação Query  ${tipo_identificacao}
    Click Estado Query         ${estado}

    # Finaliza o cadastro e verifica se a mensagem de sucesso está presente
    Click BotaoCadastrar
    Wait Until Page Contains    Cadastro realizado com sucesso
