*** Settings ***
Resource        ../tests/keywordsEbay.robot

Suite Setup             Open Ebay
Suite Teardown          Close Browser

*** Test Cases ***
Access a Product via category after applying multiple filters
    Navigate to Search by category > Electronics > Cell Phones & accessories
    After the page loads, click Cell Phones & Smartphones in the left hand side navigation section.
    Now, click - More refinements (appears on the left at the end of all filters).
    Add 3 filters - screen size, Price and Item location appearing in the pop-up and click apply.
    Verify that the filter tags are applied also counting tags are applied that equals with integer result.

Access a Product via Search
    Type any search string in the search bar. For example: MacBook.
    Change the Search category. For example: Computers/Tablets & Networking and click Search.
    Verify that the page loads completely.
    Verify that the first result name matches with the search string.

