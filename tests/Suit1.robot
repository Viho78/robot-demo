*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
PageOpen
    [Documentation]   Open browser with the page
    Open Browser     https://automationintesting.online/     Chrome
    Maximize Browser Window
    Sleep    5s
    Close Browser
