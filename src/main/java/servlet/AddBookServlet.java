package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import dao.BookDAO;
import dao.DBConnection;
import model.Book;

@MultipartConfig
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            // Step 1: Read form input
            String title = req.getParameter("title");
            String author = req.getParameter("author");
            String category = req.getParameter("category");
            double price = Double.parseDouble(req.getParameter("price"));
            int stock = Integer.parseInt(req.getParameter("stock"));

            // Step 2: Read uploaded image as byte[]
            Part filePart = req.getPart("image");
            InputStream imageStream = filePart.getInputStream();
            byte[] imageBytes = imageStream.readAllBytes();

            // Step 3: Create Book object and set all values
            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setCategory(category);
            book.setPrice(price);
            book.setStock(stock);
            book.setImage(imageBytes);  // Store image as byte[]

            // Step 4: Save to DB using DAO
            BookDAO dao = new BookDAO(DBConnection.getConnection());
            boolean added = dao.addBook(book);

            // Step 5: Response back
            if (added) {
                HttpSession session = req.getSession();
                session.setAttribute("msg", "✅ Book added successfully!");
                res.sendRedirect("jsp/admin/adminViewBooks.jsp");
            } else {
                req.setAttribute("msg", "❌ Failed to add book. Please try again.");
                req.getRequestDispatcher("jsp/admin/adminAddBook.jsp").forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Something went wrong! " + e.getMessage() + "</h2>");
            req.getRequestDispatcher("jsp/admin/adminAddBook.jsp").include(req, res);
        }
    }
}
