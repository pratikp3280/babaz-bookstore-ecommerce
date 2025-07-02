<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    String userName = (loggedInUser != null) ? loggedInUser.getName() : "Unknown";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Online Bookstore</title>
    
    <!-- Bootstrap & Font Awesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
    
    <style>
        body {
         background-image: linear-gradient(-225deg, #FF3CAC 0%, #562B7C 52%, #2B86C5 100%);
         background-image: linear-gradient(-225deg, #231557 0%, #44107A 29%, #FF1361 67%, #FFF800 100%); }
        .navbar { margin-bottom: 30px; }
        .highlight-yellow { color: #ffd700; font-weight: bold; }
       
    </style>
</head>
<body>

<!-- ✅ NAVBAR Copied Exactly -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">📚 OnlineBookstore</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/userDashboard">🏠 Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#">ℹ️ About</a></li>
            <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/jsp/contact.jsp">📞 Contact</a></li>
            <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/jsp/user/cart.jsp">🛒 My Cart</a></li>
            <li class="nav-item"><a class="nav-link text-danger" href="<%= request.getContextPath() %>/index.jsp">🚪 Logout</a></li>
        </ul>
    </div>
</nav>

<!-- ✅ Contact Info Section -->
<div class="container">
   <!--   <h3 class="text-center mb-4">Welcome, <%= userName %> 👋</h3> -->

    <div class="contact-section row">
        <div class="col-md-6 contact-info">
            <h2 class="highlight-yellow">Contact information</h2>
            <p>If you have any questions, feel free to get in touch with us.</p>
            <p><strong>📞</strong> +91 8217483280 </p>
            <p><strong>📧</strong> pattupammu123@gmail.com </p>
            <p><strong>📍</strong> Pratik P Patil, Bengaluru Karnataka</p>
            <p class="highlight-yellow"><strong>🕒</strong> Monday–Friday: 9:00 AM – 6:00 PM</p>

            <!-- Gap Before Social Section -->
            <div style="margin-top: 100px;"></div>

            <p class="highlight-yellow">Tap an icon to get in touch with us online:</p>
            <div class="social-links">
                <a href="https://www.facebook.com/babaz.buisiness/" target="_blank" title="Facebook"><i class="fab fa-facebook fa-2x"></i></a>
                <a href="https://www.linkedin.com/in/pratik-p-patil-1485aa1bb/" target="_blank" title="LinkedIn"><i class="fab fa-linkedin fa-2x"></i></a>
                <a href="https://www.facebook.com/babaz.buisiness/" target="_blank" title="Instagram"><i class="fab fa-instagram fa-2x"></i></a>
                <a href="https://www.youtube.com/@Anilgoudapatil/featured" target="_blank" title="YouTube"><i class="fab fa-youtube fa-2x"></i></a>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="col-md-6 contact-form">
            <form action="${pageContext.request.contextPath}/ContactServlet" method="post">
                <input type="text" name="firstName" placeholder="First name" class="form-control mb-2" required>
                <input type="text" name="lastName" placeholder="Last name" class="form-control mb-2" required>
                <input type="email" name="email" placeholder="Email" class="form-control mb-2" required>
                <input type="text" name="phone" placeholder="Phone number" class="form-control mb-2" required>
                <textarea name="message" placeholder="Your message" class="form-control mb-3" rows="5" required></textarea>
                <button type="submit" class="btn btn-primary btn-block">Send message</button>
            </form>
        </div>
    </div>
    
    <!-- ✅ Footer section -->
<div class="footer" style="margin-top: 50px; background-color: #343a40; color: white; padding: 15px; text-align: center; font-size: 14px;">
    &copy; 2025 Online Book Store. All rights reserved.
</div>

</div>

</body>
</html>
