#Reporter : Senayda Akkaya
#US Priority : LOW
  Feature: As an administrator, I should be able to access detailed information of the user with the
            specified id number via API connection.

  Scenario: TC01 User verifies whether a customer created through the API using an API connection exists in the customer list.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/get-users" path parameters
    * The API user sends a "GET" request and records the response.
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"
    @05
    Scenario Outline: TC02 When a GET request containing valid authorization information is sent to the /api/get-users endpoint,
    the returned information in the response body for the reason with ID 'x' should be validated.

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/get-users" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies the content of the data <id>, "<first_name>", "<username>", "<email>", "<name>" in the response body.

      Examples:
        |id | first_name | username  |      email          |name|
        | 224| dsfsd      | null      |sddfsddf@hotmail.com| dsfsd|


      Scenario: TC03 When a GET request with invalid authorization information is sent to the /api/get-users endpoint, it
      should be verified that the returned status code is 401, and the message in the response body is "Unauthenticated.".

        * The api user constructs the base url with the "invalidToken" token.
        * The api user sets "api/get-users" path parameters
        * The API user sends a "GET" request and records the response.
        * The api user verifies that the status code is 401
        * The api user verifies that the message information in the response body is "Unauthenticated."