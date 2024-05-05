#Reporter : İhsan Altunışık
#US Priority : HIGH
Feature:As an administrator, I want to be able to update the information of the FAQ record with the specified FAQ id via API connection.
  Scenario Outline: The user should perform a valid PATCH request
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user prepares a PATCH request body for faq.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "faqs updated successfully"
    * The api user verifies that updated_Id is same as the param <id>
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/faqsDetails" path parameters
    * The api user prepares a GETBODY request containing the id = <id> and records the response.
    * The api user verifies that updated id is same as the GET response body <id> "faqsDetails"
    Examples:
      |id|
      |4 |

  Scenario Outline: The user should not perform a PATCH request with invalid id
    * The api user constructs the base url with the "<api>" token.
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user prepares a PATCH request body for faq.
    * The API user sends a "PATCH" request and records the response.
    * The api user verifies that the status code is <code>
    * The api user verifies that the message information in the response body is "<message>"
    Examples:
      |api    |id   |code|message         |
      |admin  |10000|404 |faqs not found  |
      |invalid|4    |401 |Unauthenticated.|