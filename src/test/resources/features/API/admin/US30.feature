#Reporter : Azim Kaya
#US Priority : HIGH
  Feature: As an administrator, I want to be able to updatecoupon information with the specified
    Scenario:TC-01 When a PATCH request body containing valid authorization information, thecoupon
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coupon/couponUpdate/45" path parameters
    * The api user prepares a PATCH request body for couponUpdate.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the message information in the response body is "coupon updated successfully"
    * The api user verifies that the status code is 202

  Scenario:TC-02 When a PATCH request body containing valid authorization information and anincorrect
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coupon/couponUpdate/47777" path parameters
    * The api user prepares a PATCH request body for couponUpdate.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "coupon not found"

  Scenario:TC-03 When a PATCH request body containing invalid authorization information,along with
    * The api user constructs the base url with the "invalidToken" token.
    * The api user sets "api/coupon/couponUpdate/45" path parameters
    * The api user prepares a PATCH request body for couponUpdate.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."

    Scenario:TC-04 The updated_Id information in the response body from the/api/coupon/couponUpdate/{id}
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coupon/couponUpdate/45" path parameters
    * The api user prepares a PATCH request body for couponUpdate.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that updated_Id is same as the param 45

  Scenario Outline: TC-05 The update of the coupon record via the API should be verified from the API itself.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coupon/couponUpdate/45" path parameters
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that updated_Id is same as the param <id>

      Examples:
        | id |
        | 45 |