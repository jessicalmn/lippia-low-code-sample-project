@FindProject
Feature: Project

  Background:
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    And header Content-Type = application/json
    And header Accept = */*

  @FindProjectByID
  Scenario: Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/663c3d872021485a0020bbac
    When execute method GET
    Then the status code should be 200

  @GetAllProjects
  Scenario: Get all projects on workspace
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects
    When execute method GET
    Then the status code should be 200
