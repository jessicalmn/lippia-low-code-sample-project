@TimeEntriesError @All @Error
Feature: Time Entries

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define projectId = "664a06cfd4b3fe510d925782"
    * define taskId = "666393a82cba6f5957b56a8a"

  @ApiKeyInvalid @AddTime
  Scenario Outline: Add a new time entry
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And header x-api-key = AGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And set value <nombre> of key description in body jsons/bodies/add_new_entry.json
    And set value <inicio> of key start in body jsons/bodies/add_new_entry.json
    And set value <fin> of key end in body jsons/bodies/add_new_entry.json
    And set value {{projectId}} of key projectId in body jsons/bodies/add_new_entry.json
    And set value {{taskId}} of key taskId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 401

    Examples:
      | nombre                | inicio                 | fin |
      | "Hora 1 para crear"   | "2024-06-01T18:00:00Z" | "2024-06-01T18:00:00Z"|

  @WorkspaceInvalid @AddTime
  Scenario Outline: Add a new time entry
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/112eb17f3c5df5418ad248a3/time-entries
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And set value <nombre> of key description in body jsons/bodies/add_new_entry.json
    And set value <inicio> of key start in body jsons/bodies/add_new_entry.json
    And set value <fin> of key end in body jsons/bodies/add_new_entry.json
    And set value {{projectId}} of key projectId in body jsons/bodies/add_new_entry.json
    And set value {{taskId}} of key taskId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 403

    Examples:
      | nombre                | inicio                 | fin |
      | "Hora 1 para crear"   | "2024-06-01T18:00:00Z" | "2024-06-01T18:00:00Z"|

  @ProjectInvalid @AddTime
  Scenario Outline: Add a new time entry
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/162eb17f3c5df5418ad248a3/time-entries
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And set value <nombre> of key description in body jsons/bodies/add_new_entry.json
    And set value <inicio> of key start in body jsons/bodies/add_new_entry.json
    And set value <fin> of key end in body jsons/bodies/add_new_entry.json
    And set value "114a06cfd4b3fe510d925782" of key projectId in body jsons/bodies/add_new_entry.json
    And set value {{taskId}} of key taskId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 403

    Examples:
      | nombre                | inicio                 | fin |
      | "Hora 1 para crear"   | "2024-06-01T18:00:00Z" | "2024-06-01T18:00:00Z"|


  @TaskIdInvalid @AddTime
  Scenario Outline: Add a new time entry
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/162eb17f3c5df5418ad248a3/time-entries
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And set value <nombre> of key description in body jsons/bodies/add_new_entry.json
    And set value <inicio> of key start in body jsons/bodies/add_new_entry.json
    And set value <fin> of key end in body jsons/bodies/add_new_entry.json
    And set value {{projectId}} of key projectId in body jsons/bodies/add_new_entry.json
    And set value "116393a82cba6f5957b56a8a" of key taskId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 403

    Examples:
      | nombre                | inicio                 | fin |
      | "Hora 1 para crear"   | "2024-06-01T18:00:00Z" | "2024-06-01T18:00:00Z"|

  @BadRequest @AddTime
  Scenario: Bad Request Add a new time entry
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/162eb17f3c5df5418ad248a3/time-entries
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method POST
    Then the status code should be 400


