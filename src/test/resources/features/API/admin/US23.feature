#Reporter : Doruk Özgen
#US Priority : MEDIUM

Feature: US23 As an administrator, I want to be able to access detailed information about the
  department with the specified ID number via the API connection.

  Scenario Outline: TC01 Admin should be able to view and verify department information with valid authorization information and valid department id via API.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GETBODY request containing the id = <id> and records the response.
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


    Examples:
      | id |
      | 16 |

  Scenario Outline: TC02 When the administrator tries to view department information with valid authorization information and invalid department id via API, he/she should get 404 error response.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GETBODY request containing the id = <id> and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "department not found"


    Examples:
      | id |
      | 9999 |

  Scenario Outline: TC03 When the administrator tries to view department information with invalid authorization information and valid department id via API, he/she should receive 401 error response.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GETBODY request containing the id = <id> and records the response.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."

    Examples:
      | id |
      | 16 |