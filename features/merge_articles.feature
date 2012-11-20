Feature: Merge Articles
  As a blog administrator
  In order to handle duplicate articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: The merge form should appear on the admin content edit page
    Given I am on the admin content page
    When I follow "Edit"
    Then I should be on the edit page for article 1
    And I should see "Merge"
  
  Scenario: The merge form should not appear on the admin content new page
    Given I am on the admin content page
    When I follow "New Article"
    Then I should be on the new article page
    And I should not see "Merge"
  
  Scenario: Merge two articles
    Given I am on the edit page for article 1
    When I fill in "merge_with" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "The articles were merged successfully."
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles 
    
  
  Scenario: When articles are merged, the merged article should contain the comments of both previous articles
  
  Scenario: When articles are merged, the merged article should have the title of one of the previous articles
  
  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the two original articles).
    
  Scenario: A non-admin cannot merge two articles
