*** Settings ***
Documentation     A test suite for current weather.
Library           SeleniumLibrary

*** Variables ***
${POPUP_CLOSE}      css:#qc-cmp2-ui > div.qc-cmp2-footer.qc-cmp2-footer-overlay.qc-cmp2-footer-scrolled > div > button:nth-child(1) > span
${CITY_FIELD}       css:#miastoPL
${SHOW_FORECAST}    css:#polska > form > ul > li:nth-child(3) > button > span

*** Test Cases ***
Opening and checking current weather on the webpage
    Open Browser    https://m.meteo.pl      chrome
    Click Element   ${POPUP_CLOSE}
    Input text      ${CITY_FIELD}           Warszawa
    Click Element   ${SHOW_FORECAST}
    Capture Page Screenshot  WarsawWeather.png
    Close browser

