*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Cenário 1: Consultando basico
    ${response}=  GET  https://restful-booker.herokuapp.com/booking
    Log  ${response.text}
    Should Be True  ${response.ok}
    Should Be Equal As Strings  ${response.status_code}  200