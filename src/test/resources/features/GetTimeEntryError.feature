@GetTimeEntriesError @All @Error @GetTimeEntries
Feature: Get Time Entries Error

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define apikey = "MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2"

  @ApiKeyInvalid @GetTimeEntriesApiKeyInvalid
  Scenario: Get a specific time entry on workspace - Invalid Api Key
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = AGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 401
    And response should be message = "Api key does not exist"

   @WorkspaceInvalid  @GetTimeEntriesWorkspaceInvalid
   Scenario: Get a specific time entry on workspace - Workspace Invalid
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/112eb17f3c5df5418ad248a3/time-entries/{{idTime}}
    And header x-api-key = {{apikey}}
     When execute method GET
    Then the status code should be 403
     And response should be message = "Access Denied"

  @IdTimeInvalid  @GetTimeIdTimeInvalid
  Scenario: Get a specific time entry on workspace - Id Time Invalid
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/116393a82cba6f5957b56a8a
    And header x-api-key = {{apikey}}
    When execute method GET
    Then the status code should be 400
    And response should be message = "Time entry doesn't belong to Workspace"


