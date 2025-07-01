package testing;

import java.sql.Connection;
import java.sql.DriverManager;

public class jdbc_test {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/JAVA_PROJECT", "root", "Pratik@123.in"
            );
            System.out.println("Connected!");
            System.out.println("Connection Established : " + conn);
    		System.out.println("___________________________________X________________________________");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
