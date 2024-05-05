#Reporter : Murat Koparan
#US Priority : HIGH
  Feature: order_payments
    Scenario: In the order_payments table, group the data without txn_id='none' according to their txn_id, group the data with max_amount values higher than 9000 and sort them according to their max_amount values.
      * Query25 Prepare and execute the query.