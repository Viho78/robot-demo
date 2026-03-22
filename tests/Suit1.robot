*** Settings ***
Library     SeleniumLibrary
Resource    resource.robot
Test Setup    Open Browser With Page    ${URL}    ${BROWSER}
Test Teardown    Close the Browser
Test Template    Test Email Form Positive


*** Variables ***
${BROWSER}    Chrome
${URL}        https://automationintesting.online/

*** Test Cases ***

#                                      name                    email                        phone                subject                message                                     expected_output
Valid data                             John Doe                email@example.com            123-456-7890         Test Subject           Test message erwgwergwergwergwergwerg       Thanks for getting in touch John Doe!\nWe'll get back to you about\nTest Subject\nas soon as possible.
    [Tags]    emailForm    blocker    -smoke
Valid data with numbers                John Doe222             email223424@example.com      (123123) 123132      Test Subject22         Test message 123123132123123                Thanks for getting in touch John Doe222!\nWe'll get back to you about\nTest Subject22\nas soon as possible.
    [Tags]    emailForm    blocker    -smoke    
Valid data with special characters     John234 Doe#$%          email@example.com            +123123123123123     Test Subject#$^#%^     Qweqweqweqwe@#$!@#%!@#%!@%#!@%#             Thanks for getting in touch John234 Doe#$%!\nWe'll get back to you about\nTest Subject#$^#%^\nas soon as possible.
    [Tags]    emailForm    critical    
