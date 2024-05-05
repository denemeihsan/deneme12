#Reporter : Reyyan Mert
#US Priority : HIGH
  Feature: As an administrator, I want to be able to delete the address information of the customer with the specified
    ID number via the API connection.

Scenario Outline: When a DELETE request body containing valid authorization information and the address ID to be deleted
is sent to the /api/profile/deleteAddress endpoint, the returned status code should be 202, and the message in the response
body should confirm that it is "address deleted successfully".

  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/deleteAddress" path parameters
  * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
  * The API user sends a "DELETE" request and records the response.
  * The api user verifies that the status code is 202
  * The api user verifies that the message information in the response body is "address deleted successfully"
  * The api user verifies that Deleted_Id is same as the request body <id>


  Examples:
    |id |
    |255|

  Scenario Outline: When a DELETE request body containing valid authorization information and an incorrect (non-existent in the system)
  address ID is sent to the /api/profile/deleteAddress endpoint, the returned status code should be 404, and the message in the response
  body should confirm that it is "address not found".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/profile/deleteAddress" path parameters
    * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
    * The API user confirms the "notFoundExceptionMessage".

    Examples:
      |id |
      |1025|

    Scenario Outline: When a DELETE request body containing invalid authorization information and the address ID to be deleted is
    sent to the /api/profile/deleteAddress endpoint, the returned status code should be 401, and the message in the response
    body should confirm that it is "Unauthenticated.".

      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/profile/deleteAddress" path parameters
      * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
      * The API user confirms the "unauthorizedExceptionMessage".

      Examples:
        |id |
        |257|