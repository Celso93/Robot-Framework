*** Settings ***
Library    RequestsLibrary
Resource   ../contracts/post_user.resource

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
