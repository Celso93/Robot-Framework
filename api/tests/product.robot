*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary
Resource    ../resources/pages/usuarios.robot

*** Variables ***
${API_URL}    http://localhost:3000

*** Test Cases ***
Scenario: Creating a product successfully

    # Creating a Session
    Create Session    serverest    ${API_URL}

    # Creating a user to associate with the product
    ${email}            FakerLibrary.Email
    ${user_response}    Create User    
    ...                 status=201    
    ...                 email=${email}
    ...                 admin=true

    # generating auth token
    ${auth_payload}    Create Dictionary
    ...                email=${email}
    ...                password=Teste@12345

    ${login_response}    POST On Session    
    ...                  serverest    
    ...                  /login    
    ...                  json=${auth_payload}

    # Creating a product associated with the user created
    ${name}       FakerLibrary.Name
    ${product}    Create Dictionary
    ...           nome=${name}
    ...           preco=${600}
    ...           descricao=Produto de teste
    ...           quantidade=${1000}
    Log    ${product}
    Log    ${login_response.json()['authorization']}

    ${meus_headers}    Create Dictionary    Authorization=${login_response.json()['authorization']}

    Sleep    2s
    ${new_product}    POST On Session
    ...               serverest
    ...               /produtos
    ...               headers=${meus_headers}
    ...               json=${product}
    ...               expected_status=201

    Should Be Equal      ${new_product.json()['message']}    Cadastro realizado com sucesso    
    
    # Deleting product created
    DELETE On Session
    ...            serverest
    ...            /produtos/${new_product.json()['_id']}
    ...            expected_status=200
    Log To Console    Product with id ${new_product.json()['_id']} deleted

    Search User By Id    ${user_response.json()['_id']}      status=200

# *** Keywords ***
# Create User
#     [Arguments]   ${status}
#     ...           ${email}

#     ${nome}    FakerLibrary.Name
#     ${user}    Create Dictionary
#     ...    nome=${nome}
#     ...    email=${email}
#     ...    password=Teste@12345
#     ...    administrador=false

#     ${new_user}    POST
#     ...            url=${API_URL}/usuarios
#     ...            json=${user}
#     ...            expected_status=${status}
#     Return From Keyword    ${new_user}

# Clear User By Id
#     [Arguments]    ${user_id}
#     DELETE    ${API_URL}/usuarios/${user_id}        
#     ...       expected_status=200
#     Log To Console    User with id ${user_id} deleted
