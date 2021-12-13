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
${PRODUCT1}             Sauce Labs Backpack
${PRODUCT2}             Test.allTheThings() T-Shirt (Red)
${PRICE1}               $29.99
${PRICE2}               $7.99
${PRICE3}               $49.99

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

Product Should Be
    [Arguments]     ${product}
    Element Text Should Be      xpath:/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[1]/a/div  ${product}

Sort By Name A-Z
    Select From List By Value   css:*[data-test="product_sort_container"]   az

Sort By Name Z-A
    Select From List By Value   css:*[data-test="product_sort_container"]   za

Sort By Price Low to High
    Select From List By Value   css:*[data-test="product_sort_container"]   lohi

Sort By Price High TO Low
    Select From List By Value   css:*[data-test="product_sort_container"]   hilo

Product Price Should Be
    [Arguments]     ${price}
    Element Text Should Be      xpath:/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/div  ${price}