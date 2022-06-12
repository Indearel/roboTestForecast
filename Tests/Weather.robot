*** Settings ***
Documentation     A test suite for current weather.
Library           SeleniumLibrary

*** Variables ***
${CITY_INPUT_FIELD}   css:#login_id > div.eHead_search > form > input[type=text]:nth-child(3)
${SEARCH}             css:#login_id > div.eHead_search > form > input.aa
${TEMPERATURE}        css:#body > div.eZent_300 > div.eAll_sky > div.eAll_border > div > div.cont > div.c2_r > div.zentrier > div:nth-child(4) > table > tbody > tr:nth-child(3) > td:nth-child(2) > b > span

*** Keywords ***
Prepare Env
    Set Screenshot Directory        Screenshots
Start Test
    Open Browser    https://www.woeurope.eu/Europe.htm      chrome
Wait
    Set Browser Implicit Wait    5
Current Temperature
    Log  The current temperature is str(${TEMPERATURE}) Celcius degree.
End Test
    Close browser


*** Test Cases ***
Opening and checking current weather on the webpage
    Prepare Env
    Start Test
    Input text      ${CITY_INPUT_FIELD}             Warsaw
    Click Element   ${SEARCH}
    Wait
    #Current Temperature
    Capture Page Screenshot  WarsawWeather.png
    End Test

