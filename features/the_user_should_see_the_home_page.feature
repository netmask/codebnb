@javascript
Feature: The user on the home page
  should see many things

  Background
    Given I on the home page

  Scenario: The user should see the home screen map
    Then I should see the home screen map with my current position
