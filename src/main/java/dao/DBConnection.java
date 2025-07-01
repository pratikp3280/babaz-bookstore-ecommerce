// Updated Version for Docker Compose:
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get environment variables from Render Dashboard
            String url = System.getenv("DB_URL");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            conn = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}


/*  package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	// Database URL (connects to your MySQL DB running locally)
    private static final String URL = "jdbc:mysql://localhost:3306/online_bookstore";
 // Username and password 
    private static final String USER = "root";
    private static final String PASSWORD = "Pratik@123.in";

    // Public method to return a live DB connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
        	// Load the MySQL JDBC driver (required once)
            Class.forName("com.mysql.cj.jdbc.Driver");
         // Establish connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();    // Print any connection or driver loading errors
        }
        return conn;
    }
}



 *getConnection() - It lets us connect to MySQL from anywhere in our project with just one line:
 * Connection conn = DBConnection.getConnection();
 *
 * */
 