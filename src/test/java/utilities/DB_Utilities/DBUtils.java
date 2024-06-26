package utilities.DB_Utilities;

import config_Requirements.ConfigReader;
import hooks.Base;

import java.sql.*;
import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class DBUtils extends Base {


    public static void listElementsAssert(List<String> expected, String column) throws SQLException {
        List<String> actual = new ArrayList<>();
        while (resultSet.next()) {
            String element = resultSet.getString(column);
            actual.add(element);
        }
        for (String each : actual) {
            assertTrue(expected.contains(each));
        }
    }

    public static void createConnection() {
        String url = ConfigReader.getProperty("db", "URL");
        String username = ConfigReader.getProperty("db", "USERNAME");
        String password = ConfigReader.getProperty("db", "PASSWORD");
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() {
        String url = ConfigReader.getProperty("db", "URL");
        String username = ConfigReader.getProperty("db", "USERNAME");
        String password = ConfigReader.getProperty("db", "PASSWORD");
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return connection;
    }

    public static void executeQuery(String query) {
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            resultSet = statement.executeQuery(query);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void closeConnection() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Sonraki 3 methodu sadece connection,statement,resultset kullanmak istedigimizde kullaniriz
    //connection =>DBUtils.getConnection()
    //statement => DBUtils.getResultset()
    //resultSet => DBUtils.getResultset()
    //getStatement method statement object i olusturmak icin
    public static Statement getStatement() {
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return statement;
    }

    //getConnection method Connection object i olusturmak icin. Bu method create createConnectiondan farkli olarak connection objesi return ediyor

    //getResultset method Resultset object i olusturmak icin.
    public static ResultSet getResultset() {
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return resultSet;
    }

    //Table da kac satir var
    public static int getRowCount() throws Exception {
        resultSet.last();
        int rowCount = resultSet.getRow();
        return rowCount;
    }

    /**
     * @return returns a single cell value. If the results in multiple rows and/or
     * columns of data, only first column of the first row will be returned.
     * The rest of the data will be ignored
     */

    public static Object getCellValue(String query) {
        return getQueryResultList(query).get(0).get(0);
    }

    /**
     * @return returns a list of Strings which represent a row of data. If the query
     * results in multiple rows and/or columns of data, only first row will
     * be returned. The rest of the data will be ignored
     */

    public static List<Object> getRowList(String query) {

        return getQueryResultList(query).get(0);
    }

    /**
     * @return returns a map which represent a row of data where key is the column
     * name. If the query results in multiple rows and/or columns of data,
     * only first row will be returned. The rest of the data will be ignored
     */

    public static Map<String, Object> getRowMap(String query) {

        return getQueryResultMap(query).get(0);
    }

    /**
     * @return returns query result in a list of lists where outer list represents
     * collection of rows and inner lists represent a single row
     */

    public static List<List<Object>> getQueryResultList(String query) {
        executeQuery(query);
        List<List<Object>> rowList = new ArrayList<>();
        ResultSetMetaData rsmd;
        try {
            rsmd = resultSet.getMetaData();
            while (resultSet.next()) {
                List<Object> row = new ArrayList<>();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    row.add(resultSet.getObject(i));
                }
                rowList.add(row);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rowList;
    }

    /**
     * @return list of values of a single column from the result set
     */

    public static List<Object> getColumnData(String query, String column) {
        executeQuery(query);
        List<Object> rowList = new ArrayList<>();
        ResultSetMetaData rsmd;
        try {
            rsmd = resultSet.getMetaData();
            while (resultSet.next()) {
                rowList.add(resultSet.getObject(column));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rowList;
    }

    /**
     * @return returns query result in a list of maps where the list represents
     * collection of rows and a map represents represent a single row with
     * key being the column name
     */

    public static List<Map<String, Object>> getQueryResultMap(String query) {
        executeQuery(query);
        List<Map<String, Object>> rowList = new ArrayList<>();
        ResultSetMetaData rsmd;
        try {
            rsmd = resultSet.getMetaData();
            while (resultSet.next()) {
                Map<String, Object> colNameValueMap = new HashMap<>();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    colNameValueMap.put(rsmd.getColumnName(i), resultSet.getObject(i));
                }
                rowList.add(colNameValueMap);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rowList;
    }

    /*
     * @return List of columns returned in result set
     */
    public static List<String> getColumnNames(String query) {
        executeQuery(query);
        List<String> columns = new ArrayList<>();
        ResultSetMetaData rsmd;
        try {
            rsmd = resultSet.getMetaData();
            int columnCount = rsmd.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                columns.add(rsmd.getColumnName(i));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return columns;
    }

    public static synchronized void update(String query) throws SQLException {
        Statement st = connection.createStatement();
        int ok = st.executeUpdate(query);
        if (ok == -1) {
            throw new SQLException("DB problem with query: " + query);
        }
        st.close();
    }

    public static PreparedStatement getPraperedStatement(String sqlQuery) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return preparedStatement;
    }

    public static Integer randomIdGenerate() {
        // ID uzunluğu
        int idLength = 4;
        // Rastgele ID oluştur
        Integer generatedId = Integer.valueOf(generateRandomId(random, idLength));
        return generatedId;
    }

    // Rastgele ID oluşturan metot
    private static String generateRandomId(Random random, int length) {
        StringBuilder idBuilder = new StringBuilder();
        // Belirlenen uzunlukta rastgele karakterler ekleyerek ID oluştur
        for (int i = 0; i < length; i++) {
            char randomChar = (char) (random.nextInt(26) + 'a'); // Sadece küçük harfler için
            idBuilder.append(randomChar);
        }

        return idBuilder.toString();
    }

    // Belirli bir aralıkta rastgele sayı oluşturan metot
    private static int generateRandomNumber(Random random, int min, int max) {
        // Belirli aralıkta rastgele bir sayı üret
        int randomNumber = random.nextInt(max - min + 1) + min;

        return randomNumber;
    }

    public static int idOlustur() {
        // 30 ile 900 arasında rastgele sayı oluştur
        int randomNumber = generateRandomNumber(random, 30, 1200);

        // Oluşturulan sayıyı ekrana yazdır
        System.out.println("Oluşturulan Sayı: " + randomNumber);

        return randomNumber;
    }

    public static void printFirstThreePhoneNumbers(String tableName) {

        try {
            query = queryManage.getQueryUS07Q01();
            DBUtils.getStatement().executeQuery(query);
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                String phone = resultSet.getString("phone");
                System.out.println("phoneNumber: " + phone);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void checkPhoneNumbersForFive() {
        try {
            query = queryManage.getQueryUS07Q01();
            PreparedStatement US07Q01 = connection.prepareStatement(query);
            resultSet = US07Q01.executeQuery(query);
            for (int i = 0; i <= 2 && resultSet.next(); i++) {
                phone = resultSet.getString("phone");
                if (phone.contains("5")) {
                    System.out.println("Phone: " + phone + "   5 sayısı içeriyor");
                } else {
                    System.out.println("Phone: " + phone + "   5 sayısı içermiyor");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static double getOrderCounts() throws SQLException {

        query = queryManage.getQueryUS21Q01();
        DBUtils.getStatement().executeQuery(query);
        List<Object> orderIdList = DBUtils.getColumnData(query,"order_id");

        double sum = 0;
        for (Object obj : orderIdList) {
            if (obj instanceof Number) {
                sum += ((Number) obj).doubleValue();
            }
        }
        System.out.println(sum);
        return sum;
    }
    public static void PreparingUS2801ExecutingPrinting() {

        try {
            query = queryManage.getQueryUS28Q01();
            DBUtils.getStatement().executeQuery(query);
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                String userId = resultSet.getString("user_id");
                System.out.println("userId: " + userId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public static void PreparingUS2802ExecutingPrinting() {

        try {
            query = queryManage.getQueryUS28Q02();
            DBUtils.getStatement().executeQuery(query);
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                String userId = resultSet.getString("user_id");
                System.out.println("userId: " + userId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}





