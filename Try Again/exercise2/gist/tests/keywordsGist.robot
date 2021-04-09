*** Settings ***
Library     Selenium2Library
Variables   ../tests/data/env.py

*** Keywords ***
Open Gist
    Open Browser    ${GIST}    CHROME        FIREFOX
    Maximize Browser Window
    Set Selenium Speed    1
    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div[5]/a[1]
    Click element                           xpath=/html/body/div[1]/div/div[5]/a[1]
    Wait Until Element Is Visible           id=login_field
    Input Text                              id=login_field              tamanbungamami@gmail.com 
    Input Text                              id=password                 fr13nd52021
    Click Element                           class=btn
    Wait Until Element Is Visible           id=user-links
    Wait Until Element Is Visible           class=p-nickname
    ${getText}      Get Text                class=p-nickname
    log to console      ${getText}

User add new public gist
    Wait Until Element Is Visible           class=Header-link
    Click element                           class=Header-link
    Wait Until Element Is Visible           xpath=//*[@id="gists"]/input
    Input Text                              xpath=//*[@id="gists"]/input        Gist Auto Description
    Input Text                              xpath=//*[@id="gists"]/div[2]/div/div[1]/div[1]/input[2]        Fill Filename
    Click element                           xpath=//*[@id="gists"]/div[2]/div/div[2]/div/div/div[5]/div[1]/div/div/div/div[5]/div/pre
    Input Text                              xpath=//*[@id="gists"]/div[2]/div/div[2]/div/div/div[5]/div[1]/div/div/div/div[5]/div/pre           Fill your content
    Click element                           xpath=//*[@id="new_gist"]/div/div[2]/div/details
    Wait Until Element Is Visible           xpath=//*[@id="new_gist"]/div/div[2]/div/details/details-menu/label[2]
    Click element                           xpath=//*[@id="new_gist"]/div/div[2]/div/details/details-menu/label[2]
    Element should contain                  xpath=//*[@id="new_gist"]/div/div[2]/div/button        Create public gist
    Click element                           xpath=//*[@id="new_gist"]/div/div[2]/div/button
    
                
Displayed gist added
    Wait Until Element Is Visible           xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/div/div/div[2]/h1/strong
    Element should contain                  xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/div/div/div[2]/h1/strong         Fill Filename

User edit an existing gist
    Wait Until Element Is Visible           id=user-links
    Click element                           id=user-links
    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div[6]/details/details-menu/a[1]
    Click element                           xpath=/html/body/div[1]/div/div[6]/details/details-menu/a[1]
    Wait Until Element Is Visible           xpath=/html/body/div[4]/div/main/div/div/div[2]/div[2]/div[1]/div/div[2]/span[1]/a[2]/strong
    Click Element                           xpath=/html/body/div[4]/div/main/div/div/div[2]/div[2]/div[1]/div/div[2]/span[1]/a[2]/strong
    Wait Until Element Is Visible           xpath=/html/body/div[4]/div/main/div[1]/div/div[1]/ul/li[1]/a
    Click Element                           xpath=/html/body/div[4]/div/main/div[1]/div/div[1]/ul/li[1]/a
    Wait Until Element Is Visible           xpath=//*[@id="gists"]/input
    Input Text                              xpath=//*[@id="gists"]/input        Edit Auto Description
    Input Text                              xpath=//*[@id="gists"]/div[2]/div/div[1]/div[1]/input[2]        Edit Filename
    Input Text                              xpath=//*[@id="gists"]/div[2]/div[2]/div[2]/div/div/div[5]/div[1]/div/div/div/div[5]/div/pre/span           Edit
    Click element                           xpath=/html/body/div[4]/div/main/div[2]/div/form/div/div[2]/button

Displayed gist updated
    Wait Until Element Is Visible           xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/div/div/div[2]/h1/strong
    Element should contain                  xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/div/div/div[2]/h1/strong         Edit Filename

User delete an existing gist
    Wait Until Element Is Visible           id=user-links
    Click element                           id=user-links
    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div[6]/details/details-menu/a[1]
    Click element                           xpath=/html/body/div[1]/div/div[6]/details/details-menu/a[1]
    Wait Until Element Is Visible           xpath=//*[@id="gist-pjax-container"]/div/div/div[2]/div[1]/nav/div[1]/a/span
    ${getText}      Get Text                xpath=//*[@id="gist-pjax-container"]/div/div/div[2]/div[1]/nav/div[1]/a/span
    ${intText}      Convert to Integer      ${getText}
    Set Global Variable     ${intText}
    Wait Until Element Is Visible           xpath=/html/body/div[4]/div/main/div/div/div[2]/div[2]/div[1]/div/div[2]/span[1]/a[2]/strong
    Click Element                           xpath=/html/body/div[4]/div/main/div/div/div[2]/div[2]/div[1]/div/div[2]/span[1]/a[2]/strong
    Wait Until Element Is Visible           xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/ul/li[2]/form/button   
    Click Element                           xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/ul/li[2]/form/button
    Handle Alert                            ACCEPT
    Wait Until Element Is Visible           xpath=//*[@id="js-flash-container"]/div
    Element should contain                  xpath=//*[@id="js-flash-container"]/div        Gist deleted successfully.

Displayed list gist 
    Wait Until Element Is Visible           xpath=/html/body/div[4]/div/main/div/div/div[2]/div[2]/div[1]/div/div[2]/span[1]/a[2]/strong
    Wait Until Element Is Visible           xpath=//*[@id="gist-pjax-container"]/div/div/div[2]/div[1]/nav/div[1]/a/span
    ${getText2}      Get Text               xpath=//*[@id="gist-pjax-container"]/div/div/div[2]/div[1]/nav/div[1]/a/span
    ${intText2}      Convert to Integer      ${getText2}
    ${totalGist}=     Evaluate    ${intText}-1
    Should Be Equal     ${totalGist}   ${intText2}

User click see all of your gists
    Wait Until Element Is Visible           id=user-links
    Click element                           id=user-links
    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div[6]/details/details-menu/a[1]
    Click element                           xpath=/html/body/div[1]/div/div[6]/details/details-menu/a[1]

Displayed list all gist
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   class=gist-snippet
    Run Keyword If    ${present}    Data Gist Found
    ...     ELSE    Log to console      Maaf, data tidak ditemukan

Data Gist Found
    Wait Until Element Is Visible               class=gist-snippet
    ${getAllGist}=      get element count       class=gist-snippet
    ${getTextGist}      Get Text                xpath=//*[@id="gist-pjax-container"]/div/div/div[2]/div[1]/nav/div[1]/a/span
    ${intListGist}      Convert to Integer      ${getAllGist}
    Should Be Equal     ${getAllGist}   ${intListGist}
