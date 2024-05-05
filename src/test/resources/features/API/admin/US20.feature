#Reporter : Hümeyra Tayfun
#US Priority : HIGH
  Feature: As an administrator, I want to be able to update the Refund&Reason information
    with the specified ID number via the API connection.

   @20
    Scenario Outline: TC_01 When a PATCH request body containing valid authorization information, the Refund&Reason ID to be updated,
    and necessary data (reason) is sent to the /api/refundReasonUpdate/{id} endpoint, the returned status code
    should be 202, and the message information in the response body should be verified as "refundReason updated successfully".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonUpdate/<id>" path parameters
      * The api user prepares a request containing the "<reason>" data to send to the api refundReasonUpdate endpoint.
      * The API user sends a "PATCH" request and records the response.
      * The api user verifies that the status code is 202
      * The api user verifies that the message information in the response body is "refundReason updated successfully"
      * The api user verifies that updated_Id is same as the param <id>

      Examples:
        | id | reason   |
        | 94 | Ankara Baskent |

    Scenario Outline: TC_02 When a PATCH request body containing valid authorization information and an incorrect (non-existent in the
    system) Refund&Reason ID, along with necessary data (reason), is sent to the /api/refundReasonUpdate/{id}
    endpoint, the returned status code should be 404, and the message information in the response body should be
    verified as "refundReason not found".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonUpdate/<id>" path parameters
      * The api user prepares a request containing the "<reason>" data to send to the api refundReasonUpdate endpoint.
      * The API user confirms the "unauthorizedExceptionMessage".

      Examples:
        | id | reason                 |
        | 26 | Product arrived lately |

    Scenario Outline: TC_03 When a PATCH request body containing invalid authorization information, along with the Refund&Reason ID to
    be updated and necessary data (reason), is sent to the /api/refundReasonUpdate/{id} endpoint, the returned
    status code should be 401, and the message information in the response body should be verified
    as "Unauthenticated.".

      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/refundReasonUpdate/<id>" path parameters
      * The api user prepares a request containing the "<reason>" data to send to the api refundReasonUpdate endpoint.
      * The API user confirms the "unauthorizedExceptionMessage".

      Examples:
        | id | reason                 |
        | 25 | Product arrived lately |

    Scenario Outline: TC_04 The update of the desired Refund&Reason record via the API should be validated from the API.
    (The update of the record can be confirmed by sending a GET request to the /api/refundReasonDetails endpoint
    with the updated_Id returned in the response body.)

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/refundReasonDetails" path parameters
      * The api user prepares a GETBODY request containing the id = <id> and records the response.
      * The api user verifies that the reason information in the response body is "<reasonValue>".

      Examples:
        | id | reasonValue    |
        | 94 | Ankara Baskent |
        | 24 | Product arrived lately |