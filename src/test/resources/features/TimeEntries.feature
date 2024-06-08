@TimeEntries
Feature: Time Entries

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    * define workspaceId = "662eb17f3c5df5418ad248a3"
    * define projectId = "664a06cfd4b3fe510d925782"
    * define taskId = "666393a82cba6f5957b56a8a"

  @AddTime
  Scenario Outline: Add a new time entry
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries
    And set value <nombre> of key description in body jsons/bodies/add_new_entry.json
    And set value <inicio> of key start in body jsons/bodies/add_new_entry.json
    And set value <fin> of key end in body jsons/bodies/add_new_entry.json
    And set value {{projectId}} of key projectId in body jsons/bodies/add_new_entry.json
    And set value {{taskId}} of key taskId in body jsons/bodies/add_new_entry.json
    When execute method POST
    Then the status code should be 201
    And response should be description = <nombre>
    * define idTime = response.id

    Examples:
      | nombre                | inicio                 | fin |
      | "Hora 1 para crear"   | "2024-06-01T18:00:00Z" | "2024-06-01T18:00:00Z"|


  @GetTime
  Scenario: Get a specific time entry on workspace
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    When execute method GET
    Then the status code should be 200
    And response should be id = {{idTime}}


  @UpdateTime
  Scenario Outline: Get a specific time entry on workspace
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    And set value <nombre> of key description in body jsons/bodies/update_entry.json
    And set value <inicio> of key start in body jsons/bodies/update_entry.json
    And set value <fin> of key end in body jsons/bodies/update_entry.json
    And set value {{projectId}} of key projectId in body jsons/bodies/update_entry.json
    And set value {{taskId}} of key taskId in body jsons/bodies/update_entry.json
    When execute method PUT
    Then the status code should be 200
    And response should be id = {{idTime}}
    Examples:
      | nombre                | inicio                 | fin |
      | "Hora 1 modificada"   | "2024-06-01T18:00:00Z" | "2024-06-01T18:00:00Z"|


  @DeleteTime
  Scenario: Delete time entry from workspace
    Given call TimeEntries.feature@AddTime
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/{{workspaceId}}/time-entries/{{idTime}}
    When execute method DELETE
    Then the status code should be 204
