*** Settings ***
Library     OperatingSystem
Library     Selenium2Library
Library     String
Library     ../tests/lib/customLibrary.py
Variables   ../tests/data/env.py

*** Keywords ***
Open Ebay
    Open Browser    ${EBAY}    CHROME        FIREFOX
    Maximize Browser Window
    Set Selenium Speed    1

Navigate to Search by category > Electronics > Cell Phones & accessories
    Wait Until Element Is Visible           id=gh-shop-a
    Click Element                           id=gh-shop-a
    Wait Until Element Is Visible           xpath=//*[@id="gh-sbc"]/tbody/tr/td[1]/ul[2]/li[4]/a
    Click Element                           xpath=//*[@id="gh-sbc"]/tbody/tr/td[1]/ul[2]/li[4]/a

After the page loads, click Cell Phones & Smartphones in the left hand side navigation section.
    Wait Until Element Is Visible           xpath=//*[@id="s0-16-13_2-0-1[0]-0-0"]/ul/li[3]/a
    Click Element                           xpath=//*[@id="s0-16-13_2-0-1[0]-0-0"]/ul/li[3]/a

Now, click - More refinements (appears on the left at the end of all filters).
    Wait Until Element Is Visible           class=x-refine__main__list--more
    Scroll Element Into VIEW                class=x-refine__main__list--more
    Click Element                           class=x-refine__main__list--more

Add 3 filters - screen size, Price and Item location appearing in the pop-up and click apply.
    Wait Until Element Is Visible           xpath=//*[@id="c3-mainPanel-Screen%20Size"]
    Click Element                           xpath=//*[@id="c3-mainPanel-Screen%20Size"]
    Wait Until Element Is Visible           id=c3-subPanel-Screen%20Size_5.5%20-%205.9%20in_cbx
    Click Element                           id=c3-subPanel-Screen%20Size_5.5%20-%205.9%20in_cbx

    Click Element                           id=c3-mainPanel-price
    Wait Until Element Is Visible           xpath=//*[@id="c3-subPanel-_x-price-textrange"]/div/div[1]/div/input
    Input Text                              xpath=//*[@id="c3-subPanel-_x-price-textrange"]/div/div[1]/div/input        1000000
    Input Text                              xpath=//*[@id="c3-subPanel-_x-price-textrange"]/div/div[2]/div/input        3000000
   
    Click Element                           id=c3-mainPanel-location
    Wait Until Element Is Visible           xpath=//*[@id="c3-subPanel-location_Asia"]/label/input
    Click Element                           xpath=//*[@id="c3-subPanel-location_Asia"]/label/input

    Click Element                           xpath=//*[@id="c3-footerId"]/div[2]/button

Verify that the filter tags are applied also counting tags are applied that equals with integer result.
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//*[@id="s0-27-9-0-1[0]-0-1"]/ul/li[1]/div
    Run Keyword If    ${present}    Data Filter Found
    ...     ELSE    log to console      Data Not Found

Data Filter Found
    Wait Until Element Is Visible               class=s-item__price

    ${getAll}=      get element count           class=s-item__price
    log to console      ${getAll}

    @{result}=      Get WebElements            class=s-item__price

    FOR     ${element}      IN      @{result}
            ${text}=    Get Text    ${element}
            ${trim}=      Trim Symbols    ${text}
            ${line}=    Get Substring   ${trim}     0   7
            ${int}          Convert To Integer     ${line}

            Run Keyword If    ${int} >= 1000000 and ${int} <= 3000000   Log to console        ${line} "PASS"
            ...     ELSE    Log to console        ${line} "FAIL"
    END
    Log to console          "Data Ditemukan"

Type any search string in the search bar. For example: MacBook.
    Wait Until Element Is Visible           xpath=//*[@id="gh-la"]
    Click Element                           xpath=//*[@id="gh-la"]
    Wait Until Element Is Visible           id=gh-ac
    Input Text              id=gh-ac        macbook

Change the Search category. For example: Computers/Tablets & Networking and click Search.
    Wait Until Element Is Visible           id=gh-cat
    Click element                           id=gh-cat
    Wait Until Element Is Visible           xpath=//*[@id="gh-cat"]
    Select From List by Value               xpath=//*[@id="gh-cat"]    58058
    Wait Until Element Is Visible           id=gh-btn
    Click Element                           id=gh-btn

Verify that the page loads completely.
    Wait Until Element Is Visible           xpath=//*[@id="srp-river-results"]/ul

Verify that the first result name matches with the search string.
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//*[@id="srp-river-results"]/ul/li[1]/div/div[2]/a/h3
    Run Keyword If    ${present}    Data Found Macbook
    ...     ELSE    log to console      Data Not Found

Data Found Macbook
    Wait Until Element Is Visible           class=s-item__title

    @{result}=      Get WebElements            class=s-item__title

    FOR     ${element}      IN      @{result}
            ${text}=    Get Text    ${element}
            ${lower}        Convert to lowercase    ${text}
            log to console     ${lower}

            ${presentMac}=  Run Keyword And Return Status      Should Contain    ${lower}    macbook
            Run Keyword If    ${presentMac}    Log to console      Yes, macbook
            ...     ELSE    log to console      No, macbook
    END
    Log to console          "Data Ditemukan"

