#Reporter : Hümeyra Tayfun
#US Priority : HIGH
  Feature: As an administrator, I want to be able to delete Refund&Reason information
          with the specified ID number via the API connection.

    Scenario:TC_01 When a DELETE body containing valid authorization information and the refund&reason ID to be deleted is sent
    to the /api/refundReasonDelete endpoint, the returned status code should be 202, and the message information
    in the response body should be verified as "refundReason deleted successfully".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonDelete" path parameters
      * The api user prepares a DELETEBODY request containing the id = 98 and records the response.
      * The API user sends a "DELETE" request and records the response.
      * The api user verifies that the status code is 202
      * The api user verifies that the message information in the response body is "refundReason deleted successfully"

    Scenario: TC_02 When a DELETE request body containing valid authorization information and an incorrect (non-existent in the system) refund&reason ID is sent to the /api/refundReasonDelete endpoint, the returned status code should be 404,
    and the message information in the response body should be verified as "refundReason not found".
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonDelete" path parameters
      * The api user prepares a DELETEBODY request containing the id = 150 and records the response.
      * The API user sends a "DELETE" request and records the response.
      * The api user verifies that the status code is 404
      * The api user verifies that the message information in the response body is "refundReason not found"

    Scenario: TC_03 When a DELETE body containing invalid authorization information and the refund&reason ID to be deleted is sent to the /api/refundReasonDelete endpoint, the returned status code should be 401,
    and the message information in the response body should be verified as "Unauthenticated."
      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/refundReasonDelete" path parameters
      * The api user prepares a DELETEBODY request containing the id = 98 and records the response.
      * The API user sends a "DELETE" request and records the response.
      * The api user verifies that the status code is 401
      * The api user verifies that the message information in the response body is "Unauthenticated."

    Scenario: TC_04 The Deleted_Id information in the response body from the /api/refundReasonDelete endpoint should be verified to be identical to the id
    information in the DELETE request body sent to the /api/refundReasonDelete endpoint.
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonDelete" path parameters
      * The api user prepares a DELETEBODY request containing the id = 98 and records the response.
      * The API user sends a "DELETE" request and records the response.
      * The api user verifies that the status code is 202
      * The api user verifies that the message information in the response body is "refundReason deleted successfully"
      * The api user verifies that Deleted_Id is same as the request body 98

    Scenario: TC_05 The deletion of the desired Refund&Reason record via the API should be validated from the API.
    (The deletion of the record can be confirmed by sending a GET request to
    the /api/refundReasonDetails endpoint with the Deleted_Id returned in the response body.)
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonDetails" path parameters
      * The api user prepares a GETBODY request containing the id = 98 and records the response.
      * The api user verifies that the status code is 404
      * The api user verifies that the message information in the response body is "refund Reason  not found"