*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${url}                              https://trello.com
${headless_status}                  ${False}

*** Keywords ***
Open Browser
    New Browser                     headless=${headless_status}
    New Page                        ${url}
    Set Viewport Size               1512        823
    