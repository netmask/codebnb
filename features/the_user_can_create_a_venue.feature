@omniauth_test
@javascript
Feature: The user can manage his venues

  Background:
    Given The following "Venue" exist:
    | rooms | label         | description         | latitude | longitude |
    |     1 | magma_rails   | Magma rails hostage |  19.0967 |  103.9608 |
    |   100 | garays_lonely | I need friends      |  28.6322 |  106.0708 |

    And I am on the my venues page

  Scenario: The user see his venues
    Then I should see a list of my "2" venues

  Scenario: The user creates a new venue
    Given I follow "Create Venue"
    And I fill the "venue" form with:
    | Label          |       San Fransisco |
    | Latitude       |             33.2211 |
    | Longitude      |            108.0211 |
    | Description    |     Pride del bueno |
    | Work place     |                   1 |
    | Meals          |                   1 |
    | Internet       |                   1 |
    | Disclamer      | Nose puede no poder |
    | Mates allowed  |                   1 |
    | Mates quantity |                  10 |
    And I press "Create Venue"
    Then I should see "Venue Created!"
