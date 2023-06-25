<%-- 
    Document   : checkout
    Created on : Jun 14, 2023, 7:13:48 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>check out</title>
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <%@include file="sheader.jsp" %>

        <!-- heading section start -->

        <section class="heading">
            <h3>check out</h3>
            <p><a href="home.html">home</a> / <span>shop</span></p>
        </section>

        <!-- heading section end -->



       
        <!-- user info -->
        <c:set var="account" value="${sessionScope.USERDTOBYUSERNAME}" />
        <c:if test="${account!=null}">
            <c:if test="${not empty account}">
                <section class="userInfo">
                    <div>
                        <div class="line-cl"></div>
                        <h3>User information</h3>
                        <div class="user__details">
                            <span class="bold">${account.username}</span><span class="bold">${requestScope.addressShipment.phoneShipment}</span>
                            <span > ${requestScope.addressShipment.detail}, ${requestScope.addressShipment.district}, ${requestScope.addressShipment.province}</span>
                        </div>

                    </div>

                </section>

            </c:if>
        </c:if>

        <!-- user info end -->
        <!-- cart start -->

        <form action="order" method="POST">
            <c:if test="${sessionScope.checkoutMap!=null}">
                <c:if test="${ not empty sessionScope.checkoutMap}">
                    <c:if test="${sessionScope.checkoutMap.getMutilShopCart().values()!=null}">
                        <c:if test="${not empty sessionScope.checkoutMap.getMutilShopCart().values()}">

                            <section class="checkout-cart">
                                <div class="cart-head">
                                    <p class="name-product">Product</p>
                                    <div class="cart-head_description">
                                        <p>type</p>
                                        <p>price</p>
                                        <p>quantity</p>
                                        <p>amount</p>
                                    </div>
                                </div>
                                <c:set var="shipFee" value="0"></c:set>
                                <c:forEach var="checkoutshop" items="${sessionScope.checkoutMap.getMutilShopCart().values()}">
                                    <c:if test="${checkoutshop.getCart().values()!=null}">
                                        <c:if test="${not empty checkoutshop.getCart().values()}">
                                            <div class="shop">
                                                <h3 class="shop__name">${(checkoutshop.getCart().values().toArray())[0].getProduct().getShop().getShopName()}</h3>
                                                <c:forEach var="item" items="${checkoutshop.getCart().values()}">
                                                    <c:set var="shipFee" value="${pageScope.shipFee+5}"></c:set>
                                                        <div class="shop__product">
                                                            <div class="line"></div>
                                                            <div class="shop__product--name">

                                                                <img src="${item.getProduct().getImg()}" alt="" />
                                                            <p>${item.getProduct().getProductName()} </p>
                                                        </div>
                                                        <div class="flex-dis">
                                                            <div class="shop__product--description">
                                                                <p class="mg-top">${item.getProduct().getCategory()}</p>
                                                                <p class="mg-top">$${item.getProduct().getPriceOut()*item.getProduct().getpSale()}</p>
                                                                <p>${item.getQuantity()}</p>
                                                                <p class="mg-top">$${item.getProduct().getPriceOut()*item.getProduct().getpSale()
                                                                                     *item.getQuantity()}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>


                                                <div class="notice">
                                                    <div class="voucher notice-input">
                                                        <span>Notice: </span>
                                                        <input type="text" >

                                                    </div>
                                                    <div class="ip-checkout">
                                                        <span>Total (${checkoutshop.getTotalCount()} products): </span>
                                                        <span class="total">${checkoutshop.getTotalMoney()}$</span>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:if>

                                </c:forEach>




                                <div class="payment">
                                    <h3>Payment methods : </h3>
                                    <p>Payment on delivery</p>
                                </div>

                                <div class="total-all">
                                    <div class="text-wrap">
                                        <div class="text">
                                            <span>Total products: </span>
                                            <span>${Math.round(sessionScope.checkoutMap.getTotalCountAllShop())}</span>
                                        </div>
                                        <div class="text">
                                            <span>Total amount of goods: </span>
                                            <span>$${sessionScope.checkoutMap.getTotalMoneyAllShop()}</span>
                                        </div>

                                        <div class="text">
                                            <span>Transport fee: </span>
                                            <span>$${pageScope.shipFee}</span>
                                        </div>

                                        <div class="text">
                                            <span>Total payment: </span>
                                            <span class="all-pay">$${sessionScope.checkoutMap.getTotalMoneyAllShop()+pageScope.shipFee}</span>
                                        </div>
                                    </div>
                                        <input type="hidden" name="addressShip" value="${requestScope.addressShipment.getAddressShipID()}" >
                                    <input class="order" type="submit" name="action" value="Order" >

                                </div>

                            </section>
                        </c:if>
                    </c:if>
                </c:if>
            </c:if>

        </form>
         <div class="card-body cart">
            <div class="col-sm-12 empty-cart-cls text-center">

                
                <c:if test="${requestScope.message!=null}">
                    <c:if test="${not empty requestScope.message}">
                        <h3><strong>${requestScope.message}</strong></h3>
                        <div><a href="HomePage.jsp" class="btn-empty" data-abc="true">continue shopping</a></div>
                        <div><a href="">view my order</a></div>

                    </c:if>
                </c:if>
            </div>
        </div>

        <!-- cart end -->



        <!-- footer section start  -->
        <%@include file="footer.jsp" %>
        <!-- footer section end  -->

        <script src="js/script.js"></script>
    </body>
</html>