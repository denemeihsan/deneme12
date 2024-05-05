package manage;

import lombok.Getter;
@Getter
public class Manage {
    private String queryUS01Q01 = "SELECT name FROM categories WHERE slug=?";
    private String queryUS02Q01 = "INSERT INTO cities (id, name, state_id, status, created_at) VALUES(?, ?, ?, ?, ?)";
    private String queryUS02Q02 = "SELECT * FROM users WHERE id = ?";
    private String queryUS03Q01 = "DELETE FROM cities WHERE id=? AND name=?";
    private String queryUS04Q01 = "INSERT INTO contacts (id, name, email, query_type, message) VALUES (?, ?, ?, ?, ?)";
    private String queryUS04Q02 = "SELECT id FROM contacts";
    private String queryUS04Q03 = "UPDATE contacts SET message = ? WHERE id = ?;";
    private String queryUS05Q01 = "INSERT INTO contacts (id,name,email,query_type,message) VALUES(?, ?, ?, ?, ?)";
    private String queryUS05Q02 = "DELETE FROM contacts WHERE email = ?";
    private String queryUS06Q01 = "INSERT INTO bank_accounts (id, bank_name, branch_name, account_name, account_number) VALUES(?, ?, ?, ?, ?)";
    private String queryUS07Q01 = "SELECT phone FROM customer_addresses LIMIT ?";
    private String queryUS08Q01 = "SELECT name FROM delivery_processes ORDER BY id DESC LIMIT ?";
    private String queryUS09Q01 = "UPDATE users SET first_name = ?, last_name = ? WHERE id = ?";
    private String queryUS10Q01 = "SELECT customer_id from order_address_details WHERE shipping_address != billing_address";
    private String queryUS11Q01 = "SELECT SUM(amount) AS total_amount FROM wallet_balances WHERE type = ? AND id BETWEEN ? AND ?";
    private String queryUS12Q01 = "SELECT DISTINCT note FROM attendances";
    private String queryUS13Q01 = "INSERT INTO bank_accounts (id, bank_name, branch_name, account_name, account_number) VALUES(?, ?, ?, ?, ?)";
    private String queryUS14Q01 = "SELECT * FROM refund_reasons WHERE reason IS NULL";
    private String queryUS15Q01 = "SELECT * FROM customer_coupon_stores LIMIT ?";
    private String queryUS16Q01 = "SELECT orders.id FROM order_address_details JOIN orders ON order_address_details.order_id = orders.id WHERE order_address_details.shipping_address = ?";
    private String queryUS17Q01 = "SELECT attendances.year,users.email FROM attendances JOIN users on attendances.id=users.id where attendances.year<? and users.id=?";
    private String queryUS18Q01 = "INSERT INTO bank_accounts (id, bank_name, branch_name, account_name, account_number) VALUES(?, ?, ?, ?, ?)";
    private String queryUS18Q02 = "SELECT id FROM bank_accounts";
    private String queryUS19Q01 = "UPDATE bank_accounts SET opening_balance=? WHERE bank_name=?";
    private String queryUS20Q01 = "SELECT name FROM delivery_processes ORDER BY id DESC LIMIT ?";
    private String queryUS21Q01 = "SELECT * FROM guest_order_details";
    private String queryUS21Q02 = "UPDATE guest_order_details SET shipping_name = ? WHERE order_id = ?";
    private String queryUS22Q01 = "INSERT INTO digital_gift_cards (gift_name,descriptionOne) VALUE (?,?)";
    private String queryUS22Q02 = "DELETE FROM digital_gift_cards where id=?";
    private String queryUS23Q01 = "SELECT module, COUNT(*) AS type_count FROM email_template_types WHERE module IS NOT NULL GROUP BY module";
    private String queryUS24Q01 = "SELECT order_number FROM orders WHERE not customer_email=? AND sub_total<? ORDER BY order_number desc";
    private String queryUS25Q01 = "SELECT txn_id, MAX(amount) AS max_amount FROM order_payments WHERE txn_id != ? GROUP BY txn_id HAVING MAX(amount) > ? ORDER BY max_amount DESC";
    private String queryUS26Q01 = "SELECT payment_method, sum(amount) AS total_amount FROM transactions GROUP BY payment_method HAVING total_amount > ? ORDER BY payment_method DESC";
    private String queryUS27Q01 = "SELECT name FROM delivery_processes ORDER BY id DESC LIMIT ?";
    private String queryUS28Q01 = "SELECT DISTINCT user_id FROM support_tickets WHERE reference_no LIKE ''-''";
    private String queryUS28Q02 = "SELECT DISTINCT user_id FROM support_tickets WHERE reference_no NOT LIKE ''-''";
    private String queryUS29Q01 = "UPDATE guest_order_details SET shipping_name = ? WHERE order_id = ?";
    private String queryUS30Q01 = "SELECT SUM(total_price) AS total_price FROM carts WHERE is_buy_now = ? AND created_at < ?";
}
