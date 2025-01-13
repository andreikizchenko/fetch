@version @options
Feature: Testing fetch cli functionality. Command "fetch --version"
         Command options

  Scenario: Verify option "--version" functions correctly
    When I run terminal command fetch --version
    Then correct fetch version output present in terminal

  Scenario: Verify option "version" functions correctly
    When I run terminal command fetch version
    Then correct fetch version output present in terminal

  Scenario: Verify option "-v" functions correctly
    When I run terminal command fetch -v
    Then correct fetch version output present in terminal

  Scenario: Verify option "v" functions correctly
    When I run terminal command fetch v
    Then correct fetch version output present in terminal