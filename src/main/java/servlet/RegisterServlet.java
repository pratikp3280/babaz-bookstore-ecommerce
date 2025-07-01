package servlet;

import java.io.IOException;                          // For input/output operations
import javax.servlet.*;                              // For general servlet classes
import javax.servlet.http.*;                         // For HTTP-specific servlet classes

import dao.UserDAO;                                  // Custom DAO class to interact with DB
import model.User;                                   // POJO representing the user (name, email, password)

/**
 * This servlet handles user registration requests.
 * It reads form data, creates a User object, and saves it to the database.
 * If successful, it redirects to login page. Otherwise, back to register page with an error flag.
 */

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests sent from the registration form
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // 1. Get form parameters from the HTTP request
        String name = req.getParameter("name");           // Gets value of <input name="name">
        String email = req.getParameter("email");         // Gets value of <input name="email">
        String password = req.getParameter("password");   // Gets value of <input name="password">

        // 2. Create a new User object and populate its fields
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        // 3. Call DAO method to register user in DB
        boolean isRegistered = UserDAO.registerUser(user);  // returns true if registration successful

        // 4. Redirect user based on registration result
        if (isRegistered) {
        	 res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
        } else {
           
        	res.sendRedirect(req.getContextPath() + "/jsp/register.jsp?error=duplicate");
        }
    }
}
