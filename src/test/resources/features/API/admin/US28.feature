#Reporter : Doruk Özgen
#US Priority : MEDIUM

Feature: US28 As an administrator, I want to be able to access the details of the coupon with the specified ID number via the API connection.

  Scenario Outline: TC01 Admin should be able to view and verify the details of the valid authorization and valid coupon by entering its id via API.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GETBODY request containing the id = 25 and records the response.
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"
    * The api user verifies the content of the data <id>, "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <created_by>, <updated_by>, <is_expire>, <is_multiple_buy>, "<multiple_buy_limit>", "<created_at>", "<updated_at>" in the response body.

    Examples:
        | id | title | coupon_code | coupon_type | start_date | end_date | discount | discount_type | minimum_shopping | maximum_discount | created_by | updated_by | is_expire | is_multiple_buy | multiple_buy_limit | created_at | updated_at |
        | 25 | Orderder | ordered | 2 | 2024-04-18 | 2024-04-20 | 10 | 0 | 1 | 2 | 4 | 4 | 0 | 1 | null | 2024-04-10T13:38:06.000000Z | 2024-04-10T14:34:58.000000Z |


    Scenario: TC02 Admin should get 401 error by entering invalid authorization and valid coupon's id through the API.
      * The api user constructs the base url with the "invalid" token.
      * The api user sets "api/coupon/couponDetails" path parameters
      * The api user prepares a GETBODY request containing the id = 25 and records the response.
      * The api user verifies that the status code is 401
      * The api user verifies that the message information in the response body is "Unauthenticated."

    Scenario: TC03 Admin should get 404 error by entering valid authorization and invalid coupon's id through the API.
      * The api user constructs the base url with the "admin" token.
      * The api user sets "api/coupon/couponDetails" path parameters
      * The api user prepares a GETBODY request containing the id = 1001 and records the response.
      * The api user verifies that the status code is 404
      * The api user verifies that the message information in the response body is "coupon not found"