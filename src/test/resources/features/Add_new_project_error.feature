@AddNewProjectError
Feature: Add New Project Errors

  Background:
    And header Content-Type = application/json
    And header Accept = */*

  @InvalidApiKey @AddNewProject
  Scenario: Invalid api Key - Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQmMWI2
    And body jsons/bodies/add_new_project.json
    When execute method POST
    Then the status code should be 401

  @WorkspaceNoExiste @AddNewProject
  Scenario: Agregar proyecto con worskpace invalido - Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a0/projects
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And body jsons/bodies/add_new_project.json
    When execute method POST
    Then the status code should be 403

    @ValidacionLongitud @AddNewProject
  Scenario: Agregar proyecto con nombre de proyecto con 1 caracter - Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And set value "a" of key name in body jsons/bodies/update_project.json
    When execute method POST
    Then the status code should be 400

  @ProyectoExistente @AddNewProject
  Scenario: Agregar proyecto con nombre de proyecto ya existente - Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And set value "channels" of key name in body jsons/bodies/update_project.json
    When execute method POST
    Then the status code should be 400

    @RequestIncompleto @AddNewProject
  Scenario: Agregar proyecto con request sin campo obligatorio - Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And body jsons/bodies/add_new_project_sinnombre.json
    When execute method POST
    Then the status code should be 400