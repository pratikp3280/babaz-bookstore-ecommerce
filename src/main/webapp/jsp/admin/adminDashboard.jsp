<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?error=unauthorized");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Control Panel</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
           
            background-image: linear-gradient(to top, #bdc2e8 0%, #bdc2e8 1%, #e6dee9 100%);
        }
        .card {
            border-radius: 10px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.03);
        }
        
       
        
    </style>
</head>
<body>
    <div class="container text-center mt-3">
<div style="background-image: linear-gradient(-225deg, #FF3CAC 0%, #562B7C 52%, #2B86C5 100%);  padding: 10px; border-radius: 10px; color: white; margin-bottom: 20px;">
    <h2 class="mb-0">Admin Control Panel</h2>
</div>

<h3 style="color: teal;">👋 Welcome, Admin!</h3>

<p>
    This dashboard allows you to manage your entire bookstore efficiently and securely.<br>
    From adding new books to updating or deleting listings, everything is at your fingertips.<br>
    Ensure your catalog stays organized and up-to-date with ease.
</p>
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card p-4">
                    <h5>📚 Add Book</h5>
                    
                   <a href="<%=request.getContextPath()%>/jsp/admin/adminAddBook.jsp" class="btn btn-success mt-2"> ➕ Add Book</a>

                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card p-4">
                    <h5>📚⚙️🗂️ Manage Books</h5>
                    <a href="../../ViewBooksServlet" class="btn btn-info mt-2">👁️‍🗨️ View All Books</a>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card p-4">
                    <h5>🚪 Logout</h5>
                    <a href="../../jsp/login.jsp" class="btn btn-danger mt-2">↩ Logout</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
