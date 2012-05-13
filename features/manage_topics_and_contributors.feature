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

