<%-- 
    Document   : shophomepage
    Created on : Jun 10, 2023, 8:32:29 AM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${requestScope.shop.getShopName()}</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/shop.css">

    </head>

    <body>


         <%@include file="sheader.jsp" %>

        <!-- heading section start -->

        <section class="heading">
            <h3>our shop</h3>
            <div class="container">
                <div class="row">
                    <div class="col-md-5">                        
                        <image style="width: 80px" src="${requestScope.shop.getAvatar()}"/>
                        <h1>${requestScope.shop.getShopName()}</h1>
                        <p>Rating: ${requestScope.shop.getRate()} <i class="fas fa-star"></i></p> 
                    </div>
                    <div class="col-md-5">
                        <p>Address: ${requestScope.shopaddress.getDetail()}, ${requestScope.shopaddress.getDistrict()}, ${requestScope.shopaddress.getProvice()}</p>
                        <p>Contact: ${requestScope.shop.getContact()}</p>

                    </div>


                </div>

        </section>

        <!-- heading section end -->


        <!-- category section start -->

        <section class="category">

            <h1 class="title"> <span>our categories</span> <a href="#">view all >></a> </h1>

            <div class="box-container">

                <a href="shop.html" class="box">
                    <img src="image/icon-1.png" alt="">
                    <h3>Pet</h3>
                </a>

                <a href="petfood.html" class="box">
                    <img src="image/icon-2.png" alt="">
                    <h3>Food</h3>
                </a>

                <a href="toy.html" class="box">
                    <img src="image/icon-3.png" alt="">
                    <h3>Store</h3>
                </a>

                <a href="carepet.html" class="box">
                    <img src="image/icon-4.png" alt="">
                    <h3>Pet care</h3>
                </a>



            </div>
        </section>

        <!-- category section end -->


        <!-- products section start -->

        <section class="products">

            <h1 class="title"> <span>our products</span> </h1>
            <c:if test="${requestScope.shopProductList!=null}">
                <c:if test="${not empty requestScope.shopProductList}">
                     <!-- sort section start -->
                        <section class="sort">
                            <label for="sort-select">Sort by:</label>
                            <select id="sort-select">
                                <option value="default">Default</option>
                                <option value="price-low-to-high">Price: Low to High</option>
                                <option value="price-high-to-low">Price: High to Low</option>
                                <option value="name-a-to-z">Name: A to Z</option>
                                <option value="name-z-to-a">Name: Z to A</option>
                            </select>
                        </section>

                        <!-- sort section end -->

                    <div class="box-container">

                       

                        <c:forEach var="product" items="${requestScope.shopProductList}">
                            <div class="box">
                                <div class="icons">
                                    <a href="cart?action=addtocart&productID=${product.getProductID()}" class="ri-shopping-cart-line"></a>
                                    <a href="product?action=detail&productID=${product.getProductID()}" class="ri-eye-line"></a>
                                </div>
                                <div class="image">
                                    <img src="${product.getImg()}" alt="">
                                </div>
                                <div class="content">
                                    <div class="price">$${product.getPriceOut()*product.getpSale()}</div>
                                    <h3>${product.getProductName()}</h3>
                                    <div class="stars">
                                       
                                        <c:if test="${product.getStar()>0}">
                                              <p>Rating: ${product.getStar()}<i class="fas fa-star"></i></p>
                                        </c:if>
                                        <c:if test="${(1-product.getpSale())>0}">
                                             <p>sale: ${(100-product.getpSale()*100)}% </p>
                                        </c:if>
                                       

                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </c:if>
            </c:if>

        </section>

        <!-- products section end -->

        <!-- paging section start -->
        <div class="pagination">
            <c:if test="${requestScope.totalpage>1}">

                <c:set var="previous" value="${requestScope.currentpage - 1}"></c:set>
                <c:set var="next" value="${requestScope.currentpage +1}"></c:set>
                    <a href="product?action=pagingshopproductlist
                       &search=${param.search}&curPage=${pageScope.previous}
                    &category=${param.category}&colSort=${param.colSort}&sortType=${param.sortType}" class="prev">Previous</a>
                <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                    <a  href="product?action=pagingshopproductlist
                        &search=${param.search}&curPage=${pageScope.page}
                        &category=${param.category}&colSort=${param.colSort}&sortType=${param.sortType}">${requestScope.currentpage}</a>
                </c:forEach>


                <a href="product?action=pagingshopproductlist
                   &search=${param.search}&curPage=${pageScope.next}
                   &category=${param.category}&colSort=${param.colSort}&sortType=${param.sortType}" class="next">Next</a>
            </c:if>

        </div>
        <!-- paging section start -->



        <!-- footer section start  -->
        <section class="footer">
            <div class="box-container">

                <div class="box">
                    <h3>quick links</h3>
                    <a href="HomePage.jsp"> <i class="ri-arrow-right-line"></i> home </a>
                    <a href="shop.html"> <i class="ri-arrow-right-line"></i> shop </a>
                    <a href="about.html"> <i class="ri-arrow-right-line"></i> about </a>
                    <a href="team.html"> <i class="ri-arrow-right-line"></i> team </a>
                    <a href="blog.html"> <i class="ri-arrow-right-line"></i> blog </a>
                    <a href="contact.html"> <i class="ri-arrow-right-line"></i> contact </a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="HomePage.jsp"> <i class="ri-arrow-right-line"></i> Home </a>
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
        <script src="js/script.js"></script>

    </body>

</html>