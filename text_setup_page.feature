@text_message
Feature: Text Message Setup Page Tests
  Background:
    Given I am logged in as super_user
      And the welcome modal is not present
      And I click on "Text Message" in the "New" menu

  @text_setup @PUSH-393
  Scenario: Character limit validation for name and description field
    When I enter 101 characters in the name field
    #verify character length of the name field is 100 characters
    Then the character length of the name field is 100 characters
    When I enter 2010 characters in the description field
    Then the character length of the description field is 2000 characters

  @text_setup @PUSH-393
  Scenario: Name and description field should accept alphanumeric and punctuation value
    When I enter 10 characters in the name field
      And I enter asbd7263!@#$&^?. in the description field
      And I select my default division from the division select field
      And I choose option 2 from the encoding select field
    When I click the save button
    Then I should see that the current page has been saved
      And I see the current tab title is the value of the name field

  @text_setup @PUSH-393
  Scenario: Alert validation if user is saving the setup page without entering mandatory fields
    When I enter dummy text in the description field
      And I click the save button
    Then I see an alert with primary message "Please enter a name for this Text Message Touchpoint."
      And I close the modal window
      And I see the description field contains the word "dummy text"
    When I enter a unique value in the name field
      And I click the save button
    Then I see an alert with primary message "Please assign this Text Message Touchpoint to a Division."
    When I close the modal window
      And I select my default division from the division select field
      And I click the save button
    Then I see an alert with primary message "Please choose an encoding."

  @text_setup @PUSH-393
  Scenario: Alert validation if setup page is saved with the existing name
    When I enter a unique value in the name field
      And I select my default division from the division select field
    Then the campaign field is enabled
      And the campaign select field has more than 1 selectable option
    When I choose option 2 from the campaign select field
      And I choose option 2 from the encoding select field
      And I click the save button
    Then I should see that the current page has been saved
    When I save the new setup page with existing name
    Then I see an alert with primary message "The name you have entered already exists. Please enter a different one."

  @text_setup @PUSH-1317
  Scenario: Test for campaign drop down on setup page
    Then I see the deliver_on field contains the word "Schedule"
      And the campaign field is disabled
    When I enter a unique value in the name field
      And I remember the value of the sms name inside the name field
      And I select my default division from the division select field
    Then the campaign field is enabled
      And I see the value of the campaign field is "None"
      And the campaign select field has more than 1 selectable option
    When I choose option 2 from the campaign select field
      And I choose option 2 from the encoding select field
      And I remember the value of the campaign inside the campaign field
    When I click the save button
    Then I should see that the current page has been saved
    When I close the current tab
      And I navigate to the items browser
      And I open the item with the name of the value of the sms name from the items browser
    Then the current tab title is "the value of the sms name"
      And I see the value of the campaign inside the campaign field

  @text_setup @PUSH-1491
  Scenario: Test for deliver on dropdown on the setup page
    When I fill out the required information on the Set Up text message step
      And I wait until the alert is no longer present
      And I select Plan from the deliver_on select field
      And I click the save button
    Then I should see that the current page has been saved
      And the workflow_step tab with the title "Audience" is disabled
      And the workflow_step tab with the title "Delivery" is disabled
    When I select Schedule from the deliver_on select field
    Then I see an alert with primary message "Remove touchpoint from Plan. Audience and Delivery will be reset."
    When I click cancel in the modal
    Then I see the value of the deliver_on field is "Plan"
      And the workflow_step tab with the title "Audience" is disabled
      And the workflow_step tab with the title "Delivery" is disabled
    When I select Schedule from the deliver_on select field
      And I click ok in the modal
      And I click the save button
    Then I should see that the current page has been saved
      And the workflow_step tab with the title "Audience" is enabled
      And the workflow_step tab with the title "Delivery" is enabled
    When I go to the Audience text message tab
      And I close the modal window
    Then I see all the default attributes present on the audience page
    When I go to the Delivery text message tab
    Then I see that the start_date field is empty
      And I see that the start_date_hour field is empty
      And I see that the start_date_minute field is empty