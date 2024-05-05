#Reporter : Doruk Özgen
#US Priority : HIGH

Feature: US36 As a user, I want to be able to delete the information of the address in my profile with the specified ID number through the API connection.

  Scenario Outline: TC01 The user should be able to delete and verify the address in their profile by submitting valid authorization information and the address id to be deleted.
    * The api user constructs the base url with the "customer" token.
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "address deleted successfully"
    * The api user verifies that Deleted_Id is same as the request body <id>

    Examples:
      | id |
      | 251 |

  Scenario Outline: TC02 The user should receive a 401 error code when the API tries to delete the address in their profile by sending invalid authorization information and the address id to be deleted.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."

    Examples:
      | id |
      | 251 |

  Scenario Outline: TC02 The user should receive a 404 error code when the API tries to delete the address in their profile by sending VALİD authorization information and invalid address id to be deleted.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
    * The API user sends a "DELETE" request and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "address not found"

    Examples:
      | id |
      | 251 |