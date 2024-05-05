#Reporter : Azim Kaya
#US Priority : MEDIUM
Feature:As an administrator, I want to be able to access the address information of a customer with
Scenario:TC-01 When a GET request body containing valid authorization credentials and the desired
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/addressDetails" path parameters
  * The api user prepares a GETBODY request containing the id = 66 and records the response.
  * The api user verifies that the status code is 200
  * The api user verifies that the message information in the response body is "success"

Scenario:TC-02 When a GET request body containing valid authorization credentials and the desired
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/addressDetails" path parameters
  * The api user prepares a GETBODY request containing the id = 66 and records the response.
  * The api user verifies the content of the data 66 120,"Simge atalay","customer.simge@buysellcycle.com","12364567826","ankara","40314","3669","223","10600", 0 , 0 ,"2024-03-25T06:38:26.000000Z","2024-03-27T11:21:10.000000Z",in the response body.

Scenario:TC-03 When a GET request body containing valid authorization credentials and an incorrect
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/profile/addressDetails" path parameters
  * The api user prepares a GETBODY request containing the id = 366911 and records the response.
  * The api user verifies that the status code is 404
  * The api user verifies that the message information in the response body is "address not found"

Scenario:TC-04 When a GET request body containing invalid authorization credentials and the desired
  * The api user constructs the base url with the "invalid" token.
  * The api user sets "api/profile/addressDetails" path parameters
  * The api user prepares a GETBODY request containing the id = 66 and records the response.
  * The api user verifies that the status code is 401
  * The api user verifies that the message information in the response body is "Unauthenticated."