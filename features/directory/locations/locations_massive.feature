@locations @zips @massive
Feature: Massive input testing

  @valid
  Scenario: Verify massive input of valid 5 digit zip codes functions correctly
    When I load config/valid-zips.json file
    And I run 10 commands "fetch --locations" with random zips from the file
    Then all the valid requests output displayed correctly

  @invalid
  Scenario: Verify massive input of invalid 5 digit zip codes functions correctly
    When I load config/invalid-zips.json file
    And I run 10 commands "fetch --locations" with random zips from the file
    Then all the invalid requests output displayed correctly