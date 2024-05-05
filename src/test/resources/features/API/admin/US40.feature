#Reporter : Azim Kaya
#US Priority : LOW
Feature:As an administrator, I want to be able to access all customer addresses registered in the.
 Scenario:TC-01 When a GET request body containing valid authorization credentials is sent to the.
   * The api user constructs the base url with the "admin" token.
   * The api user sets "api/profile/allAddressList" path parameters
   * The API user sends a "GET" request and records the response.
   * The api user verifies that the status code is 200
   * The api user verifies that the message information in the response body is "success"

 Scenario:TC-02 When a GET request body containing valid authorization credentials is sent to the.
   * The api user constructs the base url with the "admin" token.
   * The api user sets "api/profile/allAddressList" path parameters
   * The API user sends a "GET" request and records the response.
   * The api user validates the 5 0 "ra_name","ra_mail@gmail.com","0123456789123456","DE","18744","1357","82","45857" of the response body.

 Scenario:TC-03 When a GET request body containing invalid authorization credentials is sent to the.
   * The api user constructs the base url with the "invaled" token.
   * The api user sets "api/profile/allAddressList" path parameters
   * The API user sends a "GET" request and records the response.
   * The api user verifies that the status code is 401
   * The api user verifies that the message information in the response body is "Unauthenticated."