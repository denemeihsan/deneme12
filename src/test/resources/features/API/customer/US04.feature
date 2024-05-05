#Reporter : İhsan Altunışık
#US Priority : HIGH
  Feature: API - As a user, I should be able to edit my password information via API connection.
    Scenario: User verifies that he/she have successfully sent a POST body containing valid authorization information for changing password..
      * The api user constructs the base url with the "newCustomer" token.
      * The api user sets "api/change-password" path parameters
      * The api user prepares a POST request body.
      * The API user sends a "POST" request and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "password change successfully"
      * The user saves the password.