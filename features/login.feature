@selenium @regression @login
Feature: Login and Logout of Reformation

  @smoke
  Scenario: Login in to the site as new user
    Given I am a new user and create a new account
    When I see my account page
    Then I log out

  Scenario: Log in to the site as new user but changes her mind
    Given I am on the home page
    When I go to the profile page
    Then I decide not to create a new account


