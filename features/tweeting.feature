Feature: Scheduling tweets

  In order to be more productive
  As a user
  I want to be able to schedule tweets

  Background: Signed in
    Given I am signed in
    And   I am at my dashboard

  @wip
  Scenario: Post a tweet immediately
    When I post a new tweet
    Then the tweet should be posted immediately
    
  Scenario: Post a tweet in 2 hours
    When I post a new tweet to be tweeted in 2 hours
    Then the tweet should be scheduled for posting in 2 hours
    
  Scenario: Change a scheduled tweet
    Given I have posted a new tweet to be tweeted in 2 hours
    When  I change the time by 2 hours
    Then  the tweet should be scheduled for posting in 4 hours
  
  Scenario: Schedule a tweet in the past
    Given I have posted a new tweet to be tweeted in 2 hours
    When  I change the time by -4 hours
    Then  I should receive a warning