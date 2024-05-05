package stepdefinitions;

import hooks.Base;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;
import utilities.DB_Utilities.DBUtils;

import java.util.List;

import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.nullValue;
import static org.junit.Assert.*;

public class API_Stepdefinitions extends Base {

    // Reyyan
    // US08/TC01
    @Given("The api user verifies the content of the data {int}, {string}, {string}, {int}, {string},{string},{string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String year, String name, int type, String date, String created_at , String updated_at ) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("holidayDetails[0].id"));
        assertEquals(year, jsonPath.getString("holidayDetails[0].year"));
        assertEquals(name, jsonPath.getString("holidayDetails[0].name"));
        assertEquals(type, jsonPath.getInt("holidayDetails[0].type"));
        assertEquals(date, jsonPath.getString("holidayDetails[0].date"));
        assertEquals(created_at, jsonPath.getString("holidayDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("holidayDetails[0].updated_at"));
    }
    // US18/TC01
    @Given("The api user verifies the content of the data {int}, {string},{string},{string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String reason, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id,jsonPath.getInt("refundReasonDetails[0].id"));
        assertEquals(reason,jsonPath.getString("refundReasonDetails[0].reason"));
        assertEquals(created_at,jsonPath.getString("refundReasonDetails[0].created_at"));
        assertEquals(updated_at,jsonPath.getString("refundReasonDetails[0].updated_at"));
    }
    // US22/TC01
    @Given("The api user verifies the content of the data {string},{string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(String name, String details) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(name,jsonPath.getString("departments[0].name"));
        assertEquals(details,jsonPath.getString("departments[0].details"));
    }
    // US29/TC01
    @Given("The api user prepares a POST request containing the {string}, {string}, {int}, {string}, {string}, {int}, {int}, {int}, null, {int}, {int} information to send to the api couponAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_null_information_to_send_to_the_api_coupon_add_endpoint(String title, String coupon_code, int coupon_type, String start_date, String end_date, int discount, int discount_type, int minimum_shopping, int is_expire, int is_multiple_buy) {
        requestBody.put("title",title);
        requestBody.put("coupon_code",coupon_code);
        requestBody.put("coupon_type",coupon_type);
        requestBody.put("start_date",start_date);
        requestBody.put("end_date",end_date);
        requestBody.put("discount",discount);
        requestBody.put("discount_type",discount_type);
        requestBody.put("minimum_shopping",minimum_shopping);
        requestBody.put("maximum_discount",nullValue());
        requestBody.put("is_expire",is_expire);
        requestBody.put("is_multiple_buy",is_multiple_buy);
    }
    // US43/TC01
    @Given("The api user prepares a PATCH request containing the {int}, {string}, {string}, {string}, {string}, {string},{string}, {string}, {string}, {string} data to send to the api address Update endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_address_update_endpoint(int customer_id, String name, String email, String address, String phone, String city, String state, String country, String postal_code, String address_type) {
        requestBody.put("customer_id",customer_id);
        requestBody.put("name",name);
        requestBody.put("email",email);
        requestBody.put("address",address);
        requestBody.put("phone",phone);
        requestBody.put("city",city);
        requestBody.put("state",state);
        requestBody.put("country",country);
        requestBody.put("postal_code",postal_code);
        requestBody.put("address_type",address_type);
        System.out.println(requestBody);
    }
    // US43/TC04
    @Given("The api user verifies that the reason information in the response body is {int}, {string}, {string}, {string}, {string}, {string},{string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_reason_information_in_the_response_body_is(int customer_id, String name, String email, String address, String phone, String city, String state, String country, String postal_code, String address_type) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(customer_id,jsonPath.getInt("addresses[0].customer_id"));
        assertEquals(name,jsonPath.getString("addresses[0].name"));
        assertEquals(email,jsonPath.getString("addresses[0].email"));
        assertEquals(address,jsonPath.getString("addresses[0].address"));
        assertEquals(phone,jsonPath.getString("addresses[0].phone"));
        assertEquals(city,jsonPath.getString("addresses[0].city"));
        assertEquals(state,jsonPath.getString("addresses[0].state"));
        assertEquals(country,jsonPath.getString("addresses[0].country"));
        assertEquals(postal_code,jsonPath.getString("addresses[0].postal_code"));
    }

    //======================================================================================================================================================================================
    // Hümeyra
    // US17/TC02
    @Given("The api user validates the {string} of the response body with index {int}.")
    public void the_api_user_validates_the_of_the_response_body_with_index(String reason, Integer dataIndex) {
       API_Methods.response.then()
               .assertThat()
               .body("refundReason["+ dataIndex+ "].reason",equalTo(reason));
    }
    // US20/TC01-02-03
    @Given("The api user prepares a request containing the {string} data to send to the api refundReasonUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_refund_reason_update_endpoint(String reason) {
        requestBody.put("reason",reason);
    }
    // US20/TC04
    @Given("The api user verifies that the reason information in the response body is {string}.")
    public void the_api_user_verifies_that_the_reason_information_in_the_response_body_is(String reasonValue) {
        jsonPath = API_Methods.response.jsonPath();
        Assert.assertEquals(reasonValue, jsonPath.getString("refundReasonDetails[0].reason"));
    }
    // US09/TC01-03-04
    @Given("The api user prepares a POST request body for holiday add {string} {string} {string}.")
    public void the_api_user_prepares_a_post_request_body_for_holiday_add(String year, String name, String date) {
       requestBody.put("year",year);
       requestBody.put("name",name);
       requestBody.put("date",date);
    }
    // US07/TC02 - US32/TC02
    @Given("The api user validates the {string} {string} of the response body with index {int}.")
    public void the_api_user_validates_the_of_the_response_body_with_index(String year, String name, int dataIndex) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(year, jsonPath.getString("holiday["+dataIndex+"].year"));
        assertEquals(name, jsonPath.getString("holiday["+dataIndex+"].name"));
    }

    //======================================================================================================================================================================================
    // Senayda US05-TC02
    @Given("The api user verifies the content of the data {int}, {string}, {string}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(Integer id, String first_name, String username, String email, String name) {

    }
    @Given("The api user verifies the content of the data {int} {string}, {string}, {string} {int},{string},{string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String user_id , String title , String description , int status, String created_at, String updated_at) {
     jsonPath=API_Methods.response.jsonPath();
     assertEquals(id,jsonPath.getInt("faqDetails[0].id"));
     assertEquals(user_id,jsonPath.getString("faqDetails[0].user_id"));
     assertEquals(title,jsonPath.getString("faqDetails[0].title"));
     assertEquals(description,jsonPath.getString("faqDetails[0].description"));
     assertEquals(status,jsonPath.getInt("faqDetails[0].status"));
     assertEquals(created_at,jsonPath.getString("faqDetails[0].created_at"));
     assertEquals(updated_at,jsonPath.getString("faqDetails[0].updated_at"));
    }
    @Given("The api user prepares a PATCH request body for holiday add {string} {string} {string}.")
    public void the_api_user_prepares_a_patch_request_body_for_holiday_add(String year, String name, String date) {
        requestBody.put("year",year);
        requestBody.put("name",name);
        requestBody.put("date",date);
    }
    @Given("The api user prepares a POST request body for register.")
    public void the_api_user_prepares_a_post_request_body_for_register() {
        customer_email=faker.internet().emailAddress();
        password= faker.internet().password();
        requestBody.put("first_name", faker.name().firstName());
        requestBody.put("last_name", faker.name().lastName());
        requestBody.put("email", customer_email);
        requestBody.put("password", password);
        requestBody.put("password_confirmation", password);
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "java candır");
    }
    @Given("The API user saves the information.")
    public void the_api_user_saves_the_information() {
        jsonPath= API_Methods.response.jsonPath();
        id = jsonPath.getInt("user.id");
        System.out.println("Email: " + customer_email + "\nPassword: " + password + "\nID: " + id);
    }

    //======================================================================================================================================================================================
    // Doruk
    // US23/TC01
    @Given("The api user prepares a POST request containing the department information to send to the api departmanAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_department_information_to_send_to_the_api_departman_add_endpoint(DataTable table) {
        List<List<String>> rows = table.asLists(String.class);
        System.out.println(rows);
        requestBody.put(rows.get(0).get(0), rows.get(1).get(0));
        requestBody.put(rows.get(0).get(1), rows.get(1).get(1));
        requestBody.put(rows.get(0).get(2), rows.get(1).get(2));
    }
    // US28/TC01
    @Given("The api user verifies the content of the data {int}, {string}, {string}, {int}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String title, String coupon_code, int coupon_type, String start_date, String end_date, int discount, int discount_type, int minimum_shopping, int maximum_discount, int created_by, int updated_by, int is_expire, int is_multiple_buy, String multiple_buy_limit, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("couponDetails[0].id"));
        assertEquals(title, jsonPath.getString("couponDetails[0].title"));
        assertEquals(coupon_code, jsonPath.getString("couponDetails[0].coupon_code"));
        assertEquals(coupon_type, jsonPath.getInt("couponDetails[0].coupon_type"));
        assertEquals(start_date, jsonPath.getString("couponDetails[0].start_date"));
        assertEquals(end_date, jsonPath.getString("couponDetails[0].end_date"));
        assertEquals(discount, jsonPath.getInt("couponDetails[0].discount"));
        assertEquals(discount_type, jsonPath.getInt("couponDetails[0].discount_type"));
        assertEquals(minimum_shopping, jsonPath.getInt("couponDetails[0].minimum_shopping"));
        assertEquals(maximum_discount, jsonPath.getInt("couponDetails[0].maximum_discount"));
        assertEquals(created_by, jsonPath.getInt("couponDetails[0].created_by"));
        assertEquals(updated_by, jsonPath.getInt("couponDetails[0].updated_by"));
        assertEquals(is_expire, jsonPath.getInt("couponDetails[0].is_expire"));
        assertEquals(is_multiple_buy, jsonPath.getInt("couponDetails[0].is_multiple_buy"));
        assertNull(jsonPath.get("couponDetails[0].multiple_buy_limit"));
        assertEquals(created_at, jsonPath.getString("couponDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("couponDetails[0].updated_at"));
    }
    // US35/TC01
    @Given("The api user prepares a PATCH request containing the address information to send to the api customerAddressUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_address_information_to_send_to_the_api_customer_address_update_endpoint() {
        requestBody.put("name", faker.name().firstName());
        requestBody.put("email", faker.internet().emailAddress());
        requestBody.put("address", faker.address().fullAddress());
        requestBody.put("phone", faker.phoneNumber().cellPhone());
        requestBody.put("city", faker.address().city());
        requestBody.put("state", faker.address().state());
        requestBody.put("country", faker.address().country());
        requestBody.put("postal_code", faker.address().zipCode());
        requestBody.put("address_type", "home");
    }
    // US35/TC04
    @Given("The api user prepares a PATCH request containing the address information with incorrect email format to send to the api customerAddressUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_address_information_with_incorrect_email_format_to_send_to_the_api_customer_address_update_endpoint() {
        requestBody.put("name", faker.name().firstName());
        requestBody.put("email", "incorrectEmailFormat");
        requestBody.put("address", faker.address().fullAddress());
        requestBody.put("phone", faker.phoneNumber().cellPhone());
        requestBody.put("city", faker.address().city());
        requestBody.put("state", faker.address().state());
        requestBody.put("country", faker.address().country());
        requestBody.put("postal_code", faker.address().zipCode());
        requestBody.put("address_type", "home");
    }

    //======================================================================================================================================================================================
    // Azim
    // US30/TC01-02-03-04
    @Given("The api user prepares a PATCH request body for couponUpdate.")
    public void the_api_user_sends_the_post_request_and_sav() {
        requestBody.put("title","can");
        requestBody.put("coupon_code","attemt");
        requestBody.put("coupon_type",2);
        requestBody.put("start_date","2021-11-17");
        requestBody.put("end_date","2021-11-19");
        requestBody.put("discount",10);
        requestBody.put("discount_type",0);
        requestBody.put("minimum_shopping",1);
        requestBody.put("maximum_discount",nullValue());
        requestBody.put("is_expire",0);
        requestBody.put("is_multiple_buy",1);
    }
    // US40/TC02
    @And("The api user validates the {int} {int} {string},{string},{string},{string},{string},{string},{string},{string} of the response body.")
    public void theApiUserValidatesTheOfTheResponseBody(int customer_id,int dataIndex,  String name, String email, String phone, String address, String city, String state, String country, String postal_code) {
        jsonPath=API_Methods.response.jsonPath();
        assertEquals(customer_id, jsonPath.getInt("addresses["+dataIndex+"].customer_id"));
        assertEquals(name, jsonPath.getString("addresses["+dataIndex+"].name"));
        assertEquals(email, jsonPath.getString("addresses["+dataIndex+"].email"));
        assertEquals(phone, jsonPath.getString("addresses["+dataIndex+"].phone"));
        assertEquals(address, jsonPath.getString("addresses["+dataIndex+"].address"));
        assertEquals(city, jsonPath.getString("addresses["+dataIndex+"].city"));
        assertEquals(state, jsonPath.getString("addresses["+dataIndex+"].state"));
        assertEquals(country, jsonPath.getString("addresses["+dataIndex+"].country"));
        assertEquals(postal_code, jsonPath.getString("addresses["+dataIndex+"].postal_code"));
    }
    // US41/TC02
    @Given("The api user verifies the content of the data {int} {int},{string},{string},{string},{string},{string},{string},{string},{string}, {int} , {int} ,{string},{string},in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body( int id, int customer_id, String name, String email, String phone, String address, String city, String state, String country, String postal_code, int is_shipping_default , int is_billing_default, String created_at ,String updated_at) {
        jsonPath=API_Methods.response.jsonPath();
        assertEquals(id,jsonPath.getInt("addresses[0].id"));
        assertEquals(customer_id,jsonPath.getInt("addresses[0].customer_id"));
        assertEquals(name,jsonPath.getString("addresses[0].name"));
        assertEquals(email,jsonPath.getString("addresses[0].email"));
        assertEquals(phone,jsonPath.getString("addresses[0].phone"));
        assertEquals(address,jsonPath.getString("addresses[0].address"));
        assertEquals(city,jsonPath.getString("addresses[0].city"));
        assertEquals(state,jsonPath.getString("addresses[0].state"));
        assertEquals(country,jsonPath.getString("addresses[0].country"));
        assertEquals(postal_code,jsonPath.getString("addresses[0].postal_code"));
        assertEquals(is_shipping_default,jsonPath.getInt("addresses[0].is_shipping_default"));
        assertEquals(is_billing_default,jsonPath.getInt("addresses[0].is_billing_default"));
        assertEquals(created_at,jsonPath.getString("addresses[0].created_at"));
        assertEquals(updated_at,jsonPath.getString("addresses[0].updated_at"));
    }

    //======================================================================================================================================================================================
    // İhsan
    // US04/TC01
    @Given("The api user prepares a POST request body.")
    public void the_api_user_prepares_a_post_request_body() {
        requestBody.put("old_password", password);
        password = faker.internet().password();
        requestBody.put("password", password);
        requestBody.put("password_confirmation", password);
    }
    @Given("The user saves the password.")
    public void the_user_saves_the_password() {
        System.out.println("Your new password is: " + password);
    }
    // US06/TC01
    @Given("The api user verifies the content of the data {int}, {string}, {string}, {int}, {string}, {int}, {int}, {string}, {int}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_id_in_the_response_body(int id , String first_name, String last_name, int role_id, String email, int is_verified, int is_active, String lang_code, int currency_id, String currency_code, String name) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("user.id"));
        assertEquals(first_name, jsonPath.getString("user.first_name"));
        assertEquals(last_name, jsonPath.getString("user.last_name"));
        assertEquals(role_id, jsonPath.getInt("user.role_id"));
        assertEquals(email, jsonPath.getString("user.email"));
        assertEquals(is_verified, jsonPath.getInt("user.is_verified"));
        assertEquals(is_active, jsonPath.getInt("user.is_active"));
        assertEquals(lang_code, jsonPath.getString("user.lang_code"));
        assertEquals(currency_id, jsonPath.getInt("user.currency_id"));
        assertEquals(currency_code, jsonPath.getString("user.currency_code"));
        assertEquals(name, jsonPath.getString("user.name"));
    }
    // US12/TC01
    @Given("In the response body for the FAQ with id = {int} should be validated, including the {string} information.")
    public void in_the_response_body_for_the_faq_with_id_should_be_validated_including_the_information(Integer int1, String title) {
       jsonPath = API_Methods.response.jsonPath();
       assertEquals(title, jsonPath.getString("Faqs[0].title"));
    }
    // US34/TC01
    @Given("The api user prepares a POST request body for address-store.")
    public void the_api_user_prepares_a_post_request_body_for_address_store() {
        requestBody.put("name", faker.name());
        requestBody.put("email", faker.internet().emailAddress());
        requestBody.put("address", faker.address());
        requestBody.put("phone", "5555");
        requestBody.put("city", faker.address().city());
        requestBody.put("state", faker.address().state());
        requestBody.put("country", faker.address().country());
        requestBody.put("postal_code", "55555");
        requestBody.put("address_type", "home");
    }
    // US34/TC02
    @And("The api user prepares a invalid POST request body for address-store.")
    public void theApiUserPreparesAInvalidPOSTRequestBodyForAddressStore() {
        requestBody.put("name", faker.name());
        requestBody.put("email", "wrong");
        requestBody.put("address", faker.address());
        requestBody.put("phone", "5555");
        requestBody.put("city", faker.address().city());
        requestBody.put("state", faker.address().state());
        requestBody.put("country", faker.address().country());
        requestBody.put("postal_code", "55555");
        requestBody.put("address_type", "home");
    }
    // US42/TC01
    @Given("The api user prepares a POST request body {int}{string}{string}{string}{string}{string}{string}{string}{string}{string} for addressAdd.")
    public void the_api_user_prepares_a_post_request_body_for_address_add(int customer_id, String name, String email, String address, String phone, String city, String state, String country, String postal_code, String address_type) {
        requestBody.put("customer_id", customer_id);
        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("address", address);
        requestBody.put("phone", phone);
        requestBody.put("city", city);
        requestBody.put("state", state);
        requestBody.put("country", country);
        requestBody.put("postal_code", postal_code);
        requestBody.put("address_type", address_type);
    }
    // US15/TC01-02
    @Given("The api user prepares a PATCH request body for faq.")
    public void the_api_user_prepares_a_patch_request_body_for_faq() {
        requestBody.put("title", "UPDATE");
        requestBody.put("description", "UPDATE2");
    }
    // US15/TC01
    @Given("The api user verifies that updated id is same as the GET response body {int} {string}")
    public void the_api_user_verifies_that_updated_id_is_same_as_the_get_response_body(int id, String endpoint) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt(endpoint + "[0].id"));
    }

    //======================================================================================================================================================================================
    // Murat
    // US14/TC01-02
    @Given("The api user prepares a POST request body for faq.")
    public void the_api_user_prepares_a_post_request_body_for_faq() {
        requestBody.put("title", faker.lorem().character());
        requestBody.put("description",faker.lorem());
    }
    // US25/TC01-02
    @Given("The api user prepares a PATCH request body for department.")
    public void the_api_user_prepares_a_patch_request_body_for_department() {
        requestBody.put("name", "UPDATE");
        requestBody.put("details", "UPDATE2");
        requestBody.put("status", "UPDATE2");
    }
    // US37/TC01
    @Given("The api user verifies id={int} && code={string} && name={string}")
    public void the_api_user_verifies_id_code_name(int int1, String string, String string2) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(int1, jsonPath.getInt("addresses[" + (int1-1) +"].id"));
        assertEquals(string, jsonPath.getString("addresses[" + (int1-1) +"].code"));
        assertEquals(string2, jsonPath.getString("addresses[" + (int1-1) +"].name"));
    }
    // US38/TC01
    @Given("The api user verifies the content of the data {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(String string) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(string, jsonPath.getString("addresses[6].name"));
    }
}