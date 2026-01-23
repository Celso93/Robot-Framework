*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Resource    ../resources/pages/usuarios.resource

Test Setup    Create Session    serverest    http://localhost:3000

*** Test Cases ***
Scenario: Creating an user successfully
    ${email}       FakerLibrary.Email
    ${response}    Create User    status=201    email=${email}

    Should Be Equal        ${response.json()['message']}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()['_id']}
    Clear User By Id       ${response.json()['_id']}

Scenario: Creating an user with existing email
    ${email}                   FakerLibrary.Email
    ${response_new_user}    Create User    status=201    email=${email}
    ${response_same_user}   Create User    status=400    email=${email}

    Should Be Equal     ${response_same_user.json()['message']}    Este email já está sendo usado
    Clear User By Id    ${response_new_user.json()['_id']}

Scenario: Searching for a user by id
    ${email}                FakerLibrary.Email
    ${response_new_user}    Create User    status=201    email=${email}
    ${user_response}        Search User By Id    ${response_new_user.json()['_id']}    status=200

    Should Be Equal     ${user_response.json()['_id']}    ${response_new_user.json()['_id']}
    Should Be Equal     ${email}    ${user_response.json()['email']}
    Clear User By Id    ${response_new_user.json()['_id']}
