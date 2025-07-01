<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
 
<head>
    <meta charset="UTF-8">
    <title>Online Book Store</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            /*background: linear-gradient(to right, #42275a , #734b6d); -   pinkish-gradien 
            background-image: linear-gradient(to top, #0c3483 0%, #a2b6df 100%, #6b8cce 100%, #a2b6df 100%);  
            background-image: linear-gradient(to top, #09203f 0%, #537895 100%); 
            background-image: radial-gradient(73% 147%, #EADFDF 59%, #ECE2DF 100%), radial-gradient(91% 146%, rgba(255,255,255,0.50) 47%, rgba(0,0,0,0.50) 100%); */
            background-blend-mode: screen;
            background-image: linear-gradient(to top, #bdc2e8 0%, #bdc2e8 1%, #e6dee9 100%);
 
        }

        .header {
            /* background-color: #343a40;  default */
             background-image: linear-gradient(-225deg, #FF3CAC 0%, #562B7C 52%, #2B86C5 100%);
             background-image: linear-gradient(-225deg, #231557 0%, #44107A 29%, #FF1361 67%, #FFF800 100%);
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .content {
            padding: 40px;
            text-align: center;
        }

        .tagline {
            font-size: 22px;
            color: #444;
            margin-bottom: 30px;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 14px 30px;
            margin: 10px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            
            
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .features {
            margin-top: 40px;
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .card {
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            width: 280px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .footer {
            margin-top: 50px;
            background-color: #343a40;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 14px;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="header">
        📚 Welcome to the online Bookstore
    </div>

    <div class="content">
        <div class="tagline">
            Explore thousands of books. Add, Buy, and Read anytime, anywhere!
        </div>

		<a href="jsp/register.jsp"><button class="btn">Register</button></a>
        <a href="jsp/login.jsp"><button class="btn">Login</button></a>
		


        <div class="features">
            <div class="card">
                <h3>📖 Huge Collection</h3>
                <p>Access fiction, non-fiction, educational, and trending books with ease.</p>
            </div>
            <div class="card">
                <h3>🛒 Easy Ordering</h3>
                <p>Add books to cart, order them, and track your deliveries seamlessly.</p>
            </div>
            <div class="card">
                <h3>👨‍💼 Admin Dashboard</h3>
                <p>Manage books, view orders, and keep your store up-to-date efficiently.</p>
            </div>
        </div>
    </div>

    <div class="footer">
    <div style="padding: 20px 10px;">
        <h4 style="color: #ffd700;">📞 Contact Information</h4>
        <p>If you have any questions, feel free to get in touch with us.</p>
        <p><strong>📞</strong> +91 8217483280</p>
        <p><strong>📧</strong> pattupammu123@gmail.com</p>
        <p><strong>📍</strong> Pratik P Patil, Bengaluru Karnataka</p>
        <p ><strong>🕒</strong> Monday–Friday: 9:00 AM – 6:00 PM</p>

        <div style="margin-top: 30px;"></div>
        <p style="color: #ffd700;">Tap an icon to get in touch with us online:</p>
        <div class="social-links" style="margin-top: 10px;">
            <a href="https://www.facebook.com/babaz.buisiness/" target="_blank" title="Facebook" style="margin: 0 10px; color: white;">
                <i class="fab fa-facebook fa-2x"></i>
            </a>
            <a href="https://www.linkedin.com/in/pratik-p-patil-1485aa1bb/" target="_blank" title="LinkedIn" style="margin: 0 10px; color: white;">
                <i class="fab fa-linkedin fa-2x"></i>
            </a>
            <a href="https://www.facebook.com/babaz.buisiness/" target="_blank" title="Instagram" style="margin: 0 10px; color: white;">
                <i class="fab fa-instagram fa-2x"></i>
            </a>
            <a href="https://www.youtube.com/@Anilgoudapatil/featured" target="_blank" title="YouTube" style="margin: 0 10px; color: white;">
                <i class="fab fa-youtube fa-2x"></i>
            </a>
        </div>
    </div>

    <div style="margin-top: 30px; border-top: 1px solid #555; padding-top: 10px;">
        &copy; 2025 Online Book Store. All rights reserved.
    </div>
</div>

</body>
</html>
