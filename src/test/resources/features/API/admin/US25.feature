#Reporter : Murat Koparan
#US Priority : HIGH
  Feature: As an administrator, I want to be able to update department information with the specified ID number via the API connection.
    Scenario Outline: The user should perform a valid PATCH request
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/departmentUpdate/<id>" path parameters
      * The api user prepares a PATCH request body for department.
      * The API user sends a "PATCH" request and records the response.
      * The api user verifies that the status code is 202
      * The api user verifies that the message information in the response body is "department updated successfully"
      * The api user verifies that updated_Id is same as the param <id>
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/departmentDetails" path parameters
      * The api user prepares a GETBODY request containing the id = <id> and records the response.
      * The api user verifies that updated id is same as the GET response body <id> "departmentDetails"
      Examples:
        |id |
        |130|

    Scenario Outline: The user should not perform a PATCH request with invalid id
      * The api user constructs the base url with the "<api>" token.
      * The api user sets "api/departmentUpdate/<id>" path parameters
      * The api user prepares a PATCH request body for department.
      * The API user sends a "PATCH" request and records the response.
      * The api user verifies that the status code is <code>
      * The api user verifies that the message information in the response body is "<message>"
      Examples:
        |api    |id   |code|message             |
        |admin  |10000|404 |department not found|
        |invalid|130  |401 |Unauthenticated.    |