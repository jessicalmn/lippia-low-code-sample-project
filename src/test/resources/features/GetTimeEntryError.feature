@GetTimeEntriesError @All @Error
Feature: Get Time Entries Error

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define projectId = "664a06cfd4b3fe510d925782"
    * define taskId = "666393a82cba6f5957b56a8a"

  @ApiKeyInvalid @GetTime
  Scenario: Get a specific time entry on workspace
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = AGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 401


   @WorkspaceInvalid @GetTime @WorkspaceInvalidGetTimeEntry
   Scenario: Get a specific time entry on workspace
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/112eb17f3c5df5418ad248a3/time-entries/{{idTime}}
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 403

  @IdTimeInvalid @GetTime @IdTimeInvalidGetTimeEntry
  Scenario: Get a specific time entry on workspace
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/116393a82cba6f5957b56a8a
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 400



