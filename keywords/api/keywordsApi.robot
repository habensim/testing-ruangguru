*** Settings ***
DOCUMENTATION         Search Based on keyword available
...                   tests cases to API "https://skillacademy.com/api/skillacademy/discovery/search".
Library               RequestsLibrary                                   WITH NAME        request


Resource          ../../locators/locatorskillacademy.robot

*** Keywords ***
Based on available 
    request.Create Session     skillacademy      ${url_skillacademy}        verify=true
    ${response}=    request.Get Request              skillacademy                         api/skillacademy/discovery/search?keyword=${skillavailableapi}

    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     200
    
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${skillavailableapi}

Based on keyword page pageSize 
    request.Create Session     skillacademy      ${url_skillacademy}        verify=true
    ${response}=    request.Get Request              skillacademy                         api/skillacademy/discovery/search?keyword=${skillavailableapi}&page=${page}&pageSize=${pageSize}

    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     200

    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${skillavailableapi}
    
    ${json}=  set variable  ${response.json()}

    should be equal as strings  ${json['data']['page']}  ${page}
    should be equal as strings  ${json['data']['pageSize']}  ${pageSize}
    should be equal as strings  ${json['status']}  ${success}
    should be equal as strings  ${json['message']}  ${success}

Based on keyword price duration rating 
    request.Create Session     skillacademy      ${url_skillacademy}        verify=true
    
    ${response}=    request.Get Request              skillacademy                         api/skillacademy/discovery/search?page=${page}&pageSize=${pageSize}&minPrice=${minPrice}&maxPrice=${maxPrice}&minDuration=${minDuration}&maxDuration=${maxDuration}&sortBy=${harga}&orderBy=${harga}

    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     200

    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${skillavailableapi}

    should be equal as strings  ${json['data']['page']}  ${page}
    should be equal as strings  ${json['data']['sortBy']}  ${sortByHighest}
    should be equal as strings  ${json['data']['duration']}  ${minDuration}
    should be equal as strings  ${json['status']}  ${success}
    should be equal as strings  ${json['message']}  ${success}

    ${harga}=  convert to number  ${json['data']['data'][0]['harga']}
    ${min}=  convert to number  ${minPrice}
    ${max}=  convert to number  ${maxPrice}
    should be true  ${harga}>${min} and ${harga}<${maxPrice}

