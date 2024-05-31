@FindProjectError
Feature: Find Projects Errors

  Background:
    And header Content-Type = application/json
    And header Accept = */*

  @ProjectNoExiste
  Scenario: Buscar proyecto no existente
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/663c3d872021485a0020bbad
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 400

  @WorkspaceNoExiste
  Scenario: Buscar proyecto existente con workspace no existente - Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a4/projects/663c3d872021485a0020bbad
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 403

  @InvalidApiKey
  Scenario: Api key invalida - Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/662eb17f3c5df5418ad248a3/projects/663c3d872021485a0020bbac
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQmMWI2
    When execute method GET
    Then the status code should be 401

  @WorkspaceNoExiste
  Scenario: Buscar proyecto con worskpace invalido - Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspaces/664a1496f1902e64cf1d8058/projects/663c3d872021485a0020bbac
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 400

  @EndpointInvalido
  Scenario: Buscar proyecto con endpoint incorrecto - Find project by ID
    Given base url https://api.clockify.me/api/v1
    And endpoint /workspace/662eb17f3c5df5418ad248a3/projects/663c3d872021485a0020bbac
    And header x-api-key = MGE3ZGVmNWItYTRmYS00MGI5LThhNjgtNzE2NTEzOTQzMWI2
    When execute method GET
    Then the status code should be 404