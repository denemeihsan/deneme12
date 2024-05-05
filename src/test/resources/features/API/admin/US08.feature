#Reporter : Reyyan Mert
#US Priority : MEDIUM
  Feature: As an administrator, I should be able to access detailed information about the holiday with the specified id number via
    API connection.

  Scenario Outline: When a GET request containing valid authorization credentials and the holiday id data for the desired
  detailed information is sent to the /api/holidayDetails endpoint, the expected status code returned should be 200,
  and the message in the response body should confirm: "success".


    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GETBODY request containing the id = <id> and records the response.
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"
    * The api user verifies the content of the data <id>, "<year>", "<name>", <type>, "<date>","<created_at>","<updated_at>" in the response body.

    Examples:
    | id | year   |               name                      |type| date     | created_at                | updated_at                |
    | 3  | 2023   |23 Nisan Ulusal Egemenlik ve Çocuk Bayram| 0  |2023-04-23|2024-03-12T15:32:29.000000Z|2024-03-12T15:32:29.000000Z|

      Scenario Outline: : When a GET request containing valid authorization credentials and an incorrect (non-existent in the system)
      holiday id is sent to the /api/holidayDetails endpoint, the expected status code returned should be 404,
      and the message in the response body should confirm: "holiday not found".

        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/holidayDetails" path parameters
        * The api user prepares a GETBODY request containing the id = <id> and records the response.
        * The api user verifies that the status code is 404
        * The api user verifies that the message information in the response body is "holiday not found"

        Examples:
          | id |
          | 35 |

      Scenario Outline: When a GET request containing invalid authorization credentials and the holiday id data for the desired detailed information
      is sent to the /api/holidayDetails endpoint, the expected status code returned should be 401, and the message in the response body should
      confirm: "Unauthenticated."

        * The api user constructs the base url with the "invalid" token.
        * The api user sets "api/holidayDetails" path parameters
        * The api user prepares a GETBODY request containing the id = <id> and records the response.
        * The api user verifies that the status code is 401
        * The api user verifies that the message information in the response body is "Unauthenticated."

        Examples:
          | id |
          | 2  |