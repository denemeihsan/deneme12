#Reporter : Senayda Akkaya
#US Priority : HIGH

Feature: As an administrator, I want to be able to delete holiday information for the specified id number via API connection.

  Scenario: TC01 User verify that the DELETE body with valid authorization and holiday ID is successfully deleted,with a status code of 202.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/holidayDelete" path parameters
    * The api user prepares a DELETEBODY request containing the id = 102 and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "holiday deleted successfully"

  Scenario: TC02 User confirms that when a DELETE body is sent with valid authorization information but an incorrect holiday ID,
  the response body displays a 404 status code and "holiday not found".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/holidayDelete" path parameters
    * The api user prepares a DELETEBODY request containing the id = 500 and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "holiday not found"


  Scenario: TC03 The user verifies that when a DELETE body is sent containing invalid authorization information
  and the holiday id to be deleted, the status code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/holidayDelete" path parameters
    * The api user prepares a DELETEBODY request containing the id = 102 and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."

  Scenario: TC04 User should verify that the Deleted_Id in the response body returned from the /api/holidayDelete
  endpoint is the same as the id in the DELETE request body sent to the /api/holidayDelete endpoint.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/holidayDelete" path parameters
    * The api user prepares a DELETEBODY request containing the id = 102 and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "holiday deleted successfully"
    * The api user verifies that Deleted_Id is same as the request body 102

  Scenario: TC05 User confirm if the requested holiday record from the API has been deleted by sending a GET request
  to the /api/holidayDetails endpoint with the Deleted_Id returned.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/holidayDelete" path parameters
    * The api user prepares a GETBODY request containing the id = 102 and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "holiday not found"
