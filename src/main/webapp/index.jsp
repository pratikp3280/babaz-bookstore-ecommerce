<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Book Store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        /* 1) Full-page background */
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/book_Image_Flex.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        /* 2) Overlay for content so text/cards stand out */
        .content {
            position: relative;
            padding: 40px;
            text-align: center;
            z-index: 1;
        }
        .content::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(24, 24, 24, 0.9);
            z-index: -1;
            border-radius: 8px;
          
        }

        /* Header with left-aligned logo and centered text */
        .header {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            padding: 20px;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
            background-image: linear-gradient(-225deg, #231557 0%, #44107A 29%, #FF1361 67%, #FFF800 100%);
        }
        .header img.logo {
            position: absolute;
            left: 50px;
            height: 70px;
            width: 80px;
        }

        /* Tagline plate */
        .tagline-plate {
            display: inline-block;
            background-color: rgba(0,0,0,0.6);
            padding: 12px 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .tagline-plate .tagline {
            font-size: 2rem;
            color: #fff;
            text-shadow:
                0 0 5px rgba(255,255,255,0.8),
                0 0 10px rgba(255,255,255,0.6);
        }

        /* NEW: center buttons and add vertical spacing */
        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 30px 0;
        }
        .button-group .btn {
            margin: 0; /* reset, since gap handles spacing */
        }

        /* Button styles */
        .btn {
            background-color: #007bff;
            color: white;
            padding: 14px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }

        /* Feature cards */
        .features {
            margin-top: 40px;
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }
        .card {
            background-color: rgba(255,255,255,0.9);
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

        /* Footer */
        .footer {
            margin-top: 50px;
            background-color: rgba(24, 24, 24, 0.9);
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 14px;
        }

        a {
            text-decoration: none;
        }
        
        .cursor {
  display: inline-block;
  animation: blink 0.7s steps(1) infinite;
 
  color: #fff;
}

@keyframes blink {
  50% { opacity: 0; }
}
        
    </style>
</head>

<body>

    <div class="header">
        <img class="logo" src="images/babaz_logo_2.png" alt="BabaZ Logo"/>
        📚 Welcome to the Online Bookstore
    </div>

    <div class="content">
        <div class="tagline-plate">
  <div class="tagline"><span id="typewriter"></span><span class="cursor">|</span></div>
</div>

        <!-- Wrapped buttons in a flex container -->
        <div class="button-group">
            <a href="jsp/register.jsp"><button class="btn">Register</button></a>
            <a href="jsp/login.jsp"><button class="btn">Login</button></a>
        </div>

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
            <h4 style="color: #ffd700; font-size: 1rem;">📞 Contact Information</h4>
            <p>If you have any questions, feel free to get in touch with us.</p>
            <p><strong>📞</strong> +91 8217483280</p>
            <p><strong>📧</strong> pattupammu123@gmail.com</p>
            <p><strong>📍</strong> Pratik P Patil, Bengaluru Karnataka</p>
            <p><strong>🕒</strong> Monday–Friday: 9:00 AM – 6:00 PM</p>

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
<script>
  const texts = [
    "Explore thousands of books.",
    "Add, Buy, and Read anytime, anywhere!",
    "New here? Click Register to join us!",
    "Already registered? Click Login to continue."
  ];
  let curText = 0, charIdx = 0;
  const speed = 100;  // ms per character
  const wait = 2000;  // pause between full texts
  const dest = document.getElementById('typewriter');

  function type() {
    const full = texts[curText];
    if (charIdx <= full.length) {
      dest.textContent = full.slice(0, charIdx++);
      setTimeout(type, speed);
    } else {
      setTimeout(() => {
        // reset for next text
        charIdx = 0;
        curText = (curText + 1) % texts.length;
        type();
      }, wait);
    }
  }

  document.addEventListener('DOMContentLoaded', type);
</script>

</body>
</html>
