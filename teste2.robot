*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem
Library           JSONLibrary

*** Variables ***
${URL}            https://restful-booker.herokuapp.com/booking

*** Test Cases ***
Create Booking With JSON
    # Lendo o arquivo JSON
    ${json_data}=    Get File    data.json

    # Enviando a solicitação POST
    ${response}=    POST    ${URL}    json=${json_data}
    Log  ${response.text}
    Should Be True  ${response.ok}
    Should Be Equal As Strings  ${response.status_code}  200