<%@ page import="model.Book" %>   <!--  Imports the Book class so it can be used in JSP just like in Java.-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  <!-- especially useful for emoji or non-English text -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
    <!-- Bootstrap for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .update-container {
            max-width: 500px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h3 {
            margin-bottom: 20px;
        }
        
        #back_to_dashboard {
        	margin : 10px;
        	align
        }
    </style>
</head>

<body>
	 <aside id="back_to_dashboard" >
    <a href="<%= request.getContextPath() %>/jsp/admin/adminDashboard.jsp" class="btn btn-secondary">⬅️ Back to Dashboard</a>
    </aside>
<div class="update-container">

    <h3 class="text-center text-primary">✏️ Update Book Details</h3>
   

    <%
    /* Getting the Book from Request Attribute*/
        Book book = (Book) request.getAttribute("book");
        if (book != null) {                   /* ensures the form is shown only if the book was found.*/
    %>
<!-- When the user clicks submit, it sends the updated data to UpdateBookServlet using POST. -->
   <form action="${pageContext.request.contextPath}/UpdateBookServlet" method="post" enctype="multipart/form-data">
        <!-- Hidden ID -->
        <input type="hidden" name="bookId" value="${book.id}" />

        <div class="form-group">
            <label>📘 Title</label>
            <input type="text" name="title" class="form-control" value="<%= book.getTitle() %>" required>
        </div>

        <div class="form-group">
            <label>✍️ Author</label>
            <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>" required>
        </div>
		
		<div class="form-group">
            <label>🖊️📚 Category</label>
            <input type="text" name="category" class="form-control" value="<%= book.getCategory() %>" required>
        </div>
        
        <div class="form-group">
            <label>💰 Price (₹)</label>
            <input type="text" name="price" step="0.01" class="form-control" value="<%= book.getPrice() %>" required>
        </div>

        <div class="form-group">
            <label>📦 Quantity</label>
            <input type="text" name="stock" class="form-control" value="<%= book.getStock() %>" required>
        </div>
        
        <div class="form-group">
        <label>📷 Upload New Image (optional)</label>
        <input type="file" name="image" class="form-control-file" accept="image/*">
    </div>

    <!-- Optionally show current image -->
    <div class="form-group text-center">
        <label>Current Image:</label><br/>
        <img src="${pageContext.request.contextPath}/BookImageServlet?id=<%= book.getId() %>" width="120" height="160" />
    </div>

      <!-- Cancel and Submit Buttons -->
        <button type="submit" class="btn btn-success btn-block">✅ Save Changes</button>    <!-- if Form is Sumbitted after Updating Book  -->
        
        <a href="<%= request.getContextPath() %>/ViewBooksServlet" class="btn btn-secondary btn-block">🔙 Cancel</a>      <!-- redirects back to view the books list without saving. -->
     
    </form>

    <%
        } 
        /*If Book Is Not Found: warning msg is shown */
        else {
    %>
        <p class="text-danger text-center">Book not found. ⚠️</p>
    <%
        }
    %>
</div>
</body>
</html>
