#Reporter : Azim Kaya
#US Priority : HIGH
Feature:As an administrator, I want to be able to update coupon information with the specified
Scenario:TC-01 When a DELETE body containing valid authorization information and the coupon ID to be
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/coupon/couponDelete" path parameters
  * The api user prepares a DELETEBODY request containing the id = 213 and records the response.
  * The API user sends a "DELETE" request and records the response.
  * The api user verifies that the status code is 202
  * The api user verifies that the message information in the response body is "coupon deleted successfully"

Scenario:TC-02 When a DELETE body containing valid authorization information and an incorrect
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/coupon/couponDelete" path parameters
  * The api user prepares a DELETEBODY request containing the id = 57777 and records the response.
  * The API user sends a "DELETE" request and records the response.
  * The api user verifies that the status code is 404
  * The api user verifies that the message information in the response body is "coupon not found"

Scenario:TC-03 When a DELETE body containing invalid authorization information and the coupon ID to
  * The api user constructs the base url with the "invalidToken" token.
  * The api user sets "api/coupon/couponDelete" path parameters
  * The api user prepares a DELETEBODY request containing the id = 66 and records the response.
  * The API user sends a "DELETE" request and records the response.
  * The api user verifies that the status code is 401
  * The api user verifies that the message information in the response body is "Unauthenticated."

Scenario:TC-04 The Deleted_Id information in the response body returned from the
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/coupon/couponDelete" path parameters
  * The api user prepares a DELETEBODY request containing the id = 215 and records the response.
  * The API user sends a "DELETE" request and records the response.
  * The api user verifies that the status code is 202
  * The api user verifies that the message information in the response body is "coupon deleted successfully"
  * The api user verifies that Deleted_Id is same as the request body 215

  Scenario:TC-05 The deletion of the coupon record via the API should be verified from the API
  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GETBODY request containing the id = 212 and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "coupon not found"