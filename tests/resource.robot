*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              chrome
${DELAY}                0.5
${STANDARD USER}        standard_user
${LOCKED OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     SecretSauce
${LOGIN URL}            https://${SERVER}/
${HOME URL}             https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element    login-button

Inventory Page Should Be Open
    Page Should Contain Image    /static/media/sauce-backpack-1200x1500.34e7aa42.jpg

Inventory Page Should Be Bugged
    Page Should Contain Image    /static/media/sl-404.168b1cce.jpg

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]    ${password}
    Input Password    password    ${password}

Submit Credentials
    Click Button    login-button
