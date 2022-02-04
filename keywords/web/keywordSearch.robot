*** Settings ***
Documentation    Search Skill in Skillacademy based on keyword
...     with Keyword driven approach.
Library     SeleniumLibrary


Resource          ../../locators/locatorskillacademy.robot

*** Keywords ***
Based on available
    open browser    ${url_skillacademy}    chrome    alias=Chrome
    maximize browser window
    input text      css:input[data-testid='search-input-field']     ${skillavailable}
    Press Keys      css:input[data-testid='search-input-field']     ENTER  
    ${URL}    Get Location
    Should Match Regexp    ${URL}           https://skillacademy.com/.*
    # get sample judul 
    ${judul}        Get Text                xpath://*[contains(@data-testid,"course-title")] 
    log to console     Grab Sample Title ${judul}
    # get total artikel
    Wait Until Page Contains Element        css:span[data-testid='total-result']
    ${total}        Get Text                css:span[data-testid='total-result']
    log to console     Number of articles ${total}
    # get price final
    ${pricefinal}        Get Text                xpath://*[contains(@data-testid,"price-final")] 
    log to console     Price Sample Title  ${pricefinal}
