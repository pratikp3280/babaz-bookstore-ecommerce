package servlet;


import java.io.IOException;   //For handling input/output issues.
import java.util.*;          //For using List, ArrayList, etc.


import javax.servlet.http.*;   //HttpServlet, HttpSession
import javax.servlet.*;        // ServletException and ServletRequest/Response support.

import model.Book;         //Book objects inside the cart.

//it can handle HTTP requests like GET and POST
public class RemoveFromCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//This method runs automatically when a POST request is sent (from cart.jsp)
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
		
		int bookId = Integer.parseInt(req.getParameter("bookId"));   //Reads the bookId value from the form (<input type="hidden" name="bookId">).
       
		HttpSession session = req.getSession();  //Gets the current user's session.
       
		
		@SuppressWarnings("unchecked")
		List<Book> cart = (List<Book>) session.getAttribute("cart");  //Gets the cart list stored in the session.

        if (cart != null) {
            cart.removeIf(book -> book.getId() == bookId);  //lambda expression.
        }
//After removing the book, this sends the user back to the cart.jsp page.
        res.sendRedirect("jsp/user/cart.jsp");
    }
}
