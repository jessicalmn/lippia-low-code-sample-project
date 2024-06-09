@DeleteTimeError @All @Error @DeleteTime
Feature: Update time entry on workspace Error

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define taskId = "666393a82cba6f5957b56a8a"


  @ApiKeyInvalid  @DeleteTimeApiKeyInvalid
  Scenario: Delete time entry from workspace
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = AGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method DELETE
    Then the status code should be 401
    And response should be message = "Api key does not exist"



  @WorkspaceInvalid  @DeleteTimeWorkspaceInvalid
  Scenario: Delete time entry from workspace - Workspace Invalid
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/112eb17f3c5df5418ad248a3/time-entries/{{idTime}}
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method DELETE
    Then the status code should be 403
    And response should be message = "Access Denied"


  @TaskIdInvalid  @DeleteTimeTaskIdInvalid
  Scenario:  Update time entry on workspace - Task Id Invalid
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/6664b76a6b6e6007061e8f7d
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method DELETE
    Then the status code should be 400
    And response should be message = "Time entry doesn't belong to Workspace"

  @BadRequest  @DeleteTimeBadRequest
  Scenario: Update time entry on workspace - Bad Request
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/a
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method DELETE
    Then the status code should be 400
    And response should be message = "Time entry doesn't belong to Workspace"

