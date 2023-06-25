<%-- 
    Document   : saleList
    Created on : May 31, 2023, 12:12:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>shop</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/total.css">

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
                <div id="cart-btn" class="ri-shopping-cart-line"></div>
                <div id="login-btn" class="ri-user-line"></div>
            </div>
        </header>

        <!-- header section ends  -->


        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>

        <!-- navbar start  -->

        <nav class="navbar">
            <a href="HomePage.jsp">Home</a>
            <a href="shop.html">Shop</a>
            <a href="about.html">About</a>
            <a href="team.html">Team</a>
            <a href="saleListController">On Sale</a>
            <a href="contact.html">Contact</a>
        </nav>

        <!-- navbar end  -->


        <!-- shopping cart start  -->

        <div class="shopping-cart">

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $ </span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $ </span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $1</span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $1 </span>
                </div>
            </div>

            <h3 class="total"> total : <span>$560.00</span> </h3>
            <a href="#" class="btn">checkout cart</a>

        </div>

        <!-- shopping cart end  -->


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


        <!-- heading section start -->

        <section class="heading">
            <h3>SALE</h3>
            <p> <a href="Homepage.html">home</a> / <span>On sale</span> </p>
        </section>

        <!-- heading section end -->





        <!-- products section start -->

        <section class="products">


            <div class="box-container">
                <c:if test="${empty requestScope.LIST}">
                    <h3> No Product on Sale, Please comeback later.
                    </c:if>
                    <c:if test="${ not empty requestScope.LIST}">
                        <c:forEach var="dto" items="${requestScope.LIST}">
                            <div class="box">
                                <div class="icons">
                                    <form action="product">
                                        <a href="#" class="ri-eye-line"></a>
                                        <input type="hidden" name="productID" value="${dto.productID}" />
                                        <input type="hidden" name="action" value="detail" /> 
                                        <input style="background-color: inherit;" type="submit" name="" value="View product">
                                    </form>
                                    
                                </div>
                                <div class="image">
                                    <img style="object-fit: cover;" src="${dto.img}" alt="">
                                </div>
                                <div class="content">
                                    <div class="sale">

                                        <h1>${100 - dto.pSale*100} %</h1>
                                    </div>
                                    <div class="price">
                                        <h4>${dto.priceOut} $</h4>
                                        <h4 id="new">${dto.priceOut*dto.pSale} $ </h4>
                                    </div>
                                    <h3>${dto.productName}</h3>
                                    <div style="display: flex;" class="stars">
                                        <i style="color: #5e473e;" class="fa-solid fa-shop"></i>
                                        <form class="ShopGo" action="">
                                            <input type="hidden" name="shopID" value="${dto.shop.shopID}" /> 
                                            <input style="color: #5e473e;" type="Submit" name="MAIN" value="${dto.shop.shopName}">
                                        </form>
                                        <div class="${dto.shop.rate}">
                                            <span> (4,5 </span>
                                            <i style="color: gold" class="fas fa-star"></i>
                                            <span> ) </span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </c:if>
            </div>

        </section>

        <!-- products section end -->






        <!-- footer section start  -->
        <section class="footer">
            <div class="box-container">

                <div class="box">
                    <h3>quick links</h3>
                    <a href="Homepage.html"> <i class="ri-arrow-right-line"></i> home </a>
                    <a href="shop.html"> <i class="ri-arrow-right-line"></i> shop </a>
                    <a href="about.html"> <i class="ri-arrow-right-line"></i> about </a>
                    <a href="team.html"> <i class="ri-arrow-right-line"></i> team </a>
                    <a href="blog.html"> <i class="ri-arrow-right-line"></i> blog </a>
                    <a href="contact.html"> <i class="ri-arrow-right-line"></i> contact </a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="Homepage.html"> <i class="ri-arrow-right-line"></i> Home </a>
                    <a href="shop.html"> <i class="ri-arrow-right-line"></i> Shop </a>
                    <a href="about.html"> <i class="ri-arrow-right-line"></i> About </a>
                    <a href="team.html"> <i class="ri-arrow-right-line"></i> Team </a>
                    <a href="blog.html"> <i class="ri-arrow-right-line"></i> Blog </a>
                    <a href="contact.html"> <i class="ri-arrow-right-line"></i> Contact </a>
                </div>

                <div class="box">
                    <h3>extra links</h3>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Order </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Wishlist </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Account </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> My Favorite </a>
                    <a href="#"> <i class="ri-arrow-right-line"></i> Terms of user </a>
                </div>

                <div class="box">
                    <h3>extra links</h3>
                    <a href="#"> <i class="ri-facebook-fill"></i> Facebook </a>
                    <a href="#"> <i class="ri-twitter-fill"></i> Twitter </a>
                    <a href="#"> <i class="ri-instagram-fill"></i> Instagram </a>
                    <a href="#"> <i class="ri-linkedin-box-fill"></i> Linkedin </a>
                    <a href="#"> <i class="ri-pinterest-fill"></i> Pinterest </a>
                </div>

            </div>
        </section>

        <section class="credit">
            shopemail@gmail.com|+84 123456789
        </section>
        <!-- footer section end  -->

        <!-- custom js file link  -->
        <script src="js/total.js"></script>

    </body>

</html>