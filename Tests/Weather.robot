*** Settings ***
Documentation     A test suite for the current weather.
Library           SeleniumLibrary

*** Variables ***
${AGREE_COOKIES}        css:.fc-cta-consent > .fc-button-label
${CITY_INPUT_FIELD}     css:.search-input
${SEARCH}               css:.search-icon
${TEMPERATURE_DETAILS}  css:.cur-con-weather-card__cta
${DAY_TEMPERATURE}      css:.half-day-card:nth-child(4) .temperature #TBC
${NIGHT_TEMPERATURE}    css:.half-day-card:nth-child(5) .temperature #TBC
${DAY_WEATHER_DESC}     css:.half-day-card:nth-child(4) .phrase #TBC
${NIGHT_WEATHER_DESC}   css:.half-day-card:nth-child(5) .phrase #TBC
${GRASS POLEN}          css:.index-status-text
${NEXT_DAY}             css:.pagination-button chevron-icon right
${CLOSE_AD}             css:.btn skip

*** Keywords ***
Prepare Env
    Set Selenium Speed    1.0
    Set Screenshot Directory        Screenshots
Start Test
    Open Browser    https://www.accuweather.com     chrome
Cookies Close
    Click Element  ${AGREE_COOKIES}
Wait
    Set Browser Implicit Wait    5000
Current Temperature
    Log  The current temperature is (${DAY_TEMPERATURE}) Celcius degree.
Weather Description
    Log  Today`s weather is ${DAY_WEATHER_DESC}.
End Test
    Close browser

*** Test Cases ***
Opening and checking current weather on the webpage
    Prepare Env
    Start Test
    Cookies Close
    Input text      ${CITY_INPUT_FIELD}             Varsova
    Click Element   ${SEARCH}
    Wait until element is visible    ${TEMPERATURE_DETAILS}
    Click Element   ${TEMPERATURE_DETAILS}
    Capture Page Screenshot  WarsawWeather.png
    End Test

