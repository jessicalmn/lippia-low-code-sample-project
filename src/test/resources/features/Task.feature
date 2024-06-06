@Task
Feature: Task

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2

  @FindTask
  Scenario: Find tasks on project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces//662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks
    When execute method GET
    Then the status code should be 200

  @AddTask
  Scenario: Add a new task on project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks
    And body jsons/bodies/add_task.json
    When execute method POST
    Then the status code should be 201
    * define idTask = response.id

  @GetTaskbyID
  Scenario: Get Task by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks{{idTask}}
    When execute method GET
    Then the status code should be 200

  @UpdateTask
  Scenario: Update task on project
    Given call Task.feature@AddTask
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks/{{idTask}}
    And body jsons/bodies/update_task.json
    When execute method PUT
    Then the status code should be 200

  @DeleteTask
  Scenario: Delete task from project
    Given call Task.feature@UpdateTask
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks/{{idTask}}
    When execute method DELETE
    Then the status code should be 200
