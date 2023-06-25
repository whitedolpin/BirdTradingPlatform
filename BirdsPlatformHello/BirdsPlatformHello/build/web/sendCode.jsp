<%-- 
    Document   : sendCode
    Created on : Jun 7, 2023, 8:30:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send code</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="./css/changePass.css">
    <script src="./js/sendMail.js"></script>

        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
        </script>
        <script type="text/javascript">
            (function () {
                emailjs.init("80C9sLJ3eH1DEGjTk");
            })();
        </script>
</head>

<body>

    <!-- header section starts  -->

    <header class="header">
        <a href="home.html" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

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




    <!-- Send code section start -->
    <div class="wrapper">
        <div class= "container">
            <div class = "title-section">
                <h2 class = "title">Send code to my mail.</h2>
                <p class = "para">Send to code to reset your password</p>

            </div>
           
                <div class="only">
                    
                    <input type ="hidden" value="This is your code: ${sessionScope.CODE}" 
                           style="display: none;" class="form-control" id="message"
                           rows="3" placeholder="${sessionScope.CODE}"></input>
                    <input type="hidden" id="email" value="${sessionScope.EMAILHAVECODE}" 
                           placeholder="${sessionScope.EMAILHAVECODE}"  />
          
                    <button type="submit" class="submit-btn" onclick="sendMailChangeProfile()">
                        Send Code
                        
                    </button>
                       
                    <a href="ChangePass.jsp" class="submit-btn">Next step</a>
                    
                </div>

        </div>
    </div>
    <!-- send code section end -->




    <!-- footer section start  -->
    <section class="footer">
        <div class="box-container">

            <div class="box">
                <h3>quick links</h3>
                <a href="home.html"> <i class="ri-arrow-right-line"></i> Home </a>
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

            <div class="box">
                <h3>newsletter</h3>
                <p>subscribe for latest updates</p>
                <div class="only">
                    <input type ="hidden" value="This is your code: ${sessionScope.CODE}" style="display: none;" class="form-control" id="message" rows="3"></input>
                    <input type="hidden" id="email" value="${sessionScope.EMAILHAVECODE}"  />
          
                    <button  type="submit" class="submit-btn" onclick="sendMailChangeProfile()" >
                        Send code
                    </button>
                    <a href="ChangePass.jsp" class="submit-btn">Next step</a>
                    
                </div>
            </div>

        </div>
    </section>

    <section class="credit">
        shopemail@gmail.com|+84 123456789
    </section>
    <!-- footer section end  -->

    <!-- custom js file link  -->

</body>

</html>