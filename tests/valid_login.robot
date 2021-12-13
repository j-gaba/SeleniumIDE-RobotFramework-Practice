*** Settings ***
Documentation   A test suite with a series of tests for logging in and
...             product sorting
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
    # should be open in inventory page
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

Problem Login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${PROBLEM USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in bugged inventory page
    Inventory Page Should Be Bugged
    # close browser
    [Teardown]    Close Browser

Sort product name (A to Z)
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${STANDARD USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # sort by name desc first
    Sort By Name Z-A
    # first product should be test.allTheThings() t-shirt (red)
    Product Should Be   ${PRODUCT2}
    # sort by name asc
    Sort By Name A-Z
    # first product should be sauce labs backpack
    Product Should Be   ${PRODUCT1}
    # close browser
    [Teardown]    Close Browser

Sort product name (Z to A)
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${STANDARD USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # first product should be sauce labs backpack
    Product Should Be   ${PRODUCT1}
    # sort by name desc
    Sort By Name Z-A
    # first product should be test.allTheThings() t-shirt (red)
    Product Should Be   ${PRODUCT2}
    # close browser
    [Teardown]    Close Browser

Sort product price (low to high)
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${STANDARD USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # first product price should be $29.99
    Product Price Should Be     ${PRICE1}
    # sort by name asc
    Sort By Price Low to High
    # first product price should be $7.99
    Product Price Should Be     ${PRICE2}
    # close browser
    [Teardown]    Close Browser

Sort product price (high to low)
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${STANDARD USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # first product price should be $29.99
    Product Price Should Be     ${PRICE1}
    # sort by name asc
    Sort By Price High to Low
    # first product price should be $49.99
    Product Price Should Be     ${PRICE3}
    # close browser
    [Teardown]    Close Browser