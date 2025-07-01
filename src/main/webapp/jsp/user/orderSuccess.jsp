<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    // Optionally clear the cart after successful payment
    session.removeAttribute("cart");
    session.removeAttribute("cartTotal");

    // Razorpay Payment ID (optional to display if passed via redirect or session)
    String paymentId = request.getParameter("payment_id"); // optional if you pass it
%>
<html>
<head>
    <title>✅ Order Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #e8f5e9; }
        .container { margin-top: 100px; text-align: center; }
        .payment-info { font-size: 1rem; color: #2e7d32; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-success mb-4">🎉 Order Placed Successfully!</h2>
    <p class="mb-4">Thank you for shopping with us.</p>

    <% if (paymentId != null) { %>
        <div class="payment-info">
            <strong>Payment ID:</strong> <%= paymentId %>
        </div>
    <% } %>

    <a href="<%= request.getContextPath() %>/myOrders" class="btn btn-primary mr-2">📦 My Orders</a>
    <a href="<%= request.getContextPath() %>/userDashboard" class="btn btn-secondary">🏠 Shop More</a>
</div>
</body>
</html>
