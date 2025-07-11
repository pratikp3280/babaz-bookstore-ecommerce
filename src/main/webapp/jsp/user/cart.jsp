<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.util.*, model.Book" %>
<%@ page session="true" %>
<%
    @SuppressWarnings("unchecked")
    List<Book> cart = (List<Book>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
    }
%>
<html>
<head>
    <title>🛒 My Cart</title>
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

<div class="container">
    <h3 class="text-center mb-4">🛒 Your Shopping Cart</h3>

    <% if (cart.isEmpty()) { %>
        <p class="text-center text-danger">Your cart is empty.</p>
    <% } else { %>
        <table class="table table-striped">
            <thead>
                <tr><th>Book</th><th>Title</th><th>Author</th><th>Price</th><th>Action</th></tr>
            </thead>
            <tbody>
                <%
                    double total = 0;
                    for (Book book : cart) {
                        if (book == null) continue;  // Skip null entries for safety
                        total += book.getPrice();
                %>
                    <tr>
                        <td>
                            <img class="book-img" src="<%=request.getContextPath()%>/BookImageServlet?id=<%=book.getId()%>" alt="Book Image" />
                        </td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td>₹<%= book.getPrice() %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/RemoveFromCartServlet" method="post">
                                <input type="hidden" name="bookId" value="<%= book.getId() %>">
                                <button class="btn btn-danger btn-sm">❌ Remove</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <h5 class="text-right">Total: ₹<%= total %></h5>

        <%-- ✅ Store total in session for Razorpay to access later --%>
        <%
            session.setAttribute("cartTotal", total);
        %>

        <%-- ✅ This form now goes to /purchase servlet directly --%>
        <form action="<%= request.getContextPath() %>/purchase" method="post" class="text-center">
            <button class="btn btn-success">✅ Pay Now</button>
        </form>
    <% } %>

    <div class="text-center mt-3">
        <a href="<%= request.getContextPath() %>/userDashboard" class="btn btn-secondary">⬅️ Back to Dashboard</a>
    </div>
</div>
</body>
</html>
