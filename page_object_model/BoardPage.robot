*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${add_another_list_locator}             [data-testid="list-composer-button"]
${add_list_locator}                     [placeholder="Enter list name…"]
${confirm_add_list_locator}             text=Add list
${list_name}                            list_number
${add_board_from_plus_sign_locator}     [aria-label="Add board"]
${add_a_card_locator}                   [data-testid="list-add-card-button"] >> nth=0
${enter_a_title_locator}                [class="qJv26NWQGVKzI9"]
${enter_text}                           mobina
${add_card_button_locator}              text=Add card
${board_locator_in_list}                [class="cZx7p8hAQGLEz5 l7ix_KdG4LuugK"] >> nth=0
${board_action_menu_locator}            button[aria-label="Board actions menu"] >> nth=0
${first_close_board_locator}            text=Close board
${second_close_board_locator}           [title="Close"]
${list_wrapper_locator}                 [data-testid="list-wrapper"] >> nth=1

*** Keywords ***
Check if the Board Exists in the Board List
    [Arguments]                         ${board_title_value}
    Wait For Elements State             [aria-label="${board_title_value} (currently active)"]


Create Lists on Board for three times
    FOR    ${counter}    IN RANGE    3
        Fill Text                       ${add_list_locator}           ${list_name}${counter}
        Click                           ${confirm_add_list_locator}
    END

Add Another List to the Last ones
    Click                               ${add_another_list_locator}
    Create Lists on Board for three times

Add Lists for Three Times to the Borad
    ${count1}           Get Element Count          ${list_wrapper_locator}
    Run Keyword If      ${count1} > 0
    ...    Add Another List to the Last ones
    ...  ELSE
    ...    Create Lists on Board for three times
    
Create New Board from + sign
    Click                               ${add_board_from_plus_sign_locator}

Add a Card to List Item
    Click                               ${add_a_card_locator}
    Fill Text                           ${enter_a_title_locator}           ${enter_text}
    Click                               ${add_card_button_locator}

Close a Board
   Hover                                ${board_locator_in_list}
   Click                                ${board_action_menu_locator}
   Click                                ${first_close_board_locator}
   Click                                ${second_close_board_locator}