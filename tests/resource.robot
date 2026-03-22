*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Test Email Form Positive   
    [Tags]    emailForm    critical    -smoke
    [Documentation]   Test email form with valid data
    [Arguments]    ${name}    ${email}    ${phone}    ${subject}    ${message}     ${expected_output}
    Log To Console    Running Test Email Form - dataset 1
    Fill Mail Form    name=${name}    email=${email}    phone=${phone}    subject=${subject}    message=${message}
    Send Mail Form
    Verify Email    ${name}    ${subject}    ${expected_output}

Open Browser With Page
    [Documentation]   Open browser with the page
    [Arguments]    ${url}    ${browser}
    Open Browser     ${url}     ${browser}
    Maximize Browser Window


Fill Mail Form
    [Documentation]   Fill mail form on page
    [Arguments]    ${name}    ${email}    ${phone}    ${subject}    ${message}
    Wait Until Element Is Visible     id=name    timeout=5s
    Scroll Element Into View    id=description
    Input Text    id=name    ${name}
    Input Text    id=email    ${email}
    Input Text    id=phone    ${phone}
    Input Text    id=subject    ${subject}
    Input Text    id=description    ${message}

Send Mail Form
    [Documentation]   Send mail form on page
    Wait Until Element Is Visible     xpath: //*[contains(text(), "Submit")]    timeout=5s
    #Click Button    xpath: //*[contains(text(), "Submit")]       #this did not worked, but double click did
    #Click Element    xpath: //*[contains(text(), "Submit")]
    Double Click Element    xpath: //*[contains(text(), "Submit")]

Verify Email
    [Documentation]   Verify email on expected output
    [Arguments]    ${name}    ${subject}    ${expected_output}
    Wait Until Element Contains    id=contact    text=Thanks for getting in touch    timeout=20s 
    Element Text Should Be    id=contact    ${expected_output}
    
Close the Browser
    [Documentation]   Close the browser
    Close Browser

    