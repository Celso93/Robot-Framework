*** Settings ***
Resource    ../../resources/connections/session.resource
Resource    ../../resources/routes/post_user.resource
Resource    ../../resources/routes/post_login.resource
Resource    ../../resources/routes/post_product.resource
Library    FakerLibrary

Test Setup    Create ServeRest Session

*** Test Cases ***
Scenario: Creating a product successfully
    ${email}           FakerLibrary.Email
    ${product_name}    FakerLibrary.Name

    ${response}            Create User       status=201        email=${email}    admin=true
    ${response_login}      Post Login        ${email}          Teste@12345
    ${response_product}    Create Product    ${product_name}

    Should Be Equal      ${response_product.json()['message']}    Cadastro realizado com sucesso

    Delete Product By Id    ${response_product.json()['_id']}
