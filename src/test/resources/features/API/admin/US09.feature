#Reporter : Hümeyra Tayfun
#US Priority : HIGH
  Feature:As an administrator, I want to add a new holiday record for staff via API connection.

    Scenario: TC_01 When a valid authorization information and necessary holiday data (year, name, date)
    are sent in the POST body to the /api/holidayAdd endpoint, it should be verified that the returned status
    code is 201 and the message information in the response body is "holiday added successfully".
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/holidayAdd" path parameters
      * The api user prepares a POST request body for holiday add "2023" "Aylardan nisan" "2023-04-19".
      * The API user sends a "POST" request and records the response.
      * The api user verifies that the status code is 201
      * The api user verifies that the message information in the response body is "holiday added successfully"

      Scenario: TC_02 The creation of the new holiday record via the API should be verified through the API itself.
      (The creation of the new holiday record can be confirmed by sending a GET request to
       the /api/holidayDetails endpoint with the added_item_id returned in the response body.)

        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/holidayDetails" path parameters
        * The api user prepares a GETBODY request containing the id = 81 and records the response.
        * The api user verifies that the message information in the response body is "success"

        Scenario: TC_03 /api/holidayAdd endpoint'ine gecerli authorization bilgileri ve sisteme kayitli holiday verilerini (year, name, date) iceren bir POST body gönderildiginde dönen
           status code'in 400 ve response body'deki message bilgisinin "dublicate holiday request" oldugu dogrulanmali.

          * The api user constructs the base url with the "admin" token.
          * The api user sets "api/holidayAdd" path parameters
          * The api user prepares a POST request body for holiday add "2023" "Aylardan nisan" "2023-04-19".
          * The API user sends a "POST" request and records the response.
          * The api user verifies that the status code is 400
          * The api user verifies that the message information in the response body is "dublicate holiday request"

         Scenario:  TC_04 When a POST request containing invalid authorization credentials and holiday data (year, name, date) is sent to the /api/holidayAdd endpoint, the expected
             status code returned should be 401, and the message in the response body should confirm: "Unauthenticated."

           * The api user constructs the base url with the "invalid" token.
           * The api user sets "api/holidayAdd" path parameters
           * The api user prepares a POST request body for holiday add "2023" "Aylardan nisan" "2023-04-19".
           * The API user sends a "POST" request and records the response.
           * The api user verifies that the status code is 401
           * The api user verifies that the message information in the response body is "Unauthenticated."