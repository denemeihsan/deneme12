#Reporter : İhsan Altunışık
#US Priority : LOW
  Feature: As an administrator, I want to be able to access the FAQ's list via API connection.
    Scenario: Detailed information of the customer data with valid authorization credentials should be accessible via the API connection.
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/faqsList" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"
      * The api user prepares a GETBODY request containing the id = 1 and records the response.
      * In the response body for the FAQ with id = 1 should be validated, including the "How does the site work? " information.

    Scenario:Information of the customer data with invalid authorization credentials should not be accessible via the API connection.
      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/faqsList" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 401
      * The api user verifies that the message information in the response body is "Unauthenticated."