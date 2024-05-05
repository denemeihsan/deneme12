#Reporter : Senayda Akkaya
#US Priority : MEDIUM
  Feature: As a user, I should be able to access detailed information about the user who logged into the system via API connection.

    Scenario: TC01 When the user sends the given information, it should be verified that the status code returned is 200
    and the message information in the response body is "success".

      * The api user constructs the base url with the "customer" token.
      * The api user sets "api/customerGetUser" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"

    Scenario: TC02 When the user sends the given information, it should be verified that the data
    (first_name, last_name, email) in the response body returned is the same as the user information
    that entered the system.