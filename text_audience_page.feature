@text_message @text_message_audience @PUSH-597 @PUSH-598
Feature: Text Message Audience Page Tests
  Background:
    Given I am logged in as super_user
      And the welcome modal is not present
      And I click on "Text Message" in the "New" menu
      And I fill out the required information on the Set Up text message step
      And I go to the Audience text message tab
      And I see an alert with the message "Required attributes were added to Audience."
      And I close the modal window

  Scenario: Test to check the default values and save the audience page
    Then the cancel_count button is not displayed
      And I see all the default attributes present on the audience page
      And the save button is enabled
      And the save_and_get_count button is enabled
      And I see the text "Run a count of how many subscribers will receive this message." inside the count_status_message
    When I click the save button
    Then I should see that the current page has been saved

  Scenario: Test for the save and get count button with count data and canceling the count on the audience page
    When I click the save_and_get_count button
    Then I should see that the current page has been saved
      And the cancel_count button is displayed
      And I see the text "Last Count:" inside the count_status_message
    When I click the save_and_get_count button
    Then I should see that the current page has been saved
    When I click the cancel_count button
    Then I see an alert modal
      And I close the modal window
      And I see the text "Last Count:" inside the count_status_message

  Scenario: Test to add attribute in segment area
      And I remember the value of the attribute inside the first_attribute
    When I double click the first_attribute
    Then I see the value of the attribute inside the segments
    When I click the segment_close_icon
    Then I do not see the value of the attribute inside the segments
