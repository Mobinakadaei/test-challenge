*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${log_in_button_locator}        [class="Buttonsstyles__Button-sc-1jwidxo-0 kTwZBr"]
${enter_email_locator}          [placeholder="Enter your email"]
${email_value}                  m.kadaei99@gmail.com
${submit_button_locator}        id=login-submit
${enter_password_locator}       [placeholder="Enter password"]
${password_value}               Mobina174@@

*** Keywords ***
Tap on Log in Button
    Click                       ${log_in_button_locator}
Enter Your Email and Tap on Submit
    Fill Text                   ${enter_email_locator}          ${email_value}
    Click                       ${submit_button_locator}
Enter Your Password and Tap on Submit
    Fill Text                   ${enter_password_locator}       ${password_value}
    Click                       ${submit_button_locator}