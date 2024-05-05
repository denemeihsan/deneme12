#Reporter : İhsan Altunışık
#US Priority : HIGH
  Feature: As an administrator, I want to be able to delete the record specified by the FAQ's id via the API connection.
    Scenario Outline: The user should perform a valid DELETE request
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/faqsDelete" path parameters
      * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
      * The API user sends a "DELETE" request and records the response.
      * The api user verifies that the status code is 202
      * The api user verifies that the message information in the response body is "faqs deleted successfully"
      * The api user verifies that Deleted_Id is same as the request body <id>
        Examples:
        |id|
        |70|

    Scenario Outline: The user should not perform a DELETE request with invalid id
      * The api user constructs the base url with the "<api>" token.
      * The api user sets "api/faqsDelete" path parameters
      * The api user prepares a DELETEBODY request containing the id = <id> and records the response.
      * The API user sends a "DELETE" request and records the response.
      * The api user verifies that the status code is <code>
      * The api user verifies that the message information in the response body is "<message>"
        Examples:
        |api    |id   |code|message         |
        |admin  |10000|404 |faqs not found  |
        |invalid|4    |401 |Unauthenticated.|