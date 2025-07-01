package dao;

import java.sql.*;

public class PurchaseDAO {
    public static boolean purchaseBook(int userId, int bookId) {
        boolean result = false;
       
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO purchases (user_id, book_id) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
