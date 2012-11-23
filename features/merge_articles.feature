Feature: Merge Articles
  As a blog administrator
  In order to handle duplicate articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And as admin I have published article "Hello Beautiful World!" with content "This is article A"
    And as admin I have published article "Goodbye Cruel World!" with content "This is article B"
    And article "Hello Beautiful World!" has comment "This article rocks!"
    And article "Goodbye Cruel World!" has comment "This article sucks!"

  Scenario: The merge form should appear on the admin content edit page
    Given I am on the admin content page
    When I follow the Edit link for article "Hello Beautiful World!"
    Then I should be on the edit page for article "Hello Beautiful World!"
    And I should see "Merge"
  
  Scenario: The merge form should not appear on the admin content new page
    Given I am on the admin content page
    When I follow "New Article"
    Then I should be on the new article page
    And I should not see "Merge"
  
  Scenario: An admin can merge two articles
    Given I am on the admin content page
    And I follow the Edit link for article "Hello Beautiful World!"
    When I fill in "merge_with" with the ID of article "Goodbye Cruel World!"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "The articles were merged successfully."
    And I should not see "Goodbye Cruel World!"
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles 
    Given I am on the admin content page
    And I follow the Edit link for article "Hello Beautiful World!"
    When I fill in "merge_with" with the ID of article "Goodbye Cruel World!"
    And I press "Merge"
    And I follow the Show link for article "Hello Beautiful World!"
    Then I should see "This is article A"
    And I should see "This is article B"
  
  Scenario: When articles are merged, the merged article should contain the comments of both previous articles
    Given I am on the admin content page
    And I follow the Edit link for article "Hello Beautiful World!"
    When I fill in "merge_with" with the ID of article "Goodbye Cruel World!"
    And I press "Merge"
    Then article "Hello Beautiful World!" should have comment "This article rocks!"
    And article "Hello Beautiful World!" should have comment "This article sucks!"
