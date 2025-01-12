@locations @input
Feature: Testing fetch cli functionality of "fetch --locations [LOCATIONS]"
         Command arguments input

  Scenario: Verify single argument input of location name functions correctly
    When I run terminal command fetch --locations "Washington, DC"
    Then fetch locations single location output present in terminal

  Scenario: Verify single argument input of location zip code functions correctly
    When I run terminal command fetch --locations 12345
    Then fetch locations single location output present in terminal

  Scenario: Verify multiple arguments input of location names functions correctly
    When I run terminal command fetch --locations "New York, NY" "Washington, DC"
    Then fetch locations multiple locations output present in terminal

  Scenario: Verify multiple arguments input of location zip codes functions correctly
    When I run terminal command fetch --locations "12345" "10001"
    Then fetch locations multiple locations output present in terminal

  Scenario: Verify multiple arguments input of mixture of location names and zip codes functions correctly
    When I run terminal command fetch --locations "Washington, DC" "12345"
    Then fetch locations multiple locations output present in terminal

  Scenario: Verify multiple arguments input of mixture of location zip codes and names functions correctly
    When I run terminal command fetch --locations "12345" "Washington, DC"
    Then fetch locations multiple locations output present in terminal