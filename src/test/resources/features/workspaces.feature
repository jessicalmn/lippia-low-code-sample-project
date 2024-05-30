Feature: Workspaces

  Background:
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And header Content-Type = application/json
    And header Accept = */*


  Scenario: Get all my workspace
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces
    When execute method GET
    Then the status code should be 200
