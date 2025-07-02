<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author"); 
    String price = request.getParameter("price");
%>
<!-- Above lines retrieve values sent via GET Method  will fetch those query parameters.-->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Delete Book</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8d7da; /*Background is set to a light red warning color*/
        }
        .delete-container {
            max-width: 550px;
            margin: 70px auto;
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-left: 6px solid red;
        }
        .btn-space {
            margin-right: 10px;
        }
    </style>
</head>
<!-- Displays a title and warning in red to ask for deletion confirmation. -->
<body>
<div class="delete-container">
    <h3 class="text-danger text-center">🗑️ Confirm Deletion</h3>
    <p class="lead">Are you sure you want to delete the following book?</p>

	<!-- Shows the book details using JSP scriptlets  -->
    <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Title:</strong> <%= title %></li>
        <li class="list-group-item"><strong>Author:</strong> <%= author %></li>
        <li class="list-group-item"><strong>Price:</strong> ₹<%= price %></li>
    </ul>

	<!--  Confirm Deletion Form -->
    <form action="../../DeleteBookServlet" method="get" class="d-inline">
        <input type="hidden" name="id" value="<%= id %>">
        <button type="submit" class="btn btn-danger btn-space">Yes, Delete</button>
    </form>

	<!--  Cancel Button : returns back to the adminViewBooks.jsp page. -->
    <a href="adminViewBooks.jsp" class="btn btn-secondary">Cancel</a>
</div>
</body>
</html>
