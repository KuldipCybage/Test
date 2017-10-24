@text_message @sms_workflow
Feature: Enable/Disable SMS feature

  Background:
    Given I am logged in as super_user
      And the welcome modal is not present
      And I click on "Text Message" in the "New" menu

  @PUSH-1547
  Scenario: Test to verify user can Enable or Disable SMS feature
    Given the enable button is displayed in the footer
    When I fill out the required information on the Set Up text message step
      And I fill out the required information on the Audience text message step
      And I fill out the required information on the Message text message step
      And I fill out the required information on the Delivery text message step
    When I click the enable button in the footer
    Then I see a legacy alert with the message "Are you sure you want to enable this Text touchpoint?"
      And I see a legacy alert with the message "The Text Touchpoint message is targeted to all subscribed customers."
    When I click the confirm button in the legacy_alert
    Then I see a legacy alert with the message "Are you sure you want to enable this Text touchpoint?"
      And I see a legacy alert with the message "The scheduled date for this master"
    When I click the confirm button in the legacy_alert
    Then I see an alert modal
      And I close the modal window
    Then the enable button is not displayed in the footer
      And the disable button is displayed in the footer
    When I click the disable button in the footer
    Then the enable button is displayed in the footer
      And the disable button is not displayed in the footer

  @PUSH-1547
  Scenario: Verify an alert message when user only save the audience page and enable the text touchpoint
    Given the enable button is displayed in the footer
      And I fill out the required information on the Set Up text message step
      And I fill out the required information on the Message text message step
      And I fill out the required information on the Delivery text message step
    When I go to the Audience text message tab
      And I close the modal window
      And I click the save button
    Then the status icon for the current workflow_step tab is complete
    When I click the enable button in the footer
    Then I see a legacy alert with the message "Are you sure you want to enable this Text touchpoint?"
      And I see a legacy alert with the message "No count has been run to see how many recipients will receive your mailing."
      And I see a legacy alert with the message "The Text Touchpoint message is targeted to all subscribed customers."
    When I click the confirm button in the legacy_alert
    Then I see a legacy alert with the message "Are you sure you want to enable this Text touchpoint?"
      And I see a legacy alert with the message "The scheduled date for this master"