<%-- 
    Document   : Product
    Created on : May 26, 2023, 8:57:10 PM
    Author     : Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src='js/script.js'></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link rel="stylesheet" href="css/admin.css"/>
    </head>
    <body>
        <div class="grid-container"> 
            <!-- Header -->
            <header class="header">
                <jsp:include page="header.jsp"></jsp:include>
                </header>
                <!-- End Header -->

                <!-- Sidebar -->
                <aside id="sidebar">
                <jsp:include page="sidebar.jsp"></jsp:include>
                </aside>
                <!-- End Sidebar -->
                <main class="main-container">
                    <div class=" col-sm-12" id="main" style="padding: 3%;width: 100%">
                        <h3 style=" margin-bottom: 2%; color: #000">Products Management</h3>
                        <div class="container product-box">
                            <div class="row">
                                <div class="col"></div>
                                <div class="col-10">
                                <form action="adminProductSearchController" id="product-search">
                                        <input type="search" name="txtSearch"  id="search" placeholder="Search Product" value="${txtSearch}">
                                        <button type="submit">
                                            Search
                                        </button>
                                    </form>
                                </div>
                                <div class="list table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="text-center" scope="col">No.</th>
                                                <th class="text-center" scope="col">Name</th>
                                                <th class="text-center" scope="col">Image</th>
                                                <th class="text-center" scope="col">Price</th>
                                                <th class="text-center" scope="col">Quantity</th>
                                                <th class="text-center" scope="col">Status</th>
                                                <th class="text-center" scope="col">Shop Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <c:set var="productList" value="${requestScope.PRODUCT}"/>
                                        <c:if test="${not empty productList}">
                                            <c:forEach var="product" items="${productList}" varStatus="counter">
                                            <form action="AdminProductController" method="POST">
                                                <tr>
                                                    <td class="text-right">${counter.count}

                                                    </td>
                                                    <td class="text-left">${product.productName}</td>
                                                    <td> 
                                                        <img src="${product.img}"  alt=""></td>
                                                    </td>
                                                    <td class="text-right">
                                                        ${product.priceIn}
                                                    </td>
                                                    <td class="text-right">
                                                        ${product.quantity}
                                                    </td>
                                                    <td class="text-left">${product.status}</td>
                                                    <td class="text-center">
                                                        <c:forEach var="entry" items="${SHOPS}">
                                                            <c:if test="${entry.key eq product.productID}">                                              
                                                                ${entry.value}
                                                            </c:if>
                                                        </c:forEach> 
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <div>
                </body>
                </html>
