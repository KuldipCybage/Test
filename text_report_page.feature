@text_message @sms_report @text_message_report
Feature: Enable/Disable SMS feature

  Background:
    Given I am logged in as super_user
    And the welcome modal is not present
    And I click on "Text Message" in the "New" menu

  @PUSH-960
  Scenario: Test to verify report page
    Given the enable button is displayed in the footer
    When I fill out the required information on the Set Up text message step
      And I remember all the values on the setup page
      And I fill out the required information on the Audience text message step
      And I see the text "Last Count:" inside the count_status_message
      And I remember count_value on the audience page
      And I remember count_performed_time on the audience page
      And I fill out the required information on the Message text message step
      And I remember the value of the content_field inside the content field
      And I remember the starting_date for the text touchpoint
      And I fill out the required information on the Delivery text message step
      And I go to the Report text message tab
    Then I see the value of the division_field inside the division
      And I see the text "my sms provider" inside the providers
      And I see the value of the description_field inside the description
      And I see the value of the keyword_field inside the keyword
      And I see the value of the encoding_field inside the encoding
      And I see the value of the count_value inside the eligible_recipients
      And I see the value of the count_performed_time inside the count_performed
      And I see the value of the content_field inside the text
      And I see the value of the starting_date inside the start_date
      And I see the text "The Text touchpoint will be sent on " inside the next_delivery_date
      And I see the targeting sql for the text touchpoint