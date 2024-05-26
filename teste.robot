*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL_API}  https://restful-booker.herokuapp.com/booking

*** Keywords ***
Step 1: Fazer uma request get para a url
    ${response}=   GET  https://restful-booker.herokuapp.com/booking

Step 2: Fazer uma request get para a url
    ${response}=   GET  ${URL_API}

*** Test Cases ***

Cenário 1: Fazer uma request    
    Step 1: Fazer uma request get para a url
    Step 2: Fazer uma request get para a url