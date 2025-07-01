package dao;

import java.sql.*;
import model.User;


public class UserDAO {

    public static boolean registerUser(User user) {
        boolean result = false;
       
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (name, email, password , role) VALUES (?, ?, ? , 'user')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // ✅ This is the method your LoginServlet depends on
    public static User validateUser(String email, String password) {
        User user = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
           
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));  // ✅ Get role from DB
            }
        }
        catch (Exception e) {
        	System.out.println("❌ Error while registering user: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }
}
