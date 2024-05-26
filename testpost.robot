*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://restful-booker.herokuapp.com   # Substitua pelo URL correto da API

*** Test Cases ***
Cadastrando Uma Reserva
    # Configurando dados da requisição
    ${data}=    Create Dictionary    firstname=herbertao    lastname=qazando    totalprice=222    depositpaid=True
    ...    bookingdates=${EMPTY}
    ${bookingdates}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    Set To Dictionary    ${data}    bookingdates=${bookingdates}
    Set To Dictionary    ${data}    additionalneeds=Breakfast

    # Enviando a solicitação POST
    ${response}=    POST        https://restful-booker.herokuapp.com/booking    json=${data}
    Log  ${response.text}
    Should Be True  ${response.ok}
    Should Be Equal As Strings  ${response.status_code}  200
    Status Should Be  200
    Log Dictionary    ${response.json()}

    # Validando os valores retornados
    ${booking}=    Set Variable    ${response.json()}
    Log Dictionary    ${booking}  # Exibe o conteúdo do dicionário para identificar as chaves disponíveis

    Should Be True    ${booking['bookingid']} > 0  # Verifica se bookingid é um número positivo
    Dictionary Should Contain Key    ${booking}    booking  # Verifica se a chave 'booking' está presente
    Dictionary Should Contain Key    ${booking}    bookingid  # Verifica se a chave 'bookingid' está presente

    # Validação dos valores dentro da chave 'booking'
    ${booking_info}=    Get From Dictionary    ${booking}    booking
    Should Be Equal As Strings    ${booking_info['firstname']}    herbertao
    Should Be Equal As Strings    ${booking_info['lastname']}     qazando
    Should Be Equal As Strings    ${booking_info['totalprice']}   222
    Should Be Equal As Strings    ${booking_info['additionalneeds']}   Breakfast
