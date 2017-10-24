@smoke @smoke_3
Feature: Text Message Complete Workflow
  Background:
    Given I am logged in as super_user
      And I click on "Text Message" in the "New" menu

  Scenario: Smoke test for text message workflow
    When I fill out the required information on the Set Up text message step
      And I go to the Audience text message tab
    Then I see required details on audience page
    When I click the save button
    Then I should see that the current page has been saved
    When I go to the Message text message tab
      And I fill out the required information on the Message text message step
    When I go to the Delivery text message tab
      And I fill out the required information on the Delivery text message step
      And I enable and disable sms text message
