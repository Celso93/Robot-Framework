*** Keywords ***

Contract Create User
    [Arguments]   ${email}
    ...           ${admin}=false

    ${body}    Create Dictionary
    ...        nome=Teste
    ...        email=${email}
    ...        password=Teste@12345
    ...        administrador=${admin}

    RETURN    ${body}