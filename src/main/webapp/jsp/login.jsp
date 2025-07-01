<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login_page.css?v=2'/>">
</head>
<body>

<div class="register-container">
    <h2>👤 User Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <p class="error-msg">❌ Invalid credentials. Try again.</p>
    <% } %>

    <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required placeholder = "Enter your email">

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required placeholder = "Enter your password">

        <div style="margin-bottom: 20px;">
            <input type="checkbox" id="show-password" onclick="togglePassword()">
            <label for="show-password">Show Password</label>
        </div>

        <input type="submit" value="Login">
    </form>

    <p>Don't have an account? 👉 <a href="register.jsp">Register here</a></p>
</div>

<script>
    function togglePassword() {
        const passInput = document.getElementById("password");
        passInput.type = passInput.type === "password" ? "text" : "password";
    }
</script>

</body>
</html>
