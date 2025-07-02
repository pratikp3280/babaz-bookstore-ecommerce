package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import dao.DBConnection;

public class TestDBConnectionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            out.println("<h2 style='color: green;'>✅ MySQL DB Connection Successful!</h2>");
        } else {
            out.println("<h2 style='color: red;'>❌ DB Connection Failed. Check logs!</h2>");
        }
    }
}
