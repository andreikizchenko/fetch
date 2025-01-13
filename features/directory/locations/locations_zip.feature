@locations @zip
Feature: Testing fetch cli functionality of "fetch --locations [LOCATIONS]"
         Location zip code as argument

  Scenario: Verify input of valid 5 digit zip code functions correctly
    When I run terminal command fetch --locations 12345
    Then fetch locations output is correct

  Scenario: Verify input of valid 5 digit zip code with 4 digit code
    When I run terminal command fetch --locations 12345-6789
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of valid 5 digit zip code with leading zero
    When I run terminal command fetch --locations 01234
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of valid 5 digit zip code with leading zero and with 4 digit code
    When I run terminal command fetch --locations 01234-5678
    Then message text "Please enter valid location" is displayed

  Scenario: Verify invalid input of 0 digits zip code
    When I run terminal command fetch --locations ""
    Then message text "Please enter valid location" is displayed

  Scenario: Verify invalid input of all zeros zip code
    When I run terminal command fetch --locations 00000
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of invalid zip code with less than 5 digits
    When I run terminal command fetch --locations 1234
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of invalid zip code with more than 5 digits
    When I run terminal command fetch --locations 123456
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of invalid 5 character zip code with alphabetical character
    When I run terminal command fetch --locations A1234
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of invalid 5 character zip code with special character
    When I run terminal command fetch --locations @1234
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of invalid 5 character zip code with space
    When I run terminal command fetch --locations "12 34"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of valid zip code with leading space
    When I run terminal command fetch --locations " 1234"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of valid zip code with trailing space
    When I run terminal command fetch --locations "1234 "
    Then message text "Please enter valid location" is displayed