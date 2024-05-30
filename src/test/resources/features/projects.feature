@Project
Feature: Project

  Background:
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And header Content-Type = application/json
    And header Accept = */*

@FindProject
  Scenario: Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/663c3d872021485a0020bbac
    When execute method GET
    Then the status code should be 200


  @GetAllProjects
  Scenario: Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    When execute method GET
    Then the status code should be 200

  @addProjectName
  Scenario: Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    And body jsons/bodies/add_new_project.json
    When execute method POST
    Then the status code should be 201

  @addProjectParameters
  Scenario: Add a new project
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    And body jsons/bodies/add_new_project_param.json
    When execute method POST
    Then the status code should be 201

  @updateProject
  Scenario Outline: Update project on workspace
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/663c3d872021485a0020bbac
    And set value <nombre_project> of key name in body jsons/bodies/update_project.json
    And set value <nota> of key note in body jsons/bodies/update_project.json
    When execute method PUT
    Then the status code should be 200
    And response should be name = <nombre_project>
    And response should be note = <nota>

    Examples:
      | nombre_project  | nota          |
      | "nombreDos"     | "Nota Prueba dos" |