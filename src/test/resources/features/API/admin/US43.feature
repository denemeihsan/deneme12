#Reporter : Reyyan Mert
#US Priority : HIGH

  Feature: As an administrator, I want to be able to update the existing address information of a customer with the
    specified address ID number and belonging customer_id via the API connection.

    Scenario Outline: When a PATCH request body, containing the address ID and the correct customer_id, along with valid authorization
    information, is sent to the api/profile/addressUpdate/{id} endpoint for update, with fields (customer_id, name, email, address,
    phone, city, state, country, postal_code, address_type), the returned status code should be 202, and the message in the response
    body should confirm that it is "address updated successfully".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api address Update endpoint.
      * The API user sends a "PATCH" request and records the response.
      * The api user verifies that the status code is 202
      * The api user verifies that the message information in the response body is "address updated successfully"
      * The api user verifies that updated_Id is same as the param <id>

    Examples:
    |id |customer_id| name   |  email                 |address|phone     |city | state|country|postal_code|address_type|
    |216|    7      |Mert    |reyyan@buysellcycle.com |aut    |1236547892|6007 |52    |  1    |28000      |14          |

    Scenario Outline: /api/profile/addressUpdate/{id} endpoint'ine gecerli authorization bilgileri ve yanlis (sistemde olmayan)
    address id'sini iceren bir PATCH request body (customer_id, name, email, address, phone, city, state, country, postal_code,
    address_type) gönderildiginde dönen status code'in 404 ve response body'deki message bilgisinin "address not found" oldugu
    dogrulanmali.

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api address Update endpoint.
      * The API user confirms the "notFoundExceptionMessage".
      Examples:
        |id  |customer_id| name   |  email                 |address|phone     |city | state|country|postal_code|address_type|
        |1023|    7      |Mert    |reyyan@buysellcycle.com |aut    |1236547892|6007 |52    |  1    |28000      |14          |

      Scenario Outline: /api/profile/addressUpdate/{id} endpoint'ine gecerli authorization bilgileri ile guncellenmek istenilen
      address id ve yanlis customer_id'sini iceren bir PATCH request body (customer_id, name, email, address, phone, city, state,
      country, postal_code, address_type) gönderildiginde dönen status code'in 404 ve response body'deki message bilgisinin
      "address not found" oldugu dogrulanmali.

        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/profile/addressUpdate/<id>" path parameters
        * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api address Update endpoint.
        * The API user confirms the "notFoundExceptionMessage".

        Examples:
          |id  |customer_id| name   |  email                 |address|phone     |city | state|country|postal_code|address_type|
          |216|    500      |Mert   |reyyan@buysellcycle.com  |aut    |1236547892|6007 |52    |  1    |28000      |14          |

        Scenario Outline:API uzerinden güncellenmek istenen address kaydinin güncellendigi, API uzerinden dogrulanmali.
        (Response body'de dönen updated_Id ile /api/profile/addressDetails endpoint'ine GET request gönderilerek kaydın
        güncellendiği doğrulanabilir.)

          * The api user constructs the base url with the "admin" token.
          * The api user sets "api/profile/addressDetails" path parameters
          * The api user prepares a GETBODY request containing the id = <id> and records the response.
          * The api user verifies that the reason information in the response body is <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>", "<country>", "<postal_code>", "<address_type>".

          Examples:
            |id  |customer_id| name   |  email                  |address|phone     |city | state|country|postal_code|address_type|
            |216|    7       |Mert    |reyyan@buysellcycle.com  |aut    |1236547892|6007 |52    |  1    |28000      |14          |