@locations @name
Feature: Testing fetch cli functionality of "fetch --locations [LOCATIONS]"
         Location name as argument

  Scenario: Verify input of properly formatted city, state functions correctly
    When I run terminal command fetch --locations "Washington, DC"
    Then fetch locations output is correct

  Scenario: Verify input of city, state where city has space in the name functions correctly
    When I run terminal command fetch --locations "New York, NY"
    Then fetch locations output is correct

  Scenario: Verify input of city, state where city is not capitalized functions correctly
    When I run terminal command fetch --locations "washington, DC"
    Then fetch locations output is correct

  Scenario: Verify input of city, state where state is not capitalized functions correctly
    When I run terminal command fetch --locations "Washington, dc"
    Then fetch locations output is correct

  Scenario: Verify input of city, state where city is in all capitals functions correctly
    When I run terminal command fetch --locations "WASHINGTON, DC"
    Then fetch locations output is correct

  Scenario: Verify input of city, state with leading space functions correctly
    When I run terminal command fetch --locations " Washington, DC"
    Then fetch locations output is correct

  Scenario: Verify input of city, state with trailing space functions correctly
    When I run terminal command fetch --locations "Washington, DC "
    Then fetch locations output is correct

  Scenario: Verify input of city, state without state functions correctly
    When I run terminal command fetch --locations "Washington"
    Then fetch locations output is correct

  Scenario: Verify input of city, state without city functions correctly
    When I run terminal command fetch --locations "DC"
    Then fetch locations output is correct

  Scenario: Verify input of city, state where state comes before city functions correctly
    When I run terminal command fetch --locations "DC Washington"
    Then fetch locations output is correct

  Scenario: Verify input of city, state without comma separator functions correctly
    When I run terminal command fetch --locations "Washington DC"
    Then fetch locations output is correct

  Scenario: Verify input of city, state with invalid state functions correctly
    When I run terminal command fetch --locations "Washington XX"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state with full name for a state functions correctly
    When I run terminal command fetch --locations "Washington District of Columbia"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state with a special character in city name functions correctly
    When I run terminal command fetch --locations "W@shington, DC"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state with a special character in state name functions correctly
    When I run terminal command fetch --locations "Washington, D$"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state with a digits as city name functions correctly
    When I run terminal command fetch --locations "0123456789, DC"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state with a digits as state name functions correctly
    When I run terminal command fetch --locations "Washington, 00"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state where city is too short functions correctly
    When I run terminal command fetch --locations ", DC"
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state where city name has 1 character functions correctly
    When I run terminal command fetch --locations "Y, AK"
    Then fetch locations output is correct
    Then message text "Please enter valid location" is not displayed

  Scenario: Verify input of city, state where city name has 2 characters functions correctly
    When I run terminal command fetch --locations "Bo, AL"
    Then fetch locations output is correct
    Then message text "Please enter valid location" is not displayed

  Scenario: Verify input of city, state where city name is too long functions correctly
    When I run terminal command fetch --locations "Chargoggagoggmanchauggagoggchaubunagungamaugg, MA"
    Then fetch locations output is correct
    Then message text "Please enter valid location" is not displayed

  Scenario: Verify input of city, state with unconventional but valid city name functions correctly
    When I run terminal command fetch --locations "St. Louis, MO"
    Then fetch locations output is correct

  Scenario: Verify input of city, state with non-US city name functions correctly
    When I run terminal command fetch --locations "Toronto, ON"
    Then fetch locations output is correct
    Then message text "Please enter valid location" is displayed

  Scenario: Verify input of city, state with mixed language city name functions correctly
    When I run terminal command fetch --locations "Ciudad de México, DF"
    Then fetch locations output is correct
    Then message text "Please enter valid location" is displayed