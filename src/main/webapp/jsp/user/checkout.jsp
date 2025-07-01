<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout | Razorpay</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>

<h3 class="text-center">Redirecting to Razorpay...</h3>

<%
    // Capture context path for redirect
    String contextPath = request.getContextPath();
%>

<script>
    // 👇 Java context path from JSP
    var contextPath = "<%= contextPath %>";

    var options = {
        "key": "<%= request.getAttribute("key") %>",  // Razorpay Test Key
        "amount": "<%= request.getAttribute("amount") %>", // In paise
        "currency": "INR",
        "name": "Online Bookstore",
        "description": "Book Purchase",
        "image": "https://yourdomain.com/logo.png", // optional
        "order_id": "<%= request.getAttribute("orderId") %>",

        "handler": function (response) {
            // ✅ Redirect with payment ID using correct context path
            alert("Payment Successful! Payment ID: " + response.razorpay_payment_id);
            window.location.href = contextPath + "/jsp/user/orderSuccess.jsp?payment_id=" + response.razorpay_payment_id;
        },

        "prefill": {
            "name": "Test User",
            "email": "test@example.com"
        },

        "theme": {
            "color": "#3399cc"
        }
    };

    var rzp1 = new Razorpay(options);
    rzp1.open();
</script>

</body>
</html>
