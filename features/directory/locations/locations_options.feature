@locations @options
Feature: Testing fetch cli functionality of "fetch --locations [LOCATIONS]" command options

  Scenario: Verify option "--locations" functions correctly
    When I run terminal command fetch --locations 12345
    Then fetch locations output present in terminal

  Scenario: Verify option "locations" functions correctly
    When I run terminal command fetch locations 12345
    Then fetch locations output present in terminal

  Scenario: Verify option "-l" functions correctly
    When I run terminal command fetch -l 12345
    Then fetch locations output present in terminal

  Scenario: Verify option "l" functions correctly
    When I run terminal command fetch l 12345
    Then fetch locations output present in terminal