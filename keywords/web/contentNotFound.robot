*** Settings ***
Documentation    Search Skill in Skillacademy based on Content Not Found
...     with Keyword driven approach.
Library     SeleniumLibrary


Resource          ../../locators/locatorskillacademy.robot

*** Keywords ***
Content Course Not Found
    # Title Maaf
    Wait Until Page Contains Element        xpath://*[contains(@data-testid,"empty-card-title")] 
    ${titlenotfound}        Get Text        xpath://*[contains(@data-testid,"empty-card-title")] 
    log to console     Grab Sample Title    ${titlenotfound}
    # Use Other Keywords
    Wait Until Page Contains Element        css:p[data-testid='use-other-keyword']
    ${useotherkeyword}        Get Text       css:p[data-testid='use-other-keyword']
    log to console     Grab Use Other Keyword ${useotherkeyword}
    # Use General Term
    Wait Until Page Contains Element        css:p[data-testid='use-general-term']
    ${usegeneralterm}        Get Text       css:p[data-testid='use-general-term']
    log to console     Grab Use Other Keyword ${usegeneralterm}