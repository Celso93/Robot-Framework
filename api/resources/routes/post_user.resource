*** Settings ***
Library    RequestsLibrary
Library    contracts

*** Keywords ***
Create User
    [Arguments]   ${status}
    ...           ${email}
    ...           ${admin}=false

    ${body}    Contract Create User
    ...        ${email}
    ...        ${admin}

    ${response}    POST On Session
    ...            serverest
    ...            /usuarios
    ...            json=${body}
    ...            expected_status=${status}

    RETURN   ${response}

Search User By Id
    [Arguments]    ${user_id}    
    ...            ${status}=200
    ${response}    GET On Session
    ...            serverest
    ...            /usuarios/${user_id}
    ...            expected_status=${status}
    Return From Keyword    ${response}


Clear User By Id
    [Arguments]    ${user_id}
    DELETE On Session
    ...            serverest
    ...            /usuarios/${user_id}
    ...            expected_status=200

    Log To Console    User with id ${user_id} deleted
