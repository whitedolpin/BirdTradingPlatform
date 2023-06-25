<%-- 
    Document   : pageHeader
    Created on : Jun 20, 2023, 7:58:04 PM
    Author     : Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/total.css">
        <header class="header">
            <c:url var="HomePage" value="DispatcherServlet">
                <c:param name="MAIN" value="Home" />
            </c:url>
        <a href="${HomePage}" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>
            <form action="#" class="search-form">
                <input type="search" placeholder="Search here..." id="search-box">
                <label for="search-box" class="ri-search-line"></label>
            </form>

            <div class="icons">
                <div id="menu-btn" class="ri-menu-line"></div>
                <div id="search-btn" class="ri-search-line"></div>


                <a href="cartview.jsp">
                    <div id="cart-btn" class="ri-shopping-cart-line"></div> 
                </a>





                <c:set var="User" value="${sessionScope.USERDTOBYUSERNAME}" /> 
                <c:if test="${empty User}">
                    <c:set var="User" value="${sessionScope.GOOGLE_ACC}" /> 
                </c:if>
                <c:if test="${empty User}">
                    <a href="Login.jsp">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>
                <c:if test="${not empty User}">
                    <c:url var="GetUser" value="DispatcherServlet">
                        <c:param name="MAIN" value="UserProfile"></c:param>
                    </c:url>
                     <a href="${GetUser}">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>

            </div>
        </header>

