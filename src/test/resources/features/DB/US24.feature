#Reporter : Hümeyra Tayfun
#US Priority : MEDIUM
  Feature: orders
    Scenario: In the orders table, list the data that does not contain "customer" in customer_email data and whose sub_total is less than 2000 in reverse order of "order_number".
      * Query24 Prepare and execute the query.
      * Process the results for listing