Feature: Authentication

  In order to gain access to privileged functions
  As a user
  I want to be able to login

  @omniauth
  Scenario: Existing user clicks sign in link with success
    Given I am not signed in
    And   I am at the homepage
    And   A user with uid '123456' exists
    When  I sign in using twitter with valid credentials
    Then  I should be signed in
    And   I should see my dashboard

  @omniauth
  Scenario: New user registers using sign-in link
    Given I am not signed in
    And   I am at the homepage
    When  I sign in using twitter with valid credentials
    Then  I should be signed in
    And   I should see my dashboard

  @omniauth
  Scenario: User signs in with invalid credentials
    Given I am not signed in
    And   I am at the homepage
    When  I try to sign in using twitter with invalid credentials
    Then  I should not be signed in
    And   I should see an error message

  @omniauth
  Scenario: Users signs out
    Given I am signed in
    When  I click the sign out link
    Then  I should be signed out
    And   I should be at the homepage
    
  @current
  Scenario: User deletes account
    Given PENDING