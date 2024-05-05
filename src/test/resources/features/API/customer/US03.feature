#Reporter : İhsan Altunışık
#US Priority : MEDIUM
  Feature: As a user, I should be able to access the financial information of the customer via API connection.
    Scenario Outline: Detailed information of the customer data with valid authorization credentials should be accessible via the API connection.
      * The api user constructs the base url with the "<api>" token.
      * The api user sets "api/profile/get-customer-data" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is <code>
      * The api user verifies that the message information in the response body is "<message>"
      Examples:
      |api     |code|message         |
      |customer|200 |success         |
      |invalid |401 |Unauthenticated.|