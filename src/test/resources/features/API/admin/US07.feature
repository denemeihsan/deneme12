#Reporter : Hümeyra Tayfun
#US Priority : LOW
  Feature: As an administrator, I should be able to access holiday data for staff members via API connection.

    Scenario: TC_01 When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials, the expected
       status code returned should be 200, and the message in the response body should confirm: "success".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/holidayList" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"

      Scenario Outline: TC_02 When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials, the information returned in the response body for
      the holiday with id(x) should be validated, including fields such as year and name.

        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/holidayList" path parameters
        * The API user sends a "GET" request and records the response.
        * The api user validates the "<year>" "<name>" of the response body with index <dataIndex>.

        Examples:
          | dataIndex | year  |name                                      |
          | 0         |  2025 |Spring                                    |
          | 2         |  2025 |23 Nisan Ulusal Egemenlik ve Çocuk Bayramı|

        Scenario: /api/holidayList endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde dönen status
          code'in 401 ve response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.

          * The api user constructs the base url with the "invalidToken" token.
          * The api user sets "api/holidayList" path parameters
          * The API user sends a "GET" request and records the response.
          * The api user verifies that the status code is 401
          * The api user verifies that the message information in the response body is "Unauthenticated."