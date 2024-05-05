#Reporter : Murat Koparan
#US Priority : HIGH
  Feature:As an administrator, I want to be able to create a new FAQ record via API connection.
    Scenario: The user should perform a valid POST request
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/faqsAdd" path parameters
      * The api user prepares a POST request body for faq.
      * The API user sends a "POST" request and records the response.
      * The api user verifies that the status code is 201
      * The api user verifies that the message information in the response body is "Faqs added successfully"
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/faqsDetails" path parameters
      * The api user prepares a GETBODY request containing the added_item_id and records the response.
      * The api user verifies that the status code is 200
      * The api user verifies that the message information in the response body is "success"

    Scenario: The user should not perform a valid POST request with invalid authorization credentials.
      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/faqsAdd" path parameters
      * The api user prepares a POST request body for faq.
      * The API user sends a "POST" request and records the response.
      * The api user verifies that the status code is 401
      * The api user verifies that the message information in the response body is "Unauthenticated."