<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page session="true" %>
<%
    session.removeAttribute("cart");
    session.removeAttribute("cartTotal");
    String paymentId = request.getParameter("payment_id");
%>
<html>
<head>
    <title>✅ Order Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e8f5e9;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 80px;
            text-align: center;
        }

        .logo-img {
            height: 150px;
            width: 150px;
            margin-bottom: 30px;
        }

        .payment-info {
            font-size: 1rem;
            color: #2e7d32;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- ✅ Centered Logo -->
    <img src="<%= request.getContextPath() %>/images/babaz_logo_2.png" alt="BabaZ Logo" class="logo-img">

    <!-- ✅ Success Message -->
    <h2 class="text-success mb-4">🎉 Order Placed Successfully!</h2>
    <p class="mb-4">Thank you for shopping with us.</p>

    <% if (paymentId != null) { %>
        <div class="payment-info">
            <strong>Payment ID:</strong> <%= paymentId %>
        </div>
    <% } %>

    <!-- ✅ Buttons -->
    <a href="<%= request.getContextPath() %>/myOrders" class="btn btn-primary mr-2">📦 My Orders</a>
    <a href="<%= request.getContextPath() %>/userDashboard" class="btn btn-secondary">🏠 Shop More</a>
</div>

</body>
</html>
