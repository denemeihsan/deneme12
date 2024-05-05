#Reporter : Reyyan Mert
#US Priority : MEDIUM
  Feature: guest_order_details
    Scenario: Calculate the number of orders placed according to the order_id in the guest_order_details table.
              Update the shipping_name information of the data with order number (order_id=?).
      * Calculate the number of orders placed according to order_id in the guest_order_details table.
      * Update shipping_name based on order number
      * Process the results for update 1.