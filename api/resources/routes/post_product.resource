*** Settings ***
Library    contracts
Library    RequestsLibrary

*** Keywords ***
Create Product
    [Arguments]    ${nome}

    ${product}    Contract Create Product    ${nome}


    ${new_product}    POST On Session
    ...               serverest
    ...               /produtos
    ...               json=${product}
    ...               expected_status=201
    
    RETURN       ${new_product}


Delete Product By Id
    [Arguments]    ${product_id}
    
    DELETE On Session
    ...            serverest
    ...            /produtos/${product_id}
    ...            expected_status=200

    Log To Console    Product with id ${product_id} deleted
