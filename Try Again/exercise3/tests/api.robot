*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary


*** Variable ***
${url}=                  https://run.mocky.io/v3/a5a5dc82-2a4f-4037-b6d8-0e9cae6208e7
${url_fail}=             https://run.mocky.io/v3/a5a5dc82-2a4f-4037-b6d8-0e9cae6208e1

*** Test Case ***
Success Hit
    create session      success_hit          ${url}           verify=True
    ${headers}=         create dictionary               Content-Type=application/json
    ${json_object}=     Load Json From File             ${CURDIR}/data.json
    ${resp}=            Post Request    success_hit           ${url}    data=${json_object}     headers=${headers}

    #Validation
    Should be equal as Strings      ${resp}     <Response [200]>
    log to console      ${url}

Failed Hit
    create session      failed_hit          ${url_fail}           verify=True
    ${headers}=         create dictionary               Content-Type=application/json
    ${json_object}=     Load Json From File             ${CURDIR}/data.json
    ${resp}=            Post Request    failed_hit           ${url_fail}    data=${json_object}     headers=${headers}

    #Validation
    Should be equal as Strings      ${resp}     <Response [404]>

