*** Settings ***
Documentation     A test suite for the current weather.
Library           SeleniumLibrary

*** Variables ***
${AGREE_COOKIES}        css:.fc-cta-consent > .fc-button-label
${CITY_INPUT_FIELD}     css:.search-input
${SEARCH}               css:.search-icon
${TEMPERATURE_DETAILS}  css:.cur-con-weather-card__cta
${DAY_TEMPERATURE}      css:#body > div > div.two-column-page-content > div.page-column-1 > div.content-module > a.cur-con-weather-card.card-module.non-ad.content-module.lbar-panel > div.cur-con-weather-card__body > div:nth-child(1) > div > div
${NIGHT_TEMPERATURE}    css:#body > div > div.two-column-page-content > div.page-column-1 > div.content-module > div:nth-child(5) > a:nth-child(1) > div.card-content > div.forecast-container > div
${DAY_WEATHER_DESC}     css:.half-day-card:nth-child(4) .phrase #TBC
${NIGHT_WEATHER_DESC}   css:.half-day-card:nth-child(5) .phrase #TBC
${GRASS POLEN}          css:#body > div > div.two-column-page-content > div.page-column-1 > div.content-module > div.lifestyle-index-list.content-module.non-ad.is-widget > div.lifestyle-index-list__cards.has-next > div.index-list-cards-container > a:nth-child(1) > div.index-status-text
${NEXT_DAY}             css:.pagination-button chevron-icon right
${CLOSE_AD}             css:.btn skip

*** Keywords ***
Prepare Env
    Set Selenium Speed    1.2
    Set Screenshot Directory        Screenshots
Start Test
    Log   Test begins.
    Open Browser    https://www.accuweather.com     chrome
Cookies Close
    Click Element  ${AGREE_COOKIES}
Wait
    Set Browser Implicit Wait    5000
Current Temperature
    Log  The current temperature is (${DAY_TEMPERATURE}) Celcius degree.
Weather Description
    Log  Today`s weather is ${DAY_WEATHER_DESC}.
Allergy info
    Print   (Today´s polen level is ${GRASS POLEN})
Max Window size
    Maximize Browser Window
End Test
    Log     Test ends.
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
    Max Window size
    Capture Page Screenshot  WarsawWeather.png
    End Test

