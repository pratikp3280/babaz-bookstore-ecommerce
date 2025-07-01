package servlet;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import dao.BookDAO;
import dao.DBConnection;
import model.Book;

public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String idStr = req.getParameter("bookId");
        int bookId = Integer.parseInt(idStr);

        BookDAO dao = new BookDAO(DBConnection.getConnection());
        boolean deleted = dao.deleteBook(bookId);

        if (deleted) {
            // ✅ Load updated book list
            List<Book> bookList = dao.getAllBooks();
            req.setAttribute("bookList", bookList);

            // ✅ Set success message
            req.setAttribute("message", "Book deleted successfully!");

            // ✅ Forward to JSP (no redirect needed)
            req.getRequestDispatcher("/jsp/admin/adminViewBooks.jsp").forward(req, res);
        } else {
            // Optional: Handle failure gracefully
            req.setAttribute("error", "Failed to delete the book.");
            req.getRequestDispatcher("/jsp/admin/adminViewBooks.jsp").forward(req, res);
        }
    }
}
