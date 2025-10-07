*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
Scenario: Creating an user
    ${user}    Create Dictionary
    ...    nome=NomeQualquer33
    ...    email=TestenoiteNomequalquer33@mailinator.com
    ...    password=Teste@12345
    ...    administrador=false

    ${response}    POST   
    ...    url=https://serverest.dev/usuarios
    ...    json=${USER}
    ...    expected_status=201

    Log To Console    ${response.json()}

    Should Be Equal        ${response.json()['message']}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()['_id']}

Scenario 2: Creating a user already created