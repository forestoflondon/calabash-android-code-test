Feature: Code Test
  In order to get this cool job
  As a candidate
  I want to implement the following scenarios

  Scenario: The correct name and preferred car selection are displayed
    Given I am on the Web View Screen
    When I enter my name as "Dwayne"
    And select my preferred car as an "Audi"
    Then my inputs are displayed correctly in the hello message

  Scenario: Pop-up window displays correct message
    Given I am on the Home Screen
    When I open the pop-up window
    Then I see the text "It''s a PopupWindow"

  Scenario: App crash is captured in the log
    Given I am on the Home Screen
    When I force an App crash
    Then the App has crashed
    And the crash appears in the log

  Scenario: Pop-up window and App crash
    Given I am on the Home Screen
    When I open the pop-up window
    Then I see the text "It''s a PopupWindow"
    When I press the "Dismiss" button
    And I force an App crash
    Then the App has crashed
    And the crash appears in the log