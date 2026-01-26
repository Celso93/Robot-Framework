*** Settings ***
Library    RequestsLibrary
Variables  env.yaml

*** Variables ***
${ENV}    local

*** Keywords ***
Create ServeRest Session

    Create Session    
    ...    alias=serverest
    ...    url=${serve_rest.${ENV}.url}
    ...    disable_warnings=True