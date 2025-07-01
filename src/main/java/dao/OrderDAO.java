package dao;

import java.sql.*;    //Connection, PreparedStatement, ResultSet.
import java.util.*;   // For using List, ArrayList, etc.
import model.Book;    //Book class here to get book data from the cart.


public class OrderDAO {

		//Method 1: placeOrder() - Takes user's email + cart (list) , Inserts order(s) into orders table,
	public static boolean placeOrder(String userEmail, List<Book> cart) {
	    boolean result = true;

	    try (Connection conn = DBConnection.getConnection()) {
	        conn.setAutoCommit(false);

	        for (Book book : cart) {
	            // Insert into orders
	            String orderSql = "INSERT INTO orders (user_email, book_id, quantity) VALUES (?, ?, 1)";
	            PreparedStatement psOrder = conn.prepareStatement(orderSql);
	            psOrder.setString(1, userEmail);
	            psOrder.setInt(2, book.getId());
	            psOrder.executeUpdate();

	            // Update stock
	            String updateSql = "UPDATE books SET stock = stock - 1 WHERE id = ? AND stock > 0";
	            PreparedStatement psUpdate = conn.prepareStatement(updateSql);
	            psUpdate.setInt(1, book.getId());

	            int rowsAffected = psUpdate.executeUpdate();

	            if (rowsAffected == 0) {
	                // Stock not available
	                conn.rollback();  // Cancel all previous inserts
	                System.out.println("⚠️ Not enough stock for book ID: " + book.getId());
	                return false;
	            }
	        }

	        conn.commit();
	    } catch (Exception e) {
	        result = false;
	        e.printStackTrace();
	    }

	    return result;
	}

    
    //Method 2: getOrdersByUser: Get all orders for a particular user.
    public static List<String[]> getOrdersByUser(String userEmail) {
        List<String[]> orders = new ArrayList<>();
       
        try (Connection conn = DBConnection.getConnection()) {
        
        	//Joins orders and books tables 
        	String sql = "SELECT o.id, b.title, b.price, o.quantity, o.order_date\r\n"
        			+ " FROM orders o JOIN books b ON o.book_id = b.id WHERE o.user_email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();
          
            //For every row found, extract ID, book title, and order date.
            while (rs.next()) {
               //Store in a list of string arrays.
            	orders.add(new String[] {
            		    rs.getString("id"),        // order[0]
            		    rs.getString("title"),     // order[1]
            		    rs.getString("price"),     // order[2]
            		    rs.getString("quantity"),  // order[3]
            		    rs.getString("order_date") // order[4]
            		});

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    //Method 3: getAllOrders: for Admin to get all orders by all users.
    public static List<String[]> getAllOrders() {
        List<String[]> orders = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection()) {
        	//Joins orders with books to get details.
        	String sql = "SELECT o.id, o.user_email, b.title, o.order_date FROM orders o JOIN books b ON o.book_id = b.id";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                orders.add(new String[]{
                    rs.getString("id"),
                    rs.getString("user_email"),
                    rs.getString("title"),
                    rs.getString("order_date")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}
