package utilities.DB_Utilities;

import hooks.Base;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DB_InsertInto_Methods extends Base {

    public static void citiesInsert() throws SQLException {
        query = queryManage.getQueryUS02Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);

        id = idGenerator(queryManage.getQueryUS02Q02());
        name = faker.name().fullName();
        state_id = random.nextInt(2);
        status = random.nextInt(2);
        date = Date.valueOf(LocalDate.now());

        preparedStatement.setLong(1, id);
        preparedStatement.setString(2, name);
        preparedStatement.setInt(3, state_id);
        preparedStatement.setInt(4, status);
        preparedStatement.setDate(5, date);

        System.out.println("NEW DATA: |" + id + "| |" + name + "| |" + state_id + "|" + status + "| |" + date + "|");
    }

    public static void contactsInsert() throws SQLException {
        query = queryManage.getQueryUS04Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);

        id = idGenerator(queryManage.getQueryUS04Q02());
        name = faker.name().fullName();
        email = faker.internet().emailAddress();
        message = faker.lorem().characters(3);

        preparedStatement.setInt(1, id);
        preparedStatement.setString(2, name);
        preparedStatement.setString(3, email);
        preparedStatement.setString(4, "1");
        preparedStatement.setString(5, message);
        System.out.println("NEW DATA: |" + id + "| |" + name + "| |" + email + "| |1| " + "|" + message + "|");
    }

    public static void bank_accountsInsert() throws SQLException {
        query = queryManage.getQueryUS18Q01();
        preparedStatement = DBUtils.getConnection().prepareStatement(query);

        id = idGenerator(queryManage.getQueryUS18Q02());
        bank_name = faker.company().name();
        branch_name = faker.company().profession();
        account_name = faker.name().fullName();

        preparedStatement.setInt(1, id);
        preparedStatement.setString(2, bank_name);
        preparedStatement.setString(3, branch_name);
        preparedStatement.setString(4, account_name);
        preparedStatement.setString(5, "652745234");
        System.out.println("NEW DATA: |" + id + "| |" + bank_name + "| |" + branch_name + "|" + account_name + "| |652745234|");
    }
    public static int idGenerator(String givenQuery) throws SQLException {
        resultSet = DBUtils.getStatement().executeQuery(givenQuery);

        List<Integer> ids = new ArrayList<>();
        while (resultSet.next()){
            ids.add(resultSet.getInt("id"));
        }

        do {
            id = random.nextInt(10001) + 50000;
        } while (ids.contains(id));
        return id;
    }
}
