package dao;

import java.sql.*;
import java.util.*;
import model.Book;

public class BookDAO {
    private Connection conn;

    public BookDAO(Connection conn) {
        this.conn = conn;
    }

    // ✅ Add book (with image)
    public boolean addBook(Book book) {
        String sql = "INSERT INTO books (title, author, category, price, stock, image) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getCategory());
            ps.setDouble(4, book.getPrice());
            ps.setInt(5, book.getStock());
            ps.setBytes(6, book.getImage());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Updated: Fetch all books (including image for display)
    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM books"; // includes image column

        try (Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setAuthor(rs.getString("author"));
                b.setCategory(rs.getString("category"));
                b.setPrice(rs.getDouble("price"));
                b.setStock(rs.getInt("stock"));
                b.setImage(rs.getBytes("image")); // ✅ needed for BookImageServlet

                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Fetch book by ID (used in BookImageServlet)
    public Book getBookById(int id) {
        Book book = null;
        String sql = "SELECT * FROM books WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setCategory(rs.getString("category"));
                book.setPrice(rs.getDouble("price"));
                book.setStock(rs.getInt("stock"));
                book.setImage(rs.getBytes("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }

    // ✅ Update book (image optional)
    public boolean updateBook(Book book) {
        boolean status = false;

        String sqlWithImage = "UPDATE books SET title=?, author=?, category=?, price=?, stock=?, image=? WHERE id=?";
        String sqlWithoutImage = "UPDATE books SET title=?, author=?, category=?, price=?, stock=? WHERE id=?";

        try {
            PreparedStatement ps;
            if (book.getImage() != null) {
                ps = conn.prepareStatement(sqlWithImage);
                ps.setString(1, book.getTitle());
                ps.setString(2, book.getAuthor());
                ps.setString(3, book.getCategory());
                ps.setDouble(4, book.getPrice());
                ps.setInt(5, book.getStock());
                ps.setBytes(6, book.getImage());
                ps.setInt(7, book.getId());
            } else {
                ps = conn.prepareStatement(sqlWithoutImage);
                ps.setString(1, book.getTitle());
                ps.setString(2, book.getAuthor());
                ps.setString(3, book.getCategory());
                ps.setDouble(4, book.getPrice());
                ps.setInt(5, book.getStock());
                ps.setInt(6, book.getId());
            }

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ✅ Delete
    public boolean deleteBook(int id) {
        try (PreparedStatement ps = conn.prepareStatement("DELETE FROM books WHERE id = ?")) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
