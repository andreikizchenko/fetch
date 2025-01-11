@general
Feature: Testing fetch cli functionality. Non-existing option is used

  Scenario: Verify application functions correctly when non-existing option is used
    When I run terminal command fetch with option non-existing-option
    Then output absent in terminal
    And error message present in terminal
    And exit status code is 1