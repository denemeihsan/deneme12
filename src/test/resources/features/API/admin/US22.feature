#Reporter : Reyyan Mert
#US Priority : LOW

  Feature: As an administrator, I want to be able to access departments via the API connection.

    Scenario Outline: When a GET request containing valid authorization information is sent to the /api/departmentList
    endpoint, the returned status code should be 200, and the message information in the response body should be verified
    as "success".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/departmentList " path parameters
      * The api user prepares a GETBODY request containing the id = <id> and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"
      * The api user verifies the content of the data "<name>","<details>" in the response body.


      Examples:
      |id |name  | details        |
      |1  |Sales |Sales Department|

      Scenario Outline: When a GET request containing invalid authorization information is sent to the /api/departmentList
      endpoint, the returned status code should be 401, and the message information in the response body should be verified
      as "Unauthenticated.".
        * The api user constructs the base url with the "invalid" token.
        * The api user sets "api/departmentList " path parameters
        * The api user prepares a GETBODY request containing the id = <id> and records the response.
        * The api user verifies that the status code is 401
        * The api user verifies that the message information in the response body is "Unauthenticated."

        Examples:
        |id  |
        | 1  |