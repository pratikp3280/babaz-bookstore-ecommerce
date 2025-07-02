<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container text-center mt-5">
    <h2 class="text-danger">🚫 Something went wrong</h2>
    <p><%= request.getAttribute("errorMessage") %></p>
   <a href="<%= request.getContextPath() %>/userDashboard" class="btn btn-secondary mt-3">⬅️ Back to Dashboard</a>
   
</div>
</body>
</html>
