*** Settings ***
Documentation     A test suite with a single test for valid login.
Library           Selenium2Library
Library  Selenium2Screenshots
Resource          resource.robot

*** Test Cases ***
Getting Started
    Open Browser To Login Page
    Input Username    %{UP42_USER}
    Input Password    %{UP42_PASSWORD}
    Submit Credentials
    Capture Page Screenshot    filename=./source/getting-started/up42-console.png
    [Teardown]    Close Browser

Workflow Page
    Open Browser To Login Page
    Input Username    %{UP42_USER}
    Input Password    %{UP42_PASSWORD}
    Submit Credentials
    Go To Workflow Page
    Capture Page Screenshot    ./source/getting-started/screenshot-first-workflow.png
    [Teardown]    Close Browser

Job Page
    Open Browser To Login Page
    Input Username    %{UP42_USER}
    Input Password    %{UP42_PASSWORD}
    Submit Credentials
    Go To Job Page
    Capture Page Screenshot    ./source/getting-started/screenshot-aoi-selector.png
    [Teardown]    Close Browser
