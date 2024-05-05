#Reporter : Hümeyra Tayfun
#US Priority : LOW
  Feature: As a user, I want to view the addresses in my profile via the API connection.

    Scenario:TC_01 When a GET request body containing valid authorization information is sent to the /api/profile/address-list endpoint, the returned status code
     should be 200, and the message information in the response should be verified as "success".

      * The api user constructs the base url with the "customer" token.
      * The api user sets "api/profile/address-list" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"

      Scenario Outline: TC_02 When a GET request body containing valid authorization information is sent to the /api/profile/address-list endpoint,
      the response body for the address with ID 'x' should be verified to contain the following information:
      customer_id, name, email, phone, address, city, state, country, postal_code, is_shipping_default, is_billing_default, created_at, updated_at.
        * The api user constructs the base url with the "customer" token.
        * The api user sets "api/profile/address-list" path parameters
        * The API user sends a "GET" request and records the response.
        * The api user validates the "<year>" "<name>" of the response body with index <dataIndex>.

        Examples:
          | dataIndex | year  |name                                      |
          | 0         |  2025 |Spring                                    |
          | 2         |  2025 |23 Nisan Ulusal Egemenlik ve Çocuk Bayramı|

        Scenario: When a GET request body containing invalid authorization information is sent to the /api/profile/address-list endpoint, the returned status code
        should be 401, and the message information in the response should be verified as "Unauthenticated.".
          * The api user constructs the base url with the "invalidToken" token.
          * The api user sets "api/profile/address-list" path parameters
          * The API user sends a "GET" request and records the response.
          * The api user verifies that the status code is 401
          * The api user verifies that the message information in the response body is "Unauthenticated."