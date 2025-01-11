@version
Feature: Testing fetch cli functionality. Command 'fetch --version"

  Scenario: Verify "--version" output present
    When I run terminal command fetch with option --version
    Then output present in terminal
    And error message absent in terminal
    And exit status code is 0

  Scenario: Verify option "--version" functions correctly
    When I run terminal command fetch with option --version
    Then correct fetch version output present in terminal

  Scenario: Verify option "version" functions correctly
    When I run terminal command fetch with option version
    Then correct fetch version output present in terminal

  Scenario: Verify option "-v" functions correctly
    When I run terminal command fetch with option -v
    Then correct fetch version output present in terminal

  Scenario: Verify option "v" functions correctly
    When I run terminal command fetch with option v
    Then correct fetch version output present in terminal
