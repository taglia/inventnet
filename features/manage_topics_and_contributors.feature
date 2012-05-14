Feature: Add contributors to a project
  In order to communicate and share ideas
  projects' owners must be able to add contributors
  to their own project

  Background:
    Given the following users
      |email                 |password     |password_confirmation|
      |owner@titi.com        |maomao123    |maomao123            |
      |contrib@titi.com      |maomao321    |maomao321            |
      |non_contrib@titi.com  |maomao321    |maomao321            |
    And a topic named "The Best Topic!" owned by "owner@titi.com"

  Scenario: A user should be able to see a project if they are a contributor
    Given "contrib@titi.com" is a contributor for "The Best Topic!"
    And "contrib@titi.com" is logged in using password "maomao321"
    When I visit the topic page for "The Best Topic!"
    Then I am taken to the topic page for "The Best Topic!"

  Scenario: A user should not be able to see a project if they are not contributor (nor owner)
    Given "non_contrib@titi.com" is logged in using password "maomao321"
    When I visit the topic page for "The Best Topic!"
    Then I am taken to the root page

  Scenario: A user should be able to create a new topic
    Given "owner@titi.com" is logged in using password "maomao123"
    When I follow the link "Discussion Topics"
    And I click on " New"
    And I fill "topic_title" with "My very own topic"
    And I click on "Create Topic"
    Then I am taken to the topic page for "My very own topic"
    And I see "Topic was successfully created."
