package stepdefinitions;

import config_Requirements.ConfigReader;
import hooks.Base;
import io.cucumber.java.en.Given;
import utilities.DB_Utilities.DBUtils;
import utilities.DB_Utilities.DB_InsertInto_Methods;

import java.sql.SQLException;
import static org.junit.Assert.assertEquals;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.*;

public class DB_Stepdefinitions extends Base {
    //ihsan
    @Given("Query02 Prepare and execute the query.")
    public void query02_prepare_and_execute_the_query() throws SQLException {
        preparedStatement = DBUtils.getConnection().prepareStatement(queryManage.getQueryUS02Q02());
        preparedStatement.setInt(1, id);
        //commit
        resultSet = preparedStatement.executeQuery();
        resultSet.next();
        System.out.println("Database Name Result: " + resultSet.getString("first_name") +
                           "\nDatabase Last Name Result: " + resultSet.getString("last_name"));
    }

    @Given("Query09 Prepare and execute the query.")
    public void query09_prepare_and_execute_the_query() throws SQLException {
        preparedStatement = DBUtils.getConnection().prepareStatement(queryManage.getQueryUS09Q01());
        preparedStatement.setString(1, "Java");
        preparedStatement.setString(2, "Tandır");
        preparedStatement.setInt(3, id);
    }

    @Given("Process the results for counting")
    public void process_the_results_for_counting() throws SQLException {
        resultSet.next();
        System.out.println("Total amount: " + resultSet.getLong("total_amount"));
    }

    @Given("Query16 Prepare and execute the query.")
    public void query16_prepare_and_execute_the_query() throws SQLException {
        DB_InsertInto_Methods.citiesInsert();
        query = queryManage.getQueryUS16Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1,"Switzerland");
        resultSet = preparedStatement.executeQuery();
        System.out.println("ids: " + DBUtils.getColumnData(query,"id"));
    }
    @Given("Query23 Prepare and execute the query.")
    public void query23_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS23Q01();
        resultSet = DBUtils.getStatement().executeQuery(query);
        resultSet.next();
        System.out.println("module: " + resultSet.getString("module") +
                "\ntype_count: " + resultSet.getInt("type_count"));
    }
    @Given("Query30 Prepare and execute the query.")
    public void query30_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS30Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setInt(1,1);
        preparedStatement.setString(2,"2024-03-30");
        resultSet = preparedStatement.executeQuery();
        resultSet.next();
        System.out.println("Total Price: " + resultSet.getInt("total_price"));
    }

// ====================================================================================================================================================================
    //reyyan
    @Given("Query07 Prepare and execute the query.")
    public void query07_prepare_and_execute_the_query() throws SQLException {
        DBUtils.printFirstThreePhoneNumbers("phone");

    }

    @Given("Check if each {string} number has the number {string}")
    public void check_if_each_number_has_the_number(String phone, String number) {
        DBUtils.checkPhoneNumbersForFive();
        String expectedPhone = "5";
        String actualPhone = DBUtils.phone;
        assertTrue(actualPhone.contains(expectedPhone));
    }

    @Given("Query14 Prepare and execute the query")
    public void query14_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS14Q01();
        DBUtils.getStatement().executeQuery(query);
        List<Object> reason = DBUtils.getColumnData(query,"reason");
        assertFalse(reason.isEmpty());
    }

    @Given("Calculate the number of orders placed according to order_id in the guest_order_details table.")
    public void calculate_the_number_of_orders_placed_according_to_order_id_in_the_guest_order_details_table() throws SQLException {
        DBUtils.getOrderCounts();
    }

    @Given("Update shipping_name based on order number")
    public void update_shipping_name_based_on_order_number() throws SQLException {
        query = queryManage.getQueryUS21Q02();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1, "Reyyan");
        preparedStatement.setInt(2, 118);
        preparedStatement.executeUpdate();
    }
    @Given("Prepare the query containing {string} in Query28, execute it and print it to the console.")
    public void prepare_the_query_containing_in_query28_execute_it_and_print_it_to_the_console(String string) throws SQLException {

        DBUtils.PreparingUS2801ExecutingPrinting();
    }
    @Given("Prepare the query that does not contain {string} in Query28, execute it and print it to the console.")
    public void prepare_the_query_that_does_not_contain_in_query28_execute_it_and_print_it_to_the_console(String string) {
        DBUtils.PreparingUS2802ExecutingPrinting();
    }


    //================================================================================================================================================
    // senayda
    @Given("Query01 Prepare and execute the query.")
    public void query01_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS01Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1,ConfigReader.getProperty("db", "categoryName"));
        resultSet= preparedStatement.executeQuery();
    }
    @Given("Verify the {string} information Results are obtained.")
    public void verify_the_information_results_are_obtained(String categoryName) throws SQLException {
        resultSet.next();
        categoryName=resultSet.getString(categoryName);
        String expectedName = ConfigReader.getProperty("db","categoryName");
        assertEquals(expectedName, categoryName);
    }

    @Given("Query08 Prepare and execute the query.")
    public void query08_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS08Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
    }

    @Given("Process the results for verify.")
    public void process_the_results_for_verify() throws SQLException {
        List<String> expectedDelivery_Process = new ArrayList<>(5);
        preparedStatement.setInt(1,5);
        resultSet= preparedStatement.executeQuery();

        expectedDelivery_Process.add("Delivered");
        expectedDelivery_Process.add("Recieved");
        expectedDelivery_Process.add("Shipped");
        expectedDelivery_Process.add("Processing");
        expectedDelivery_Process.add("Pending");

        for (int i = 0; i < 5; i++) {
            resultSet.next();
            assertEquals(expectedDelivery_Process.get(i),resultSet.getString("name"));
        }
    }

    @Given("Query015 Prepare and execute the query.")
    public void query015_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS15Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setInt(1,3);
        resultSet= preparedStatement.executeQuery();
    }
    @Given("Query22 Prepare and execute the query.")
    public void query22_prepare_and_execute_the_query() throws SQLException {
        query=queryManage.getQueryUS22Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1,"merak");
        preparedStatement.setString(2,"at");
        preparedStatement.executeUpdate();

    }
    @Given("delete data inserted query15.")
    public void delete_data_inserted_query15() throws SQLException {
        query=queryManage.getQueryUS22Q02();
        preparedStatement=DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setInt(1,9047166);


    }
    // ======================================================================================
    //Azim Kaya US-05
    @Given("Query05 Prepare and execute the query.")
    public void query05_prepare_and_execute_the_query() throws SQLException {
        query=queryManage.getQueryUS05Q01();
        preparedStatement=DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setInt(1,44);
        preparedStatement.setString(2,"Ömer");
        preparedStatement.setString(3,"azimli@buysellcycle.com");
        preparedStatement.setInt(4,1);
        preparedStatement.setString(5,"Herkese kolay gelsin");
        preparedStatement.executeUpdate();
    }

    @Given("Delete the added data by entering email information in the contacts table.")
    public void delete_the_added_data_by_entering_email_information_in_the_contacts_table() throws SQLException {
    query=queryManage.getQueryUS05Q02();
    preparedStatement=DBUtils.getConnection().prepareStatement(query);
    preparedStatement.setString(1,"azimli@buysellcycle.com");
    }

    //Azim Kaya US-19
    @Given("Query19 Prepare and execute the query.")
    public void query19_prepare_and_execute_the_query() throws SQLException {
        query=queryManage.getQueryUS19Q01();
        preparedStatement=DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setInt(1,-1);
        preparedStatement.setString(2,"Weissnat-Stanton");
    }
    @Given("Query26 Prepare and execute the query.")
    public void query26_prepare_and_execute_the_query() throws SQLException {
        query=queryManage.getQueryUS26Q01();
        preparedStatement=DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setInt(1,7000);
        resultSet=preparedStatement.executeQuery();
    }
    @Given("Query26 Process the results for .")
    public void query26_process_the_results_for() throws SQLException {
        double expected=19039967.55;
        resultSet.next();
       int actualAmount1=resultSet.getInt("total_amount");
        resultSet.next();
       double actualAmount2=resultSet.getInt("total_amount");
        assertEquals(9164,actualAmount1);

    }
    @Given("list the unique {string} in the attendances table.")
    public void list_the_unique_in_the_attendances_table(String string) throws SQLException {
    query=queryManage.getQueryUS12Q01();
    DBUtils.getStatement().executeQuery(query);
    List<Object> note = DBUtils.getColumnData(query,"note");
        System.out.println(note+"note");

    }

    // ======================================================================================
    // humeyra tayfun
    @Given("Query10 Prepare and execute the query.")
    public void query10_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS10Q01();
        resultSet= DBUtils.getStatement().executeQuery(query);
    }

    @Given("Process the results")
    public void process_the_results() throws Exception {
     rowCount=DBUtils.getRowCount();
     assertEquals(2,rowCount);
    }

    @Given("Query24 Prepare and execute the query.")
    public void query24_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS24Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        customer_email="customer";
        sub_total=2000;
        preparedStatement.setString(1,customer_email);
        preparedStatement.setDouble(2,sub_total);
        resultSet=preparedStatement.executeQuery();
    }

    @Given("Process the results for listing")
    public void process_the_results_for_listing() {
        System.out.println(DBUtils.getQueryResultList(query));
        /*
        20240416000570
        20240416000569
        20240414000568
        20240405000567
        20240405000565
         */
    }

    @Given("Query17 Prepare and execute the query.")
    public void query17_prepare_and_execute_the_query() throws SQLException {
        query = queryManage.getQueryUS17Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1,"2022");
        preparedStatement.setInt(2,5);
        resultSet = preparedStatement.executeQuery();
    }

    @Given("Verify the {string} information Results are obtained from user table")
    public void verify_the_information_results_are_obtained_from_user_table(String email) throws SQLException {
        resultSet.next();
        email=resultSet.getString(email);
        String expectedEmail = ConfigReader.getProperty("db","email");
        assertEquals(expectedEmail, email);
    }

    @Given("Query03 insert Prepare and execute the query.")
    public void query03_insert_prepare_and_execute_the_query() throws SQLException {
        DB_InsertInto_Methods.citiesInsert();
    }

    @Given("delete  inserted query03")
    public void delete_inserted_query03() throws SQLException {
        query=queryManage.getQueryUS03Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setLong(1, id);
        preparedStatement.setString(2,name);
    }
//=================================================================================================
    //murat
    @Given("Query11 Prepare and execute the query.")
    public void query11_prepare_and_execute_the_query() throws SQLException {
       query=queryManage.getQueryUS11Q01();
       preparedStatement = DBUtils.getConnection().prepareStatement(query);
       preparedStatement.setString(1,"Referral");
       preparedStatement.setInt(2,10);
       preparedStatement.setInt(3,20);
       resultSet=preparedStatement.executeQuery();
       System.out.println("Total amount: " + DBUtils.getColumnData(query,"total_amount"));
    }

    @Given("Query25 Prepare and execute the query.")
    public void query25_prepare_and_execute_the_query() throws SQLException {
        query=queryManage.getQueryUS25Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1,"none");
        preparedStatement.setInt(2,9000);
        resultSet=preparedStatement.executeQuery();
        for (int i = 0; i < 4; i++) {
            resultSet.next();
            System.out.println("\ntxn_id: " + resultSet.getString(1) +
                                " ---- max_amount: " + resultSet.getInt(2));
        }
    }

    @Given("Query04 Prepare and execute the query.")
    public void query04_prepare_and_execute_the_query() throws SQLException {
        DB_InsertInto_Methods.contactsInsert();
    }

    @Given("Query04 Process the results")
    public void query04_process_the_results() throws SQLException {
        query = queryManage.getQueryUS04Q03();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);
        preparedStatement.setString(1, "UPDATE");
        preparedStatement.setInt(2, id);
    }

    @Given("Query18 Prepare and execute the query.")
    public void query18_prepare_and_execute_the_query() throws SQLException {
        for (int i = 0; i < 5; i++) {
            DB_InsertInto_Methods.bank_accountsInsert();
            if (preparedStatement.executeUpdate() == 1)
                rowCount++;
        }
        assertEquals(5,rowCount);
    }
}
