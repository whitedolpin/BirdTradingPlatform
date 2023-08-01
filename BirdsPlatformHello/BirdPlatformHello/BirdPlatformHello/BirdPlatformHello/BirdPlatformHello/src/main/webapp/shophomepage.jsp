<%-- 
    Document   : shophomepage
    Created on : Jun 28, 2023, 8:15:14 AM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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

        <form action="product" method="post">

            

            <!-- header section ends  -->

            
            
            <header class="header">
            <a href="./GetDataForHomepage" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

            <div class="search-form">
                    <form action="product" method="post">
                        <c:choose>
                            <c:when test="${search!=null}">
                                <input type="text" name="search" value="${requestScope.search}" placeholder="search products in ${requestScope.shop.getShopName()}" id="search-box">

                            </c:when>
                            <c:otherwise>
                                <input type="text" name="search" value="${requestScope.search}" placeholder="${requestScope.search}" id="search-box">

                            </c:otherwise>
                        </c:choose>
                        <input type="hidden" name="action" value="pagingshopproductlist"/>
                        <input type="hidden" name="shopID" value="${requestScope.shop.getShopID()}"/>
                        <label type="submit" for="search-box" class="ri-search-line" onclick="this.form.submit();"></label>
                    </form>
                </div>

            <div class="icons">
               
                <a href="contact.jsp">
                    <div style="font-size: 2.4rem; text-decoration: none" id="cart-btn" class="ri-question-fill"></div> 
                </a>
                <a href="cartview.jsp">
                    <div style="font-size: 2.4rem;" id="cart-btn" class="ri-shopping-cart-line"></div> 
                </a>





                <c:set var="User" value="${sessionScope.dto}" /> 
                <c:if test="${empty User}">
                    <c:set var="User" value="${sessionScope.GOOGLE_ACC}" /> 
                </c:if>
                <c:if test="${empty User}">
                    <a href="Login.jsp">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>
                <c:if test="${not empty User}">
                    
                    <a href="order?action=historyorder">
                        <div id="viewOrder-btn" class="fa-regular fa-credit-card"></div>
                    </a>
                    <a href="GetDataForUserProfile">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                    <a href="LogOutServlet"> 
                        <div id="logout-btn" class="fa-solid fa-right-from-bracket"> </div>
                    </a>
                </c:if>

            </div>
        </header>
            

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




            <section class="shop-pd">

                <div class="wrapper-container">
                    <div class="shop-wrap">

                        <div class="shop-name seprate">
                            <img src="${requestScope.avatar}" alt="" />
                            <div class="shop-name__info">
                                <p>${requestScope.shop.getShopName()}</p>


                            </div>
                        </div>


                        <div class="shop-info ">
                            <div>
                                <span>Evaluate</span>
                                <c:choose>
                                    <c:when test="${requestScope.evaluateofshop>1000}">
                                        <span class="spRight">${requestScope.evaluateofshop/1000}k</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="spRight">${requestScope.evaluateofshop}</span>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div>
                                <span>Rate</span>
                                <span class="spRight">${requestScope.ratingofshop}</span>
                            </div>
                            
                            <div>
                                <span>Products</span>
                                <span class="spRight">${requestScope.totalproductofshop}</span>
                            </div>
                            <div>
                                <span style="margin-right: 10px;">Address </span>
                                <span class="spRight">  ${requestScope.shopaddress.getDistrict()}, ${requestScope.shopaddress.getProvice()}</span>
                            </div>
                            <div>
                                <span>Contact</span>
                                <span class="spRight">${requestScope.shop.getContact()}</span>
                            </div>




                        </div>
                    </div>
                </div>
            </section>
            <!-- heading section end -->


            <!-- category section start -->

            <section class="category">

                <h1 class="title"> <span>Our categories</span> </h1>

                <div class="box-container">

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Bird" class="box">
                        <img src="image/icon-1.png" alt="">
                        <h3>Bird</h3>
                    </a>

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Bird food" class="box">
                        <img src="image/icon-2.png" alt="">
                        <h3>Bird Food</h3>
                    </a>

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Bird Toy" class="box">
                        <img src="image/icon-4.png" alt="">
                        <h3>Bird Toy</h3>
                    </a>


                </div>
            </section>

            <!-- category section end -->


            <!-- products section start -->
            
            <section class="products">
                <h1 class="title"> <span>Our products</span> </h1>
                
                <c:if test="${empty requestScope.shopProductList}">
                    <h1  class="title"> 
                                    There are no products that match the filter criteria. Please select different filter options.
                                </h1>
                </c:if>
                
                <c:if test="${requestScope.shopProductList!=null}">
                    
                    <c:if test="${not empty requestScope.shopProductList}">
                        <!-- sort section start -->
                        <form action="product" method="post">
                            <div style="width: 100%; margin: 20px 0px;" class="consearch">
                                <div class="filter">
                                    <div class="item">
                                        <label for="">Sort by:</label>
                                        <select name="colSort" onchange="this.form.submit();">
                                            <option value="">${requestScope.colSortPresent}</option>
                                            <option value="star">Favorite Product</option>
                                            <option value="new">Newest Product</option>
                                            <option value="priceasc">Price: Low to High</option>
                                            <option value="pricedesc">Price: High to Low</option>
                                        </select>
                                        <input type="hidden" name="action" value="pagingshopproductlist"/>
                                        <input type="hidden" name="shopID" value="${requestScope.shop.getShopID()}"/>
                                        <input type="hidden" name="category" value="${param.category}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>

                                    </div>
                                </div>
                            </div>
                        </form>


                        <!-- sort section end -->

                        <div style="display: flex;" class="box-container">

                            <c:if test="${empty requestScope.shopProductList}">
                                <h1  class="title"> 
                                    There are no products that match the filter criteria. Please select different filter options.
                                </h1>
                            </c:if>

                            <c:forEach var="product" items="${requestScope.shopProductList}">
                                <div style="width: 290px" class="box">
                                    <div class="icons">
                                        <a href="product?action=detail&productID=${product.getProductID()}" class="ri-eye-line"></a>
                                    </div>
                                    <div class="image">
                                        <img src="${product.getImg()}" alt="">
                                    </div>
                                    <div class="content">
                                        
                                         <c:set var="sale" value="${100 - 100*product.pSale}" />
                            
                                        <c:if test="${sale > 0}">
                                    <div class="sale"  >
                                        <h4
                                            style="
                                            position: absolute;
                                            background-color: red;
                                            top: 0;
                                            left: 0;
                                            padding: 10px;"
                                            >${100 - 100*product.pSale}%</h4>
                                    </div>
                                </c:if>
                                        <h3>${product.getProductName()}</h3>
                                        <div class="price" style="display: flex;justify-content: space-between;">

                                        <c:if test="${sale > 0}">

                                            <h3 style="text-decoration: line-through;">${product.priceOut} $</h3>
                                            <h3 style="color: red;"> ${product.priceOut * product.pSale}$</h3>

                                        </c:if>
                                        <c:if test = "${sale eq 0}">
                                            <h3> ${product.priceOut} $ </h3>
                                        </c:if>

                                    </div>
                                        
                                        
                                        
                                        
                                        <div class="stars">




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
            <c:if test="${requestScope.totalpage >1}">
                <div class="pagination">
                    <c:if test="${requestScope.currentpage>1}">
                        <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&curPage=${requestScope.currentpage-1}&category=${param.category}&colSort=${param.colSort}" class="prev">Previous</a>

                    </c:if>
                    <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                        <c:if test="${requestScope.currentpage==pageScope.page}">

                            <a style="background-color: #e1cec7"  href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${requestScope.search}&curPage=${pageScope.page}&category=${param.category}&colSort=${param.colSort}">${page}</a>
                        </c:if>
                        <c:if test="${requestScope.currentpage!=pageScope.page}">
                            <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${requestScope.search}&curPage=${pageScope.page}&category=${param.category}&colSort=${param.colSort}">${page}</a>                        
                        </c:if>


                    </c:forEach>
                    <c:if test="${requestScope.currentpage<requestScope.totalpage}">
                        <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&curPage=${requestScope.currentpage+1}&category=${param.category}&colSort=${param.colSort}" class="next">Next</a>
                    </c:if>

                </div>
            </c:if>

            <!-- paging section start -->

        </form>



        <!-- footer section start  -->
         <jsp:include page="pageFooter.jsp"></jsp:include>
        <!-- footer section end  -->

        <!-- custom js file link  -->

    </body>

</html>