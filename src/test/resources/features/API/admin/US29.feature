#Reporter : Reyyan Mert
#US Priority : HIGH

  Feature: As an administrator, I want to be able to create a new coupon record via the API connection.

    Scenario Outline: When a POST body containing valid authorization information and necessary data (title,
    coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount,
    is_expire, is_multiple_buy) is sent to the /api/coupon/couponAdd endpoint, the returned status code should
    be 201, and the message information in the response body should be verified as "coupon added successfully".

      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/coupon/couponAdd" path parameters
      * The api user prepares a POST request containing the "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire>, <is_multiple_buy> information to send to the api couponAdd endpoint.
      * The API user sends a "POST" request and records the response.
      * The api user verifies that the status code is 201
      * The api user verifies that the message information in the response body is "coupon added successfully"

      Examples:
      |title          |coupon_code|coupon_type|start_date  |end_date  |discount |discount_type|minimum_shopping|maximum_discount|is_expire|is_multiple_buy|
      |Attemt Coupon 2|attemt     |2          |2021-11-17  |2021-11-19|10       |0            |1               |null            |0        |1              |

      Scenario Outline: The creation of the new coupon record via the API should be verified from the API itself.
      (The creation of the record can be confirmed by sending a GET request to the /api/coupon/couponDetails endpoint with the
      added_item_id returned in the response body.)

        * The api user constructs the base url with the "admin" token.
        * The api user sets "api/coupon/couponDetails" path parameters
        * The api user prepares a GETBODY request containing the id = <id> and records the response.
        * The api user verifies that the message information in the response body is "success"

        Examples:
        |id  |
        |44  |

        Scenario Outline: When a POST body containing invalid authorization information and necessary data (title, coupon_code,
        coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, is_expire, is_multiple_buy)
        is sent to the /api/coupon/couponAdd endpoint, the returned status code should be 401, and the message information in the
        response body should be verified as "Unauthenticated.".

          * The api user constructs the base url with the "invalid" token.
          * The api user sets "api/coupon/couponAdd " path parameters
          * The api user prepares a POST request containing the "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire>, <is_multiple_buy> information to send to the api couponAdd endpoint.
          * The API user sends a "POST" request and records the response.
          * The api user verifies that the status code is 401
          * The api user verifies that the message information in the response body is "Unauthenticated."

          Examples:
            |title          |coupon_code|coupon_type|start_date  |end_date  |discount |discount_type|minimum_shopping|maximum_discount|is_expire|is_multiple_buy|
            |Attemt Coupon 2|attemt     |2          |2021-11-17  |2021-11-19|10       |0            |1               |null            |0        |1              |