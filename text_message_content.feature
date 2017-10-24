@text_message
Feature: Text Message Content Page Tests

  Background:
    Given I am logged in as super_user
      And the welcome modal is not present
      And I click on "Text Message" in the "New" menu
      And I fill out the required information on the Set Up text message step
      And I go to the Message text message tab

  @text_message_content @PUSH-396
  Scenario: Verify the character limit of the content box with a warning message
    When I enter 50 characters in the content field
    Then I see a warning
      And I see a warning icon as small_ok_icon
      And I see the text "90 characters remaining..." inside the alert_message
      And the save button is enabled
    When I append 80 characters to the content field
    Then I see a warning icon as small_warning_icon
    When I append 10 characters to the content field
    Then I see a warning icon as small_warning_icon
      And I see the text "0 character remaining..." inside the alert_message
    When I append 50 characters to the content field
    Then I see a warning icon as small_error_icon
      And I see the text "50 characters too many. Successful delivery of this message will depend on the carrier." inside the alert_message
    When I enter 2050 characters in the content field
    Then I see the text "1860 characters too many. Successful delivery of this message will depend on the carrier." inside the alert_message
      And I see a warning icon as small_error_icon
      And the character length of the content field is 2000 characters
    When I click the save button
    Then I should see that the current page has been saved
      And the status icon for the current workflow_step tab is complete

  @text_message_content @PUSH-396
  Scenario: Verify the cheat sheet link
    Given the cheat_sheet is not displayed
    When I click the cheat_sheet_link
    Then the cheat_sheet is displayed
    When I click the cheat_sheet_link
    Then the cheat_sheet is not displayed

  @text_message_content @text_message_preview @PUSH-396
  Scenario: Verify that post tag message is showing correct info in the preview page
    When I enter a post tag script in the content field
    Then I see a warning icon as small_warning_icon
      And I see the text "Character count not available with personalization." inside the alert_message
    When I click the save button
    Then I should see that the current page has been saved
    When I select Preview from the switch_sms_mode select field
    Then I see the text "Hi Valued Customer" inside the preview_content
    When I enter a valid user_id in the user_id field
      And I click the test button
    Then I see the text "the preview user's email" inside the preview_content

  Scenario: Verify an alert message if user want to switch to preview page with blank content
    When I select Preview from the switch_sms_mode select field
    Then I see an alert with primary message "Please define some content for this Text Touchpoint before attempting to preview its content."