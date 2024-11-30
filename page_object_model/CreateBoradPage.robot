*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${first_create_button_locator}             [data-testid=header-create-menu-button]
${create_board_button_locator}             text=Create board
${enter_board_title_locator}               input[type="text"]
${visibility_option_locator}               [data-testid="create-board-select-visibility"]
${public_visibility_locator}               text=Public
${submit_visibility_option_locator}        text=Yes, make board public
${second_create_button_locator}            data-testid=create-board-submit-button
${specific_boards_locator}                 css=a[href="/w/userworkspace90805637"]:has-text("Boards")

*** Keywords ***
Tap on Create Button at the Top of the Page
    Click                                   ${first_create_button_locator}

Tap on Create Board Button
    Click                                   ${create_board_button_locator}

Fill in the Board Title
    [Arguments]                             ${board_title_value}
    Fill Text                               ${enter_board_title_locator}    ${board_title_value}

Tap on Visibility Options
    Click                                   ${visibility_option_locator}

Select a Visibility Option
    [Arguments]                             ${visibility_locator}
    Click                                   ${visibility_locator}

Confirm Public Visibility Option
    Click                                   ${submit_visibility_option_locator}

Tap on Create Button
    Click                                   ${second_create_button_locator}
    
Tap on Boards Button in the Boards Page
    Click                                   ${specific_boards_locator}
