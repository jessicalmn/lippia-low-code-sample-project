@AddTimeEntriesError @All @Error @AddTime
Feature: Add Time Entries Error

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define apikey = "MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2"

  @ApiKeyInvalid  @AddTimeApiKeyInvalid
  Scenario: Add a new time entry - Invalid Api Key
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And header x-api-key = AGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And body jsons/bodies/add_new_entry_empty.json
    When execute method POST
    Then the status code should be 401
    And response should be message = "Api key does not exist"

  @WorkspaceInvalid @AddTimeWorkspaceInvalid
  Scenario: Add a new time entry  - Workspace Invalid
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/112eb17f3c5df5418ad248a3/time-entries
    And header x-api-key = {{apikey}}
    And body jsons/bodies/add_new_entry_empty.json
    When execute method POST
    Then the status code should be 403
    And response should be message = "Access Denied"

  @ProjectInvalid  @AddTimeProjectInvalid
  Scenario: Add a new time entry - Project Invalid
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And header x-api-key = {{apikey}}
    And set value "164a06cfd4b3fe510d925782" of key projectId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 400

  @TaskIdInvalid  @AddTimeTaskIdInvalid
  Scenario: Add a new time entry - Task Id Invalid
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And header x-api-key = {{apikey}}
    And set value "164a06cfd4b3fe510d925782" of key taskId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 400
    And response should be message = "Task doesn't belong to Project"

  @BadRequest  @AddTimeBadRequest
  Scenario: Add a new time entry - Bad Request
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And header x-api-key = {{apikey}}
    When execute method POST
    Then the status code should be 400
    And response should be message contains "Required request body is missing"

  @EndDateInvalid  @EndDateProjectInvalid
  Scenario: Add a new time entry - Date Invalid
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And header x-api-key = {{apikey}}
    And set value "2024-06-06T09:00:00Z" of key start in body jsons/bodies/add_new_entry.json
    And set value "2024-06-06T06:00:00Z" of key end in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 400
    And response should be message contains "is greater than end datetime"
