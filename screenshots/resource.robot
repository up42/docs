** Settings ***
Documentation     A resource file with keywords and variables.
Library           Selenium2Library

*** Variables ***
${SERVER}         console.up42.com
${BROWSER}        headlesschrome
${DELAY}          2
${USER}           rodrigo.almeida@up42.com
${VALID USER}     rodrigo.almeida@up42.com
${VALID PASSWORD}  xpNZvNEACAyq6sH6Dtr9E2J*
${LOGIN URL}      https://${SERVER}/sign-in
${PROJECTS URL}   https://${SERVER}/projects/42879c8a-59a5-44f0-997a-cb317ec8b499
${RESULTS}   screenshots/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Window Size    1024    768
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
    Click button    class:upButton_1ISuKq9p

Dismiss Cookies
    Click element    xpath=/html/body/div[1]/div

Projects Page Should Be Open
    Location Should Be    ${PROJECTS URL}
    Title Should Be    Dashboard · Demo Project · UP42

Set Screenshot Directory ${RESULTS}
