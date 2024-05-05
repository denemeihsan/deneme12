#Reporter : Murat Koparan
#US Priority : MEDIUM
  Feature: As an customer, I should be able to access detailed information of the user with the specified id number via API connection.

    Scenario: Detailed information of the customer data with valid authorization credentials should be accessible via the API connection.
      * The api user constructs the base url with the "customer" token.
      * The api user sets "api/get-user" path parameters
      * The api user prepares a GETBODY request containing the id = 2 and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"
      * The api user verifies the content of the data 2, "Customerr", "Due", 4, "customer@gmail.com", 1, 1, "en", 2, "USD", "Customerr Due" in the response body.

    Scenario Outline: The response of the customer data with invalid id  should indicate that there is no such customer.
      * The api user constructs the base url with the "<api>" token.
      * The api user sets "api/get-user" path parameters
      * The api user prepares a GETBODY request containing the id = <id> and records the response.
      * The api user verifies that the status code is <code>
      * The api user verifies that the message information in the response body is "<message>"
      Examples:
        |api     |id    |code|message         |
        |customer|324235|404 |user not found  |
        |invalid |2     |401 |Unauthenticated.|