package servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import dao.OrderDAO;

public class MyOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");
        List<String[]> orders = OrderDAO.getOrdersByUser(userEmail);

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("/jsp/user/myOrders.jsp").forward(req, res);
    }
}
