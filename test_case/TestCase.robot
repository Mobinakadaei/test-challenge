*** Settings ***
Library             Browser         timeout=20000
Resource            ../page_object_model/OpenBrowser.robot
Resource            ../page_object_model/LoginPage.robot
Resource            ../page_object_model/CreateBoradPage.robot
Resource            ../page_object_model/BoardPage.robot
Test Teardown       Close Browser

*** Variables ***
${board_title_value}                       sample_board
${board_title_value2}                      test_board
${public_visibility_locator}               text=Public
${workspace_visibility_locator}            data-testid=create-board-select-visibility

*** Test Cases ***
Create Board form Creat Button at the Top of the Page
    Given OpenBrowser.Open Browser
    When LoginPage.Tap on Log in Button
    And LoginPage.Enter Your Email and Tap on Submit
    And LoginPage.Enter Your Password and Tap on Submit
    And CreateBoradPage.Tap on Create Button at the Top of the Page
    And CreateBoradPage.Tap on Create Board Button
    And CreateBoradPage.Fill in the Board Title                         ${board_title_value}
    And CreateBoradPage.Tap on Visibility Options
    And CreateBoradPage.Select a Visibility Option                      ${public_visibility_locator}
    And CreateBoradPage.Confirm Public Visibility Option
    And CreateBoradPage.Tap on Create Button
    Then BoardPage.Check if the Board Exists in the Board List          ${board_title_value}
    And BoardPage.Add Lists for Three Times to the Borad
    And Browser.Reload
    And BoardPage.Add a Card to List Item
    And BoardPage.Close a Board

Create Board from Plus Sign in the Board Page
    Given OpenBrowser.Open Browser
    When LoginPage.Tap on Log in Button
    And LoginPage.Enter Your Email and Tap on Submit
    And LoginPage.Enter Your Password and Tap on Submit
    And CreateBoradPage.Tap on Boards Button in the Boards Page
    And BoardPage.Create New Board from + sign
    And CreateBoradPage.Fill in the Board Title                         ${board_title_value2}
    And CreateBoradPage.Tap on Visibility Options
    And CreateBoradPage.Select a Visibility Option                      ${workspace_visibility_locator}
    And CreateBoradPage.Tap on Create Button
    Then BoardPage.Check if the Board Exists in the Board List          ${board_title_value2}
    And BoardPage.Add Lists for Three Times to the Borad
    And Browser.Reload
    And BoardPage.Add a Card to List Item
    And BoardPage.Close a Board








