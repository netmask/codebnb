@omniauth_test
@javascript
Feature: The user can edit his profile

  Scenario: The User can see his profile
    Given I am on the profile page
    And I follow "Edit"
    Then I fill the "user" form with:
    | Name       | Jon             |
    | First name | Jon             |
    | Last name  | Doe             |
    | Age        | 30              |
    | Address    | 1697 Dolores St |
    | City       | San Fransisco   |
    | State      | California      |
    | Country    | United States   |
    | Zip code   | 94110           |
    And I press "Save User"
    Then I should see "Success!"
