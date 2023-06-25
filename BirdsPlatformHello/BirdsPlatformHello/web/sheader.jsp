<%-- 
    Document   : sheader
    Created on : Jun 10, 2023, 9:39:15 AM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>header</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/shop.css">
    </head>
    <body>
              <!-- header section starts  -->

        <header class="header">
            <a href="HomePage.jsp" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

            <form action="#" class="search-form">
                <input type="search" placeholder="search here..." id="search-box">
                <label for="search-box" class="ri-search-line"></label>
            </form>

            <div class="icons">
                <div id="menu-btn" class="ri-menu-line"></div>
                <div id="search-btn" class="ri-search-line"></div>
                <div><a href="cartview.jsp" id="cart-btn" class="ri-shopping-cart-line"></a></div>
                <div id="login-btn" class="ri-user-line"></div>
            </div>
        </header>

        <!-- header section ends  -->


        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>

        <!-- navbar start  -->

        <nav class="navbar">
            <a href="home.html">Home</a>
            <a href="shop.html">Shop</a>
            <a href="about.html">About</a>
            <a href="team.html">Team</a>
            <a href="blog.html">Blog</a>
            <a href="contact.html">Contact</a>
        </nav>

        <!-- navbar end  -->


       


        <!-- login form start  -->

        <div class="login-form">
            <form action="#">
                <h3>login form</h3>
                <input type="email" placeholder="enter your email" class="box">
                <input type="password" placeholder="enter your password" class="box">
                <div class="remember">
                    <input type="checkbox" name="" id="remember-me">
                    <label for="remember-me">remember me</label>
                </div>
                <input type="submit" value="login now" class="btn">
                <p>forget password? <a href="#">click here</a> </p>
                <p>don't have an account? <a href="#">create now</a> </p>
            </form>
        </div>

        <!-- login form end  -->
    </body>
</html>
