*** Settings ***
Documentation    Search Skill in Skillacademy based on keyword
...     with Keyword driven approach.
Library     SeleniumLibrary


Resource          ../../locators/locatorskillacademy.robot

*** Keywords ***
Content Course
    # get sample judul 
    Wait Until Page Contains Element        xpath://*[contains(@data-testid,"course-title")] 
    ${judul}        Get Text                xpath://*[contains(@data-testid,"course-title")] 
    log to console     Grab Sample Title ${judul}
    # Instuktur name
    Wait Until Page Contains Element        css:h2[data-testid='instructor-name']
    ${instructorname}        Get Text       css:h2[data-testid='instructor-name']
    log to console     Grab Sample instructor name ${instructorname}
    # Instuktur Description
    Wait Until Page Contains Element        css:p[data-testid='instructor-description']
    ${instructordesc}        Get Text       css:p[data-testid='instructor-description']
    log to console     Grab Sample instructor description ${instructordesc}
    # Course Description
    Wait Until Page Contains Element        xpath://*[contains(@data-testid,"course-description")] 
    ${coursedesc}        Get Text           xpath://*[contains(@data-testid,"course-description")] 
    log to console     Grab Sample course description ${coursedesc}
    # Star Rating
    Wait Until Page Contains Element        xpath://*[contains(@data-testid,"star-rating")] 
    ${starrating}        Get Text           xpath://*[contains(@data-testid,"star-rating")] 
    log to console     Star Rating ${starrating}
    # Rating text
    Wait Until Page Contains Element        css:span[data-testid='rating-text']
    ${starrating}        Get Text           css:span[data-testid='rating-text']
    log to console     Rating Text ${starrating}
    # Rating Count
    Wait Until Page Contains Element        css:span[data-testid='rating-count']
    ${ratingcount}        Get Text           css:span[data-testid='rating-count']
    log to console     Rating Count ${ratingcount}
    # Price Base
    Wait Until Page Contains Element        css:p[data-testid='price-base']
    ${pricebase}        Get Text           css:p[data-testid='price-base']
    log to console     Price Base ${pricebase}
    # get price final
    Wait Until Page Contains Element        xpath://*[contains(@data-testid,"price-final")] 
    ${pricefinal}        Get Text           xpath://*[contains(@data-testid,"price-final")] 
    log to console     Price Sample Title  ${pricefinal}
    # Button Buy
    Wait Until Page Contains Element        xpath://*[contains(@data-testid,"buy-course")] 
    ${buttonbuy}        Get Text           xpath://*[contains(@data-testid,"buy-course")] 
    log to console     Button Buy  ${buttonbuy}

    # get total artikel
    Wait Until Page Contains Element        css:span[data-testid='total-result']
    ${total}        Get Text                css:span[data-testid='total-result']
    log to console     Number of articles ${total}