*** Settings ***
Documentation    Search Skill in Skillacademy based on keyword
...     with Keyword driven approach.
Library     SeleniumLibrary


Resource          ../../locators/locatorskillacademy.robot
Resource          contentCourse.robot

*** Keywords ***
Based on available keyword
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    contentCourse.Content Course
    
    

Based on available keyword and filter price < 100.000
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    Wait Until Page Contains Element            xpath://div[contains(text(),'Harga')]
    Click Element                               xpath://div[contains(text(),'Harga')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'<100.000')]
    Click Element                               xpath://div[contains(text(),'<100.000')]
    contentCourse.Content Course

Based on available keyword and filter price < 100.000 - 149.999
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    Wait Until Page Contains Element            xpath://div[contains(text(),'Harga')]
    Click Element                               xpath://div[contains(text(),'Harga')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'100.000 - 149.999')]
    Click Element                               xpath://div[contains(text(),'100.000 - 149.999')]
    contentCourse.Content Course

Based on available keyword and filter price 150.000 - 200.000
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    Wait Until Page Contains Element            xpath://div[contains(text(),'Harga')]
    Click Element                               xpath://div[contains(text(),'Harga')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'150.000 - 200.000')]
    Click Element                               xpath://div[contains(text(),'150.000 - 200.000')]
    contentCourse.Content Course

Based on available keyword and filter price > 200.000
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    Wait Until Page Contains Element            xpath://div[contains(text(),'Harga')]
    Click Element                               xpath://div[contains(text(),'Harga')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'>200.000')]
    Click Element                               xpath://div[contains(text(),'>200.000')]
    contentCourse.Content Course

Based on available keyword and filter price < 100.000 and duration 1 jam
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    Wait Until Page Contains Element            xpath://div[contains(text(),'Harga')]
    Click Element                               xpath://div[contains(text(),'Harga')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'<100.000')]
    Click Element                               xpath://div[contains(text(),'<100.000')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'Durasi')]
    Click Element                               xpath://div[contains(text(),'Durasi')]
    Wait Until Page Contains Element            xpath://div[contains(text(),'<1 jam')]
    Click Element                               xpath://div[contains(text(),'<1 jam')]
    contentCourse.Content Course

    
