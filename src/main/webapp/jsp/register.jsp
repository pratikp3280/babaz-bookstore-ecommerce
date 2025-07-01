<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration - Online Book Store</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/register_page.css'/>">

</head>
<body>

<div class="register-container">
    <h2>📝 User Registration</h2>
    
    <% String error = request.getParameter("error"); %>
<% if ("duplicate".equals(error)) { %>
    <p class="error-msg">❌ This email is already registered. Please use a different email.</p>
<% } else  if (error != null) { %>
    <p class="error-msg">❌ Registration failed. Try again.</p>
<% } %>
    

     <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
        <label>Name:</label>
        <input type="text" name="name" required placeholder = "Enter your name">
		<br>
        <label>Email:</label>
        <input type="email" name="email" required placeholder = "Enter your email">
		<br>
      <label>Password:</label>
		<input type="password" id="password" name="password" required placeholder="Create new password">
		<br>
		<div style="display: flex;  align-items: center; margin-top: 0px;">
		    <div style="display: flex; align-items: center; gap: 1mm;">
		        <input type="checkbox" id="togglePassword">
		        <label for="togglePassword" style="font-size: 0.8em; font-weight: 500;">Show Password</label>
		    </div>
		</div>
		<br>
        <input type="submit" value="Register">
    </form>

    <p>Already registered? <a href="login.jsp">👉 Login here</a></p>
</div>



<script src="<c:url value='/JavaScript/scripts.js' />"></script>

</body>
</html>
