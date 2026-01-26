*** Settings ***
# Library    ../contracts
Library    RequestsLibrary
Library    FakerLibrary
Resource   ../contracts/post_login.resource


*** Keywords ***
Post Login
    [Arguments]    ${login_email}    
    ...            ${login_password}    
    ...            ${expected_status}=200

    ${payload}    Contract Post Login
    ...           ${login_email}
    ...           ${login_password}

    ${response}    POST On Session
    ...            serverest
    ...            /login
    ...            json=${payload}
    ...            expected_status=${expected_status}

    RETURN       ${response}

Assert POST Login
    [Arguments]    ${response}    ${message}

    Should Be Equal    ${response.json()['message']}    ${message}

    IF    ${response.status_code} == ${200}
        Should Not Be Empty    ${response.json()['authorization']}
    END