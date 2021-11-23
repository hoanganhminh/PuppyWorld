package context;

import java.sql.*;

public class DBContext {
    public Connection doConnect() {
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbo_url = "jdbc:sqlserver://localhost;databaseName=dog";
            String username = "sa";
            String password = "12345";

            connection = DriverManager.getConnection(dbo_url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void main(String[] args) {
        System.out.println(new DBContext().doConnect());
    }
}
