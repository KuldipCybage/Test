@text_message @text_message_delivery
Feature: Text Message Delivery Page Tests
  Background:
    Given I am logged in as super_user
      And the welcome modal is not present
      And I click on "Text Message" in the "New" menu
      And I fill out the required information on the Set Up text message step
      And I go to the Delivery text message tab

  @PUSH-46
  Scenario: Test for saving the delivery page
    When I fill out the required fields
      And I click the save button
    Then the status icon for the current workflow_step tab is complete
      And I see the confirmation message on the delivery page

  @PUSH-46
  Scenario: Alert Validation check if user provide invalid start time
    When I select today using the date picker of the start_date field
      And I enter 14 in the start_date_hour field
      And I enter the time for 15 minutes from now in minute format in the start_date_minute field
      And I click the save button
    Then I see an alert with primary message "Please enter a valid starting date and time."
      And I close the modal window
      And I see that the start_date_hour field is empty
    When I enter the time for 1 hour from now in hour format in the start_date_hour field
      And I enter 61 in the start_date_minute field
      And I click the save button
    Then I see an alert with primary message "Please enter a valid starting date and time."
      And I close the modal window
      And I see that the start_date_minute field is empty

  @PUSH-46
  Scenario: Alert Validation check if user provides already passed date and time
    When I enter the date for yesterday in the start_date field
      And I enter the time for 1 hour from now in hour format in the start_date_hour field
      And I enter 00 in the start_date_minute field
      And I click the save button
    Then I see an alert with primary message "Please enter a start date and time later than current date and time."
      And I close the modal window
    When I select today using the date picker of the start_date field
      And I enter the time for now in hour format in the start_date_hour field
      And I enter the time for 2 minutes ago in minute format in the start_date_minute field
      And I click the save button
    Then I see an alert with primary message "Please enter a start date and time later than current date and time."
