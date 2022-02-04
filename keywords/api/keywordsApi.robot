*** Settings ***
DOCUMENTATION         Search Based on keyword available
...                   tests cases to API "https://skillacademy.com/api/skillacademy/discovery/search".
Library               Collections                                       WITH NAME        collection
Library               RequestsLibrary                                   WITH NAME        request
Library               BuiltIn                                           WITH NAME        std
Library               OperatingSystem                                   WITH NAME        system


Resource          ../../locators/locatorskillacademy.robot

*** Keywords ***
Based on available 
    request.Create Session     skillacademy      ${url_skillacademy}        verify=true
    ${response}=    request.Get Request              skillacademy                         api/skillacademy/discovery/search?keyword=${skillavailableapi}

    #validation Status Code 200
    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     200
    
    # log to console      ${response.headers}
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    #body
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${skillavailableapi}

Based on keyword page pageSize 
    request.Create Session     skillacademy      ${url_skillacademy}        verify=true
    ${response}=    request.Get Request              skillacademy                         api/skillacademy/discovery/search?keyword=${skillavailableapi}&page=${page}&pageSize=${pageSize}

    #validation Status Code 200
    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     200

    # log to console      ${response.headers}
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    #body
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${skillavailableapi}
    
    ${json}=  set variable  ${response.json()}

    # page, pageSize, status
    should be equal as strings  ${json['data']['page']}  ${page}
    should be equal as strings  ${json['data']['pageSize']}  ${pageSize}
    should be equal as strings  ${json['status']}  ${success}
    should be equal as strings  ${json['message']}  ${success}

Based on keyword price duration rating 
    request.Create Session     skillacademy      ${url_skillacademy}        verify=true
    ${response}=    request.Get Request              skillacademy                         api/skillacademy/discovery/search?keyword=${skillavailableapi}&page=${page}&sortBy=${sortByHighest}&price=${minPrice}&duration=${minDuration}

    #validation Status Code 200
    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     200

    # log to console      ${response.headers}
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    #body
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${skillavailableapi}

    should be equal as strings  ${json['data']['page']}  ${page}
    should be equal as strings  ${json['data']['sortBy']}  ${sortByHighest}
    should be equal as strings  ${json['data']['duration']}  ${minDuration}
    should be equal as strings  ${json['status']}  ${success}
    should be equal as strings  ${json['message']}  ${success}

    ${price}=  convert to number  ${json['data']['data'][0]['price']}
    ${min}=  convert to number  ${minPrice}
