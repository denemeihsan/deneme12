#Reporter : Murat Koparan
#US Priority : MEDIUM
  Feature:
    Scenario:
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/profile/allCountries" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"
      * The api user verifies id=223 && code="TR" && name="Turkey"

    Scenario: Information of the customer data with invalid authorization credentials should not be accessible via the API connection.
      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/profile/allCountries" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 401
      * The api user verifies that the message information in the response body is "Unauthenticated."