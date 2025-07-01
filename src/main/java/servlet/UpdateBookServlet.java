package servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import dao.BookDAO;
import model.Book;
import dao.DBConnection;

@MultipartConfig
public class UpdateBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            // Get book ID
            String bookIdParam = req.getParameter("bookId");
            if (bookIdParam == null || bookIdParam.isEmpty()) {
                res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing book ID");
                return;
            }

            int bookId = Integer.parseInt(bookIdParam);
            String title = req.getParameter("title");
            String author = req.getParameter("author");
            String category = req.getParameter("category");
            double price = Double.parseDouble(req.getParameter("price"));
            int stock = Integer.parseInt(req.getParameter("stock"));

            // Handle optional image
            Part imagePart = req.getPart("image");
            byte[] imageBytes = null;

            if (imagePart != null && imagePart.getSize() > 0) {
                try (InputStream inputStream = imagePart.getInputStream()) {
                    imageBytes = inputStream.readAllBytes();
                }
            }

            // Create Book object
            Book updatedBook = new Book(title, author, category, price, stock);
            updatedBook.setId(bookId);
            updatedBook.setImage(imageBytes); // can be null

            // Update in DB
            BookDAO dao = new BookDAO(DBConnection.getConnection());
            boolean updated = dao.updateBook(updatedBook);

            if (updated) {
                System.out.println("✅ Book updated successfully. ID: " + bookId);
                res.sendRedirect("ViewBooksServlet"); // Redirect to book list
            } else {
                res.setContentType("text/html");
                res.getWriter().println("<h3 style='color:red;'>❌ Update Failed</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.setContentType("text/html");
            res.getWriter().println("<h3 style='color:red;'>⚠️ Error: " + e.getMessage() + "</h3>");
        }
    }
}
