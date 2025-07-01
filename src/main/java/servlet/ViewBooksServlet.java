package servlet;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.*;
import java.util.List;
import dao.BookDAO;
import model.Book;
import dao.DBConnection;

public class ViewBooksServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		BookDAO dao = new BookDAO(DBConnection.getConnection());
		List<Book> books = dao.getAllBooks();  // Get list of books

		// ✅ Send data to JSP using request attribute
		req.setAttribute("bookList", books);

		// ✅ Forward to JSP page that handles the UI
		req.getRequestDispatcher("jsp/admin/adminViewBooks.jsp").forward(req, res);
	}
}


// Sends the List<Book> to your JSP.
// JSP handle display the list using JSTL/Java code with Bootstrap styling.
// clean, maintainable, and MVC-compliant