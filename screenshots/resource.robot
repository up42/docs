** Settings ***
Documentation     A resource file with keywords and variables.
Library           Selenium2Library
Library  Selenium2Screenshots

*** Variables ***
${SERVER}         console.up42.com
${BROWSER}        headlesschrome
${DELAY}          2
${LOGIN URL}      https://${SERVER}/sign-in
${PROJECTS URL}   https://${SERVER}/projects
${RESULTS}   screenshots/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Window Size    1600    1200
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Dismiss Cookies
    Login Page Should Be

Login Page Should Be
    Title Should Be    Sign In · UP42

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click element    xpath://*[@id="content"]/div/div[3]/div/div/div/div/div/section/div/form/div[4]/button

Dismiss Cookies
    Click element    xpath://*[@id="onetrust-accept-btn-handler"]

Projects Page Should Be Open
    Location Should Be    ${PROJECTS URL}
    Title Should Be    Dashboard · Demo Project · UP42

Set Screenshot Directory ${RESULTS}

Go To Workflow Page
    Go To    ${PROJECTS URL}/b45630bf-c6e1-4713-8f33-eeadaa536c44/workflows/a8f353a1-1bf4-43a3-a533-682355c3a3c2

Go To Job Page
    Go To    ${PROJECTS URL}/b45630bf-c6e1-4713-8f33-eeadaa536c44/workflows/a8f353a1-1bf4-43a3-a533-682355c3a3c2/configure-job?workspace=f82f589f-337c-482e-aff9-a8915d7393fa
    Sleep   5s
