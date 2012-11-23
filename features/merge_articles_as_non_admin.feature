Feature: Merge Articles
  As a non-admin publisher user
  In order to restrict merge permissions
  I want a non-admin user to be unable to merge articles
  
  Background:
    Given the blog is set up
    And I am logged into the publisher panel
    And as publisher I have published article "Hello Beautiful World!" with content "This is article A"
    And as publisher I have published article "Goodbye Cruel World!" with content "This is article B"
    
  Scenario: The merge form should not appear on the admin content edit page
    Given I am on the admin content page
    When I follow the Edit link for article "Hello Beautiful World!"
    Then I should be on the edit page for article "Hello Beautiful World!"
    And I should not see "Merge"
