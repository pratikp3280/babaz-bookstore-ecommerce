package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;


public class BookImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("id"));
        byte[] imageData = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT image FROM books WHERE id=?")) {

            stmt.setInt(1, bookId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageData = rs.getBytes("image");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // ✅ Serve book image or fallback to default
        if (imageData != null && imageData.length > 0) {
            response.setContentType("image/png");
            response.getOutputStream().write(imageData);
        } else {
            // Load placeholder image from webapp/images folder
            InputStream placeholderStream = getServletContext().getResourceAsStream("/images/default-book.jpg");

            if (placeholderStream != null) {
                response.setContentType("image/png");
                byte[] buffer = placeholderStream.readAllBytes();
                response.getOutputStream().write(buffer);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found.");
            }
        }
    }
}
