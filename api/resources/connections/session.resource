*** Settings ***
Library    RequestsLibrary


*** Keywords ***
Create ServeRest Session

    Create Session    
    ...    alias=serverest
    ...    url=http://localhost:3000
    ...    disable_warnings=True