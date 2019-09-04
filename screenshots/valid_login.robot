*** Settings ***
Documentation     A test suite with a single test for valid login.
Library           Selenium2Library
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Set screenshot directory    screenshots/
    Input Username    rodrigo.almeida@up42.com
    Input Password    xpNZvNEACAyq6sH6Dtr9E2J*
    Submit Credentials
    Capture Page Screenshot
    [Teardown]    Close Browser
