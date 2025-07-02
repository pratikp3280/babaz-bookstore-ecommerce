<!-- Directive for the JSP engine: Ensures the browser interprets the page as HTML with UTF-8 encoding  -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <!-- Bootstrap for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Loads Bootstrap 4.5.2 for responsive layout and pre-defined styles. -->
    <style>
        body {
            background-color: #eef2f3;  /*Sets light background.*/
            background-image: linear-gradient(to top, #bdc2e8 0%, #bdc2e8 1%, #e6dee9 100%);
        }
        /*Creates a centered card layout with rounded corners and shadow.*/
        .add-container {
            max-width: 550px;
            margin: 60px auto;
           background-image: linear-gradient(to top, #dfe9f3 0%, white 100%);
         
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h3 {
            margin-bottom: 25px;  /*Adds spacing and padding for visual neatness.*/
        }
    </style>
</head>
<body>
<div class="add-container">
    <h3 class="text-center text-success">📘➕ Add New Book</h3>

	<!-- Submits data to the AddBookServlet via POST method. -->
    <form action="<%=request.getContextPath()%>/AddBookServlet" method="post" enctype="multipart/form-data">
        
        <!-- Each field is wrapped in a Bootstrap .form-group: -->
        <div class="form-group">
            <label for="title">Book Title 📖</label>
            <input type="text" id="title" name="title" class="form-control" placeholder="Enter book title" required> <!-- required: Ensures this field is mandatory. -->
        </div>

        <div class="form-group">
            <label for="author">Author ✍️</label>
            <input type="text" id="author" name="author" class="form-control" placeholder="Enter author name" required>
        </div>

        <div class="form-group">
            <label for="price">Price ₹</label>
            <input type="text" id="price" name="price" step="0.01" class="form-control" placeholder="Enter price" required>
        </div>
        
       <!-- Updated Book Category Field as Dropdown -->
    <div class="form-group">
        <label for="category">Book Category</label>
        <select id="category" name="category" class="form-control" required>
            <option value="" disabled selected>Select a category</option>
            <option value="Fiction">Fiction</option>
            <option value="Non-Fiction">Non-Fiction</option>
            <option value="Educational">Educational</option>
            <option value="Biography">Biography</option>
            <option value="Science">Science</option>
            <option value="Technology">Technology</option>
            <option value="Religious">Religious</option>
            <option value="Philosophy">Philosophy</option>
            <option value="Others">Others</option>
        </select>
    </div>


        <div class="form-group">
            <label for="quantity">Quantity/Stock📦</label>
            <input type="text" id="quantity" name="stock" class="form-control" placeholder="Enter quantity" required>
        </div>
        
        <div class="form-group">
            <label for="image">Image</label>
            <input type="file" id="image" name="image" class="form-control" placeholder="upload image" accept="image/*" >
        </div>
        
		
		<!-- Add Book Button: Submits the form. -->
        <button type="submit" class="btn btn-primary btn-block" >➕ Add Book</button>
        <!-- Back Button: Redirects to admin dashboard -->
        <a href="adminDashboard.jsp" class="btn btn-secondary btn-block">🔙 Back to Dashboard</a>
    </form>
</div>
</body>
</html>
