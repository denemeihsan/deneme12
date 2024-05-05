#Reporter : Doruk Özgen
# US Priority : HIGH

Feature: US24 As an administrator, I want to be able to add a new department record via the API connection.

  Scenario: TC01 The administrator should be able to create and verify the creation of a department record by entering valid authorization information and required data via API.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/departmentAdd" path parameters
    * The api user prepares a POST request containing the department information to send to the api departmanAdd endpoint.
      | name | details | status |
      | Test Department | Test Department Details | 1 |
    * The API user sends a "POST" request and records the response.
    * The api user verifies that the status code is 201
    * The api user verifies that the message information in the response body is "department added successfully"

  Scenario: TC02 The administrator should be able to create and verify the creation of a department record by entering invalid authorization information and required data via the API.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/departmentAdd" path parameters
    * The api user prepares a POST request containing the department information to send to the api departmanAdd endpoint.
      | name | details | status |
      | Test Department | Test Department Details | 1 |
    * The API user sends a "POST" request and records the response.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."