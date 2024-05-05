#Reporter : İhsan Altunışık
#US Priority : LOW

  Feature: DB - users update
    @DB
    Scenario: In the users table, update the latest created user's first_name = "Java" and last_name = "Tandır".
      * Query09 Prepare and execute the query.
      * Process the results for update 1.