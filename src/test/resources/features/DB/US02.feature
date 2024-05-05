#Reporter : İhsan Altunışık
#US Priority : HIGH

  Feature: DB - users select
    @DB
    Scenario: Check the first_name and last_name information of the recent registered person in users table
      * Query02 Prepare and execute the query.