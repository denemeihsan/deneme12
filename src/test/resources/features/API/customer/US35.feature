#Reporter : Doruk Özgen
#US Priority : HIGH

Feature: US35 As a user, I want to be able to update the information of the address in my profile with the specified ID number through the API connection.

  Scenario Outline: TC01 User should be able to update and verify address information with valid authorization information via API.
    * The api user constructs the base url with the "customer" token.
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the address information to send to the api customerAddressUpdate endpoint.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "address updated successfully"
    * The api user verifies that updated_Id is same as the param <id>

    Examples:
      | id |
      | 251 |

  Scenario Outline: TC02 When the user tries to update address information with invalid authorization information via API, they should receive 401 error response.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the address information to send to the api customerAddressUpdate endpoint.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."

    Examples:
      | id |
      | 251 |

  Scenario Outline: TC03 The user should receive a 404 error response when trying to update address information with an invalid address id via the API.
    * The api user constructs the base url with the "customer" token.
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the address information to send to the api customerAddressUpdate endpoint.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "Address not found."

    Examples:
      | id |
      | 10012 |

  Scenario Outline: TC04 When the user tries to update the address information with valid authorization information via API by entering the email incorrectly, the user should receive error response 422.
    * The api user constructs the base url with the "customer" token.
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the address information with incorrect email format to send to the api customerAddressUpdate endpoint.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 422
    * The api user verifies that the message information in the response body is "The email must be a valid email address."

    Examples:
      | id |
      | 251 |