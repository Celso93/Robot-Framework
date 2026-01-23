*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${API_URL}    http://localhost:3000

*** Keywords ***
Create User
    [Arguments]   ${status}
    ...           ${email}
    ...           ${admin}=false

    ${user}    Create Dictionary
    ...        nome=Teste
    ...        email=${email}
    ...        password=Teste@12345
    ...        administrador=${admin}

    ${new_user}    POST On Session
    ...            serverest
    ...            url=${API_URL}/usuarios
    ...            json=${user}
    ...            expected_status=${status}
    Return From Keyword    ${new_user}

Clear User By Id
    [Arguments]    ${user_id}
    DELETE On Session
    ...            serverest
    ...            ${API_URL}/usuarios/${user_id}
    ...            expected_status=200
    Log To Console    User with id ${user_id} deleted

Search User By Id
    [Arguments]    ${user_id}    
    ...            ${status}=200
    ${response}    GET On Session
    ...            serverest
    ...            ${API_URL}/usuarios/${user_id}
    ...            expected_status=${status}
    Return From Keyword    ${response}
