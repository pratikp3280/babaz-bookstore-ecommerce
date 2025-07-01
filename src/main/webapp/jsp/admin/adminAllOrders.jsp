<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!-- DIRECTIVES & DATA FETCHING -->
<%@ page import="java.util.List" %>  
<%@ page import="dao.OrderDAO" %>   <!-- you can call getAllOrders(). -->
<%
    List<String[]> orders = OrderDAO.getAllOrders();   // fetches all orders from the database
%>
<html>
<head>
    <title>📦 All Orders - Admin View</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h3 class="text-center mb-4">📦 All Orders</h3>

	<!-- If there are no orders  it shows a red message. -->
    <% if (orders.isEmpty()) { %>
        <p class="text-center text-danger">No orders found.</p>
    <% } 
    //DISPLAY TABLE OF ALL ORDERS
    else { %>
        <table class="table table-striped">
            <thead><tr><th>Order ID</th><th>User Email</th><th>Book</th><th>Date</th></tr></thead>
            <tbody>
            <% for (String[] order : orders) { %>
                <tr>
                    <td><%= order[0] %></td>    <!--  Order ID  -->
                    <td><%= order[1] %></td>    <!--  User Email -->
                    <td><%= order[2] %></td>    <!--  Book Title -->
                    <td><%= order[3] %></td>	<!--  Order Date -->
                </tr>
            <% } %>
            </tbody>
        </table>
    <% } %>
</div>
</body>
</html>
