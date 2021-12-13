*** Settings ***
Documentation   A test suite with a single test for valid login
...
...             This test follows the example using keywords from
...             the SeleniumLibrary
Resource         resource.robot

*** Test Cases ***
Valid login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${STANDARD USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Inventory Page Should Be Open
    # close browser
    [Teardown]    Close Browser

Locked Out Login
    Open Browser To Login Page
    # input username
    Input Username    ${LOCKED OUT USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # Error message is "Epic sadface: Sorry, this user has been locked out."
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser

Wrong Password Login
    Open Browser To Login Page
    # input username
    Input Username    ${STANDARD USER}
    # input password
    Input Pass    ${INVALID PASSWORD}
    # click login button
    Submit Credentials
    # Error message is "Epic sadface: Username and password do not match any user in this service"
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser

Problem login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${PROBLEM USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Inventory Page Should Be Bugged
    # close browser
    [Teardown]    Close Browser