@text_message
Feature: Text Message Preview Tests
  Background:
    Given I am logged in as super_user
      And the welcome modal is not present
      And I click on "Text Message" in the "New" menu
      And I fill out the required information on the Set Up text message step
      And I fill out the required information on the Message text message step

  @text_message_preview @PUSH-394
  Scenario: Send and test button should enabled when enter valid data in the fields
      And I remember the value of the content_text inside the content field
    When I select Preview from the switch_sms_mode select field
    Then the send button is disabled
      And the test button is disabled
      And I see the value of the content_text inside the preview_content
    When I enter a valid user_id in the user_id field
    Then the test button is enabled
      And the send button is disabled
    When I enter my phone number in the send_preview_to field
    Then the send button is enabled
    When I enter alphanumeric text in the send_preview_to field
    Then the send button is disabled
    When I enter my phone number in the send_preview_to field
    Then the send button is enabled
    When I enter @ in the send_preview_to field
    Then the send button is disabled

  @text_message_preview @PUSH-394
  Scenario: Send button is disabled when enter more than 10 numbers in send_preview_to field
      And I select Preview from the switch_sms_mode select field
    When I enter a valid user_id in the user_id field
      And I enter my phone number in the send_preview_to field
      And I add 10 more phone numbers to the send_preview_to field
    Then the send button is disabled

  @text_message_preview @PUSH-394
  Scenario: Alert modal should display when enter invalid number in send_preview_to field
      And I select Preview from the switch_sms_mode select field
      And I enter a valid user_id in the user_id field
    When I enter my phone number in the send_preview_to field
      And I add 4 more phone numbers to the send_preview_to field
      And I append , to the send_preview_to field
      And I append 789 to the send_preview_to field
      And I add 3 more phone numbers to the send_preview_to field
      And I click the send button
    Then I see an alert with primary message "Please enter up to 10 valid mobile numbers including 1 and area code, numbers only, separated by commas or semicolons"

  @text_message_preview @PUSH-394
  Scenario: Alert modal should display when enter invalid user id
      And I select Preview from the switch_sms_mode select field
      And I enter -1 in the user_id field
    When I click the test button
    Then I see an alert with primary message "User not found. Please provide a valid User Id."
      And I close the modal window
    When I enter my phone number in the send_preview_to field
      And I click the send button
    Then I see an alert with primary message "User not found. Please provide a valid User Id."

  @text_message_preview @PUSH-394
  Scenario: Alert modal should display when send preview to valid number
      And I select Preview from the switch_sms_mode select field
    When I enter a valid user_id in the user_id field
      And I enter my phone number in the send_preview_to field
      And I click the send button
    Then I see an alert with primary message "Text Touchpoint queued for Preview delivery."