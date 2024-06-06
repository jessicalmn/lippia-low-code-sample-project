@Task
Feature: Task

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2

  @AddTask
  Scenario Outline: Add a new task on project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks
    And set value <nombre_task> of key name in body jsons/bodies/add_task.json
    When execute method POST
    Then the status code should be 201
    And response should be name = <nombre_task>

    Examples:
      | nombre_task  |
      | "Tarea 1 para crear"|
      | "Tarea 2 para buscar"|
      | "Tarea 3 para Actualizar y eliminar"|

  @FindTask
  Scenario: Find tasks on project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces//662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks
    When execute method GET
    Then the status code should be 200
    * define idTask1 = response[0].id
    * define idTask2 = response[1].id
    * define idTask3 = response[2].id

  @GetTaskbyID
  Scenario: Get Task by ID
    Given call Task.feature@FindTask
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks/{{idTask2}}
    When execute method GET
    Then the status code should be 200
    And response should be id = {{idTask2}}

  @UpdateTask
  Scenario: Update task on project
    Given call Task.feature@FindTask
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks/{{idTask3}}
    And set value "Tarea Actualizacion de estado" of key name in body jsons/bodies/update_task.json
    When execute method PUT
    Then the status code should be 200
    And response should be id = {{idTask3}}

  @DeleteTask
  Scenario: Delete task from project
    Given call Task.feature@UpdateTask
    And base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/664a17f4accb3a560e2898e8/tasks/{{idTask3}}
    When execute method DELETE
    Then the status code should be 200
    And response should be id = {{idTask3}}



