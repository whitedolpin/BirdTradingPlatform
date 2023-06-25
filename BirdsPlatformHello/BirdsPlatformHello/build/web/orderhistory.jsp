<%-- 
    Document   : orderhistory
    Created on : May 27, 2023, 12:05:53 AM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <form action="order">
        <head>

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="utf-8">
            <title>Order</title>
            <link rel="stylesheet" href="css/orderstyle.css">
        </head>

        <body>
            <div class="container">
                <br><br>

                <div class="row">
                    <div class="order-breadcrumb">
                        <a href="#" class="">Your Account</a> › <a href="#" class="">Your Orders</a>

                    </div>
                </div>


                <div class="row order_sorter" style="margin-top: 30px;">
                    <ul id="toggle-orders">
                        <li class="first"></li>
                        <li class="oh selected"><a href="order?action=historyorders">Order History</a></li>
                        <li class="fo"><a href="order?action=historyorders&status=Pending">Pending/Future Orders</a>
                        </li>
                        <li class="ed"><a href="order?action=historyorders&status=Cancel">Cancel</a></>
                        </li>
                        <li class="com"><a href="order?action=historyorders&status=Completed">Completed/Delivered</a></li>

                    </ul>
                </div>

                <div class="row" id="order-history">

                    <div class="row order-summary">
                        <div class="totalspent-orders">
                            <h2>${requestScope.TOTAL_MONEY}</h2>
                            <h3>Overall Total Spent</h3>
                        </div>
                        <div class="printqty-orders">
                            <h2>${requestScope.TOTAL_ORDER}</h2>
                            <h3>Overall Total Orders</h3>
                        </div>

                    </div>

                    <!--     <div class="row download-all">
                        <a href="#" class="all-history">Download All Order History</a>
                      </div> -->



                    <c:if test="${requestScope.ORDER_LIST!=null}">
                        <c:if test="${not empty requestScope.ORDER_LIST}">
                            <c:forEach var="order" items="${requestScope.ORDER_LIST}">
                                <div class="order-container">

                                    <div class="header">
                                        <div class="row">
                                            <div class="col-1"><span>ORDERS PLACED</span><span>${order.getOrderDate()}</span></div>
                                            <div class="col-2"><span>TOTAL</span><span>${order.getTotal()} VND</span></div>                                
                                            <div class="col-3"><span>ORDER#</span><span>${order.getOrderID()}</span></div>
                                        </div>
                                    </div>

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="" alt="">
                                            </div>
                                            <div class="col-2">              
                                                <span class="product-title">${order.getFirstProductName()} + ${order.getTotalQuantity()-1} items more <i
                                                        class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                                <p>Order Status: ${order.getStatus()} <br>
                                                    Total Quantity: ${order.getTotalQuantity()} <br>
                                                    Ship Date: ${order.getShipDate()} <br>

                                                    <a href="#" class="btn-default"><i class="fa fa-repeat" aria-hidden="true"></i> Re-Order</a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#" class="btn-default"><i class="fa fa-download" aria-hidden="true"></i> Download</a>
                                                <a href="#" class="btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                                <a href="#" class="btn-default"><i class="fa fa-truck" aria-hidden="true"></i> Track</a>
                                                <a href="#" class="btn-default"><i class="fa fa-remove" aria-hidden="true"></i> Cancel</a>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end of order-container -->




                            </c:forEach>
                        </c:if>
                    </c:if>
                </div><!-- end of Order History -->

                <div id="future-orders">
                    <c:if test="${requestScope.ORDER_LIST!=null}">
                        <c:if test="${not empty requestScope.ORDER_LIST}">
                            <c:forEach var="order" items="${requestScope.ORDER_LIST}">


                               <div class="order-container">

                                    <div class="header">
                                        <div class="row">
                                            <div class="col-1"><span>ORDERS PLACED</span><span>${order.getOrderDate()}</span></div>
                                            <div class="col-2"><span>TOTAL</span><span>${order.getTotal()} VND</span></div>                                
                                            <div class="col-3"><span>ORDER#</span><span>${order.getOrderID()}</span></div>
                                        </div>
                                    </div>

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="" alt="">
                                            </div>
                                            <div class="col-2">              
                                                <span class="product-title">${order.getFirstProductName()} + ${order.getTotalQuantity()-1} items more <i
                                                        class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                                <p>Order Status: ${order.getStatus()} <br>
                                                    Total Quantity: ${order.getTotalQuantity()} <br>
                                                    Ship Date: ${order.getShipDate()} <br>

                                                    <a href="#" class="btn-default"><i class="fa fa-repeat" aria-hidden="true"></i> Re-Order</a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#" class="btn-default"><i class="fa fa-download" aria-hidden="true"></i> Download</a>
                                                <a href="#" class="btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                                <a href="#" class="btn-default"><i class="fa fa-truck" aria-hidden="true"></i> Track</a>
                                                <a href="#" class="btn-default"><i class="fa fa-remove" aria-hidden="true"></i> Cancel</a>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end of order-container -->


                            </c:forEach>
                        </c:if>
                    </c:if>

                </div><!-- end of future-orders -->
                <div id="cancel-orders">
                    <c:if test="${requestScope.ORDER_LIST!=null}">
                        <c:if test="${not empty requestScope.ORDER_LIST}">
                            <c:forEach var="order" items="${requestScope.ORDER_LIST}">


                               <div class="order-container">

                                    <div class="header">
                                        <div class="row">
                                            <div class="col-1"><span>ORDERS PLACED</span><span>${order.getOrderDate()}</span></div>
                                            <div class="col-2"><span>TOTAL</span><span>${order.getTotal()} VND</span></div>                                
                                            <div class="col-3"><span>ORDER#</span><span>${order.getOrderID()}</span></div>
                                        </div>
                                    </div>

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="" alt="">
                                            </div>
                                            <div class="col-2">              
                                                <span class="product-title">${order.getFirstProductName()} + ${order.getTotalQuantity()-1} items more <i
                                                        class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                                <p>Order Status: ${order.getStatus()} <br>
                                                    Total Quantity: ${order.getTotalQuantity()} <br>
                                                    Ship Date: ${order.getShipDate()} <br>

                                                    <a href="#" class="btn-default"><i class="fa fa-repeat" aria-hidden="true"></i> Re-Order</a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#" class="btn-default"><i class="fa fa-download" aria-hidden="true"></i> Download</a>
                                                <a href="#" class="btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                                <a href="#" class="btn-default"><i class="fa fa-truck" aria-hidden="true"></i> Track</a>
                                                <a href="#" class="btn-default"><i class="fa fa-remove" aria-hidden="true"></i> Cancel</a>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end of order-container -->


                            </c:forEach>
                        </c:if>
                    </c:if>

                </div><!-- end of cancel-orders -->
                
                <div id="completed-orders">
                    <c:if test="${requestScope.ORDER_LIST!=null}">
                        <c:if test="${not empty requestScope.ORDER_LIST}">
                            <c:forEach var="order" items="${requestScope.ORDER_LIST}">


                               <div class="order-container">

                                    <div class="header">
                                        <div class="row">
                                            <div class="col-1"><span>ORDERS PLACED</span><span>${order.getOrderDate()}</span></div>
                                            <div class="col-2"><span>TOTAL</span><span>${order.getTotal()} VND</span></div>                                
                                            <div class="col-3"><span>ORDER#</span><span>${order.getOrderID()}</span></div>
                                        </div>
                                    </div>

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="" alt="">
                                            </div>
                                            <div class="col-2">              
                                                <span class="product-title">${order.getFirstProductName()} + ${order.getTotalQuantity()-1} items more <i
                                                        class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                                <p>Order Status: ${order.getStatus()} <br>
                                                    Total Quantity: ${order.getTotalQuantity()} <br>
                                                    Ship Date: ${order.getShipDate()} <br>

                                                    <a href="#" class="btn-default"><i class="fa fa-repeat" aria-hidden="true"></i> Re-Order</a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#" class="btn-default"><i class="fa fa-download" aria-hidden="true"></i> Download</a>
                                                <a href="#" class="btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                                <a href="#" class="btn-default"><i class="fa fa-truck" aria-hidden="true"></i> Track</a>
                                                <a href="#" class="btn-default"><i class="fa fa-remove" aria-hidden="true"></i> Cancel</a>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end of order-container -->


                            </c:forEach>
                        </c:if>
                    </c:if>

                </div><!-- end of completed-orders -->


          

               

            </div><!-- container ends -->

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <script src="js/order.js"></script>
        </body>
    </form>

</html>
