*** Settings ***
Library    contracts
Library    RequestsLibrary
Library    FakerLibrary

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

    IF    ${response.status_code} == ${200}
        ${header}  Create Dictionary   Authorization=${response.json()['authorization']}
    
        # Token é compartilhado dentro da sessions, não preciso passar novamente em outras chamada
        Update Session    serverest
        ...  headers=${header} 
    END

    RETURN       ${response}


Assert POST Login
    [Arguments]    ${response}    ${message}

    Should Be Equal    ${response.json()['message']}    ${message}

    IF    ${response.status_code} == ${200}
        Should Not Be Empty    ${response.json()['authorization']}
    END

