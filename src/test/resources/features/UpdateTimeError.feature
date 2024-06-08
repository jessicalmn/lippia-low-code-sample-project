@UpdateEntriesError @All @Error
Feature: Update time entry on workspace Error

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define projectId = "664a06cfd4b3fe510d925782"
    * define taskId = "666393a82cba6f5957b56a8a"
    * define apikey = "MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2"


  @ApiKeyInvalid @UpdateTime @UpdateTimeApiKeyInvalid
  Scenario: Update time entry on workspace - Invalid Api Key
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = AGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And body jsons/bodies/update_entry.json
    When execute method PUT
    Then the status code should be 401
    And response should be message = "Api key does not exist"

  @WorkspaceInvalid @UpdateTime @UpdateTimeWorkspaceInvalid
  Scenario: Update time entry on workspace - Workspace Invalid
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/112eb17f3c5df5418ad248a3/time-entries/{{idTime}}
    And header x-api-key = {{apikey}}
    And body jsons/bodies/update_entry.json
    When execute method PUT
    Then the status code should be 403
    And response should be message = "Access Denied"


  @ProjectInvalid @UpdateTime @UpdateTimeProjectInvalid
  Scenario: Update time entry on workspace - Project Invalid
    Given call TimeEntries.feature@AddTimeEmpty
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = {{apikey}}
    And set value "164a06cfd4b3fe510d925782" of key projectId in body jsons/bodies/update_entry.json
    When execute method PUT
    Then the status code should be 400


  @TaskIdInvalid @UpdateTime @UpdateTimeTaskIdInvalid
  Scenario:  Update time entry on workspace - Task Id Invalid

    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = {{apikey}}
    And set value "AAAA" of key taskId in body jsons/bodies/update_entry.json
    When execute method PUT
    Then the status code should be 400

  @BadRequest @UpdateTime @UpdateTimeBadRequest
  Scenario: Update time entry on workspace - Bad Request
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And header x-api-key = {{apikey}}
    And set value 1 of key start in body jsons/bodies/update_entry.json
    When execute method PUT
    Then the status code should be 400
    And response should be message contains "You entered invalid value for field"


