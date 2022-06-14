*** Settings ***
Documentation     A test suite for current weather.
Library           SeleniumLibrary

*** Variables ***
${AGREE_COOKIES}      css:.fc-cta-consent > .fc-button-label
${CITY_INPUT_FIELD}   css:.search-input
${SEARCH}             css:.search-icon
${TEMPERATURE}        css:.forecast-container:nth-child(3) .temp
${WEATHER_DESC}       css:#body > div > div.two-column-page-content > div.page-column-1 > div.content-module > div:nth-child(5) > a > div.card-content > div.phrase

*** Keywords ***
Prepare Env
    Set Selenium Speed    0.5
    Set Screenshot Directory        Screenshots
Start Test
    Open Browser    https://www.accuweather.com     chrome
Cookies Close
    Click Element  ${AGREE_COOKIES}
Wait
    Set Browser Implicit Wait    5000
Current Temperature
    Log  The current temperature is (${TEMPERATURE}) Celcius degree.
Weather Description
    Log  Today`s weather is ${WEATHER_DESC}.
End Test
    Close browser


*** Test Cases ***
Opening and checking current weather on the webpage
    Prepare Env
    Start Test
    Cookies Close
    Input text      ${CITY_INPUT_FIELD}             Varsova
    Click Element   ${SEARCH}
    Click Element   ${TEMPERATURE}
    Capture Page Screenshot  WarsawWeather.png
    End Test

