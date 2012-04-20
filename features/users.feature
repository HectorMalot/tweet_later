Feature: Authentication

  In order to gain access to privileged functions
  As a user
  I want to be able to login

  @current @omniauth-success
  Scenario: Existing user clicks sign in link with success
    Given I am not signed in
    And   I am at the homepage
    And   A user with uid '123456' exists
    When  I sign in using twitter with valid credentials
    Then  I should be signed in
    And   I should see my dashboard

  @omniauth-success
  Scenario: New user registers using sign-in link
    Given I am not signed in
    And   I am at the homepage
    When  I sign in using twitter with valid credentials
    Then  I should be signed in
    And   I should see my dashboard

  @omniauth-failure
  Scenario: User signs in with invalid credentials
    Given I am not signed in
    And   I am at the homepage
    When  I try to sign in using twitter with invalid credentials
    Then  I should not be signed in
    And   I should see an error message

  Scenario: Users signs out
    Given I am signed in
    When  I click the sign out link
    Then  I should be signed out
    And   I should be redirected to the homepage