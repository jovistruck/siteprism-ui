@home @valtech
Feature: Perform tests on the Valtech home page

  As a customer visiting the Valtech website
  I am able to see the various sections on the page
  I can also navigate to the links and view the correct number of contact locations

  Background:
    Given I am on the valtech home page

  Scenario: I can see the section displaying valtech's latest news

    Then the valtech news section is displayed

  Scenario Outline: I can see that the page header is correct

    And I click and open the right navigation panel
    When I visit the "<page_name>" page from the right navigational links
    Then the title header of the page is "<page_name>"

    Examples:
      | page_name |
      | CASES     |
      | EVENTS    |
      | SERVICES  |

  Scenario: I can see correct number of contact locations

    When I visit the contact page
    Then the number of contact locations listed is "62"