#Reporter : Reyyan Mert
#US Priority : LOW
@reyyan
  Feature: support_tickets
    Scenario: In the support_tickets table, list the unique user_ids of the data with and without '-' in reference_no.
      * Prepare the query containing '-' in Query28, execute it and print it to the console.
      * Prepare the query that does not contain '-' in Query28, execute it and print it to the console.