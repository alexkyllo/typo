Feature: Edit Categories
	As a blog administrator
	In order to categorize my blog posts
	I want to be able to edit categories
	
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: Navigating to the Categories page
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the edit categories page
    And I should see "Categories"
    And I should see "Name"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Description"

  Scenario: Adding a new category
    Given I am on the edit categories page
    When I fill in "Name" with "Chunky Bacon"
    And I fill in "Keywords" with "Chunky, Bacon"
    And I fill in "Permalink" with "chunky-bacon"
    And I fill in "Description" with "Chunky Bacon! Chunky Bacon!"
    And I press "Save"
    Then I should be on the edit categories page
    And I should see "Chunky Bacon"
    
  Scenario: Editing an existing category
    Given I am on the edit categories page
    And I have added category "Chunky Bacon" with description "Chunky Bacon! Chunky Bacon!"
    When I follow the Edit link for category "Chunky Bacon"
    And I fill in "Description" with "The bacon is not chunky enough."
    And I press "Save"
    Then I should be on the edit categories page
    And I should see "The bacon is not chunky enough."
    
