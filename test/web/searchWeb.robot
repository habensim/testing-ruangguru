***Settings***
Documentation     Performs Testing Based On Keyword
Test Teardown     Close Browser
Resource          ../../keywords/web/keywordSearch.robot
Resource          ../../locators/locatorskillacademy.robot


*** Test Cases ***
Search web
    keywordSearch.Based on available keyword
    keywordSearch.Based on available keyword and filter price < 100.000
    keywordSearch.Based on available keyword and filter price < 100.000 - 149.999
    keywordSearch.Based on available keyword and filter price 150.000 - 200.000
    keywordSearch.Based on available keyword and filter price > 200.000
    keywordSearch.Based on available keyword and filter price < 100.000 and duration 1 jam
