#Reporter : Senayda Akkaya
#US Priority : HIGH
@US10
Feature: As an administrator, I want to be able to update holiday information for the specified id number via API connection.

  Scenario Outline: TC01 When the user sends a PATCH body containing the holiday id and the current holiday data (year, name, date)
  to be updated, the status code returned is 202 and the message in the response body is "holiday updated successfully".
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/holidayUpdate/<id>" path parameters
    * The api user prepares a PATCH request body for holiday add "2025" "Spring" "2025-01-01".
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "holiday updated successfully"
 Examples:
  | id |
  | 82 |

    Scenario Outline: TC02 The user verifies that the status code returned when valid authorization is sent is 400 and
                      the message information in the response body is "dublicate holiday request"
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/holidayUpdate/<id>" path parameters
      * The api user prepares a PATCH request body for holiday add "2025" "Spring" "2025-01-01".
      * The API user sends a "PATCH" request and records the response.
      * The api user verifies that the status code is 400
      * The api user verifies that the message information in the response body is "dublicate holiday request"
      Examples:
        | id |
        | 82 |

      Scenario Outline: TC03 Verifies that the status code returned is 404 and the message in the response
                          body is "holiday not found" when the user sends a PATCH body containing the wrong holiday id
                          and current holiday data with valid authorization information
        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/holidayUpdate/<id>" path parameters
        * The api user prepares a PATCH request body for holiday add "2025" "Spring" "2025-01-01".
        * The API user sends a "PATCH" request and records the response.
        * The api user verifies that the status code is 404
        * The api user verifies that the message information in the response body is "holiday not found"

        Examples:
          | id |
          | 2000 |


        Scenario Outline: TC04 User confirms that they have the holiday ID and data to be updated, but the authorization
                          information is invalid, and the response body is "Unauthenticated."
          * The api user constructs the base url with the "invalid" token.
          * The api user sets "api/holidayUpdate/<id>" path parameters
          * The api user prepares a PATCH request body for holiday add "2025" "Spring" "2025-01-01".
          * The API user sends a "PATCH" request and records the response.
          * The api user verifies that the status code is 401
          * The api user verifies that the message information in the response body is "Unauthenticated."
        Examples:
        | id |
        | 2000 |

    Scenario Outline: TC05 The api user verifies that the updated id information in the response body matches
                      the id path parameter specified in the endpoint.

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/holidayUpdate/<id>" path parameters
      * The api user prepares a PATCH request body for holiday add "2025" "Spring" "2025-01-01".
      * The API user sends a "PATCH" request and records the response.
      * The api user verifies that the updated id information in the response body matches the <id> path parameter specified in the endpoint.

      Examples:
        | id |
        | 82 |


    Scenario: TC06 User must confirm the update of the holiday record via the API by sending a GET request to
                the /api/holidayDetails endpoint with the updated_Id returned in the response body.
   * The api user constructs the base url with the "admin" token.
   * The api user sets "api/holidayDetails" path parameters