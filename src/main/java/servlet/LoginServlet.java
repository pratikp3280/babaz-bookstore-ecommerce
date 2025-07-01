package servlet;

import java.io.IOException;                           // For input/output exceptions
import javax.servlet.*;                               // For general servlet functionality
import javax.servlet.http.*;                          // For HTTP-specific servlet classes

import model.User;                                    // POJO representing a user
import dao.UserDAO;                                   // DAO class to interact with user-related DB operations

/**
 * This servlet handles user login requests.
 * It checks if the provided email & password are valid,
 * and manages session creation and redirection accordingly.
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST request sent from login form
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // 1. Read login credentials from request
        String email = req.getParameter("email");         // Get <input name="email">
        String password = req.getParameter("password");   // Get <input name="password">

        // 2. Call DAO to validate user credentials
        User user = UserDAO.validateUser(email, password);   // returns User object if valid, else null

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user); // Save full user object
            session.setAttribute("userEmail", user.getEmail());
            	
            String role = user.getRole();
            System.out.println("User role: " + role); // Debug log

            if ("admin".equalsIgnoreCase(user.getRole())) {
                res.sendRedirect(req.getContextPath() + "/jsp/admin/adminDashboard.jsp");
            } else if ("user".equalsIgnoreCase(user.getRole())) {
            	System.out.println("Login Success: " + user.getEmail() + " | Role: " + user.getRole());
            	res.sendRedirect(req.getContextPath() + "/userDashboard");

            } else {
                res.sendRedirect(req.getContextPath() + "/jsp/login.jsp?error=unauthorized");
            }

        } else {
//            req.setAttribute("error", "Invalid email or password");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/login.jsp");
            dispatcher.forward(req, res);
        }
        
        

    }
}