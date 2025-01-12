@locations @general
Feature: Testing fetch cli functionality. Command 'fetch --locations [LOCATIONS]"

  Scenario: Verify "fetch --locations 12345" command output present
    When I run terminal command fetch --locations 12345
    Then output present in terminal
    And error message absent in terminal
    And exit status code is 0

  Scenario: Verify "fetch --locations 12345" command output correct
    When I run terminal command fetch --locations 12345
    Then fetch locations output present in terminal
    And fetch locations output includes parameters Name, Lat, Lon, Country
    And fetch locations output includes value for each parameter

  Scenario: Verify "fetch --locations" command functions correctly without arguments
    When I run terminal command fetch --locations
    Then output absent in terminal
    And error message absent in terminal
    And exit status code is 0