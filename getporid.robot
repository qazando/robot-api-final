*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Test Cases ***
Cenário 1: Consultando as reservas cadastradas com base em um id
    ${response}=    GET    https://restful-booker.herokuapp.com/booking/1266

    # Verificando os dados da reserva
    ${firstnamevalue}=        Get From Dictionary       ${response.json()}        firstname
    Should Be Equal As Strings    ${firstnamevalue}       John

    # Verificando se o depositpaid é true
    ${depositpaid}=        Get From Dictionary       ${response.json()}        depositpaid
    Should Be True    ${depositpaid}
