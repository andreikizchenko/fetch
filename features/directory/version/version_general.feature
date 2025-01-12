@version @general
Feature: Testing fetch cli general functionality of "fetch --version" command

  Scenario: Verify "fetch --version" command output present
    When I run terminal command fetch --version
    Then output present in terminal
    And error message absent in terminal
    And exit status code is 0

  Scenario: Verify "fetch --version" command functions correctly with extra argument
    When I run terminal command fetch --version with extra arguments
    Then output absent in terminal
    And error message present in terminal
    And exit status code is 1
    And error message text is "Error: The 'fetch --version' command does not accept arguments."