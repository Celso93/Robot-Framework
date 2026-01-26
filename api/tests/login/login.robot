*** Settings ***
Resource    ../../resources/connections/session.resource
Resource    ../../resources/routes/post_login.resource
Resource    ../../resources/routes/post_user.resource
Library     FakerLibrary

*** Test Cases ***
Cena de Login com Sucesso
    ${email}       FakerLibrary.Email

    Create ServeRest Session
    ${response_user}    Create User    status=201    email=${email}
    ${response_login}   Post Login     ${email}      Teste@12345

    Assert POST Login      ${response_login}    Login realizado com sucesso

