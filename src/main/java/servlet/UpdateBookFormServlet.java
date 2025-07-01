package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import dao.BookDAO;
import model.Book;
import dao.DBConnection;

public class UpdateBookFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles GET request to fetch book details by ID
     * and forwards them to the update form JSP.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String bookIdParam = request.getParameter("bookId");
        int bookId = 0;

        try {
            bookId = Integer.parseInt(bookIdParam);
        } catch (NumberFormatException e) {
            // Invalid ID format → redirect to adminViewBooks.jsp with message
            request.setAttribute("message", "Invalid book ID format.");
            request.getRequestDispatcher("jsp/admin/adminViewBooks.jsp").forward(request, response);
            return;
        }

        BookDAO bookDAO = new BookDAO(DBConnection.getConnection());
        Book book = bookDAO.getBookById(bookId);

        if (book != null) {
            request.setAttribute("book", book); // Found the book, forward to update form
            request.getRequestDispatcher("jsp/admin/updateBookForm.jsp").forward(request, response);
        } else {
            // Book not found → redirect back with inline message
            request.setAttribute("message", "Book not found!");
            request.getRequestDispatcher("jsp/admin/adminViewBooks.jsp").forward(request, response);
        }
    }
}
