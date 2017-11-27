Feature: Validate Activation Code
  As a subject
  I want to check the activation code I was given against what the system stores
  So that I can identify my enrollment and continue with registration

  Background:
    Given the service API document version "v1" has been deployed to Eureka

  @Release2015.2.0
  @PB132853-001
  @Validation
  Scenario: Validating an non-expired, valid activation code that is unused
    When I use Euresource to attempt to validate a good activation code
    Then I should get a successful response
    And I should get a JSON representation of the activation code
    And I should get a JSON representation of subject enrollment within the activation code

  @Release2016.1.0
  @PB183528-001
  @Validation
  Scenario: Validating a non-expired, valid activation code that has been used
    When I use Euresource to validate an activation code that is used but not expired
    Then I should get a successful response
    And I should get a JSON representation of the activation code
    And I should get a JSON representation of subject enrollment within the activation code

  @Release2015.1.0
  @PB132853-002
  @Validation
  Scenario: Validating a nonexistent activation code
    When I use Euresource to attempt to validate a nonexistent activation code
    Then I should get a not found error response with body:
      """
      Activation code not found.
      """

  @Release2016.1.0
  @PB183528-002
  @Validation
  Scenario: Validating an expired activation code
    When I use Euresource to validate an activation code that is expired
    Then I should get a not found error response with body:
      """
      Activation code not found.
      """
