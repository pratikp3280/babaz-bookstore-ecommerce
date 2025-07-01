package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import dao.BookDAO;
import dao.DBConnection;
import model.Book;
import model.User;



public class UserDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);

        if (user == null || !"user".equalsIgnoreCase(user.getRole())) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp?error=unauthorized");
            return;
        }

        List<Book> books = null;

        try {
            Connection conn = DBConnection.getConnection();
            BookDAO bookDAO = new BookDAO(conn);
            books = bookDAO.getAllBooks();
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("books", books);
        req.setAttribute("loggedInUser", user);  // ✅ Critical Fix
        req.getRequestDispatcher("/jsp/user/userDashboard.jsp").forward(req, res);

    }
}