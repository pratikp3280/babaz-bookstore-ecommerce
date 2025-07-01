<%@ page import="java.util.*, model.Book, dao.BookDAO, dao.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - View Books</title>
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        body {
            background-color: #eef2f7;
        }
        .container {
            margin-top: 60px;
        }
        table {
            background-color: white;
            border-radius: 10px;
        }
        th, td {
            text-align: center;
            vertical-align: middle;
        }
        .btn {
            margin: 2px;
        }
        .book-img {
            width: 70px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<div>
    <a href="<%= request.getContextPath() %>/jsp/admin/adminDashboard.jsp" class="btn btn-secondary">⬅️ Back to Dashboard</a>
</div>

<div class="container">
    <h2 class="text-center mb-4">📚 Book Inventory (Admin View)</h2>

    <%-- ✅ Session message logic for redirects --%>
    <%
        String msg = (String) session.getAttribute("message");
        String error = (String) session.getAttribute("error");

        if (msg != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <%
            session.removeAttribute("message");
        }

        if (error != null) {
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <%
            session.removeAttribute("error");
        }
    %>

    <%-- ✅ Load books if not already set --%>
    <%
    List<Book> books = (List<Book>) request.getAttribute("bookList");
    if (books == null) {
        BookDAO dao = new BookDAO(DBConnection.getConnection());
        books = dao.getAllBooks();
    }
%>


    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Cover</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td>
                <img class="book-img" src="<%=request.getContextPath()%>/BookImageServlet?id=<%=book.getId()%>" alt="Book Image" />
            </td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPrice() %></td>
            <td><%= book.getStock() %></td>
            <td>
                <form action="<%= request.getContextPath() %>/UpdateBookFormServlet" method="get" style="display:inline;">
                    <input type="hidden" name="bookId" value="<%= book.getId() %>">
                    <button class="btn btn-warning btn-sm">✏️ Update</button>
                </form>

                <form action="<%= request.getContextPath() %>/DeleteBookServlet" method="post" style="display:inline;" onsubmit="return confirm('Delete this book?');">
                    <input type="hidden" name="bookId" value="<%= book.getId() %>">
                    <button class="btn btn-danger btn-sm">🗑️ Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7" class="text-center text-danger">No books available.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="<%= request.getContextPath() %>/jsp/admin/adminDashboard.jsp" class="btn btn-secondary">⬅️ Back to Dashboard</a>
    </div>
</div>

<!-- JS Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
