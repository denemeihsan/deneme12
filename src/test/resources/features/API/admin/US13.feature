#Reporter : Senayda Akkaya
#US Priority : MEDIUM

  Feature: As an administrator, I want to be able to access the details of the FAQ with the specified id number
            via API connection.

  Scenario: TC01 User sends a GET request to the /api/faqsDetails endpoint with valid authorization and faq ID, verifies a 200 status code
            and "success" message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/faqsDetails" path parameters
    * The api user prepares a GETBODY request containing the id = 2 and records the response.
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

Scenario Outline: TC02 User sends a GET request to the /api/faqsDetails endpoint with valid authorization information
                    and faq id, and the response body verifies the data (id, user_id, title, description, status,
                    created_at, updated_at).

  * The api user constructs the base url with the "admin" token.
  * The api user sets "api/faqsDetails" path parameters
  * The API user sends a "GET" request and records the response.
  * The api user verifies the content of the data 2 "null", "How do I know when my order is here?", "A representative will call you as soon as they are at your house to let you know about your delivery." 1,"2024-01-22T23:18:58.000000Z","2024-01-22T23:18:58.000000Z" in the response body.

  Examples:
    |id | user_id |            title                                                      |  description                                               |  status  |   created_at                |   updated_at   |
    | 2| null  | How do I know when my order is here? |"A representative will call you as soon as they are at your house to let you know about your delivery.| 1 | 2024-01-22T23:18:58.000000Z | 2024-01-22T23:18:58.000000Z |

  Scenario: TC03 When a user sends a valid GET request to the /api/faqsDetails endpoint with incorrect faq's ID, the response body displays a status code of 404
            and a message of "Faqs not found."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/faqsDetails" path parameters
    * The API user sends a "GET" request and records the response.
    * The api user verifies that the status code is 404
    * The api user verifies that the message information in the response body is "Faqs not found"

    Scenario:
      * The api user constructs the base url with the "invalidToken" token.
      * The api user sets "api/faqsDetails" path parameters
      * The API user sends a "GET" request and records the response.
      * The api user verifies that the status code is 401
      * The api user verifies that the message information in the response body is "Unauthenticated."