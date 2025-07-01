<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page session="true" %>

<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }
	
    @SuppressWarnings("unchecked") 
    List<Book> books = (List<Book>) request.getAttribute("bookList");
%>

<html>
<head>
    <title>Available Books</title>
    
    <style>
    table, th, td {
        border: 1px solid black;
        padding: 10px;
    }
    </style>
    
</head>

<body>
    <h2>📚 List of Available Books</h2>

    <table style="border-collapse: collapse; border: 1px solid black;">
        <tr>
            <th>ID</th><th>Title</th><th>Author</th><th>Action</th>
        </tr>

        <% if (books != null) {
            for (Book b : books) {
        %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td><form action="BuyServlet" method="post">
                    <input type="hidden" name="bookId" value="<%= b.getId() %>">
                    <input type="submit" value="Buy Now">
                </form></td>
            </tr>
        <%  }} else { %>
            <tr><td colspan="4">No books available.</td></tr>
        <% } %>
    </table>

    <br><a href="dashboard.jsp">🔙 Back to Dashboard</a>
    
    
    
</body>
</html>
