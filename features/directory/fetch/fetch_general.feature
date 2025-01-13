@fetch @general
Feature: Testing fetch cli general functionality

  Scenario: Verify cli application functions correctly without option
    When I run terminal command fetch
    Then output absent in terminal
    And error message present in terminal
    And exit status code is 1
    And help message is displayed

  Scenario: Verify cli application functions correctly with non-existing option
    When I run terminal command fetch --non-existing-option
    Then output absent in terminal
    And error message present in terminal
    And exit status code is 1
    And help message is displayed