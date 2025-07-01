package servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import model.Book;
import dao.OrderDAO;

public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get current session
        HttpSession session = req.getSession(false); // false = don't create if not exists

        // 🔍 Debug: Print session data
        System.out.println("🧪 [CheckoutServlet] Checking session data...");
        if (session == null) {
            System.out.println("⚠️ Session is null. Redirecting to login.");
            res.sendRedirect("login.jsp");
            return;
        } else {
            System.out.println("✅ Session exists.");
            System.out.println("User Email: " + session.getAttribute("userEmail"));
            System.out.println("Cart: " + session.getAttribute("cart"));
        }

        // Retrieve data from session
        @SuppressWarnings("unchecked")
        List<Book> cart = (List<Book>) session.getAttribute("cart");
        String userEmail = (String) session.getAttribute("userEmail");

        // Check for valid user and non-empty cart
        if (userEmail != null && cart != null && !cart.isEmpty()) {
            boolean isOrderPlaced = OrderDAO.placeOrder(userEmail, cart);
            System.out.println("Order placed? " + isOrderPlaced);

            if (isOrderPlaced) {
                session.removeAttribute("cart");
                res.sendRedirect(req.getContextPath() + "/jsp/user/orderSuccess.jsp"); // Adjust path if needed
            } else {
                req.setAttribute("errorMessage", "❌ Failed to place your order. Please try again.");
                req.getRequestDispatcher("/jsp/user/error.jsp").forward(req, res);
            }
        } else {
            System.out.println("❌ Cart is null/empty or userEmail is null.");
            req.setAttribute("errorMessage", "⚠️ Your cart is empty or your session has expired.");
            req.getRequestDispatcher("/jsp/user/error.jsp").forward(req, res);
        }
    }
}
