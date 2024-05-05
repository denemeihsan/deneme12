#Reporter : İhsan Altunışık
#US Priority : HIGH
  Feature: As an administrator, I want to be able to add a new address record for a customer specified by customer_id via the API connection.
    Scenario Outline: The user should perform a valid POST request
      * The api user constructs the base url with the "<admin>" token.
      * The api user sets "api/profile/addressAdd" path parameters
      * The api user prepares a POST request body <customer_id>"<name>""<email>""<address>""<phone>""<city>""<state>""<country>""<postal_code>""<address_type>" for addressAdd.
      * The API user sends a "POST" request and records the response.
      * The api user verifies that the status code is <id>
      * The api user verifies that the message information in the response body is "<message>"
      Examples:
        |admin  |customer_id|name|email                  |address|phone|city |state |country|postal_code|address_type|id |message                                 |
        |admin  |100        |New |2dsfsd@buysellcycle.com|gag    |55555|izmir|Aegean|Turkey |35000      |ev          |201|address added successfully              |
        |admin  |100        |New |2dsfsdbuysellcycle.com |gag    |55555|izmir|Aegean|Turkey |35000      |ev          |422|The email must be a valid email address.|
        |invalid|100        |New |2dsfsd@buysellcycle.com|gag    |55555|izmir|Aegean|Turkey |35000      |ev          |401|Unauthenticated.                        |

    Scenario: The user should perform a valid GET request
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/profile/addressDetails" path parameters
      * The api user prepares a GETBODY request containing the id = 100 and records the response.