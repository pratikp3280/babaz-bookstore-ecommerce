<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDAO" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("userEmail");
    List<String[]> orders = OrderDAO.getOrdersByUser(email);
%>

<!DOCTYPE html>
<html>
<head>
    <title>📦 My Orders</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #fce4ec); /* Soft pastel gradient */
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        h3 {
            color: #333;
            font-weight: 600;
        }

        table {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .alert {
            margin-top: 20px;
        }

        .back-btn {
            margin-top: 30px;
        }
    </style>
</head>

<body>

<div class="container">
    <h3 class="text-center mb-4">🧾 Your Order History</h3>

    <% if (orders == null || orders.isEmpty()) { %>
        <div class="alert alert-warning text-center">
            You haven’t placed any orders yet.
        </div>
    <% } else { %>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
               <thead class="text-center">
    <tr>
        <th>🆔 Order ID</th>
        <th>📘 Product</th>
        <th>💰 Amount Paid</th>
        <th>🧮 Quantity</th> <!-- ✅ New column -->
        <th>🕒 Order Date & Time</th>
    </tr>
</thead>
<tbody>
    <% for (String[] order : orders) { %>
        <tr>
            <td class="text-center"><%= order[0] %></td>  <!-- ID -->
            <td><%= order[1] %></td>                       <!-- Title -->
            <td>₹<%= order[2] %></td>                      <!-- Price -->
            <td><%= order[3] %></td>                       <!-- ✅ Quantity -->
            <td><%= order[4] %></td>                       <!-- Date -->
        </tr>
    <% } %>
</tbody>
            </table>
        </div>
    <% } %>

    <!-- Back to Dashboard -->
    <div class="text-center back-btn">
        <a href="<%= request.getContextPath() %>/userDashboard" class="btn btn-secondary">
            ⬅️ Back to Dashboard
        </a>
    </div>
</div>

</body>
</html>
