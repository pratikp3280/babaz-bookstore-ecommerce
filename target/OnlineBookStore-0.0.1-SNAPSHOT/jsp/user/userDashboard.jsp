<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Book, model.User" %>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
    User loggedInUser = (User) session.getAttribute("user");
    String userName = (loggedInUser != null) ? loggedInUser.getName() : "Unknown";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Online Bookstore</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f5f8fa;
        }

        .navbar {
            margin-bottom: 30px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .card {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .book-image {
            height: 220px;
            width: 160px;
            object-fit: cover;
            border-radius: 6px;
            margin-top: 15px;
        }

        .card-body {
            text-align: center;
            padding-bottom: 20px;
        }

        h5.card-title {
            font-size: 1.1rem;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .btn {
            margin-top: 8px;
        }

        /* 🆙 Back to Top Button */
        #topBtn {
            display: none;
            position: fixed;
            bottom: 40px;
            right: 30px;
            z-index: 999;
            background-color: yellow;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 18px;
            border-radius: 50px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
            cursor: pointer;
        }

        #topBtn:hover {
            background-color: Aqua;
        }
    </style>
</head>

<body>

<!-- ✅ NAVBAR (Sticky) -->
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

<div class="container">
    <h3 class="text-center mb-4">Welcome, <%= userName %> 👋</h3>

    <div class="row">
        <%
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <img src="<%= request.getContextPath() %>/BookImageServlet?id=<%= book.getId() %>"
                     alt="Book Image"
                     class="card-img-top mx-auto d-block book-image">

                <div class="card-body text-center">
                    <h5 class="card-title font-weight-bold"><%= book.getTitle() %></h5>
                    <p><strong>Author:</strong> <%= book.getAuthor() %></p>
                    <p><strong>Category:</strong> <%= book.getCategory() %></p>
                    <p><strong>Price:</strong> ₹<%= book.getPrice() %></p>
                    <p><strong>Stock:</strong> <%= book.getStock() %></p>

                    <form action="<%= request.getContextPath() %>/PurchaseServlet" method="post" class="d-inline">
                        <input type="hidden" name="bookId" value="<%= book.getId() %>">
                        <button type="submit" class="btn btn-success">Buy Now</button>
                    </form>

                    <form action="<%= request.getContextPath() %>/AddToCartServlet" method="post" class="d-inline">
                        <input type="hidden" name="bookId" value="<%= book.getId() %>">
                        <button type="submit" class="btn btn-outline-primary ml-2">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-12 text-center alert alert-warning">🚫 No books available at the moment.</div>
        <%
            }
        %>
    </div>
</div>

<!-- 🆙 Back to Top Button -->
<button onclick="scrollToTop()" id="topBtn" title="Go to top">🔝</button>

<script>
    // Show button after scrolling
    window.onscroll = function() {
        const topBtn = document.getElementById("topBtn");
        if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
            topBtn.style.display = "block";
        } else {
            topBtn.style.display = "none";
        }
    };

    // Scroll to top smoothly
    function scrollToTop() {
        window.scrollTo({top: 0, behavior: 'smooth'});
    }
</script>

</body>
</html>
