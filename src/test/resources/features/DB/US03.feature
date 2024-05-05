#Reporter : Hümeyra Tayfun
#US Priority : HIGH
  Feature: cities
    Scenario: Delete the data containing the values (id=?,name=?) in the cities table.
              Verify that it has been deleted.
      * Query03 insert Prepare and execute the query.
      * delete  inserted query03
      * Process the results for update 1.