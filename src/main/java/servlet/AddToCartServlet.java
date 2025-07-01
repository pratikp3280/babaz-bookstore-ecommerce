package servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import dao.BookDAO;
import dao.DBConnection;
import model.Book;

public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int bookId = Integer.parseInt(req.getParameter("bookId"));

        // Get the book object
        BookDAO dao = new BookDAO(DBConnection.getConnection());
        Book book = dao.getBookById(bookId);

        // Maintain the session
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        List<Book> cart = (List<Book>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Avoid duplicate books in the cart (optional enhancement)
        boolean alreadyInCart = false;
        for (Book b : cart) {
            if (b.getId() == bookId) {
                alreadyInCart = true;
                break;
            }
        }

        if (!alreadyInCart && book != null) {
            cart.add(book);
        }

        session.setAttribute("cart", cart);

        // ✅ Redirect back to user dashboard after adding to cart
        res.sendRedirect(req.getContextPath() + "/userDashboard"); // This should match your servlet mapping
    }
}
