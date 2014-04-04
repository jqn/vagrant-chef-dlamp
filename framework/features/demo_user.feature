Feature: Demo authenticated test feature

  @api
  Scenario: Create and log in as a user
    Given I am logged in as a user with the "authenticated user" role
     When I click "My account"
     Then I should see the heading "History"
