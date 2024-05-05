#Reporter : Azim Kaya
#US Priority : MEDIUM
@kaya
Feature:As an administrator, I want to be able to access the city information registered in
Scenario:TC-01 When a GET request body containing valid authorization credentials and the desired
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/stateCities" path parameters
  * The api user prepares a GETBODY request containing the id = 5996 and records the response.
  * The api user verifies that the status code is 200
  * The api user verifies that the message information in the response body is "success"

Scenario:TC-02 When a GET request body containing valid authorization credentials and a state_id
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/stateCities" path parameters
  * The api user prepares a GETBODY request containing the id = 66 and records the response.
  * The api user verifies that the status code is 200
  * The api user verifies that the message information in the response body is "success"

Scenario:TC-03 When a GET request body containing valid authorization credentials and an incorrect
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/stateCities" path parameters
  * The api user prepares a GETBODY request containing the id = 3669 and records the response.
  * The api user verifies that the status code is 404
  * The api user verifies that the message information in the response body is "address not found"

Scenario:TC-04 When a GET request body containing invalid authorization credentials and the desired
  * The api user constructs the base url with the "invalidToken" token.
  * The api user sets "api/profile/stateCities" path parameters
  * The API user sends a "GET" request and records the response.
  * The api user verifies that the status code is 401
  * The api user verifies that the message information in the response body is "Unauthenticated."